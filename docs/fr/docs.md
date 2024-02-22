## .concat
> `array.concat([value*])`

Utilisé pour joindre deux ou plusieurs tableaux.


#### Arguments
| Argument       | Type                                                 | Description  |
| :------------- | :--------------------------------------------------- | :----------- |
|  value*        | valeur/objet | Facultatif. (Par défaut `[]`) Tableaux et/ou valeurs à concaténer dans un nouveau tableau. |


#### Retour
(array): Une nouvelle instance de tableau. 


#### Exemple
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

Teste si tous les éléments du tableau réussissent le test implémenté par la fonction fournie.


#### Arguments
| Argument                              | Type                   | Description  |
| :------------------------------------ | :--------------------- | :----------- |
|  function(element, index, array)      | fonction | Requis. Une fonction à exécuter pour chaque élément du tableau. |


#### Retour
(boolean): `true` si tous les éléments réussissent la fonction de test, sinon `false` s'il n'y en a pas.


#### Exemple
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

Remplissez tous les éléments du tableau avec une valeur statique.

> [!Note]
> Cette méthode modifie le tableau appelant

#### Arguments
| Argument       | Type                       | Description  |
| :------------- | :------------------------- | :----------- |
|  value         | valeur | Requis. La valeur avec laquelle remplir le tableau. |
|  start         | nombre | Facultatif. (Par défaut `1`) L'index pour commencer à remplir le tableau. |
|  end           | nombre | Facultatif. (Par défaut `array.Count()`) La valeur avec laquelle remplir le tableau. |


#### Retour
(array): Le tableau modifié, rempli de valeur.


#### Exemple
```autohotkey
[1, 2, 3].fill(1)
; => [1, 1, 1]
```
<!-- end of fill -->


## .filter
> `array.filter(func("function"))`

Crée un nouveau tableau avec tous les éléments qui réussissent le test implémenté par la fonction fournie.

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | fonction     | Requis. Function est un prédicat, pour tester chaque élément du tableau. |


#### Retour
(array): Un nouveau tableau avec les éléments qui réussissent le test. 


#### Exemple
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

Renvoie la valeur du premier élément du tableau fourni qui satisfait à la fonction de test fournie.

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | fonction     | Requis. Fonction à exécuter sur chaque valeur du tableau. |


#### Retour
(value): La valeur du premier élément du tableau qui satisfait à la fonction de test fournie. 


#### Exemple
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

Renvoie l'index du premier élément du tableau qui satisfait à la fonction de test fournie.

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | fonction | Requis. Fonction à exécuter sur chaque valeur du tableau. |


#### Retour
(value): L'index ou la valeur de clé du premier élément du tableau qui satisfait à la fonction de test fournie. 


#### Exemple
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

Exécute une fonction fournie une fois pour chaque élément du tableau.

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | fonction | Requis. Fonction à exécuter sur chaque valeur du tableau. |


#### Retour
(""): `""` est toujours renvoyé.


#### Exemple
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

Détermine si un tableau inclut une certaine valeur parmi ses entrées, renvoyant vrai ou faux selon le cas.

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  valueToFind   | *            | Requis. La valeur à rechercher. |
|  fromIndex     | nombre       | Facultatif. (Par défaut `1`) L'index à partir duquel démarrer la recherche. |


#### Retour
(boolean): `true` si la valeur valueToFind est trouvée dans le tableau (ou dans la partie du tableau indiquée par l'index fromIndex, si spécifié). 


#### Exemple
```autohotkey
[1, 2, 3, 4].includes(2)
; => true

[1, 2, 3, 4].includes("Socrates")
; => false
```
<!-- end of includes -->


## .indexOf
> `array.indexOf(valueToFind[, fromIndex])`

Renvoie le premier index auquel un élément donné peut être trouvé dans le tableau, ou « -1 » s'il n'est pas présent.

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | valeur        | Requis. La valeur à rechercher. |
|  fromIndex     | nombre       | Facultatif. (Par défaut `1`) L'index à partir duquel démarrer la recherche. |


#### Retour
(number): L'index ou la valeur de clé du premier élément du tableau qui correspond à searchElement. 


#### Exemple
```autohotkey
["Bill", "Ted"].indexOf("Socrates")
; => -1

["four", "three", "two", "one"].indexOf("three")
; => 2
```
<!-- end of indexOf -->


## .join
> `array.join(valueToFind[, fromIndex])`

Renvoie une nouvelle chaîne en concaténant tous les éléments d'un tableau, séparés par des virgules ou une chaîne de séparation spécifiée.

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  separator     | chaîne       | Facultatif. (Par défaut `","`) Spécifie une chaîne pour séparer chaque paire d'éléments adjacents du tableau. |


#### Retour
(string): Une chaîne avec tous les éléments du tableau joints. 


#### Exemple
```autohotkey
[1, 2, 3].join()
; => "1,2,3"

["Bill", "Ted"].join(" and ")
; => "Bill and Ted"
```
<!-- end of join -->


## .keys
> `array.keys()`

Renvoie un nouveau tableau contenant les clés de chaque index du tableau.

#### Arguments
N&#x27;accepte aucun argument.


#### Retour
(array): Un nouveau tableau contenant toutes les clés du tableau appelant.


#### Exemple
```autohotkey
["Bill", "Ted", "Socrates"].keys()
; => [1, 2, 3]
```
<!-- end of keys -->


## .lastIndexOf
> `array.lastIndexOf(valueToFind[, fromIndex])`

Renvoie le premier index auquel un élément donné peut être trouvé dans le tableau, ou « -1 » s'il n'est pas présent.

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | valeur        | Requis. La valeur à rechercher. |
|  fromIndex     | nombre       | Facultatif. (Par défaut `1`) L'index à partir duquel commencer la recherche en arrière. |


#### Retour
(number): Le dernier index de l'élément dans le tableau


#### Exemple
```autohotkey
["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Ted")
; => 4

["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Socrates")
; => 3
```
<!-- end of lastIndexOf -->


## .map
> `array.map(func("function"))`

crée un nouveau tableau rempli avec les résultats de l'appel d'une fonction fournie sur chaque élément du tableau appelant.

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | fonction     | Requis. Fonction appelée pour chaque élément de l'arr. |


#### Retour
(array): Un nouveau tableau dont chaque élément est le résultat de la fonction de rappel.


#### Exemple
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

Exécute une fonction de réduction sur chaque élément du tableau, ce qui donne une valeur de sortie unique.

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      | fonction     | Requis. Une fonction à exécuter sur chaque élément du tableau (sauf le premier, si aucune valeur initiale n'est fournie). |


#### Retour
(value): La valeur unique qui résulte de la réduction.


#### Exemple
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

Applique une fonction à un accumulateur et à chaque valeur du tableau (de droite à gauche) pour le réduire à une valeur unique.

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      | fonction     | Requis. Une fonction à exécuter sur chaque élément du tableau (sauf le premier, si aucune valeur initiale n'est fournie). |


#### Retour
(value): La valeur unique qui résulte de la réduction.


#### Exemple
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

Inverse un tableau en place.

> [!Note]
> Cette méthode modifie le tableau appelant

#### Arguments
N&#x27;accepte aucun argument.


#### Retour
(array): Le tableau inversé.


#### Exemple
```autohotkey
[1, 2, 3].reverse()
; => [3, 2, 1]
```
<!-- end of reverse -->


## .shift
> `array.shift()`

Supprime le premier élément d'un tableau et renvoie cet élément supprimé.

> [!Note]
> Cette méthode modifie le tableau appelant

#### Arguments
N&#x27;accepte aucun argument.


#### Retour
(value): L'élément supprimé du tableau


#### Exemple
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

Renvoie une copie superficielle d'une partie d'un tableau dans un nouvel objet tableau sélectionné du début à la fin (fin non incluse), où le début et la fin représentent l'index des éléments de ce tableau.

#### Arguments
| Argument       | Type                      | Description  |
| :------------- | :------------------------ | :----------- |
|  start         | nombre | Facultatif. (Par défaut `1`) L'index auquel démarrer l'extraction. |
|  end           | nombre | Facultatif. (Par défaut `array.Count()`) L'index auquel terminer l'extraction. |


#### Retour
(value): Un nouveau tableau contenant les éléments extraits.


#### Exemple
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

Teste si au moins un élément du tableau réussit le test implémenté par la fonction fournie.

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)      | fonction     | Requis. Une fonction à exécuter pour chaque élément du tableau. |


#### Retour
(boolean): `true` si la fonction de rappel renvoie une valeur véridique pour au moins un élément du tableau.


#### Exemple
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

Trie les éléments d'un tableau sur place et renvoie le tableau trié.

> [!Note]
> Cette méthode modifie le tableau appelant

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  compareFunction(firstElement, secondElement)      | fonction     | Facultatif. Spécifie une fonction qui définit l'ordre de tri. |

| compareFunction(a, b) return value | sort order |
| :------------- | :----------- |
| > 0			 | trier `b` avant `a` |
| < 0			 | trier `a` avant `b` |
| == 0			 | conserver l'ordre original de `a` et `b` |


#### Retour
(array): Le tableau trié. 


#### Exemple
```autohotkey
[1, 30, 4, 21, 100000].sort()
; => [1, 4, 21, 30, 100000]

["ted", "Bill", "bill", "Ted", "Socrates", "Lincoln"].sort()
; => ["Bill", "Lincoln", "Socrates, "Ted", "bill, "ted"]
```
<!-- end of sort -->


## .splice
> `array.splice(start, [end, values*])`

Modifie le contenu d'un tableau en supprimant ou en remplaçant des éléments existants et/ou en ajoutant de nouveaux éléments en place.

> [!Note]
> Cette méthode modifie le tableau appelant

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  start         | nombre       | Requis. L'index à partir duquel commencer à modifier le tableau. |
|  deleteCount    | nombre       | Facultatif. (Default `-1`) Entier indiquant le nombre d’éléments du tableau à supprimer. |
|  values*        | valeur/objet | Facultatif. (Default `""`) Les valeurs à ajouter au tableau. |


#### Retour
(array): Un tableau contenant les éléments supprimés. 


#### Exemple
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

Renvoie une chaîne représentant le tableau spécifié et ses éléments.

#### Arguments
N&#x27;accepte aucun argument.


#### Retour
(string): Une chaîne représentant tous les éléments du tableau.


#### Exemple
```autohotkey
["Bill", "Ted"].toString()
; => "Bill,Ted"
```
<!-- end of toString -->


## .unshift
> `array.unshift(element*)`

Ajoute un ou plusieurs éléments au début d'un tableau et renvoie la nouvelle longueur du tableau.

> [!Note]
> Cette méthode modifie le tableau appelant

#### Arguments
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  element*      | valeur/objet | Requis. Les éléments à ajouter au début du tableau. |



#### Retour
La nouvelle longueur array.Count() du tableau sur lequel la méthode a été appelée.


#### Exemple
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

Renvoie un nouveau tableau contenant les valeurs de chaque élément du tableau appelant.

#### Arguments
N&#x27;accepte aucun argument.


#### Retour
(array): Un nouveau tableau contenant toutes les valeurs du tableau appelant.


#### Exemple
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
