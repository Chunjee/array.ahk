## .concat
> `array.concat([value*])`

Utilizzato per unire due o più array. 


#### argomenti
| Argument       | Type                                                 | Description  |
| :------------- | :--------------------------------------------------- | :----------- |
|  value*        | valore/oggetto | Opzionale. (Predefinito `[]`) Array e/o valori da concatenare in un nuovo array.  |


#### ritorna
(array): Una nuova istanza di Array. 


#### Esempio
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

Verifica se tutti gli elementi nell'array superano il test implementato dalla funzione fornita.


#### argomenti
| Argument                              | Type                   | Description  |
| :------------------------------------ | :--------------------- | :----------- |
|  function(element, index, array)      | funzione | Necessario. Una funzione da eseguire per ogni elemento dell'array. |


#### ritorna
(boolean): "true" se tutti gli elementi superano la funzione di test, altrimenti "false" se qualcuno non lo ha fatto.


#### Esempio
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

Riempi tutti gli elementi dell'array con un valore statico.

> [!Note]
> Questo metodo modifica l&#x27;array chiamante

#### argomenti
| Argument       | Type                       | Description  |
| :------------- | :------------------------- | :----------- |
|  value         | valore | Necessario. Il valore con cui riempire la matrice. |
|  start         | numero | Opzionale. (Predefinito `1`) L'indice per iniziare a riempire l'array.  |
|  end           | numero | Opzionale. (Predefinito `array.Count()`) Il valore con cui riempire l'array.  |


#### ritorna
(array): L'array modificato, riempito con valore.


#### Esempio
```autohotkey
[1, 2, 3].fill(1)
; => [1, 1, 1]
```
<!-- end of fill -->


## .filter
> `array.filter(func("function"))`

Crea un nuovo array con tutti gli elementi che superano il test implementato dalla funzione fornita. 

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | funzione     | Necessario. La funzione è un predicato, per testare ogni elemento dell'array.  |


#### ritorna
(array): Un nuovo array con gli elementi che superano il test. 


#### Esempio
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

Restituisce il valore del primo elemento nell'array fornito che soddisfa la funzione di test fornita. 

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | funzione     | Necessario. Funzione da eseguire su ciascun valore nell'array. |


#### ritorna
(value): Il valore del primo elemento nell'array che soddisfa la funzione di test fornita. 


#### Esempio
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

Restituisce l'indice del primo elemento nell'array che soddisfa la funzione di test fornita. 

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | funzione | Necessario. Funzione da eseguire su ciascun valore nell'array. |


#### ritorna
(value): L'indice o il valore della chiave del primo elemento nell'array che soddisfa la funzione di test fornita. 


#### Esempio
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

Esegue una funzione fornita una volta per ogni elemento dell'array. 

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | funzione | Necessario. Funzione da eseguire su ciascun valore nell'array. |


#### ritorna
(""): `""` viene sempre restituito.


#### Esempio
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

Determina se un array include un determinato valore tra le sue voci, restituendo true o false a seconda dei casi.

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  valueToFind   | *            | Necessario. Il valore da cercare. |
|  fromIndex     | numero       | Opzionale. (Predefinito `1`) L'indice da cui iniziare la ricerca.  |


#### ritorna
(boolean): "true" se il valore valueToFind si trova all'interno dell'array (o nella parte dell'array indicata dall'indice fromIndex, se specificato). 


#### Esempio
```autohotkey
[1, 2, 3, 4].includes(2)
; => true

[1, 2, 3, 4].includes("Socrates")
; => false
```
<!-- end of includes -->


## .indexOf
> `array.indexOf(valueToFind[, fromIndex])`

Restituisce il primo indice in cui è possibile trovare un determinato elemento nell'array o "-1" se non è presente.

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | valore        | Necessario. Il valore da cercare. |
|  fromIndex     | numero       | Opzionale. (Predefinito `1`) L'indice da cui iniziare la ricerca.  |


#### ritorna
(number): L'indice o il valore della chiave del primo elemento nell'array che corrisponde a searchElement. 


#### Esempio
```autohotkey
["Bill", "Ted"].indexOf("Socrates")
; => -1

["four", "three", "two", "one"].indexOf("three")
; => 2
```
<!-- end of indexOf -->


## .join
> `array.join(valueToFind[, fromIndex])`

Restituisce una nuova stringa concatenando tutti gli elementi in una matrice, separati da virgole o da una stringa separatore specificata. 

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  separator     | corda       | Opzionale. (Predefinito `","`) Specifica una stringa per separare ciascuna coppia di elementi adiacenti dell'array.  |


#### ritorna
(string): Una stringa con tutti gli elementi dell'array uniti. 


#### Esempio
```autohotkey
[1, 2, 3].join()
; => "1,2,3"

["Bill", "Ted"].join(" and ")
; => "Bill and Ted"
```
<!-- end of join -->


## .keys
> `array.keys()`

Restituisce un nuovo array che contiene le chiavi per ogni indice nell'array.

#### argomenti
Non accetta alcuna argomentazione.


#### ritorna
(array): Un nuovo array contenente tutte le chiavi nell'array chiamante.


#### Esempio
```autohotkey
["Bill", "Ted", "Socrates"].keys()
; => [1, 2, 3]
```
<!-- end of keys -->


## .lastIndexOf
> `array.lastIndexOf(valueToFind[, fromIndex])`

Restituisce il primo indice in cui è possibile trovare un determinato elemento nell'array o "-1" se non è presente.

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | valore        | Necessario. Il valore da cercare. |
|  fromIndex     | numero       | Opzionale. (Predefinito `1`) L'indice da cui iniziare la ricerca all'indietro.  |


#### ritorna
(number): L'ultimo indice dell'elemento nell'array


#### Esempio
```autohotkey
["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Ted")
; => 4

["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Socrates")
; => 3
```
<!-- end of lastIndexOf -->


## .map
> `array.map(func("function"))`

crea un nuovo array popolato con i risultati della chiamata a una funzione fornita su ogni elemento nell'array chiamante. 

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | funzione     | Necessario. Funzione che viene chiamata per ogni elemento di arr.  |


#### ritorna
(array): Un nuovo array in cui ciascun elemento è il risultato della funzione di callback.


#### Esempio
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

Esegue una funzione di riduzione su ciascun elemento dell'array, ottenendo un singolo valore di output. 

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      | funzione     | Necessario. Una funzione da eseguire su ogni elemento dell'array (tranne il primo, se non viene fornito il valore iniziale). |


#### ritorna
(value): Il singolo valore che risulta dalla riduzione.


#### Esempio
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

Applica una funzione a un accumulatore e a ciascun valore dell'array (da destra a sinistra) per ridurlo a un singolo valore. 

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      | funzione     | Necessario. Una funzione da eseguire su ogni elemento dell'array (tranne il primo, se non viene fornito il valore iniziale). |


#### ritorna
(value): Il singolo valore che risulta dalla riduzione.


#### Esempio
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

Inverte un array sul posto. 

> [!Note]
> Questo metodo modifica l&#x27;array chiamante

#### argomenti
Non accetta alcuna argomentazione.


#### ritorna
(array): La matrice invertita.


#### Esempio
```autohotkey
[1, 2, 3].reverse()
; => [3, 2, 1]
```
<!-- end of reverse -->


## .shift
> `array.shift()`

Rimuove il primo elemento da un array e restituisce l'elemento rimosso. 

> [!Note]
> Questo metodo modifica l&#x27;array chiamante

#### argomenti
Non accetta alcuna argomentazione.


#### ritorna
(value): L'elemento rimosso dall'array; 


#### Esempio
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

Restituisce una copia superficiale di una porzione di un array in un nuovo oggetto array selezionato dall'inizio alla fine (fine non inclusa) dove inizio e fine rappresentano l'indice degli elementi in quell'array. 

#### argomenti
| Argument       | Type                      | Description  |
| :------------- | :------------------------ | :----------- |
|  start         | numero | Opzionale. (Predefinito `1`) L'indice da cui iniziare l'estrazione. |
|  end           | numero | Opzionale. (Default `array.Count()`) L'indice al quale terminare l'estrazione.  |


#### ritorna
(value): Un nuovo array contenente gli elementi estratti.


#### Esempio
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

Verifica se almeno un elemento nell'array supera il test implementato dalla funzione fornita. 

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)      | funzione     | Necessario. Una funzione da eseguire per ogni elemento dell'array.  |


#### ritorna
(boolean): "true" se la funzione di callback restituisce un valore di verità per almeno un elemento nell'array. 


#### Esempio
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

Ordina gli elementi di un array sul posto e restituisce l'array ordinato. 

> [!Note]
> Questo metodo modifica l&#x27;array chiamante

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  compareFunction(firstElement, secondElement)      | funzione     | Opzionale. Specifica una funzione che definisce l'ordinamento.  |

| compareFunction(a, b) return value | sort order |
| :------------- | :----------- |
| > 0			 | ordina `b` prima di `a`. |
| < 0			 | ordina `a` prima di `b`. |
| == 0			 | mantenere l'ordine originale di `a` e `b`. |


#### ritorna
(array): L'array ordinato. 


#### Esempio
```autohotkey
[1, 30, 4, 21, 100000].sort()
; => [1, 4, 21, 30, 100000]

["ted", "Bill", "bill", "Ted", "Socrates", "Lincoln"].sort()
; => ["Bill", "Lincoln", "Socrates, "Ted", "bill, "ted"]
```
<!-- end of sort -->


## .splice
> `array.splice(start, [deleteCount, values*])`

Modifica il contenuto di un array rimuovendo o sostituendo gli elementi esistenti e/o aggiungendo nuovi elementi.

> [!Note]
> Questo metodo modifica l&#x27;array chiamante

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  start         | numero       | Necessario. L'indice da cui iniziare a modificare l'array.  |
|  deleteCount    | numero       | Opzionale. (Default `-1`) Un numero intero che indica il numero di elementi nell'array da rimuovere. |
|  values*        | valore/oggetto | Opzionale. (Default `""`) I valori da aggiungere all'array.  |


#### ritorna
(array): Un array contenente gli elementi eliminati. 


#### Esempio
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

Restituisce una stringa che rappresenta l'array specificato e i suoi elementi.

#### argomenti
Non accetta alcuna argomentazione.


#### ritorna
(string): Una stringa che rappresenta tutti gli elementi dell'array.


#### Esempio
```autohotkey
["Bill", "Ted"].toString()
; => "Bill,Ted"
```
<!-- end of toString -->


## .unshift
> `array.unshift(element*)`

Aggiunge uno o più elementi all'inizio di una matrice e restituisce la nuova lunghezza della matrice.

> [!Note]
> Questo metodo modifica l&#x27;array chiamante

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  element*      | valore/oggetto | Necessario. Gli elementi da aggiungere all'inizio dell'array. |



#### ritorna
La nuova lunghezza array.Count() dell'array su cui è stato chiamato il metodo.


#### Esempio
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

Restituisce un nuovo array che contiene i valori per ogni elemento nell'array chiamante.

#### argomenti
Non accetta alcuna argomentazione.


#### ritorna
(array): Un nuovo array contenente tutti i valori nell'array chiamante.


#### Esempio
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
