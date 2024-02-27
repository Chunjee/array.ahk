## .concat
> `array.concat([value*])`

Utilizzato per unire due o più array. Questo metodo non cambia gli array esistenti, ma ritorna un nuovo array contenente i valori degli array concatenati.


#### argomenti
| Argument       | Type                                                 | Description  |
| :------------- | :--------------------------------------------------- | :----------- |
|  value*        | valore/oggetto | Opzionale. (Predefinito `[]`) Array e/o valori da concatenare in un nuovo array. Se tutti i parametri valueN sono omessi, concat ritorna una copia dello stesso array su cui è chiamato il metodo. |


#### ritorna
(array): Una nuova istanza di Array. Contiene i valori degli array concatenati.


#### esempio
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
|  function(element, index, array)      | funzione | Richiesto. Una funzione da eseguire per ogni elemento dell'array. |


#### ritorna
(boolean): "true" se tutti gli elementi superano il test della funzione, altrimenti "false" se qualsiasi non lo ha superato.


#### esempio
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

Modifica tutti gli elementi dell'array con un valore statico.

> [!Note]
> Questo metodo modifica l&#x27;array chiamato

#### argomenti
| Argument       | Type                       | Description  |
| :------------- | :------------------------- | :----------- |
|  value         | valore | Richiesto. Il valore con cui modificare l'array. |
|  start         | numero | Opzionale. (Predefinito `1`) L'indice per iniziare a modificare l'array. Se negativo, viene interpretato come array.Count() + start |
|  end           | numero | Opzionale. (Predefinito `array.Count()`) Il valore con cui modificare l'array. Se negativo, viene interpretato come array.Count() + end |


#### ritorna
(array): L'array modificato con value.


#### esempio
```autohotkey
[1, 2, 3].fill(1)
; => [1, 1, 1]
```
<!-- end of fill -->


## .filter
> `array.filter(func("function"))`

Crea un nuovo array con tutti gli elementi che superano il test implementato dalla funzione fornita. La funzione è invocata con tre argomenti; (elemento, indice, array).

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | funzione     | Richiesto. La funzione è un predicato, per testare ogni elemento dell'array. Ritorna "true" per mantenere l'elemento, altrimenti "false". |


#### ritorna
(array): Un nuovo array con gli elementi che superano il test. Se nessun elemento supera il test, ritorna un array vuoto.


#### esempio
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

Ritorna il valore del primo elemento nell'array fornito che soddisfa la funzione di test fornita. La funzione è invocata con tre argomenti; (elemento, indice, array).

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | funzione     | Richiesto. Funzione da eseguire per ogni valore nell'array. |


#### ritorna
(value): Il valore del primo elemento nell'array che soddisfa la funzione di test fornita. Altrimenti "".


#### esempio
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

Ritorna l'indice del primo elemento nell'array che soddisfa la funzione di test fornita. Altrimenti ritorna -1, a indicare che nessuno degli elementi ha passato il test. La funzione è invocata con tre argomenti; (elemento, indice, array).

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | funzione | Richiesto. Funzione da eseguire per ogni valore nell'array. |


#### ritorna
(value): L'indice o il valore della chiave del primo elemento nell'array che soddisfa la funzione di test fornita. Altrimenti "-1" se non trovato.


#### esempio
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

Esegue una funzione fornita una volta per ogni elemento dell'array. La funzione è invocata con tre argomenti; (elemento, indice, array).

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | funzione | Richiesto. Funzione da eseguire per ogni valore nell'array. |


#### ritorna
(""): `""` Ritorna "" in ogni caso.


#### esempio
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

Determina se un array include un determinato valore tra le sue voci, ritornando true o false.

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  valueToFind   | *            | Richiesto. Il valore da cercare. |
|  fromIndex     | numero       | Opzionale. (Predefinito `1`) L'indice con cui iniziare la ricerca. Se l'indice fornito è un numero negativo, viene interpretato come differenza dalla fine dell'array. |


#### ritorna
(boolean): "true" se il valore valueToFind si trova nell'array (o nella parte dell'array indicata dall'indice fromIndex, se specificato). Altrimenti "false".


#### esempio
```autohotkey
[1, 2, 3, 4].includes(2)
; => true

[1, 2, 3, 4].includes("Socrates")
; => false
```
<!-- end of includes -->


## .indexOf
> `array.indexOf(valueToFind[, fromIndex])`

Ritorna il primo indice in cui si trova un determinato elemento nell'array o "-1" se non è presente.

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | valore        | Richiesto. . Il valore da cercare. |
|  fromIndex     | numero       | Opzionale. (Predefinito `1`) L'indice con cui iniziare la ricerca. Se l'indice fornito è un numero negativo, viene interpretato come differenza dalla fine dell'array. |


#### ritorna
(number): L'indice o il valore della chiave del primo elemento nell'array che corrisponde a searchElement. Altrimenti "-1" se non trovato.


#### esempio
```autohotkey
["Bill", "Ted"].indexOf("Socrates")
; => -1

["four", "three", "two", "one"].indexOf("three")
; => 2
```
<!-- end of indexOf -->


## .join
> `array.join(valueToFind[, fromIndex])`

Ritorna una nuova stringa concatenando tutti gli elementi in un array, separati da virgole o da una stringa separatrice specificata. Se l'array ha solo un oggetto, ritorna lo stesso oggetto senza il separatore.

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  separator     | stringa       | Opzionale. (Predefinito `","`) Specifica una stringa per separare ciascuna coppia di elementi adiacenti dell'array. Il separatore viene convertito in stringa se necessario. Se il separatore è una stringa vuota (""), tutti gli elementi sono uniti senza caratteri tra di loro. |


#### ritorna
(string): Una stringa con tutti gli elementi dell'array uniti. Se array.Count() è 0, ritorna una stringa vuota "".


#### esempio
```autohotkey
[1, 2, 3].join()
; => "1,2,3"

["Bill", "Ted"].join(" and ")
; => "Bill and Ted"
```
<!-- end of join -->


## .keys
> `array.keys()`

Ritorna un nuovo array che contiene le chiavi per ogni indice nell'array.

#### argomenti
Non accetta alcuno argomento.


#### ritorna
(array): Un nuovo array contenente tutte le chiavi nell'array chiamato.


#### esempio
```autohotkey
["Bill", "Ted", "Socrates"].keys()
; => [1, 2, 3]
```
<!-- end of keys -->


## .lastIndexOf
> `array.lastIndexOf(valueToFind[, fromIndex])`

Ritorna il primo indice in cui si trova un determinato elemento nell'array, "-1" se non è presente.

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | valore        | Richiesto. . Il valore da cercare. |
|  fromIndex     | numero       | Opzionale. (Predefinito `1`) L'indice con cui iniziare la ricerca all'indietro. Predefinito è la lunghezza dell'array meno uno (array.Count()), ovvero tutto l'array viene cercato. Se l'indice è maggiore o uguale alla lunghezza dell'array, tutto l'array viene cercato. Se negativo, viene interpretato come differenza dalla fine dell'array. Nota che anche se l'indice è negativo, l'array viene comunque cercato dalla fine all'inizio. |


#### ritorna
(number): L'ultimo indice dell'elemento nell'array.


#### esempio
```autohotkey
["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Ted")
; => 4

["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Socrates")
; => 3
```
<!-- end of lastIndexOf -->


## .map
> `array.map(func("function"))`

Crea un nuovo array popolato con i risultati della chiamata a una funzione fornita su ogni elemento nell'array chiamato. La funzione è invocata con tre argomenti; (elemento, indice, array).

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | funzione     | Richiesto. Funzione che viene chiamata per ogni elemento di arr. Ogni volta che callback viene eseguito, il valore di ritorno è aggiunto a new_array. |


#### ritorna
(array): Un nuovo array in cui ciascun elemento è il risultato della funzione di callback.


#### esempio
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

Esegue una funzione di riduzione per ogni elemento dell'array, ottenendo un singolo valore di uscita. La funzione di riduzione è invocata con quattro argomenti; (accumulatore, elemento, indice, array).

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      | funzione     | Richiesto. Una funzione da eseguire su ogni elemento dell'array (ecetto il primo, se non viene fornito il valore initialValue). |


#### ritorna
(value): Il singolo valore che risulta dalla riduzione.


#### esempio
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

Applica una funzione a un accumulatore e a ciascun valore dell'array (da destra a sinistra) per ridurlo a un singolo valore. La funzione di riduzione è invocata con quattro argomenti; (accumulatore, elemento, indice, array).

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      | funzione     | Richiesto. . Una funzione da eseguire su ogni elemento dell'array (tranne il primo, se non viene fornito il valore initialValue). |


#### ritorna
(value): Il singolo valore che risulta dalla riduzione.


#### esempio
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

Inverte un array sul posto. Il primo elemento diventa l'ultimo, e l'ultimo diventa il primo.

> [!Note]
> Questo metodo modifica l&#x27;array chiamato

#### argomenti
Non accetta alcuno argomento.


#### ritorna
(array): La matrice invertita.


#### esempio
```autohotkey
[1, 2, 3].reverse()
; => [3, 2, 1]
```
<!-- end of reverse -->


## .shift
> `array.shift()`

Rimuove il primo elemento da un array e ritorna l'elemento rimosso. Questo metodo modifica l'array.

> [!Note]
> Questo metodo modifica l&#x27;array chiamato

#### argomenti
Non accetta alcuno argomento.


#### ritorna
(value): L'elemento rimosso dall'array; "" se l'array è vuoto.


#### esempio
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

Ritorna una copia di una porzione di un array in un nuovo oggetto array selezionato dall'inizio alla fine (fine non inclusa) dove inizio e fine rappresentano l'indice degli elementi in quell'array. L'array originale non viene modificato.

#### argomenti
| Argument       | Type                      | Description  |
| :------------- | :------------------------ | :----------- |
|  start         | numero | Opzionale. (Predefinito `1`) L'indice con cui iniziare l'estrazione. |
|  end           | numero | Opzionale. (Default `array.Count()`) L'indice al quale terminare l'estrazione. slice estrae fino a, ma senza includere end. Se end è omesso, slice estrae fino alla fine della sequenza. Un indice negativo può essere usato, indicante la differenza dalla fine della sequenza. |


#### ritorna
(value): Un nuovo array contenente gli elementi estratti.


#### esempio
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

Verifica se almeno un elemento nell'array supera il test implementato dalla funzione fornita. Ritorna un valore Booleano. La funzione è invocata con tre argomenti; (elemento, indice, array).

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)      | funzione     | Richiesto. Una funzione da eseguire per ogni elemento dell'array. Dovrebbe ritornare un valore vero per indicare che l'elemento passa il test, altrimenti falso. |


#### ritorna
(boolean): "true" se la funzione di callback ritorna un valore vero per almeno un elemento nell'array. Altrimenti ritorna "false".


#### esempio
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

Ordina gli elementi di un array sul posto e ritorna l'array riordinato. Il riordino predefinito è ascendente. La funzione è invocata con due argomenti; (firstElement, secondElement).

> [!Note]
> Questo metodo modifica l&#x27;array chiamato

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  compareFunction(firstElement, secondElement)      | funzione     | Opzionale. Specifica una funzione che definisce l'ordinamento. Se omesso, gli elementi dell'array sono riordinati alfanumericamente. Se "compareFunction" è fornita, gli elementi sono riordinati a seconda del valore di ritorno. |

| compareFunction(a, b) return value | sort order |
| :------------- | :----------- |
| > 0			 | ordina "b" prima di "a" |
| < 0			 | ordina "a" prima di "b" |
| == 0			 | mantiene l'ordine originale di "a" e "b" |


#### ritorna
(array): L'array riordinato. Nota che l'array è riordinato sul posto, e non viene creata alcuna copia.


#### esempio
```autohotkey
[1, 30, 4, 21, 100000].sort()
; => [1, 4, 21, 30, 100000]

["ted", "Bill", "bill", "Ted", "Socrates", "Lincoln"].sort()
; => ["Bill", "Lincoln", "Socrates, "Ted", "bill, "ted"]
```
<!-- end of sort -->


## .splice
> `array.splice(start, [end, values*])`

Modifica il contenuto di un array rimuovendo o sostituendo gli elementi esistenti e/o aggiungendo nuovi elementi sul posto.

> [!Note]
> Questo metodo modifica l&#x27;array chiamato

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  start         | numero       | Richiesto. L'indice con cui iniziare a modificare l'array. Se maggiore della lunghezza dell'array, start viene impostato alla lunghezza dell'array. In questo caso nessun elemento viene eliminato ma il metodo si comporta come funzione additiva, aggiungendo tutti gli elementi forniti. Se negativo, inizia dalla fine dell'array. |
|  deleteCount    | numero       | Opzionale. (Default `-1`) (Predefinito "-1") Un numero intero che indica il numero di elementi da rimuovere dall'array. |
|  values*        | valore/oggetto | Opzionale. (Default `""`) (Predefinito "") I valori da aggiungere all'array. Se non vengono specificati elementi, rimuove dall'array. |


#### ritorna
(array): Un array contenente gli elementi eliminati. Se nessun elemento viene eliminato, ritorna un array vuoto.


#### esempio
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

Ritorna una stringa che rappresenta l'array specificato e i suoi elementi.

#### argomenti
Non accetta alcuno argomento.


#### ritorna
(string): Una stringa che rappresenta tutti gli elementi dell'array.


#### esempio
```autohotkey
["Bill", "Ted"].toString()
; => "Bill,Ted"
```
<!-- end of toString -->


## .unshift
> `array.unshift(element*)`

Aggiunge uno o più elementi all'inizio di un array e ritorna la nuova lunghezza dell'array.

> [!Note]
> Questo metodo modifica l&#x27;array chiamato

#### argomenti
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  element*      | valore/oggetto | Richiesto. Gli elementi da aggiungere all'inizio dell'array. |



#### ritorna
La nuova lunghezza array.Count() dell'array su cui è stato chiamato il metodo.


#### esempio
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

Ritorna un nuovo array contenente i valori per ogni elemento nell'array chiamato.

#### argomenti
Non accetta alcuno argomento.


#### ritorna
(array): Un nuovo array contenente tutti i valori nell'array chiamato.


#### esempio
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
