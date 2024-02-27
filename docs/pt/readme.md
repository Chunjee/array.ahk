# array.ahk
## Conversão de métodos Array de JavaScript para AutoHotkey


AutoHotkey não possui métodos auxiliares de iteração integrados (a partir de 1.1.33) para executar muitos dos comportamentos comuns de array encontrados em outras linguagens.

### Métodos portados
* [concat](/pt/docs?id=concat)
* [every](/pt/docs?id=every)
* [fill](/pt/docs?id=fill)
* [filter](/pt/docs?id=filter)
* [find](/pt/docs?id=find)
* [findIndex](/pt/docs?id=findIndex)
* [forEach](/pt/docs?id=forEach)
* [includes](/pt/docs?id=includes)
* [indexOf](/pt/docs?id=indexOf)
* [join](/pt/docs?id=join)
* [lastIndexOf](/pt/docs?id=lastIndexOf)
* [map](/pt/docs?id=map)
* [reduce](/pt/docs?id=reduce)
* [reduceRight](/pt/docs?id=reduceRight)
* [reverse](/pt/docs?id=reverse)
* [shift](/pt/docs?id=shift)
* [slice](/pt/docs?id=slice)
* [some](/pt/docs?id=some)
* [sort](/pt/docs?id=sort)
* [splice](/pt/docs?id=splice)
* [toString](/pt/docs?id=toString)
* [unshift](/pt/docs?id=unshift)
* [values](/pt/docs?id=values)

### Instalação

Em um terminal ou linha de comando navegue até a pasta do seu projeto:

```bash
npm install array.ahk
```
Você também pode revisar ou copiar a biblioteca de [./export.ahk no GitHub](https://raw.githubusercontent.com/chunjee/array.ahk/master/export.ahk)


No seu código:

```autohotkey
#Include %A_ScriptDir%\node_modules
#Include array.ahk\export.ahk

msgbox, % [1,2,3].join()
; => "1,2,3"
```

### Uso

Usage: `array.<fn>([params*])`
```autohotkey
; Mapear para valor duplicado
arrayInt := [1, 5, 10]
arrayInt.map(func("fn_doubleInt"))
; => [2, 10, 20]

fn_doubleInt(int) {
	return int * 2
}


; Mapear para propriedade do objeto
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]
arrayObj.map(func("fn_returnName"))
; => ["bob", "tom"]

fn_returnName(obj) {
	return obj.name
}


; Encadeamento de métodos
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]
msgbox, % arrayObj.map(func("fn_returnProp").bind("age"))
	.map(func("fn_doubleInt"))
	.join(",")
; => "44,102"

fn_returnProp(prop, obj) {
	return obj[prop]
}
```

### Ordenação

JavaScript não expõe parâmetros de início/fim ou esquerda/direita e nem essa classificação.

`array.sort([params*])`
```autohotkey
arrayInt := [11,9,5,10,1,6,3,4,7,8,2]
arrayInt.sort()
; => [1,2,3,4,5,6,7,8,9,10,11]
```
