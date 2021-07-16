# array.ahk
Conversion of JavaScript's Array methods to AutoHotkey

![npm](https://img.shields.io/npm/dm/array.ahk) [![npm](https://img.shields.io/badge/full-documentation-blue)](https://chunjee.github.io/array.ahk)


AutoHotkey lacks built-in iteration helper methods (as of 1.1.33) to perform many of the common array behaviors found in other languages. This package ports most of JavaScript's Array object methods to AutoHotkey's Array object.

### Ported Methods
* [concat](/docs?id=concat)
* [every](/docs?id=every)
* [fill](/docs?id=fill)
* [filter](/docs?id=filter)
* [find](/docs?id=find)
* [findIndex](/docs?id=findIndex)
* [forEach](/docs?id=forEach)
* [includes](/docs?id=includes)
* [indexOf](/docs?id=indexOf)
* [join](/docs?id=join)
* [lastIndexOf](/docs?id=lastIndexOf)
* [map](/docs?id=map)
* [reduce](/docs?id=reduce)
* [reduceRight](/docs?id=reduceRight)
* [reverse](/docs?id=reverse)
* [shift](/docs?id=shift)
* [slice](/docs?id=slice)
* [some](/docs?id=some)
* [sort](/docs?id=sort)
* [splice](/docs?id=splice)
* [toString](/docs?id=toString)
* [unshift](/docs?id=unshift)

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
arrayInt.map(func("fn_doubleInt"))
; => [2, 10, 20]

fn_doubleInt(int) {
	return int * 2
}


; Map to object property
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]
arrayObj.map(func("fn_returnName"))
; => ["bob", "tom"]

fn_returnName(obj) {
	return obj.name
}


; Method chaining
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]
msgbox, % arrayObj.map(func("fn_returnProp").bind("age"))
	.map(func("fn_doubleInt"))
	.join(",")
; => "44,102"

fn_returnProp(prop, obj) {
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
