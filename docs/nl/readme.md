# array.ahk
## Conversie van JavaScript&#x27;s Array-methoden naar AutoHotkey


AutoHotkey heeft geen ingebouwde iteratie helper methoden (vanaf 1.1.33) om veel van de veel voorkomende array gedragingen uit te voeren die in andere talen gevonden worden. Dit pakket zet de meeste methoden van JavaScript&#x27;s Array-object om naar AutoHotkey&#x27;s Array-object.

### Gedeporteerde methoden
* [concat](/nl/docs?id=concat)
* [every](/nl/docs?id=every)
* [fill](/nl/docs?id=fill)
* [filter](/nl/docs?id=filter)
* [find](/nl/docs?id=find)
* [findIndex](/nl/docs?id=findIndex)
* [forEach](/nl/docs?id=forEach)
* [includes](/nl/docs?id=includes)
* [indexOf](/nl/docs?id=indexOf)
* [join](/nl/docs?id=join)
* [lastIndexOf](/nl/docs?id=lastIndexOf)
* [map](/nl/docs?id=map)
* [reduce](/nl/docs?id=reduce)
* [reduceRight](/nl/docs?id=reduceRight)
* [reverse](/nl/docs?id=reverse)
* [shift](/nl/docs?id=shift)
* [slice](/nl/docs?id=slice)
* [some](/nl/docs?id=some)
* [sort](/nl/docs?id=sort)
* [splice](/nl/docs?id=splice)
* [toString](/nl/docs?id=toString)
* [unshift](/nl/docs?id=unshift)
* [values](/nl/docs?id=values)

### Installatie

Navigeer in een terminal of commandoregel naar je projectmap:

```bash
npm install array.ahk
```
Je kunt de bibliotheek ook bekijken of kopiëren van [./export.ahk op GitHub] (https://raw.githubusercontent.com/chunjee/array.ahk/master/export.ahk)


In je code:

```autohotkey
#Include %A_ScriptDir%\node_modules
#Include array.ahk\export.ahk

msgbox, % [1,2,3].join()
; => "1,2,3"
```

### Gebruik

Usage: `array.<fn>([params*])`
```autohotkey
; Kaart naar verdubbelde waarde
arrayInt := [1, 5, 10]
arrayInt.map(func("fn_doubleInt"))
; => [2, 10, 20]

fn_doubleInt(int) {
	return int * 2
}


; Kaart naar objecteigenschap
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]
arrayObj.map(func("fn_returnName"))
; => ["bob", "tom"]

fn_returnName(obj) {
	return obj.name
}


; Methode chaining
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]
msgbox, % arrayObj.map(func("fn_returnProp").bind("age"))
	.map(func("fn_doubleInt"))
	.join(",")
; => "44,102"

fn_returnProp(prop, obj) {
	return obj[prop]
}
```

### Sorteren

JavaScript geeft geen start/einde of links/rechts parameters weer en dit soort ook niet.

`array.sort([params*])`
```autohotkey
arrayInt := [11,9,5,10,1,6,3,4,7,8,2]
arrayInt.sort()
; => [1,2,3,4,5,6,7,8,9,10,11]
```
