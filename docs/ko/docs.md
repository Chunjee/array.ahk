## .concat
> `array.concat([value*])`

두 개 이상의 배열을 결합하는 데 사용됩니다.


#### 인수
| Argument       | Type                                                 | Description  |
| :------------- | :--------------------------------------------------- | :----------- |
|  value*        | 값/물체 | 선택 과목. (기본값 `[]`) 새 배열로 연결할 배열 및/또는 값입니다. |


#### 보고
(array): 새로운 Array 인스턴스. 


#### 예
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

배열의 모든 요소가 제공된 함수에 의해 구현된 테스트를 통과하는지 테스트합니다.


#### 인수
| Argument                              | Type                   | Description  |
| :------------------------------------ | :--------------------- | :----------- |
|  function(element, index, array)      | 기능 | 필수의. 배열의 각 요소에 대해 실행될 함수입니다. |


#### 보고
(boolean): 모든 요소가 테스트 함수를 통과하면 `true`이고, 그렇지 않으면 `false`입니다.


#### 예
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

모든 배열 요소를 정적 값으로 채웁니다.

> [!Note]
> 이 메서드는 호출 배열을 수정합니다.

#### 인수
| Argument       | Type                       | Description  |
| :------------- | :------------------------- | :----------- |
|  value         | 값 | 필수의. 배열을 채울 값입니다. |
|  start         | 숫자 | 선택 과목. (기본값 `1`) 배열 채우기를 시작할 인덱스입니다. |
|  end           | 숫자 | 선택 과목. (기본값 `array.Count()`) 배열을 채울 값입니다. |


#### 보고
(array): 값으로 채워진 수정된 배열입니다.


#### 예
```autohotkey
[1, 2, 3].fill(1)
; => [1, 1, 1]
```
<!-- end of fill -->


## .filter
> `array.filter(func("function"))`

제공된 함수로 구현된 테스트를 통과한 모든 요소로 새 배열을 만듭니다.

#### 인수
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | 기능     | 필수의. 함수는 배열의 각 요소를 테스트하는 조건자입니다. |


#### 보고
(array): 테스트를 통과한 요소가 포함된 새 배열입니다. 


#### 예
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

제공된 테스트 기능을 충족하는 제공된 배열의 첫 번째 요소 값을 반환합니다.

#### 인수
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | 기능     | 필수의. 배열의 각 값에 대해 실행되는 함수입니다. |


#### 보고
(value): 제공된 테스트 기능을 충족하는 배열의 첫 번째 요소 값입니다. 


#### 예
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

제공된 테스트 함수를 만족하는 배열의 첫 번째 요소 인덱스를 반환합니다.

#### 인수
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | 기능 | 필수의. 배열의 각 값에 대해 실행되는 함수입니다. |


#### 보고
(value): 제공된 테스트 기능을 충족하는 배열의 첫 번째 요소의 인덱스 또는 키 값입니다. 


#### 예
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

각 배열 요소에 대해 제공된 함수를 한 번씩 실행합니다.

#### 인수
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | 기능 | 필수의. 배열의 각 값에 대해 실행되는 함수입니다. |


#### 보고
(""): `""` 항상 반환됩니다.


#### 예
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

배열의 항목 중 특정 값이 포함되어 있는지 여부를 결정하고 적절하게 true 또는 false를 반환합니다.

#### 인수
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  valueToFind   | *            | 필수의. 검색할 값입니다. |
|  fromIndex     | 숫자       | 선택 과목. (기본값 '1') 검색을 시작할 인덱스입니다. |


#### 보고
(boolean): valueToFind 값이 배열(또는 지정된 경우 fromIndex 인덱스가 나타내는 배열 부분) 내에서 발견되면 'true'입니다. 


#### 예
```autohotkey
[1, 2, 3, 4].includes(2)
; => true

[1, 2, 3, 4].includes("Socrates")
; => false
```
<!-- end of includes -->


## .indexOf
> `array.indexOf(valueToFind[, fromIndex])`

배열에서 특정 요소를 찾을 수 있는 첫 번째 인덱스를 반환하거나 해당 요소가 없으면 '-1'을 반환합니다.

#### 인수
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | 값        | 필수의. 검색할 값입니다. |
|  fromIndex     | 숫자       | 선택 과목. (기본값 '1') 검색을 시작할 인덱스입니다. |


#### 보고
(number): searchElement와 일치하는 배열의 첫 번째 요소에 대한 인덱스 또는 키 값입니다. 


#### 예
```autohotkey
["Bill", "Ted"].indexOf("Socrates")
; => -1

["four", "three", "two", "one"].indexOf("three")
; => 2
```
<!-- end of indexOf -->


## .join
> `array.join(valueToFind[, fromIndex])`

쉼표 또는 지정된 구분 기호 문자열로 구분된 배열의 모든 요소를 ​​연결하여 새 문자열을 반환합니다.

#### 인수
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  separator     | 끈       | 선택 과목. (기본값 `","`) 배열의 인접한 요소의 각 쌍을 구분하는 문자열을 지정합니다. |


#### 보고
(string): 모든 배열 요소가 결합된 문자열입니다. 


#### 예
```autohotkey
[1, 2, 3].join()
; => "1,2,3"

["Bill", "Ted"].join(" and ")
; => "Bill and Ted"
```
<!-- end of join -->


## .keys
> `array.keys()`

배열의 각 인덱스에 대한 키를 포함하는 새 배열을 반환합니다.

#### 인수
어떤 인수도 허용하지 않습니다.


#### 보고
(array): 호출 배열의 모든 키를 포함하는 새 배열입니다.


#### 예
```autohotkey
["Bill", "Ted", "Socrates"].keys()
; => [1, 2, 3]
```
<!-- end of keys -->


## .lastIndexOf
> `array.lastIndexOf(valueToFind[, fromIndex])`

배열에서 특정 요소를 찾을 수 있는 첫 번째 인덱스를 반환하거나 해당 요소가 없으면 '-1'을 반환합니다.

#### 인수
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | 값        | 필수의. 검색할 값입니다. |
|  fromIndex     | 숫자       | 선택 과목. (기본값 `1`) 역방향 검색을 시작할 인덱스입니다. |


#### 보고
(number): 배열에 있는 요소의 마지막 인덱스


#### 예
```autohotkey
["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Ted")
; => 4

["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Socrates")
; => 3
```
<!-- end of lastIndexOf -->


## .map
> `array.map(func("function"))`

호출 배열의 모든 요소에 대해 제공된 함수를 호출한 결과로 채워진 새 배열을 만듭니다.

#### 인수
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | 기능     | 필수의. arr의 모든 요소에 대해 호출되는 함수입니다. |


#### 보고
(array): 콜백 함수의 결과인 각 요소가 포함된 새 배열입니다.


#### 예
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

배열의 각 요소에 대해 감속기 함수를 실행하여 단일 출력 값을 생성합니다.

#### 인수
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      | 기능     | 필수의. 배열의 각 요소에 대해 실행되는 함수입니다(initialValue가 제공되지 않은 경우 첫 번째 요소 제외). |


#### 보고
(value): 감소로 인해 발생하는 단일 값입니다.


#### 예
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

누산기와 배열의 각 값(오른쪽에서 왼쪽으로)에 대해 함수를 적용하여 단일 값으로 줄입니다.

#### 인수
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      |      | 필수의. 배열의 각 요소에 대해 실행되는 함수입니다(initialValue가 제공되지 않은 경우 첫 번째 요소 제외). |


#### 보고
(value): 감소로 인해 발생하는 단일 값입니다.


#### 예
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

배열을 제자리에서 뒤집습니다.

> [!Note]
> 이 메서드는 호출 배열을 수정합니다.

#### 인수
어떤 인수도 허용하지 않습니다.


#### 보고
(array): 역방향 배열입니다.


#### 예
```autohotkey
[1, 2, 3].reverse()
; => [3, 2, 1]
```
<!-- end of reverse -->


## .shift
> `array.shift()`

배열에서 첫 번째 요소를 제거하고 제거된 요소를 반환합니다.

> [!Note]
> 이 메서드는 호출 배열을 수정합니다.

#### 인수
어떤 인수도 허용하지 않습니다.


#### 보고
(value): 배열에서 제거된 요소입니다. 


#### 예
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

배열 일부의 얕은 복사본을 처음부터 끝까지(끝은 포함되지 않음) 선택된 새 배열 객체로 반환합니다. 여기서 시작과 끝은 해당 배열에 있는 항목의 인덱스를 나타냅니다.

#### 인수
| Argument       | Type                      | Description  |
| :------------- | :------------------------ | :----------- |
|  start         | 숫자 | 선택 과목. (기본값 `1`) 추출을 시작할 인덱스입니다. |
|  end           | 숫자 | 선택 과목. (기본값 `array.Count()`) 추출을 종료할 인덱스입니다. |


#### 보고
(value): 추출된 요소를 포함하는 새 배열입니다.


#### 예
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

배열에 있는 하나 이상의 요소가 제공된 함수에 의해 구현된 테스트를 통과하는지 테스트합니다.

#### 인수
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)      | 기능     | 필수의. 배열의 각 요소에 대해 실행할 함수입니다. |


#### 보고
(boolean): 콜백 함수가 배열의 최소 하나의 요소에 대해 실제 값을 반환하는 경우 'true'입니다. 


#### 예
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

배열의 요소를 제자리에 정렬하고 정렬된 배열을 반환합니다.

> [!Note]
> 이 메서드는 호출 배열을 수정합니다.

#### 인수
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  compareFunction(firstElement, secondElement)      | 기능     | 선택 과목. 정렬 순서를 정의하는 함수를 지정합니다. |

| compareFunction(a, b) return value | sort order |
| :------------- | :----------- |
| > 0			 | `a` 앞에 `b` 정렬 |
| < 0			 | `b` 앞에 `a`를 정렬하세요. |
| == 0			 | `a`와 `b`의 원래 순서를 유지합니다. |


#### 보고
(array): 정렬된 배열입니다.


#### 예
```autohotkey
[1, 30, 4, 21, 100000].sort()
; => [1, 4, 21, 30, 100000]

["ted", "Bill", "bill", "Ted", "Socrates", "Lincoln"].sort()
; => ["Bill", "Lincoln", "Socrates, "Ted", "bill, "ted"]
```
<!-- end of sort -->


## .splice
> `array.splice(start, [end, values*])`

기존 요소를 제거 또는 교체하거나 새 요소를 제자리에 추가하여 배열의 내용을 변경합니다.

> [!Note]
> 이 메서드는 호출 배열을 수정합니다.

#### 인수
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  start         | 숫자       | 필수의. 배열 변경을 시작할 인덱스입니다. |
|  deleteCount    | 숫자       | 선택 과목. (Default `-1`) 제거할 배열의 요소 수를 나타내는 정수입니다. |
|  values*        | 값/물체 | 선택 과목. (Default `""`) 배열에 추가할 값입니다. |


#### 보고
(array): 삭제된 요소가 포함된 배열입니다. 


#### 예
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

지정된 배열과 해당 요소를 나타내는 문자열을 반환합니다.

#### 인수
어떤 인수도 허용하지 않습니다.


#### 보고
(string): 배열의 모든 요소를 ​​나타내는 문자열입니다.


#### 예
```autohotkey
["Bill", "Ted"].toString()
; => "Bill,Ted"
```
<!-- end of toString -->


## .unshift
> `array.unshift(element*)`

배열의 시작 부분에 하나 이상의 요소를 추가하고 배열의 새 길이를 반환합니다.

> [!Note]
> 이 메서드는 호출 배열을 수정합니다.

#### 인수
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  element*      | 값/물체 | 필수의. 배열 앞에 추가할 요소입니다. |



#### 보고
메서드가 호출된 배열의 새 array.Count() 길이입니다.


#### 예
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

호출 배열의 각 요소에 대한 값을 포함하는 새 배열을 반환합니다.

#### 인수
어떤 인수도 허용하지 않습니다.


#### 보고
(array): 호출 배열의 모든 값을 포함하는 새 배열입니다.


#### 예
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
