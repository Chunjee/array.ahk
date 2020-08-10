# array.ahk
Conversion of JavaScript's Array methods to AutoHotKey

AutoHotKey lacks built-in iteration helper methods (as of 1.1.33) to perform many of the common array behaviors found in other languages. This package ports most of JavaScript's Array object methods to AutoHotKey's Array object.

### Ported Methods
* concat
* every
* fill
* filter
* find
* findIndex
* forEach
* includes
* indexOf
* join
* lastIndexOf
* map
* reduce
* reduceRight
* reverse
* shift
* slice
* some
* sort
* splice
* toString
* unshift

### Installation

In a terminal or command line navigated to your project folder:

```bash
npm install array.ahk
```
You may also review or copy the library from [./export.ahk on GitHub](https://raw.githubusercontent.com/chunjee/array.ahk/master/export.ahk)


In your code:

```autohotkey
#Include %A_ScriptDir%\node_modules
#Include array.ahk\export.ahk

msgbox, % [1,2,3].join()
; => "1,2,3"
```

### Usage

Usage: `Array.<fn>([params*])`
```autohotkey
; Map to doubled value
arrayInt := [1, 5, 10]
arrayInt.map(func("double_int"))
; => [2, 10, 20]

double_int(int) {
	return int * 2
}


; Map to object property
arrayObj.map(func("get_name")) 
; => ["bob", "tom"]

get_name(obj) {
	return obj.name
}


; Method chaining
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]
msgbox, % arrayObj.map(func("get_prop").bind("age"))
	.map(func("double_int"))
	.join(",")
; => "44,102"

get_prop(prop, obj) {
	return obj[prop]
}
```

### Sorting

JavaScript does not expose start/end or left/right parameters and neither does this sort.

`Array.sort([params*])`  
```autohotkey
arrayInt := [11,9,5,10,1,6,3,4,7,8,2]
arrayInt.sort()
; => [1,2,3,4,5,6,7,8,9,10,11]
```
