# array.ahk
## Conversion des méthodes Array de JavaScript en AutoHotkey


AutoHotkey ne dispose pas de méthodes d&#x27;aide à l&#x27;itération intégrées (à partir de la version 1.1.33) pour exécuter de nombreux comportements de tableau courants trouvés dans d&#x27;autres langages.

### Méthodes portées
* [concat](/fr/docs?id=concat)
* [every](/fr/docs?id=every)
* [fill](/fr/docs?id=fill)
* [filter](/fr/docs?id=filter)
* [find](/fr/docs?id=find)
* [findIndex](/fr/docs?id=findIndex)
* [forEach](/fr/docs?id=forEach)
* [includes](/fr/docs?id=includes)
* [indexOf](/fr/docs?id=indexOf)
* [join](/fr/docs?id=join)
* [lastIndexOf](/fr/docs?id=lastIndexOf)
* [map](/fr/docs?id=map)
* [reduce](/fr/docs?id=reduce)
* [reduceRight](/fr/docs?id=reduceRight)
* [reverse](/fr/docs?id=reverse)
* [shift](/fr/docs?id=shift)
* [slice](/fr/docs?id=slice)
* [some](/fr/docs?id=some)
* [sort](/fr/docs?id=sort)
* [splice](/fr/docs?id=splice)
* [toString](/fr/docs?id=toString)
* [unshift](/fr/docs?id=unshift)

### Installation

Dans un terminal ou une ligne de commande, accédez au dossier de votre projet :

```bash
npm install array.ahk
```
Vous pouvez également consulter ou copier la bibliothèque depuis [./export.ahk sur GitHub](https://raw.githubusercontent.com/chunjee/array.ahk/master/export.ahk)


Dans ton code :

```autohotkey
#Include %A_ScriptDir%\node_modules
#Include array.ahk\export.ahk

msgbox, % [1,2,3].join()
; => "1,2,3"
```

### Usage

Usage: `array.<fn>([params*])`
```autohotkey
; Mapper à la valeur doublée
arrayInt := [1, 5, 10]
arrayInt.map(func("fn_doubleInt"))
; => [2, 10, 20]

fn_doubleInt(int) {
	return int * 2
}


; Mapper à la propriété de l&#x27;objet
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]
arrayObj.map(func("fn_returnName"))
; => ["bob", "tom"]

fn_returnName(obj) {
	return obj.name
}


; Chaînage de méthodes
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]
msgbox, % arrayObj.map(func("fn_returnProp").bind("age"))
	.map(func("fn_doubleInt"))
	.join(",")
; => "44,102"

fn_returnProp(prop, obj) {
	return obj[prop]
}
```

### Tri

JavaScript n&#x27;expose pas les paramètres début/fin ou gauche/droite et ce tri non plus.

`array.sort([params*])`
```autohotkey
arrayInt := [11,9,5,10,1,6,3,4,7,8,2]
arrayInt.sort()
; => [1,2,3,4,5,6,7,8,9,10,11]
```
