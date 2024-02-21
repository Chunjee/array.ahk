# array.ahk
## Conversión de métodos Array de JavaScript a AutoHotkey


AutoHotkey carece de métodos auxiliares de iteración integrados (a partir de 1.1.33) para realizar muchos de los comportamientos de matrices comunes que se encuentran en otros lenguajes.

### Métodos portados
* [concat](/es/docs?id=concat)
* [every](/es/docs?id=every)
* [fill](/es/docs?id=fill)
* [filter](/es/docs?id=filter)
* [find](/es/docs?id=find)
* [findIndex](/es/docs?id=findIndex)
* [forEach](/es/docs?id=forEach)
* [includes](/es/docs?id=includes)
* [indexOf](/es/docs?id=indexOf)
* [join](/es/docs?id=join)
* [lastIndexOf](/es/docs?id=lastIndexOf)
* [map](/es/docs?id=map)
* [reduce](/es/docs?id=reduce)
* [reduceRight](/es/docs?id=reduceRight)
* [reverse](/es/docs?id=reverse)
* [shift](/es/docs?id=shift)
* [slice](/es/docs?id=slice)
* [some](/es/docs?id=some)
* [sort](/es/docs?id=sort)
* [splice](/es/docs?id=splice)
* [toString](/es/docs?id=toString)
* [unshift](/es/docs?id=unshift)

### Instalación

En una terminal o línea de comando navegó a la carpeta de su proyecto:

```bash
npm install array.ahk
```
También puede revisar o copiar la biblioteca desde [./export.ahk en GitHub](https://raw.githubusercontent.com/chunjee/array.ahk/master/export.ahk)


En tu código:

```autohotkey
#Include %A_ScriptDir%\node_modules
#Include array.ahk\export.ahk

msgbox, % [1,2,3].join()
; => "1,2,3"
```

### Uso

Usage: `array.<fn>([params*])`
```autohotkey
; Mapa al valor duplicado
arrayInt := [1, 5, 10]
arrayInt.map(func("fn_doubleInt"))
; => [2, 10, 20]

fn_doubleInt(int) {
	return int * 2
}


; Asignar a propiedad de objeto
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]
arrayObj.map(func("fn_returnName"))
; => ["bob", "tom"]

fn_returnName(obj) {
	return obj.name
}


; Encadenamiento de métodos
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]
msgbox, % arrayObj.map(func("fn_returnProp").bind("age"))
	.map(func("fn_doubleInt"))
	.join(",")
; => "44,102"

fn_returnProp(prop, obj) {
	return obj[prop]
}
```

### Clasificación

JavaScript no expone los parámetros de inicio/fin o izquierda/derecha y tampoco este tipo.

`array.sort([params*])`
```autohotkey
arrayInt := [11,9,5,10,1,6,3,4,7,8,2]
arrayInt.sort()
; => [1,2,3,4,5,6,7,8,9,10,11]
```
