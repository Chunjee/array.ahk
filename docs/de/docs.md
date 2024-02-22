## .concat
> `array.concat([value*])`

Wird verwendet, um zwei oder mehr Arrays zu verbinden.


#### Argumente
| Argument       | Type                                                 | Description  |
| :------------- | :--------------------------------------------------- | :----------- |
|  value*        | wert/objekt | Optional. (Standard `[]`) Arrays und/oder Werte, die zu einem neuen Array verkettet werden sollen. |


#### Kehrt zurück
(array): Eine neue Array-Instanz. 


#### Beispiel
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

Testet, ob alle Elemente im Array den von der bereitgestellten Funktion implementierten Test bestehen.


#### Argumente
| Argument                              | Type                   | Description  |
| :------------------------------------ | :--------------------- | :----------- |
|  function(element, index, array)      | funktion | Erforderlich. Eine Funktion, die für jedes Element im Array ausgeführt werden soll. |


#### Kehrt zurück
(boolean): `true`, wenn alle Elemente die Testfunktion bestehen, andernfalls `false`, wenn dies bei einem nicht der Fall war.


#### Beispiel
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

Füllen Sie alle Array-Elemente mit einem statischen Wert.

> [!Note]
> Diese Methode ändert das aufrufende Array

#### Argumente
| Argument       | Type                       | Description  |
| :------------- | :------------------------- | :----------- |
|  value         | wert | Erforderlich. Der Wert, mit dem das Array gefüllt werden soll. |
|  start         | nummer | Optional. (Standard `1`) Der Index, mit dem das Füllen des Arrays beginnen soll. |
|  end           | nummer | Optional. (Standard `array.Count()`) Der Wert, mit dem das Array gefüllt werden soll. |


#### Kehrt zurück
(array): Das geänderte Array, gefüllt mit Wert.


#### Beispiel
```autohotkey
[1, 2, 3].fill(1)
; => [1, 1, 1]
```
<!-- end of fill -->


## .filter
> `array.filter(func("function"))`

Erstellt ein neues Array mit allen Elementen, die den von der bereitgestellten Funktion implementierten Test bestehen.

#### Argumente
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | funktion     | Erforderlich. Funktion ist ein Prädikat, um jedes Element des Arrays zu testen. |


#### Kehrt zurück
(array): Ein neues Array mit den Elementen, die den Test bestehen. 


#### Beispiel
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

Gibt den Wert des ersten Elements im bereitgestellten Array zurück, das die bereitgestellte Testfunktion erfüllt.

#### Argumente
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | funktion     | Erforderlich. Funktion, die für jeden Wert im Array ausgeführt werden soll. |


#### Kehrt zurück
(value): Der Wert des ersten Elements im Array, das die bereitgestellte Testfunktion erfüllt. 


#### Beispiel
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

Gibt den Index des ersten Elements im Array zurück, das die bereitgestellte Testfunktion erfüllt.

#### Argumente
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | funktion | Erforderlich. Funktion, die für jeden Wert im Array ausgeführt werden soll. |


#### Kehrt zurück
(value): Der Index oder Schlüsselwert des ersten Elements im Array, das die bereitgestellte Testfunktion erfüllt. 


#### Beispiel
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

Führt eine bereitgestellte Funktion einmal für jedes Array-Element aus.

#### Argumente
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | funktion | Erforderlich. Funktion, die für jeden Wert im Array ausgeführt werden soll. |


#### Kehrt zurück
(""): `""` wird immer zurückgegeben.


#### Beispiel
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

Bestimmt, ob ein Array einen bestimmten Wert in seinen Einträgen enthält, und gibt je nach Bedarf `true` oder `false` zurück.

#### Argumente
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  valueToFind   | *            | Erforderlich. Der Wert, nach dem gesucht werden soll. |
|  fromIndex     | nummer       | Optional. (Standard `1`) Der Index, bei dem die Suche gestartet werden soll. |


#### Kehrt zurück
(boolean): `true`, wenn der Wert valueToFind innerhalb des Arrays gefunden wird (oder dem Teil des Arrays, der durch den Index fromIndex angegeben wird, falls angegeben). 


#### Beispiel
```autohotkey
[1, 2, 3, 4].includes(2)
; => true

[1, 2, 3, 4].includes("Socrates")
; => false
```
<!-- end of includes -->


## .indexOf
> `array.indexOf(valueToFind[, fromIndex])`

Gibt den ersten Index zurück, an dem ein bestimmtes Element im Array gefunden werden kann, oder `-1`, wenn es nicht vorhanden ist.

#### Argumente
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | wert        | Erforderlich. Der Wert, nach dem gesucht werden soll. |
|  fromIndex     | nummer       | Optional. (Standard `1`) Der Index, bei dem die Suche gestartet werden soll. |


#### Kehrt zurück
(number): Der Index oder Schlüsselwert des ersten Elements im Array, das mit dem searchElement übereinstimmt. 


#### Beispiel
```autohotkey
["Bill", "Ted"].indexOf("Socrates")
; => -1

["four", "three", "two", "one"].indexOf("three")
; => 2
```
<!-- end of indexOf -->


## .join
> `array.join(valueToFind[, fromIndex])`

Gibt eine neue Zeichenfolge zurück, indem alle Elemente in einem Array, getrennt durch Kommas oder eine angegebene Trennzeichenfolge, verkettet werden.

#### Argumente
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  separator     | zeichenfolge       | Optional. (Standard `","`) Gibt eine Zeichenfolge an, um jedes Paar benachbarter Elemente des Arrays zu trennen. |


#### Kehrt zurück
(string): Eine Zeichenfolge, bei der alle Array-Elemente verbunden sind. 


#### Beispiel
```autohotkey
[1, 2, 3].join()
; => "1,2,3"

["Bill", "Ted"].join(" and ")
; => "Bill and Ted"
```
<!-- end of join -->


## .keys
> `array.keys()`

Gibt ein neues Array zurück, das die Schlüssel für jeden Index im Array enthält.

#### Argumente
Akzeptiert keine Argumente.


#### Kehrt zurück
(array): Ein neues Array, das alle Schlüssel im aufrufenden Array enthält.


#### Beispiel
```autohotkey
["Bill", "Ted", "Socrates"].keys()
; => [1, 2, 3]
```
<!-- end of keys -->


## .lastIndexOf
> `array.lastIndexOf(valueToFind[, fromIndex])`

Gibt den ersten Index zurück, an dem ein bestimmtes Element im Array gefunden werden kann, oder `-1`, wenn es nicht vorhanden ist.

#### Argumente
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | wert        | Erforderlich. Der Wert, nach dem gesucht werden soll. |
|  fromIndex     | nummer       | Optional. (Standard `1`) Der Index, bei dem mit der Rückwärtssuche begonnen werden soll. |


#### Kehrt zurück
(number): Der letzte Index des Elements im Array


#### Beispiel
```autohotkey
["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Ted")
; => 4

["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Socrates")
; => 3
```
<!-- end of lastIndexOf -->


## .map
> `array.map(func("function"))`

Erstellt ein neues Array, das mit den Ergebnissen des Aufrufs einer bereitgestellten Funktion für jedes Element im aufrufenden Array gefüllt wird.

#### Argumente
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | funktion     | Erforderlich. Funktion, die für jedes Element von arr aufgerufen wird. |


#### Kehrt zurück
(array): Ein neues Array, wobei jedes Element das Ergebnis der Rückruffunktion ist.


#### Beispiel
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

Führt eine Reduzierfunktion für jedes Element des Arrays aus, was zu einem einzelnen Ausgabewert führt.

#### Argumente
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      | funktion     | Erforderlich. Eine Funktion, die für jedes Element im Array ausgeführt wird (mit Ausnahme des ersten, wenn kein initialValue angegeben wird). |


#### Kehrt zurück
(value): Der einzelne Wert, der sich aus der Reduzierung ergibt.


#### Beispiel
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

Wendet eine Funktion auf einen Akkumulator und jeden Wert des Arrays (von rechts nach links) an, um ihn auf einen einzelnen Wert zu reduzieren.

#### Argumente
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      | funktion     | Erforderlich. Eine Funktion, die für jedes Element im Array ausgeführt wird (mit Ausnahme des ersten, wenn kein initialValue angegeben wird). |


#### Kehrt zurück
(value): Der einzelne Wert, der sich aus der Reduzierung ergibt.


#### Beispiel
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

Kehrt ein Array um.

> [!Note]
> Diese Methode ändert das aufrufende Array

#### Argumente
Akzeptiert keine Argumente.


#### Kehrt zurück
(array): Das umgekehrte Array.


#### Beispiel
```autohotkey
[1, 2, 3].reverse()
; => [3, 2, 1]
```
<!-- end of reverse -->


## .shift
> `array.shift()`

Entfernt das erste Element aus einem Array und gibt das entfernte Element zurück.

> [!Note]
> Diese Methode ändert das aufrufende Array

#### Argumente
Akzeptiert keine Argumente.


#### Kehrt zurück
(value): Das aus dem Array entfernte Element; 


#### Beispiel
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

Gibt eine flache Kopie eines Teils eines Arrays in ein neues Array-Objekt zurück, das vom Anfang bis zum Ende ausgewählt wird (Ende nicht eingeschlossen), wobei Start und Ende den Index der Elemente in diesem Array darstellen.

#### Argumente
| Argument       | Type                      | Description  |
| :------------- | :------------------------ | :----------- |
|  start         | nummer | Optional. (Standard `1`) Der Index, bei dem mit der Extraktion begonnen werden soll. |
|  end           | nummer | Optional. (Standard `array.Count()`) Der Index, bei dem die Extraktion beendet werden soll. |


#### Kehrt zurück
(value): Ein neues Array, das die extrahierten Elemente enthält.


#### Beispiel
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

Testet, ob mindestens ein Element im Array den von der bereitgestellten Funktion implementierten Test besteht.

#### Argumente
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)      | funktion     | Erforderlich. Eine Funktion, die für jedes Element im Array ausgeführt werden soll. |


#### Kehrt zurück
(boolean): `true`, wenn die Rückruffunktion einen wahren Wert für mindestens ein Element im Array zurückgibt. 


#### Beispiel
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

Sortiert die Elemente eines Arrays an Ort und Stelle und gibt das sortierte Array zurück.

> [!Note]
> Diese Methode ändert das aufrufende Array

#### Argumente
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  compareFunction(firstElement, secondElement)      | funktion     | Optional. Gibt eine Funktion an, die die Sortierreihenfolge definiert. |

| compareFunction(a, b) return value | sort order |
| :------------- | :----------- |
| > 0			 | Sortieren Sie `b` vor `a`. |
| < 0			 | Sortieren Sie `a` vor `b`. |
| == 0			 | Behalten Sie die ursprüngliche Reihenfolge von `a` und `b` bei |


#### Kehrt zurück
(array): Das sortierte Array.


#### Beispiel
```autohotkey
[1, 30, 4, 21, 100000].sort()
; => [1, 4, 21, 30, 100000]

["ted", "Bill", "bill", "Ted", "Socrates", "Lincoln"].sort()
; => ["Bill", "Lincoln", "Socrates, "Ted", "bill, "ted"]
```
<!-- end of sort -->


## .splice
> `array.splice(start, [end, values*])`

Ändert den Inhalt eines Arrays, indem vorhandene Elemente entfernt oder ersetzt und/oder neue Elemente hinzugefügt werden.

> [!Note]
> Diese Methode ändert das aufrufende Array

#### Argumente
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  start         | nummer       | Erforderlich. Der Index, ab dem mit der Änderung des Arrays begonnen werden soll. |
|  deleteCount    | nummer       | Optional. (Default `-1`) Eine Ganzzahl, die die Anzahl der zu entfernenden Elemente im Array angibt. |
|  values*        | wert/objekt | Optional. (Default `""`) Die Werte, die dem Array hinzugefügt werden sollen. |


#### Kehrt zurück
(array): Ein Array, das die gelöschten Elemente enthält. 


#### Beispiel
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

Gibt eine Zeichenfolge zurück, die das angegebene Array und seine Elemente darstellt.

#### Argumente
Akzeptiert keine Argumente.


#### Kehrt zurück
(string): Eine Zeichenfolge, die alle Elemente des Arrays darstellt.


#### Beispiel
```autohotkey
["Bill", "Ted"].toString()
; => "Bill,Ted"
```
<!-- end of toString -->


## .unshift
> `array.unshift(element*)`

Fügt ein oder mehrere Elemente am Anfang eines Arrays hinzu und gibt die neue Länge des Arrays zurück.

> [!Note]
> Diese Methode ändert das aufrufende Array

#### Argumente
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  element*      | wert/objekt | Erforderlich. Die Elemente, die am Anfang des Arrays hinzugefügt werden sollen. |



#### Kehrt zurück
Die neue array.Count()-Länge des Arrays, für das die Methode aufgerufen wurde.


#### Beispiel
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

Gibt ein neues Array zurück, das die Werte für jedes Element im aufrufenden Array enthält.

#### Argumente
Akzeptiert keine Argumente.


#### Kehrt zurück
(array): Ein neues Array, das alle Werte im aufrufenden Array enthält.


#### Beispiel
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
