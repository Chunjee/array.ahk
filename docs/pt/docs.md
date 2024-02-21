## .concat
> `array.concat([value*])`

Usado para unir dois ou mais arrays.


#### Argumentos
| Argument       | Type                                                 | Description  |
| :------------- | :--------------------------------------------------- | :----------- |
|  value*        | valor/objeto | Opcional. (Padrão `[]`) Matrizes e/ou valores para concatenar em uma nova matriz. |


#### Devoluções
(array): Uma nova instância de Array. 


#### Exemplo
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

Testa se todos os elementos da matriz passam no teste implementado pela função fornecida.


#### Argumentos
| Argument                              | Type                   | Description  |
| :------------------------------------ | :--------------------- | :----------- |
|  function(element, index, array)      | função | Obrigatório. Uma função a ser executada para cada elemento do array. |


#### Devoluções
(boolean): `true` se todos os elementos passarem na função de teste, caso contrário `false` se algum não passou.


#### Exemplo
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

Preencha todos os elementos do array com um valor estático.

> [!Note]
> Este método modifica o array de chamada

#### Argumentos
| Argument       | Type                       | Description  |
| :------------- | :------------------------- | :----------- |
|  value         | valor | Obrigatório. O valor com o qual preencher a matriz. |
|  start         | número | Opcional. (Padrão `1`) O índice para começar a preencher o array. |
|  end           | número | Opcional. (Padrão `array.Count()`) O valor com o qual preencher o array. |


#### Devoluções
(array): A matriz modificada, preenchida com valor.


#### Exemplo
```autohotkey
[1, 2, 3].fill(1)
; => [1, 1, 1]
```
<!-- end of fill -->


## .filter
> `array.filter(func("function"))`

Cria um novo array com todos os elementos que passam no teste implementado pela função fornecida.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | função     | Obrigatório. Função é um predicado para testar cada elemento do array. |


#### Devoluções
(array): Um novo array com os elementos que passam no teste. 


#### Exemplo
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

Retorna o valor do primeiro elemento na matriz fornecida que satisfaz a função de teste fornecida.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | função     | Obrigatório. Função a ser executada em cada valor do array. |


#### Devoluções
(value): O valor do primeiro elemento na matriz que satisfaz a função de teste fornecida. 


#### Exemplo
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

Retorna o índice do primeiro elemento da matriz que satisfaz a função de teste fornecida.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | função | Obrigatório. Função a ser executada em cada valor do array. |


#### Devoluções
(value): O índice ou valor chave do primeiro elemento na matriz que satisfaz a função de teste fornecida. 


#### Exemplo
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

Executa uma função fornecida uma vez para cada elemento da matriz.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | função | Obrigatório. Função a ser executada em cada valor do array. |


#### Devoluções
(""): `""` é sempre retornado.


#### Exemplo
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

Determina se um array inclui um determinado valor entre suas entradas, retornando verdadeiro ou falso conforme apropriado.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  valueToFind   | *            | Obrigatório. O valor a ser pesquisado. |
|  fromIndex     | número       | Opcional. (Padrão `1`) O índice no qual iniciar a pesquisa. |


#### Devoluções
(boolean): `true` se o valor valueToFind for encontrado dentro do array (ou a parte do array indicada pelo índice fromIndex, se especificado). 


#### Exemplo
```autohotkey
[1, 2, 3, 4].includes(2)
; => true

[1, 2, 3, 4].includes("Socrates")
; => false
```
<!-- end of includes -->


## .indexOf
> `array.indexOf(valueToFind[, fromIndex])`

Retorna o primeiro índice no qual um determinado elemento pode ser encontrado no array ou `-1` se não estiver presente.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | valor        | Obrigatório. O valor a ser pesquisado. |
|  fromIndex     | número       | Opcional. (Padrão `1`) O índice no qual iniciar a pesquisa. |


#### Devoluções
(number): O índice ou valor-chave do primeiro elemento na matriz que corresponde ao searchElement. 


#### Exemplo
```autohotkey
["Bill", "Ted"].indexOf("Socrates")
; => -1

["four", "three", "two", "one"].indexOf("three")
; => 2
```
<!-- end of indexOf -->


## .join
> `array.join(valueToFind[, fromIndex])`

Retorna uma nova string concatenando todos os elementos em uma matriz, separados por vírgulas ou por uma string separadora especificada.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  separator     | corda       | Opcional. (Padrão `","`) Especifica uma string para separar cada par de elementos adjacentes do array. |


#### Devoluções
(string): Uma string com todos os elementos do array unidos. 


#### Exemplo
```autohotkey
[1, 2, 3].join()
; => "1,2,3"

["Bill", "Ted"].join(" and ")
; => "Bill and Ted"
```
<!-- end of join -->


## .keys
> `array.keys()`

Retorna uma nova matriz que contém as chaves de cada índice da matriz.

#### Argumentos
Não aceita nenhum argumento.


#### Devoluções
(array): Uma nova matriz contendo todas as chaves na matriz de chamada.


#### Exemplo
```autohotkey
["Bill", "Ted", "Socrates"].keys()
; => [1, 2, 3]
```
<!-- end of keys -->


## .lastIndexOf
> `array.lastIndexOf(valueToFind[, fromIndex])`

Retorna o primeiro índice no qual um determinado elemento pode ser encontrado no array ou `-1` se não estiver presente.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | valor        | Obrigatório. O valor a ser pesquisado. |
|  fromIndex     | número       | Opcional. (Padrão `1`) O índice no qual iniciar a pesquisa para trás. |


#### Devoluções
(number): O último índice do elemento na matriz


#### Exemplo
```autohotkey
["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Ted")
; => 4

["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Socrates")
; => 3
```
<!-- end of lastIndexOf -->


## .map
> `array.map(func("function"))`

cria um novo array preenchido com os resultados da chamada de uma função fornecida em cada elemento do array de chamada.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | função     | Obrigatório. Função que é chamada para cada elemento de arr. |


#### Devoluções
(array): Uma nova matriz com cada elemento sendo o resultado da função de retorno de chamada.


#### Exemplo
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

Executa uma função redutora em cada elemento da matriz, resultando em um único valor de saída.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      | função     | Obrigatório. Uma função a ser executada em cada elemento do array (exceto o primeiro, se nenhum valor inicial for fornecido). |


#### Devoluções
(value): O valor único que resulta da redução.


#### Exemplo
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

Aplica uma função a um acumulador e a cada valor do array (da direita para a esquerda) para reduzi-lo a um único valor.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      |      | Obrigatório. Uma função a ser executada em cada elemento do array (exceto o primeiro, se nenhum valor inicial for fornecido). |


#### Devoluções
(value): O valor único que resulta da redução.


#### Exemplo
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

Inverte uma matriz no lugar.

> [!Note]
> Este método modifica o array de chamada

#### Argumentos
Não aceita nenhum argumento.


#### Devoluções
(array): A matriz invertida.


#### Exemplo
```autohotkey
[1, 2, 3].reverse()
; => [3, 2, 1]
```
<!-- end of reverse -->


## .shift
> `array.shift()`

Remove o primeiro elemento de uma matriz e retorna o elemento removido.

> [!Note]
> Este método modifica o array de chamada

#### Argumentos
Não aceita nenhum argumento.


#### Devoluções
(value): O elemento removido da matriz; 


#### Exemplo
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

Retorna uma cópia superficial de uma parte de uma matriz em um novo objeto de matriz selecionado do início ao fim (fim não incluído), onde início e fim representam o índice de itens nessa matriz.

#### Argumentos
| Argument       | Type                      | Description  |
| :------------- | :------------------------ | :----------- |
|  start         | número | Opcional. (Padrão `1`) O índice no qual iniciar a extração. |
|  end           | número | Opcional. (Padrão `array.Count()`) O índice no qual finalizar a extração. |


#### Devoluções
(value): Uma nova matriz contendo os elementos extraídos.


#### Exemplo
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

Testa se pelo menos um elemento da matriz passa no teste implementado pela função fornecida.

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)      | função     | Obrigatório. Uma função a ser executada para cada elemento da matriz. |


#### Devoluções
(boolean): `true` se a função de retorno de chamada retornar um valor verdadeiro para pelo menos um elemento na matriz. 


#### Exemplo
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

Classifica os elementos de um array no local e retorna o array classificado.

> [!Note]
> Este método modifica o array de chamada

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  compareFunction(firstElement, secondElement)      | função     | Opcional. Especifica uma função que define a ordem de classificação. |

| compareFunction(a, b) return value | sort order |
| :------------- | :----------- |
| > 0			 | classifique `b` antes de `a` |
| < 0			 | classifique `a` antes de `b` |
| == 0			 | mantenha a ordem original de `a` e `b` |


#### Devoluções
(array): A matriz classificada.


#### Exemplo
```autohotkey
[1, 30, 4, 21, 100000].sort()
; => [1, 4, 21, 30, 100000]

["ted", "Bill", "bill", "Ted", "Socrates", "Lincoln"].sort()
; => ["Bill", "Lincoln", "Socrates, "Ted", "bill, "ted"]
```
<!-- end of sort -->


## .splice
> `array.splice(start, [end, values*])`

Altera o conteúdo de um array removendo ou substituindo elementos existentes e/ou adicionando novos elementos no lugar.

> [!Note]
> Este método modifica o array de chamada

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  start         | número       | Obrigatório. O índice no qual começar a alterar a matriz. |
|  deleteCount    | número       | Opcional. (Default `-1`) Um número inteiro que indica o número de elementos da matriz a serem removidos. |
|  values*        | valor/objeto | Opcional. (Default `""`) Os valores a serem adicionados à matriz. |


#### Devoluções
(array): Uma matriz contendo os elementos excluídos. 


#### Exemplo
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

Retorna uma string que representa o array especificado e seus elementos.

#### Argumentos
Não aceita nenhum argumento.


#### Devoluções
(string): Uma string que representa todos os elementos da matriz.


#### Exemplo
```autohotkey
["Bill", "Ted"].toString()
; => "Bill,Ted"
```
<!-- end of toString -->


## .unshift
> `array.unshift(element*)`

Adiciona um ou mais elementos ao início de uma matriz e retorna o novo comprimento da matriz.

> [!Note]
> Este método modifica o array de chamada

#### Argumentos
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  element*      | valor/objeto | Obrigatório. Os elementos a serem adicionados à frente da matriz. |



#### Devoluções
O novo comprimento array.Count() do array no qual o método foi chamado.


#### Exemplo
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

Retorna uma nova matriz que contém os valores de cada elemento na matriz de chamada.

#### Argumentos
Não aceita nenhum argumento.


#### Devoluções
(array): Uma nova matriz contendo todos os valores na matriz de chamada.


#### Exemplo
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
