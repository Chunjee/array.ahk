# array.ahk
## Преобразование методов массива JavaScript в AutoHotkey


В AutoHotkey отсутствуют встроенные вспомогательные методы итерации (начиная с версии 1.1.33), позволяющие выполнять многие из распространенных действий с массивами, встречающихся в других языках.

### Портированные методы
* [concat](/ru/docs?id=concat)
* [every](/ru/docs?id=every)
* [fill](/ru/docs?id=fill)
* [filter](/ru/docs?id=filter)
* [find](/ru/docs?id=find)
* [findIndex](/ru/docs?id=findIndex)
* [forEach](/ru/docs?id=forEach)
* [includes](/ru/docs?id=includes)
* [indexOf](/ru/docs?id=indexOf)
* [join](/ru/docs?id=join)
* [lastIndexOf](/ru/docs?id=lastIndexOf)
* [map](/ru/docs?id=map)
* [reduce](/ru/docs?id=reduce)
* [reduceRight](/ru/docs?id=reduceRight)
* [reverse](/ru/docs?id=reverse)
* [shift](/ru/docs?id=shift)
* [slice](/ru/docs?id=slice)
* [some](/ru/docs?id=some)
* [sort](/ru/docs?id=sort)
* [splice](/ru/docs?id=splice)
* [toString](/ru/docs?id=toString)
* [unshift](/ru/docs?id=unshift)
* [values](/ru/docs?id=values)

### Монтаж

В терминале или командной строке перейдите в папку вашего проекта:

```bash
npm install array.ahk
```
Вы также можете просмотреть или скопировать библиотеку из [./export.ahk на GitHub](https://raw.githubusercontent.com/chunjee/array.ahk/master/export.ahk).


В вашем коде:

```autohotkey
#Include %A_ScriptDir%\node_modules
#Include array.ahk\export.ahk

msgbox, % [1,2,3].join()
; => "1,2,3"
```

### Применение

Usage: `array.<fn>([params*])`
```autohotkey
; Сопоставить удвоенное значение
arrayInt := [1, 5, 10]
arrayInt.map(func("fn_doubleInt"))
; => [2, 10, 20]

fn_doubleInt(int) {
	return int * 2
}


; Сопоставить свойство объекта
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]
arrayObj.map(func("fn_returnName"))
; => ["bob", "tom"]

fn_returnName(obj) {
	return obj.name
}


; Цепочка методов
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]
msgbox, % arrayObj.map(func("fn_returnProp").bind("age"))
	.map(func("fn_doubleInt"))
	.join(",")
; => "44,102"

fn_returnProp(prop, obj) {
	return obj[prop]
}
```

### Сортировка

JavaScript не предоставляет параметры начала/конца или левого/правого значения, а также не осуществляет сортировку.

`array.sort([params*])`
```autohotkey
arrayInt := [11,9,5,10,1,6,3,4,7,8,2]
arrayInt.sort()
; => [1,2,3,4,5,6,7,8,9,10,11]
```
