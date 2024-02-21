# array.ahk
## Konvertierung der Array-Methoden von JavaScript in AutoHotkey


AutoHotkey verfügt nicht über integrierte Iterationshilfsmethoden (ab 1.1.33), um viele der in anderen Sprachen üblichen Array-Verhaltensweisen auszuführen.

### Portierte Methoden
* [concat](/de/docs?id=concat)
* [every](/de/docs?id=every)
* [fill](/de/docs?id=fill)
* [filter](/de/docs?id=filter)
* [find](/de/docs?id=find)
* [findIndex](/de/docs?id=findIndex)
* [forEach](/de/docs?id=forEach)
* [includes](/de/docs?id=includes)
* [indexOf](/de/docs?id=indexOf)
* [join](/de/docs?id=join)
* [lastIndexOf](/de/docs?id=lastIndexOf)
* [map](/de/docs?id=map)
* [reduce](/de/docs?id=reduce)
* [reduceRight](/de/docs?id=reduceRight)
* [reverse](/de/docs?id=reverse)
* [shift](/de/docs?id=shift)
* [slice](/de/docs?id=slice)
* [some](/de/docs?id=some)
* [sort](/de/docs?id=sort)
* [splice](/de/docs?id=splice)
* [toString](/de/docs?id=toString)
* [unshift](/de/docs?id=unshift)

### Installation

Navigieren Sie in einem Terminal oder einer Befehlszeile zu Ihrem Projektordner:

```bash
npm install array.ahk
```
Sie können die Bibliothek auch von [./export.ahk auf GitHub](https://raw.githubusercontent.com/chunjee/array.ahk/master/export.ahk) überprüfen oder kopieren.


In Ihrem Code:

```autohotkey
#Include %A_ScriptDir%\node_modules
#Include array.ahk\export.ahk

msgbox, % [1,2,3].join()
; => "1,2,3"
```

### Verwendung

Usage: `array.<fn>([params*])`
```autohotkey
; Auf den doppelten Wert abbilden
arrayInt := [1, 5, 10]
arrayInt.map(func("fn_doubleInt"))
; => [2, 10, 20]

fn_doubleInt(int) {
	return int * 2
}


; Zuordnung zur Objekteigenschaft
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]
arrayObj.map(func("fn_returnName"))
; => ["bob", "tom"]

fn_returnName(obj) {
	return obj.name
}


; Methodenverkettung
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]
msgbox, % arrayObj.map(func("fn_returnProp").bind("age"))
	.map(func("fn_doubleInt"))
	.join(",")
; => "44,102"

fn_returnProp(prop, obj) {
	return obj[prop]
}
```

### Sortierung

JavaScript macht keine Start-/End- oder Links-/Rechts-Parameter verfügbar und diese Sortierung erfolgt auch nicht.

`array.sort([params*])`
```autohotkey
arrayInt := [11,9,5,10,1,6,3,4,7,8,2]
arrayInt.sort()
; => [1,2,3,4,5,6,7,8,9,10,11]
```
