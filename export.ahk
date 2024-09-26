; Apply "native" support, redefines Array() to add custom _Array base object
Array(prms*) {
	; Since prms is already an array of the parameters, just give it a
	; new base object and return it. Using this method, _Array.__New()
	; is not called and any instance variables are not initialized.
	prms.base := _Array
	return prms
}


; Define the base class.
class _Array {

	concat(arrays*) {
		result := []

		; First add the values from the instance being called on
		result := this.Clone()

		; Second, add arrays given in parameter
		for key, array in arrays {
			if (IsObject(array)) {
				for key2, element in array {
					result.push(element)
				}
			} else {
				result.push(array)
			}
		}
		return result
	}


	every(callback) {
		for index, element in this
			if !callback.Call(element, index, this)
				return false

		return true
	}


	fill(value, start:=0, end:=0) {
		len := this.Count()

		; START: Adjust 1 based index, check signage, set defaults
		if (start > 0)
			begin := start - 1 ; Include starting index going forward
		else if (start < 0)
			begin := len + start ; Count backwards from end
		else
			begin := start


		; END: Check signage and set defaults
		if (end > 0)
			last := end
		else if (end < 0)
			last := len + end ; Count backwards from end
		else
			last := len


		loop, % (last - begin)
			this[begin + A_Index] := value

		return this
	}


	filter(callback) {
		result := []

		for index, element in this
			if (callback.Call(element, index, this))
				result.push(element)

		return result
	}


	; Modified to return "" instead of 'undefined'
	find(callback) {
		for index, element in this
			if (callback.Call(element, index, this))
				return element

		return ""
	}


	findIndex(callback) {
		for index, value in this
			if (callback.Call(value, index, this))
				return index

		return -1
	}



	forEach(callback) {
		for index, element in this
			callback.Call(element, index, this)

		return ""
	}


	includes(searchElement, fromIndex:=0) {
		return this.indexOf(searchElement, fromIndex) > 0 ? true : false
	}


	indexOf(searchElement, fromIndex:=0) {
		len := this.Count()

		if (fromIndex > 0)
			start := fromIndex - 1 ; Include starting index going forward
		else if (fromIndex < 0)
			start := len + fromIndex ; Count backwards from end
		else
			start := fromIndex


		loop, % len - start
			if (this[start + A_Index] = searchElement)
				return start + A_Index

		return -1
	}


	join(separator:=",") {
		result := ""
		for index, element in this {
			result .= element (index < this.Count() ? separator : "")
		}
		return result
	}


	keys() {
		result := []

		for key, value in this {
			result.push(key)
		}
		return result
	}


	; if the provided index is negative, the array is still searched from front to back
	; - Are we not able to return the first found starting from the back?
	lastIndexOf(searchElement, fromIndex:=0) {
		len := this.Count()
		foundIdx := -1

		if (fromIndex > len)
			return foundIdx

		if (fromIndex > 0)
			start := fromIndex - 1 ; Include starting index going forward
		else if (fromIndex < 0)
			start := len + fromIndex ; Count backwards from end
		else
			start := fromIndex

		loop, % len - start
			if (this[start + A_Index] = searchElement)
				foundIdx := start + A_Index

		return foundIdx
	}


	map(callback) {
		result := []

		for index, element in this
			result.push(callback.Call(element, index, this))

		return result
	}


	reduce(callback, initialValue:="__NULL__") {
		len := this.Count()

		; initialValue not defined
		if (initialValue == "__NULL__") {

			if (len < 1) {
				; Empty array with no intial value
				return
			}
			else if (len == 1) {
				; Single item array with no initial value
				return this[1]
			}

			; Starting value is last element
			initialValue := this[1]

			; Loop n-1 times (start at 2nd element)
			iterations := len - 1

			; Set index A_Index+1 each iteration
			idxOffset := 1

		} else {
		; initialValue defined

			if (len == 0) {
				; Empty array with initial value
				return initialValue
			}

			; Loop n times (starting at 1st element)
			iterations := len

			; Set index A_Index each iteration
			idxOffset := 0
		}

		; if no initialValue is passed, use first index as starting value and reduce
		; array starting at index n+1. Otherwise, use initialValue as staring value
		; and start at arrays first index.
		Loop, % iterations
		{
			adjIndex := A_Index + idxOffset
			initialValue := callback.Call(initialValue, this[adjIndex], adjIndex, this)
		}

		return initialValue
	}


	reduceRight(callback, initialValue:="__NULL__") {
		len := this.Count()

		; initialValue not defined
		if (initialValue == "__NULL__") {

			if (len < 1) {
				; Empty array with no intial value
				return
			}
			else if (len == 1) {
				; Single item array with no initial value
				return this[1]
			}

			; Starting value is last element
			initialValue := this[len]

			; Loop n-1 times (starting at n-1 element)
			iterations := len - 1

			; Set index A_Index-1 each iteration
			idxOffset := 0

		} else {
		; initialValue defined

			if (len == 0)
				; Empty array with initial value
				return initialValue

			; Loop n times (start at n element)
			iterations := len

			; Set index A_Index each iteration
			idxOffset := 1
		}

		; If no initialValue is passed, use last index as starting value and reduce
		; array starting at index n-1. Otherwise, use initialValue as starting value
		; and start at arrays last index.
		Loop, % iterations
		{
			adjIndex := len - (A_Index - idxOffset)
			initialValue := callback.Call(initialValue, this[adjIndex], adjIndex, this)
		}

		return initialValue
	}


	reverse() {

		len := this.Count()

		Loop, % (len // 2)
		{
			idxFront := A_Index
			idxBack := len - (A_Index - 1)

			tmp := this[idxFront]
			this[idxFront] := this[idxBack]
			this[idxBack] := tmp
		}

		return this
	}


	shift() {
		return this.RemoveAt(1)
	}


	slice(start:=0, end:=0) {
		len := this.Count()

		; START: Adjust 1 based index, check signage, set defaults
		if (start > 0)
			begin := start - 1 ; Include starting index going forward
		else if (start < 0)
			begin := len + start ; Count backwards from end
		else
			begin := start


		; END: Check signage and set defaults
		; MDN States: "to end (end not included)" so subtract one from end
		if (end > 0)
			last := end - 1
		else if (end < 0)
			last := len + end ; Count backwards from end
		else
			last := len


		result := []

		loop, % last - begin
			result.push(this[begin + A_Index])
		if (result.Count() == 0) {
			return ""
		}
		return result
	}


	some(callback) {
		for index, value in this
			if callback.Call(value, index, this)
				return true

		return false
	}


	sort(compare_fn:=0) {
		; Quicksort
		this._Call(this, compare_fn)

		return this
	}


	splice(start, deleteCount:=-1, args*) {
		len := this.Count()
		exiting := []

		; Determine starting index
		if (start > len)
			start := len

		if (start < 0)
			start := len + start

		; deleteCount unspecified or out of bounds, set count to start through end
		if ((deleteCount < 0) || (len <= (start + deleteCount))) {
			deleteCount := len - start + 1
		}

		; Remove elements
		Loop, % deleteCount
		{
			exiting.push(this[start])
			this.RemoveAt(start)
		}

		; Inject elements
		Loop, % args.Count()
		{
			curIndex := start + (A_Index - 1)

			this.InsertAt(curIndex, args[1])
			args.removeAt(1)
		}

		return exiting
	}


	toString() {
		str := ""

		for i,v in this
			str .= v (i < this.Count() ? "," : "")

		return str
	}


	unshift(args*) {
		for index, value in args
			this.InsertAt(A_Index, value)

		return this.Count()
	}


	values() {
		result := []

		for key, value in this {
			result.push(value)
		}
		return result
	}


	; Internal functions
	_compare_alphanum(a, b) {
		; return 0 if a and b are the same
		; return -1 if b is "" or undefined
		; return 1 if a is greater than b
		; return -1 if a is less than b
		return a == b ? 0 : b == "" ? -1 : a > b ? 1 : a < b ? -1
	}


	_sort(array, compare_fn, left, right) {
		if (array.Count() > 1) {
			centerIdx := this._partition(array, compare_fn, left, right)
			if (left < centerIdx - 1) {
				this._sort(array, compare_fn, left, centerIdx - 1)
			}
			if (centerIdx < right) {
				this._sort(array, compare_fn, centerIdx, right)
			}
		}
	}


	_partition(array, compare_fn, left, right) {
		pivot := array[floor(left + (right - left) / 2)]
		i := left
		j := right

		while (i <= j) {
			while (compare_fn.Call(array[i], pivot) < 0) { ;array[i] < pivot
				i++
			}
			while (compare_fn.Call(array[j], pivot) > 0) { ;array[j] > pivot
				j--
			}
			if (i <= j) {
				this._swap(array, i, j)
				i++
				j--
			}
		}
		return i
	}


	_swap(array, idx1, idx2) {
		tempVar := array[idx1]
		array[idx1] := array[idx2]
		array[idx2] := tempVar
	}


	; Left/Right remain from a standard implementation, but the adaption is
	; ported from JS which doesn't expose these parameters.
	;
	; To expose left/right: Call(array, compare_fn:=0, left:=0, right:=0), but
	; this would require passing a falsey value to compare_fn when only
	; positioning needs altering: Call(myArr, <false/0/"">, 2, myArr.Count())
	_Call(array, compare_fn:=0) {
		; Default comparator
		if !(compare_fn) {
			compare_fn := objBindMethod(this, "_compare_alphanum")
		}

		; Default start/end index
		left := left ? left : 1
		right := right ? right : array.Count()

		; Perform in-place sort
		this._sort(array, compare_fn, left, right)

		; Return object ref for method chaining
		return array
	}

	; Redirect to newer calling standard
	__Call(method, args*) {
		if (method = "")
			return this._Call(args*)
		if (IsObject(method))
			return this._Call(method, args*)
	}
}
