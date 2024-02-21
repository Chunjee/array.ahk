## .concat
> `array.concat([value*])`

Se utiliza para unir dos o más matrices.


#### Argumentos
| Argument       | Type                                                 | Description  |
| :------------- | :--------------------------------------------------- | :----------- |
|  value*        | valor/objeto | Opcional. (Predeterminado `[]`) Matrices y/o valores para concatenar en una nueva matriz. |


#### Devoluciones
(array): Una nueva instancia de Array. 


#### Ejemplo
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

Prueba si todos los elementos de la matriz pasan la prueba implementada por la función proporcionada.


#### Argumentos
| Argument                              | Type                   | Description  |
| :------------------------------------ | :--------------------- | :----------- |
|  function(element, index, array)      | función | Requerido. Una función que se ejecutará para cada elemento de la matriz. |


#### Devoluciones
(boolean): "verdadero" si todos los elementos pasan la función de prueba; en caso contrario, "falso" si alguno no lo hizo.


#### Ejemplo
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

Llene todos los elementos de la matriz con un valor estático.

> [!Note]
> Este método modifica la matriz de llamada.

#### Argumentos
| Argument       | Type                       | Description  |
| :------------- | :------------------------- | :----------- |
|  value         | valor | Requerido. El valor con el que llenar la matriz. |
|  start         | número | Opcional. (Predeterminado `1`) El índice para comenzar a llenar la matriz. |
|  end           | número | Opcional. (Predeterminado `array.Count()`) El valor con el que llenar la matriz. |


#### Devoluciones
(array): La matriz modificada, llena de valor.


#### Ejemplo
```autohotkey
[1, 2, 3].fill(1)
; => [1, 1, 1]
```
<!-- end of fill -->


## .filter
> `array.filter(func("function"))`

Crea una nueva matriz con todos los elementos que pasan la prueba implementada por la función proporcionada.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | función     | Requerido. La función es un predicado para probar cada elemento de la matriz. |


#### Devoluciones
(array): Un nuevo array con los elementos que pasan la prueba. 


#### Ejemplo
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

Devuelve el valor del primer elemento de la matriz proporcionada que satisface la función de prueba proporcionada.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | función     | Requerido. Función a ejecutar en cada valor del array. |


#### Devoluciones
(value): El valor del primer elemento de la matriz que satisface la función de prueba proporcionada. 


#### Ejemplo
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

Devuelve el índice del primer elemento de la matriz que satisface la función de prueba proporcionada.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | función | Requerido. Función a ejecutar en cada valor del array. |


#### Devoluciones
(value): El índice o valor clave del primer elemento de la matriz que satisface la función de prueba proporcionada. 


#### Ejemplo
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

Ejecuta una función proporcionada una vez para cada elemento de la matriz.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | función | Requerido. Función a ejecutar en cada valor del array. |


#### Devoluciones
(""): `""` siempre se devuelve.


#### Ejemplo
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

Determina si una matriz incluye un determinado valor entre sus entradas, devolviendo verdadero o falso según corresponda.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  valueToFind   | *            | Requerido. El valor a buscar. |
|  fromIndex     | número       | Opcional. (Predeterminado `1`) El índice para iniciar la búsqueda. |


#### Devoluciones
(boolean): `true` si el valor valueToFind se encuentra dentro de la matriz (o la parte de la matriz indicada por el índice fromIndex, si se especifica). 


#### Ejemplo
```autohotkey
[1, 2, 3, 4].includes(2)
; => true

[1, 2, 3, 4].includes("Socrates")
; => false
```
<!-- end of includes -->


## .indexOf
> `array.indexOf(valueToFind[, fromIndex])`

Devuelve el primer índice en el que se puede encontrar un elemento determinado en la matriz, o "-1" si no está presente.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | valor        | Requerido. El valor a buscar. |
|  fromIndex     | número       | Opcional. (Predeterminado `1`) El índice para iniciar la búsqueda. |


#### Devoluciones
(number): El índice o valor clave del primer elemento de la matriz que coincide con searchElement. 


#### Ejemplo
```autohotkey
["Bill", "Ted"].indexOf("Socrates")
; => -1

["four", "three", "two", "one"].indexOf("three")
; => 2
```
<!-- end of indexOf -->


## .join
> `array.join(valueToFind[, fromIndex])`

Devuelve una nueva cadena concatenando todos los elementos de una matriz, separados por comas o una cadena separadora especificada.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  separator     | cadena       | Opcional. (Predeterminado `","`) Especifica una cadena para separar cada par de elementos adyacentes de la matriz. |


#### Devoluciones
(string): Una cadena con todos los elementos de la matriz unidos. 


#### Ejemplo
```autohotkey
[1, 2, 3].join()
; => "1,2,3"

["Bill", "Ted"].join(" and ")
; => "Bill and Ted"
```
<!-- end of join -->


## .keys
> `array.keys()`

Devuelve una nueva matriz que contiene las claves para cada índice de la matriz.

#### Argumentos
No acepta ningún argumento.


#### Devoluciones
(array): Una nueva matriz que contiene todas las claves de la matriz de llamada.


#### Ejemplo
```autohotkey
["Bill", "Ted", "Socrates"].keys()
; => [1, 2, 3]
```
<!-- end of keys -->


## .lastIndexOf
> `array.lastIndexOf(valueToFind[, fromIndex])`

Devuelve el primer índice en el que se puede encontrar un elemento determinado en la matriz, o "-1" si no está presente.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | valor        | Requerido. El valor a buscar. |
|  fromIndex     | número       | Opcional. (Predeterminado `1`) El índice en el que comenzar a buscar hacia atrás. |


#### Devoluciones
(number): El último índice del elemento en la matriz.


#### Ejemplo
```autohotkey
["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Ted")
; => 4

["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Socrates")
; => 3
```
<!-- end of lastIndexOf -->


## .map
> `array.map(func("function"))`

crea una nueva matriz completa con los resultados de llamar a una función proporcionada en cada elemento de la matriz de llamada.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | función     | Requerido. Función que se llama para cada elemento de arr. |


#### Devoluciones
(array): Una nueva matriz en la que cada elemento es el resultado de la función de devolución de llamada.


#### Ejemplo
```autohotkey
[1, 2, 3].map(func("fn_timesTwo"))
; => [2, 4, 6]

fn_timesTwo(o)
{
	return o * 2
}


["Bill", "Ted"].map(func("fn_upcase"))
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

Ejecuta una función reductora en cada elemento de la matriz, lo que da como resultado un valor de salida único.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      | función     | Requerido. Una función para ejecutar en cada elemento de la matriz (excepto el primero, si no se proporciona un valor inicial). |


#### Devoluciones
(value): El valor único que resulta de la reducción.


#### Ejemplo
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

Aplica una función contra un acumulador y cada valor del array (de derecha a izquierda) para reducirlo a un solo valor.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      |      | Requerido. Una función para ejecutar en cada elemento de la matriz (excepto el primero, si no se proporciona un valor inicial). |


#### Devoluciones
(value): El valor único que resulta de la reducción.


#### Ejemplo
```autohotkey
[[0, 1], [2, 3], [4, 5]].reduceRight(func("fn_reduceNestedArray"))
; => [4, 5, 2, 3, 0, 1]

fn_reduceNestedArray(previousValue, currentValue)
{
	return previousValue.concat(currentValue)
}
```
<!-- end of reduceRight -->


## .reverse
> `array.reverse()`

Invierte una matriz en su lugar.

> [!Note]
> Este método modifica la matriz de llamada.

#### Argumentos
No acepta ningún argumento.


#### Devoluciones
(array): La matriz invertida.


#### Ejemplo
```autohotkey
[1, 2, 3].reverse()
; => [3, 2, 1]
```
<!-- end of reverse -->


## .shift
> `array.shift()`

Elimina el primer elemento de una matriz y devuelve ese elemento eliminado.

> [!Note]
> Este método modifica la matriz de llamada.

#### Argumentos
No acepta ningún argumento.


#### Devoluciones
(value): El elemento eliminado de la matriz; 


#### Ejemplo
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

Devuelve una copia superficial de una parte de una matriz en un nuevo objeto de matriz seleccionado de principio a fin (no incluido el final), donde el inicio y el final representan el índice de los elementos de esa matriz.

#### Argumentos
| Argument       | Type                      | Description  |
| :------------- | :------------------------ | :----------- |
|  start         | número | Opcional. (Predeterminado `1`) El índice en el que comenzar la extracción. |
|  end           | número | Opcional. (Predeterminado `array.Count()`) El índice en el que finalizar la extracción. |


#### Devoluciones
(value): Una nueva matriz que contiene los elementos extraídos.


#### Ejemplo
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

Prueba si al menos un elemento de la matriz pasa la prueba implementada por la función proporcionada.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)      | función     | Requerido. Una función a ejecutar para cada elemento de la matriz. |


#### Devoluciones
(boolean): `verdadero` si la función de devolución de llamada devuelve un valor verdadero para al menos un elemento de la matriz. 


#### Ejemplo
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

Ordena los elementos de una matriz en su lugar y devuelve la matriz ordenada.

> [!Note]
> Este método modifica la matriz de llamada.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  compareFunction(firstElement, secondElement)      | función     | Opcional. Especifica una función que define el orden de clasificación. |

| compareFunction(a, b) return value | sort order |
| :------------- | :----------- |
| > 0			 | ordenar `b` antes de `a` |
| < 0			 | ordenar `a` antes de `b` |
| == 0			 | mantener el orden original de `a` y `b` |


#### Devoluciones
(array): La matriz ordenada.


#### Ejemplo
```autohotkey
[1, 30, 4, 21, 100000].sort()
; => [1, 4, 21, 30, 100000]

["ted", "Bill", "bill", "Ted", "Socrates", "Lincoln"].sort()
; => ["Bill", "Lincoln", "Socrates, "Ted", "bill, "ted"]
```
<!-- end of sort -->


## .splice
> `array.splice(start, [end, values*])`

Cambia el contenido de una matriz eliminando o reemplazando elementos existentes y/o agregando nuevos elementos en su lugar.

> [!Note]
> Este método modifica la matriz de llamada.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  start         | número       | Requerido. El índice en el que comenzar a cambiar la matriz. |
|  deleteCount    | número       | Opcional. (Default `-1`) Un número entero que indica el número de elementos de la matriz que se van a eliminar. |
|  values*        | valor/objeto | Opcional. (Default `""`) Los valores para agregar a la matriz. |


#### Devoluciones
(array): Una matriz que contiene los elementos eliminados. 


#### Ejemplo
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

Devuelve una cadena que representa la matriz especificada y sus elementos.

#### Argumentos
No acepta ningún argumento.


#### Devoluciones
(string): Una cadena que representa todos los elementos de la matriz.


#### Ejemplo
```autohotkey
["Bill", "Ted"].toString()
; => "Bill,Ted"
```
<!-- end of toString -->


## .unshift
> `array.unshift(element*)`

Agrega uno o más elementos al comienzo de una matriz y devuelve la nueva longitud de la matriz.

> [!Note]
> Este método modifica la matriz de llamada.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  element*      | valor/objeto | Requerido. Los elementos que se agregarán al frente de la matriz. |



#### Devoluciones
La nueva longitud array.Count() de la matriz sobre la que se llamó el método.


#### Ejemplo
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

Devuelve una nueva matriz que contiene los valores de cada elemento de la matriz que llama.

#### Argumentos
No acepta ningún argumento.


#### Devoluciones
(array): Una nueva matriz que contiene todos los valores de la matriz de llamada.


#### Ejemplo
```autohotkey
["Bill", "Ted", "Socrates"].values()
; => ["Bill, "Ted, "Socrates"]

array := []
array.InsertAt("x", "Bill")
array.InsertAt("y", "Ted")
array.InsertAt("z", "Socrates")
array.values()
; => ["Bill, "Ted, "Socrates"]
```
<!-- end of values -->
