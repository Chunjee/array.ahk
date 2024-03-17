## .concat
> `array.concat([value*])`

Wordt gebruikt om twee of meer matrices samen te voegen. Deze methode wijzigt de bestaande matrices niet, maar retourneert een nieuwe matrix die de waarden van de samengevoegde matrices bevat.


#### Argumenten
| Argument       | Type                                                 | Description  |
| :------------- | :--------------------------------------------------- | :----------- |
|  value*        | waarde/object | Optioneel. (Standaard `[]`) Arrays en/of waarden om samen te voegen tot een nieuwe array. Als alle valueN parameters worden weggelaten, retourneert concat een ondiepe kopie van de bestaande matrix waarop het is aangeroepen. |


#### Geeft als resultaat
(array): Een nieuwe Array-instantie. Bevat de waarden van de samengevoegde matrices.


#### Voorbeeld
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

Test of alle elementen in de array voldoen aan de test die wordt geïmplementeerd door de opgegeven functie.


#### Argumenten
| Argument                              | Type                   | Description  |
| :------------------------------------ | :--------------------- | :----------- |
|  function(element, index, array)      | functie | Vereist. Een functie die moet worden uitgevoerd voor elk element in de matrix. |


#### Geeft als resultaat
(boolean): `true` als alle elementen de testfunctie doorstaan, anders `false` als dat niet het geval is.


#### Voorbeeld
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

Vul alle array-elementen met een statische waarde.

> [!Note]
> Deze methode wijzigt de aanroepende array

#### Argumenten
| Argument       | Type                       | Description  |
| :------------- | :------------------------- | :----------- |
|  value         | waarde | Vereist. De waarde om de array mee te vullen. |
|  start         | nummer | Optioneel. (Standaard `1`) De index om te beginnen met het vullen van de array. Als deze negatief is, wordt deze behandeld als array.Count() + start |
|  end           | nummer | Optioneel. (Standaard `array.Count()`) De waarde waarmee de array wordt gevuld. Als het negatief is, wordt het behandeld als `array.Count() + end`. |


#### Geeft als resultaat
(array): De gewijzigde array, gevuld met waarde.


#### Voorbeeld
```autohotkey
[1, 2, 3].fill(1)
; => [1, 1, 1]
```
<!-- end of fill -->


## .filter
> `array.filter(func("function"))`

Creëert een nieuwe array met alle elementen die voldoen aan de test uitgevoerd door de opgegeven functie. De functie wordt aangeroepen met drie argumenten; (element, index, array).

#### Argumenten
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | functie     | Vereist. Functie is een predikaat om elk element van de array te testen. Retourneert `true` om het element te behouden, anders `false`. |


#### Geeft als resultaat
(array): Een nieuwe array met de elementen die voldoen aan de test. Als er geen elementen door de test komen, wordt er een lege array geretourneerd.


#### Voorbeeld
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

Geeft de waarde terug van het eerste element in de opgegeven array dat voldoet aan de opgegeven testfunctie. De functie wordt aangeroepen met drie argumenten; (element, index, array).

#### Argumenten
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | functie     | Vereist. Functie om uit te voeren op elke waarde in de array. |


#### Geeft als resultaat
(value): De waarde van het eerste element in de array dat voldoet aan de opgegeven testfunctie. Anders `""` als er geen is gevonden.


#### Voorbeeld
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

Geeft de index terug van het eerste element in de array dat voldoet aan de opgegeven testfunctie. Anders geeft het -1 terug, wat aangeeft dat geen enkel element de test heeft doorstaan. De functie wordt aangeroepen met drie argumenten; (element, index, array).

#### Argumenten
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | functie | Vereist. Functie om uit te voeren op elke waarde in de array. |


#### Geeft als resultaat
(value): De index of sleutelwaarde van het eerste element in de array dat voldoet aan de opgegeven testfunctie. Anders `-1` als het niet wordt gevonden.


#### Voorbeeld
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

Voert een opgegeven functie eenmaal uit voor elk array-element. De functie wordt aangeroepen met drie argumenten; (element, index, array).

#### Argumenten
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | functie | Vereist. Functie om uit te voeren op elke waarde in de array. |


#### Geeft als resultaat
(""): `""` wordt altijd geretourneerd.


#### Voorbeeld
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

Bepaalt of een matrix een bepaalde waarde bevat onder de items en retourneert waar of onwaar als dat van toepassing is.

#### Argumenten
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  valueToFind   | *            | Vereist. De waarde waarnaar moet worden gezocht. |
|  fromIndex     | nummer       | Optioneel. (Standaard `1`) De index om te beginnen met zoeken. Als de opgegeven indexwaarde een negatief getal is, wordt het genomen als de offset vanaf het einde van de matrix. |


#### Geeft als resultaat
(boolean): `true` als de waarde valueToFind wordt gevonden in de array (of het deel van de array dat wordt aangegeven door de index fromIndex, indien gespecificeerd). Anders `waar`.


#### Voorbeeld
```autohotkey
[1, 2, 3, 4].includes(2)
; => true

[1, 2, 3, 4].includes("Socrates")
; => false
```
<!-- end of includes -->


## .indexOf
> `array.indexOf(valueToFind[, fromIndex])`

Geeft de eerste index terug waarop een gegeven element kan worden gevonden in de matrix, of `-1` als het niet aanwezig is.

#### Argumenten
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | waarde        | Vereist. De waarde waarnaar moet worden gezocht. |
|  fromIndex     | nummer       | Optioneel. (Standaard `1`) De index om te beginnen met zoeken. Als de opgegeven indexwaarde een negatief getal is, wordt het genomen als de offset vanaf het einde van de matrix. |


#### Geeft als resultaat
(number): De index of sleutelwaarde van het eerste element in de array dat overeenkomt met het searchElement. Anders `-1` als het niet wordt gevonden.


#### Voorbeeld
```autohotkey
["Bill", "Ted"].indexOf("Socrates")
; => -1

["four", "three", "two", "one"].indexOf("three")
; => 2
```
<!-- end of indexOf -->


## .join
> `array.join(valueToFind[, fromIndex])`

Geeft een nieuwe tekenreeks terug door alle elementen in een array aan elkaar te rijgen, gescheiden door komma's of een gespecificeerde scheidingstekenreeks. Als de array slechts één item heeft, dan wordt dat item geretourneerd zonder het scheidingsteken te gebruiken.

#### Argumenten
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  separator     | string       | Optioneel. `) Geeft een tekenreeks op om elk paar aangrenzende elementen van de matrix te scheiden. Het scheidingsteken wordt indien nodig geconverteerd naar een tekenreeks. Als scheidingsteken een lege tekenreeks is (`""`), worden alle elementen samengevoegd zonder tekens ertussen. |


#### Geeft als resultaat
(string): Een tekenreeks met alle array-elementen samengevoegd. Als array.Count() 0 is, wordt een lege tekenreeks `""` geretourneerd.


#### Voorbeeld
```autohotkey
[1, 2, 3].join()
; => "1,2,3"

["Bill", "Ted"].join(" and ")
; => "Bill and Ted"
```
<!-- end of join -->


## .keys
> `array.keys()`

Geeft een nieuwe matrix terug die de sleutels bevat voor elke index in de matrix.

#### Argumenten
Accepteert geen argumenten.


#### Geeft als resultaat
(array): Een nieuwe array met alle sleutels in de aanroepende array.


#### Voorbeeld
```autohotkey
["Bill", "Ted", "Socrates"].keys()
; => [1, 2, 3]
```
<!-- end of keys -->


## .lastIndexOf
> `array.lastIndexOf(valueToFind[, fromIndex])`

Geeft de eerste index terug waarop een gegeven element kan worden gevonden in de matrix, of `-1` als het niet aanwezig is.

#### Argumenten
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | waarde        | Vereist. De waarde waarnaar moet worden gezocht. |
|  fromIndex     | nummer       | Optioneel. (Standaard `1`) De index waarbij het terugzoeken begint. Standaard is dit de lengte van de array min één (array.Count()), d.w.z. de hele array wordt doorzocht. Als de index groter of gelijk is aan de lengte van de array, wordt de hele array doorzocht. Als de index negatief is, wordt deze genomen als de offset vanaf het einde van de array. Merk op dat zelfs als de index negatief is, het array nog steeds van achter naar voren wordt doorzocht. |


#### Geeft als resultaat
(number): De laatste index van het element in de matrix


#### Voorbeeld
```autohotkey
["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Ted")
; => 4

["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Socrates")
; => 3
```
<!-- end of lastIndexOf -->


## .map
> `array.map(func("function"))`

creëert een nieuwe matrix die gevuld is met de resultaten van het aanroepen van een opgegeven functie op elk element in de aanroepende matrix. De functie wordt aangeroepen met drie argumenten: (element, index, matrix).

#### Argumenten
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | functie     | Vereist. Functie die wordt aangeroepen voor elk element van arr. Elke keer dat callback wordt uitgevoerd, wordt de geretourneerde waarde toegevoegd aan new_array. |


#### Geeft als resultaat
(array): Een nieuwe array waarvan elk element het resultaat is van de callback-functie.


#### Voorbeeld
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

Voert een reducer-functie uit op elk element van de array, wat resulteert in een enkele uitvoerwaarde. De reducer-functie wordt aangeroepen met vier argumenten: (accumulator, element, index, matrix).

#### Argumenten
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      | functie     | Vereist. Een functie die wordt uitgevoerd op elk element in de matrix (behalve het eerste, als er geen initialValue is opgegeven). |


#### Geeft als resultaat
(value): De enkele waarde die resulteert uit de reductie.


#### Voorbeeld
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

Past een functie toe op een accumulator en elke waarde van de array (van rechts naar links) om deze te reduceren tot een enkele waarde. De reducer-functie wordt aangeroepen met drie argumenten; (accumulator, element, index, matrix).

#### Argumenten
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      | functie     | Vereist. Een functie die wordt uitgevoerd op elk element in de matrix (behalve het eerste, als er geen initialValue is opgegeven). |


#### Geeft als resultaat
(value): De enkele waarde die resulteert uit de reductie.


#### Voorbeeld
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

Keert een array op zijn plaats om. Het eerste array-element wordt het laatste en het laatste array-element wordt het eerste.

> [!Note]
> Deze methode wijzigt de aanroepende array

#### Argumenten
Accepteert geen argumenten.


#### Geeft als resultaat
(array): De omgekeerde matrix.


#### Voorbeeld
```autohotkey
[1, 2, 3].reverse()
; => [3, 2, 1]
```
<!-- end of reverse -->


## .shift
> `array.shift()`

Verwijdert het eerste element uit een array en geeft dat verwijderde element terug. Deze methode wijzigt de array.

> [!Note]
> Deze methode wijzigt de aanroepende array

#### Argumenten
Accepteert geen argumenten.


#### Geeft als resultaat
(value): Het verwijderde element uit de array; "" als de array leeg is.


#### Voorbeeld
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

Retourneert een ondiepe kopie van een deel van een matrix in een nieuw matrixobject geselecteerd van begin tot einde (einde niet inbegrepen) waarbij begin en einde de index van items in die matrix vertegenwoordigen. De originele matrix wordt niet gewijzigd.

#### Argumenten
| Argument       | Type                      | Description  |
| :------------- | :------------------------ | :----------- |
|  start         | nummer | Optioneel. (Standaard `1`) De index waarbij de extractie moet beginnen. |
|  end           | nummer | Optioneel. (Standaard `array.Count()`) De index waarop de extractie moet eindigen. slice extraheert tot en met maar niet inclusief end. Als einde is weggelaten, extraheert slice tot het einde van de reeks. Er kan een negatieve index worden gebruikt om een offset vanaf het einde van de reeks aan te geven. |


#### Geeft als resultaat
(value): Een nieuwe matrix met de geëxtraheerde elementen.


#### Voorbeeld
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

Test of ten minste één element in de array voldoet aan de test die wordt geïmplementeerd door de opgegeven functie. De functie retourneert een Booleaanse waarde. De functie wordt aangeroepen met drie argumenten: (element, index, array).

#### Argumenten
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)      | functie     | Vereist. Een functie om uit te voeren voor elk element in de array. Deze moet een waarheidsgetrouwe waarde teruggeven om aan te geven dat het element de test doorstaat en anders een foutieve waarde. |


#### Geeft als resultaat
(boolean): `true` als de callback-functie een waarheidsgetrouwe waarde retourneert voor ten minste één element in de array. Anders `false`.


#### Voorbeeld
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

Sorteert de elementen van een array op hun plaats en geeft de gesorteerde array terug. De standaard sorteervolgorde is oplopend. De functie wordt aangeroepen met twee argumenten; (firstElement, secondElement).

> [!Note]
> Deze methode wijzigt de aanroepende array

#### Argumenten
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  compareFunction(firstElement, secondElement)      | functie     | Optioneel. Geeft een functie op die de sorteervolgorde definieert. Als deze wordt weggelaten, worden de array-elementen gesorteerd op hun alfanumerieke waarde. Als `compareFunction` wordt opgegeven, worden de array-elementen gesorteerd op de retourwaarde |

| compareFunction(a, b) return value | sort order |
| :------------- | :----------- |
| > 0			 | sorteer `b` voor `a` |
| < 0			 | sorteer `a` voor `b` |
| == 0			 | behoud de oorspronkelijke volgorde van `a` en `b` |


#### Geeft als resultaat
(array): De gesorteerde matrix. Merk op dat de matrix op zijn plaats wordt gesorteerd en dat er geen kopie wordt gemaakt.


#### Voorbeeld
```autohotkey
[1, 30, 4, 21, 100000].sort()
; => [1, 4, 21, 30, 100000]

["ted", "Bill", "bill", "Ted", "Socrates", "Lincoln"].sort()
; => ["Bill", "Lincoln", "Socrates, "Ted", "bill, "ted"]
```
<!-- end of sort -->


## .splice
> `array.splice(start, [deleteCount, values*])`

Wijzigt de inhoud van een array door bestaande elementen te verwijderen of te vervangen en/of nieuwe elementen toe te voegen.

> [!Note]
> Deze methode wijzigt de aanroepende array

#### Argumenten
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  start         | nummer       | Vereist. De index waarop het wijzigen van de matrix moet beginnen. Als deze groter is dan de lengte van de array, wordt start ingesteld op de lengte van de array. In dit geval wordt er geen element verwijderd, maar gedraagt de methode zich als een optelfunctie, die zoveel elementen toevoegt als is opgegeven. Als het negatief is, begint de methode met zoveel elementen vanaf het einde van de matrix. |
|  deleteCount    | nummer       | Optioneel. (Default `-1`) Een geheel getal dat het aantal elementen in de array aangeeft dat moet worden verwijderd. |
|  values*        | waarde/object | Optioneel. (Default `""`) De waarden om toe te voegen aan de array. Als je geen elementen opgeeft, wordt er alleen uit de array verwijderd. |


#### Geeft als resultaat
(array): Een array die de verwijderde elementen bevat. Als er geen elementen worden verwijderd, wordt een lege array geretourneerd.


#### Voorbeeld
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



#### Argumenten
Accepteert geen argumenten.


#### Geeft als resultaat
(string): 


#### Voorbeeld
```autohotkey
["Bill", "Ted"].toString()
; => "Bill,Ted"
```
<!-- end of toString -->


## .unshift
> `array.unshift(element*)`

Voegt een of meer elementen toe aan het begin van een matrix en retourneert de nieuwe lengte van de matrix.

> [!Note]
> Deze methode wijzigt de aanroepende array

#### Argumenten
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  element*      | waarde/object | Vereist. De elementen om toe te voegen aan de voorkant van de array. |



#### Geeft als resultaat
De nieuwe array.Count() lengte van de array waarop de methode is aangeroepen.


#### Voorbeeld
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

Geeft een nieuwe matrix terug die de waarden bevat voor elk element in de aanroepende matrix.

#### Argumenten
Accepteert geen argumenten.


#### Geeft als resultaat
(array): Een nieuwe matrix die alle waarden in de aanroepende matrix bevat.


#### Voorbeeld
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
