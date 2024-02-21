# array.ahk
## Conversione dei metodi Array di JavaScript in AutoHotkey


AutoHotkey non dispone di metodi di supporto per l&#x27;iterazione integrati (a partire dalla versione 1.1.33) per eseguire molti dei comportamenti comuni degli array riscontrati in altri linguaggi. 

### Metodi portati
* [concat](/it/docs?id=concat)
* [every](/it/docs?id=every)
* [fill](/it/docs?id=fill)
* [filter](/it/docs?id=filter)
* [find](/it/docs?id=find)
* [findIndex](/it/docs?id=findIndex)
* [forEach](/it/docs?id=forEach)
* [includes](/it/docs?id=includes)
* [indexOf](/it/docs?id=indexOf)
* [join](/it/docs?id=join)
* [lastIndexOf](/it/docs?id=lastIndexOf)
* [map](/it/docs?id=map)
* [reduce](/it/docs?id=reduce)
* [reduceRight](/it/docs?id=reduceRight)
* [reverse](/it/docs?id=reverse)
* [shift](/it/docs?id=shift)
* [slice](/it/docs?id=slice)
* [some](/it/docs?id=some)
* [sort](/it/docs?id=sort)
* [splice](/it/docs?id=splice)
* [toString](/it/docs?id=toString)
* [unshift](/it/docs?id=unshift)

### Installazione

In un terminale o una riga di comando accedi alla cartella del tuo progetto:

```bash
npm install array.ahk
```
Puoi anche rivedere o copiare la libreria da [./export.ahk su GitHub](https://raw.githubusercontent.com/chunjee/array.ahk/master/export.ahk)


Nel tuo codice:

```autohotkey
#Include %A_ScriptDir%\node_modules
#Include array.ahk\export.ahk

msgbox, % [1,2,3].join()
; => "1,2,3"
```

### Utilizzo

Usage: `array.<fn>([params*])`
```autohotkey
; Mappa a valore raddoppiato
arrayInt := [1, 5, 10]
arrayInt.map(func("fn_doubleInt"))
; => [2, 10, 20]

fn_doubleInt(int) {
	return int * 2
}


; Mappare la proprietà dell&#x27;oggetto
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]
arrayObj.map(func("fn_returnName"))
; => ["bob", "tom"]

fn_returnName(obj) {
	return obj.name
}


; Concatenamento dei metodi
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]
msgbox, % arrayObj.map(func("fn_returnProp").bind("age"))
	.map(func("fn_doubleInt"))
	.join(",")
; => "44,102"

fn_returnProp(prop, obj) {
	return obj[prop]
}
```

### Ordinamento

JavaScript non espone i parametri di inizio/fine o sinistra/destra e nemmeno questo ordinamento.

`array.sort([params*])`
```autohotkey
arrayInt := [11,9,5,10,1,6,3,4,7,8,2]
arrayInt.sort()
; => [1,2,3,4,5,6,7,8,9,10,11]
```
