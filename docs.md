## .concat
> `array.concat([value*])`

Used to join two or more arrays. This method does not change the existing arrays, but returns a new array, containing the values of the joined arrays.


#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  value*        | alnum/array  | Optional. (Default `[]`)  Arrays and/or values to concatenate into a new array. If all valueN parameters are omitted, concat returns a shallow copy of the existing array on which it is called. |


#### Returns
(array): A new Array instance.


#### Example
```autohotkey
[1, 2, 3].concat([4, 5, 6])
; => [1, 2, 3, 4, 5, 6]

[1, 2, 3].concat([4, 5, 6], [7, 8, 9])
; => [1, 2, 3, 4, 5, 6, 7, 8, 9]

[].concat("Bill", "Ted")
; => ["Bill", "Ted"]
```
<!-- end of concat -->


## .every
> `array.every(func("function"))`

Tests whether all elements in the array pass the test implemented by the provided function. It returns a Boolean value.


#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)      | function     | Required. A function to be run for each element in the array. |


#### Returns
(Object): Returns object.


#### Example
```autohotkey
[2, 4, 6].every(func("fn_isEven")
; => true

[2, 5, 7].every(func("fn_isEven")
; => false

fn_isEven(o)
{
	if (mod(o, 2) = 0) {
		return true
	}
	return false
}
```
<!-- end of every -->


## .fill
> `array.fill(value[, start, end])`

Fill all the array elements with a static value.

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  value         | alnum        | Required. The value to fill the array with. |
|  start         | number       | Optional. (Default `1`) The index to start filling the array. If negative, it is treated as array.Count() + start |
|  end := array.Count() | number       | Optional. The value to fill the array with. If negative, it is treated as array.Count() + end |


#### Returns
(array): The modified array, filled with `value`.


#### Example
```autohotkey
[1, 2, 3].fill(1)
; => [1, 1, 1]
```
<!-- end of fill -->


## .filter
> `array.filter(func("function"))`

Creates a new array with all elements that pass the test implemented by the provided function. The function is invoked with three arguments; (element, index, array).

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)      | function     | Required. Function is a predicate, to test each element of the array. Return `true` to keep the element, `false` otherwise. |


#### Returns
(array): A new array with the elements that pass the test. If no elements pass the test, an empty array will be returned.


#### Example
```autohotkey
[1, 2, 3, 4, 5, 6].filter(func("fn_filterIsEven"))
; => [2, 4, 6]

fn_filterIsEven(o) {
	if (mod(o, 2) = 0) {
		return true
	}
	return false
}
```
<!-- end of filter -->


## .find
> `array.find(func("function"))`

Returns the value of the first element in the provided array that satisfies the provided testing function. The function is invoked with three arguments; (element, index, array).

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)      | function     | Required. Function to execute on each value in the array. |


#### Returns
(value): The value of the first element in the array that satisfies the provided testing function. Otherwise, `""` is returned.


#### Example
```autohotkey
[1, 2, 3, 4, 5, 6].find(func("fn_findGreaterThanFive"))
; => 6

fn_findGreaterThanFive(o)
{
	if (o > 5) {
		return o
	}
}
```
<!-- end of find -->


## .findIndex
> `array.findIndex(func("function"))`

Returns the index of the first element in the array that satisfies the provided testing function. Otherwise, it returns -1, indicating that no element passed the test. The function is invoked with three arguments; (element, index, array).

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)      | function     | Required. Function to execute on each value in the array. |


#### Returns
(value): The value of the first element in the array that satisfies the provided testing function. Otherwise, `""` is returned.


#### Example
```autohotkey
[1, 2, 3, 4].findIndex(func("fn_findIndexFunc"))
; => 2

fn_findIndexFunc(o) {
	return o = 2
}

users := [{user: "Bill"}, {user: "Ted"}]
users.findIndex(func("fn_findIndexFunc2"))
; => 2

fn_findIndexFunc2(o) {
	return o.user = "Ted"
}
```
<!-- end of findIndex -->


## .forEach
> `array.forEach(func("function"))`

Executes a provided function once for each array element. The function is invoked with three arguments; (element, index, array).

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)      | function     | Required. Function to execute on each value in the array. |


#### Returns
(""): `""` is always returned.


#### Example
```autohotkey
[1, 2, 3, 4].forEach(func("fn_forEachFunc"))
; => msgboxes 1 then 2 then 3 then 4

fn_forEachFunc(value) {
	msgbox, % value
}
```
<!-- end of forEach -->


## .includes
> `array.includes(valueToFind[, fromIndex])`

Determines whether an array includes a certain value among its entries, returning true or false as appropriate.

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  valueToFind   | *            | Required. The value to search for. |
|  fromIndex     | number       | Optional. (Default `1`) The index to start the search at. If the provided index value is a negative number, it is taken as the offset from the end of the array. |


#### Returns
(boolean): `true` if the value valueToFind is found within the array (or the part of the array indicated by the index fromIndex, if specified). Otherwise `false`.


#### Example
```autohotkey
[1, 2, 3, 4].includes(2)
; => true

[1, 2, 3, 4].includes("Socrates")
; => false
```
<!-- end of includes -->


## .indexOf
> `array.indexOf(valueToFind[, fromIndex])`

Returns the first index at which a given element can be found in the array, or `-1` if it is not present.

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | alnum        | Required. The value to search for. |
|  fromIndex     | number       | Optional. (Default `1`) The index to start the search at. If the provided index value is a negative number, it is taken as the offset from the end of the array. |


#### Returns
(number): The first index of the element in the array; `-1` if not found.


#### Example
```autohotkey
[1, 2, 3, 4].indexOf(2)
; => 2

["Bill", "Ted"].indexOf("Socrates")
; => -1
```
<!-- end of indexOf -->


## .join
> `array.join(valueToFind[, fromIndex])`

Creates and returns a new string by concatenating all of the elements in an array, separated by commas or a specified separator string. If the array has only one item, then that item will be returned without using the separator.

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  separator     | string       | Optional. (Default `","`) Specifies a string to separate each pair of adjacent elements of the array. The separator is converted to a string if necessary. If separator is an empty string (`""`), all elements are joined without any characters in between them. |


#### Returns
(string): A string with all array elements joined. If array.Count() is 0, an empty string `""` is returned.


#### Example
```autohotkey
[1, 2, 3].join()
; => "1,2,3"

["Bill", "Ted"].join(" and ")
; => "Bill and Ted"
```
<!-- end of join -->


## .keys
> `array.keys()`

Returns a new array that contains the keys for each index in the array.

#### Arguments
Does not accept any arguments.


#### Returns
(array): A new array containing all keys in the calling array.


#### Example
```autohotkey
["Bill", "Ted", "Socrates"].keys()
; => [1, 2, 3]
```
<!-- end of keys -->


## .lastIndexOf
> `array.lastIndexOf(valueToFind[, fromIndex])`

Returns the first index at which a given element can be found in the array, or `-1` if it is not present.

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | alnum        | Required. The value to search for. |
|  fromIndex     | number       | Optional. (Default `1`) The index at which to start searching backwards. Defaults to the array's length minus one (array.Count()), i.e. the whole array will be searched. If the index is greater than or equal to the length of the array, the whole array will be searched. If negative, it is taken as the offset from the end of the array. Note that even when the index is negative, the array is still searched from back to front. |


#### Returns
(number): The last index of the element in the array; `-1` if not found.


#### Example
```autohotkey
["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Ted")
; => 4

["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Socrates")
; => 3
```
<!-- end of lastIndexOf -->


## .map
> `array.map(func("function"))`

creates a new array populated with the results of calling a provided function on every element in the calling array. The function is invoked with three arguments; (element, index, array).

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)      | function     | Required. Function that is called for every element of arr. Each time callback executes, the returned value is added to new_array.


#### Returns
(array): A new array with each element being the result of the callback function.


#### Example
```autohotkey
[1, 2, 3].map(func("fn_timesTwo"))
; => [2, 4, 6]

fn_timesTwo(o)
{
	return o * 2
}


["Bill", "Ted"].map("fn_upcase")
; => ["BILL", "TED"]

fn_upcase(o)
{
	StringUpper, OutputVar, o
	return OutputVar
}
```
<!-- end of map -->


## .reduce
> `array.reduce(func("function"))`

Executes a reducer function on each element of the array, resulting in single output value. The reducer function is invoked with four arguments; (accumulator, element, index, array).

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      | function     | Required. A function to execute on each element in the array (except for the first, if no initialValue is supplied).


#### Returns
(value): The single value that results from the reduction.


#### Example
```autohotkey
[1, 2, 3].reduce(func("fn_addition"))
; => 6

fn_addition(a, b)
{
	return a + b
}
```
<!-- end of reduce -->


## .reduceRight
> `array.reduceRight(func("function"))`

Applies a function against an accumulator and each value of the array (from right-to-left) to reduce it to a single value. The reducer function is invoked with three arguments; (accumulator, element, index, array).

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      | function     | Required. A function to execute on each element in the array (except for the first, if no initialValue is supplied).


#### Returns
(value): The single value that results from the reduction.


#### Example
```autohotkey
[[0, 1], [2, 3], [4, 5]].reduceRight(func("fn_addition"))
; => [4, 5, 2, 3, 0, 1]

fn_concatReduce(accumulator, currentValue)
{
	accumulator.concat(currentValue)
}
```
<!-- end of reduceRight -->


## .reverse
> `array.reverse()`

Reverses an array in place. The first array element becomes the last, and the last array element becomes the first.

#### Arguments
Does not accept any arguments.


#### Returns
(array): The reversed array.


#### Example
```autohotkey
[1, 2, 3].reverse()
; => [3, 2, 1]
```
<!-- end of reverse -->


## .shift
> `array.shift()`

Removes the first element from an array and returns that removed element. This method modifies the array.

#### Arguments
Does not accept any arguments.


#### Returns
(value): The removed element from the array; `""` if the array is empty.


#### Example
```autohotkey
array := [1, 2, 3]
array.shift()
; => 1

msgbox, % array.join()
; => "2,3"
```
<!-- end of shift -->


## .slice
> `array.slice()`

Returns a shallow copy of a portion of an array into a new array object selected from start to end (end not included) where start and end represent the index of items in that array. The original array will not be modified.

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  start         | number       | Optional. (Default `1`) The index at which to start extraction. |
|  end           | number       | Optional. (Default `array.Count()`) The index at which to end extraction. slice extracts up to but not including end. If end is omitted, slice extracts through the end of the sequence. A negative index can be used, indicating an offset from the end of the sequence. |


#### Returns
(value): The removed element from the array; `""` if the array is empty.


#### Example
```autohotkey
array := ["Bill", "Ted", "Socrates", "Lincoln"]
array.slice(3)
; => ["Socrates", "Lincoln"]

array.slice(1, 2)
; => ["Bill", "Ted"]
```
<!-- end of slice -->


## .some
> `array.some(func("function"))`

Tests whether at least one element in the array passes the test implemented by the provided function. It returns a Boolean value. The function is invoked with three arguments; (element, index, array).

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)      | function     | Required. The index at which to start extraction. |


#### Returns
(boolean): `true` if the callback function returns a truthy value for at least one element in the array. Otherwise, `false`.


#### Example
```autohotkey
[1, 2, 3, 4].some(func("fn_isEven"))
; => true

fn_isEven(o)
{
	if (mod(o, 2) = 0) {
		return true
	}
	return false
}
```
<!-- end of some -->


## .sort
> `array.sort([func("function")])`

Sorts the elements of an array in place and returns the sorted array. The default sort order is ascending. The function is invoked with two arguments; (firstElement, secondElement).

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(firstElement, secondElement)      | function     | Optional. Specifies a function that defines the sort order. If omitted, the array elements are sorted according to their alphanum value |


#### Returns
(array): The sorted array. Note that the array is sorted in place, and no copy is made.


#### Example
```autohotkey
[1, 30, 4, 21, 100000].sort()
; => [1, 4, 21, 30, 100000]

["ted", "Bill", "bill", "Ted", "Socrates", "Lincoln"].sort()
; => ["Bill", "Lincoln", "Socrates, "Ted", "bill, "ted"]
```
<!-- end of sort -->


## .splice
> `array.splice(start, [end])`

Changes the contents of an array by removing or replacing existing elements and/or adding new elements in place.

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  start         | number       | Required. The index at which to start changing the array. If greater than the length of the array, start will be set to the length of the array. In this case, no element will be deleted but the method will behave as an adding function, adding as many element as provided. If negative, it will begin that many elements from the end of the array. |
|  deleteCount    | number       | Optional. (Default `-1`) An integer indicating the number of elements in the array to remove. |
|  values*        | number       | Optional. (Default `""`) The elements to add to the array. If you do not specify any elements, it will only remove elements from the array. |


#### Returns
(array): An array containing the deleted elements. If no elements are removed, an empty array is returned.


#### Example
```autohotkey
array := ["Bill", "Socrates"]
array.splice(2, 0, "Ted")
; => ["Socrates"]

msgbox, % array.join()
; => "Bill,Ted"
```
<!-- end of splice -->


## .toString
> `array.toString()`

Returns a string representing the specified array and its elements.

#### Arguments
Does not accept any arguments.


#### Returns
(string): A string representing the elements of the array.


#### Example
```autohotkey
["Bill", "Ted"].toString()
; => "Bill,Ted"
```
<!-- end of toString -->


## .unshift
> `array.unshift(element*)`

Returns a string representing the specified array and its elements.

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  element*      | *            | Required. The elements to add to the front of the array. |



#### Returns
The new array.Count() length of the array upon which the method was called.


#### Example
```autohotkey
array := []
array.unshift("Bill", "Ted")
; => 2

msgbox, % array.join()
; => "Bill,Ted"
```
<!-- end of unshift -->


## .values
> `array.values()`

Returns a new array that contains the values for each element in the calling array.

#### Arguments
Does not accept any arguments.


#### Returns
(array): A new array containing all values in the calling array.


#### Example
```autohotkey
["Bill", "Ted", "Socrates"].values()
; => ["Bill, "Ted, "Socrates"]

array := []
array.insert("x", "Bill")
array.insert("y", "Ted")
array.insert("z", "Socrates")
array.values()
; => ["Bill, "Ted, "Socrates"]
```
<!-- end of values -->
