## .concat
> `array.concat([value*])`

用于连接两个或多个数组。


#### 论点
| Argument       | Type                                                 | Description  |
| :------------- | :--------------------------------------------------- | :----------- |
|  value*        | 价值/目的 | 选修的. （默认`[]`）要连接到新数组中的数组和/或值。 |


#### 退货
(array): 一个新的数组实例。


#### 例子
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

测试数组中的所有元素是否通过所提供函数实现的测试。


#### 论点
| Argument                              | Type                   | Description  |
| :------------------------------------ | :--------------------- | :----------- |
|  function(element, index, array)      | 功能 | 必需的. 对数组中的每个元素运行的函数。 |


#### 退货
(boolean): 如果所有元素都通过了测试函数，则为`true`；如果有元素未通过，则为`false`。


#### 例子
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

用静态值填充所有数组元素。

> [!Note]
> 该方法修改调用数组

#### 论点
| Argument       | Type                       | Description  |
| :------------- | :------------------------- | :----------- |
|  value         | 价值 | 必需的. 用于填充数组的值。 |
|  start         | 数字 | 选修的. （默认为`1`）开始填充数组的索引。 |
|  end           | 数字 | 选修的. （默认 `array.Count()`）用于填充数组的值。 |


#### 退货
(array): 修改后的数组，填充有值。


#### 例子
```autohotkey
[1, 2, 3].fill(1)
; => [1, 1, 1]
```
<!-- end of fill -->


## .filter
> `array.filter(func("function"))`

创建一个新数组，其中包含通过所提供函数实现的测试的所有元素。

#### 论点
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | 功能     | 必需的. 函数是一个谓词，用于测试数组的每个元素。 |


#### 退货
(array): 包含通过测试的元素的新数组。


#### 例子
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

返回所提供数组中满足所提供测试函数的第一个元素的值。

#### 论点
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | 功能     | 必需的. 对数组中的每个值执行的函数。 |


#### 退货
(value): 数组中满足所提供的测试函数的第一个元素的值。


#### 例子
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

返回数组中满足所提供的测试函数的第一个元素的索引。

#### 论点
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | 功能 | 必需的. 对数组中的每个值执行的函数。 |


#### 退货
(value): 数组中满足所提供的测试函数的第一个元素的索引或键值。


#### 例子
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

为每个数组元素执行一次提供的函数。

#### 论点
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | 功能 | 必需的. 对数组中的每个值执行的函数。 |


#### 退货
(""): `""` 总是被返回。


#### 例子
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

确定数组的条目中是否包含某个值，根据需要返回 true 或 false。

#### 论点
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  valueToFind   | *            | 必需的. 要搜索的值。 |
|  fromIndex     | 数字       | 选修的. （默认为`1`）开始搜索的索引。 |


#### 退货
(boolean): 如果在数组（或由索引 fromIndex 指示的数组部分，如果指定）中找到值 valueToFind，则为`true`。


#### 例子
```autohotkey
[1, 2, 3, 4].includes(2)
; => true

[1, 2, 3, 4].includes("Socrates")
; => false
```
<!-- end of includes -->


## .indexOf
> `array.indexOf(valueToFind[, fromIndex])`

返回在数组中可以找到给定元素的第一个索引，如果不存在则返回`-1`。

#### 论点
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | 价值        | 必需的. 要搜索的值。 |
|  fromIndex     | 数字       | 选修的. （默认为`1`）开始搜索的索引。 |


#### 退货
(number): 数组中与 searchElement 匹配的第一个元素的索引或键值。


#### 例子
```autohotkey
["Bill", "Ted"].indexOf("Socrates")
; => -1

["four", "three", "two", "one"].indexOf("three")
; => 2
```
<!-- end of indexOf -->


## .join
> `array.join(valueToFind[, fromIndex])`

通过连接数组中的所有元素（以逗号或指定的分隔符字符串分隔）来返回一个新字符串。

#### 论点
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  separator     | 细绳       | 选修的. （默认`","`）指定一个字符串来分隔数组的每对相邻元素。 |


#### 退货
(string): 所有数组元素连接在一起的字符串。


#### 例子
```autohotkey
[1, 2, 3].join()
; => "1,2,3"

["Bill", "Ted"].join(" and ")
; => "Bill and Ted"
```
<!-- end of join -->


## .keys
> `array.keys()`

返回一个新数组，其中包含数组中每个索引的键。

#### 论点
不接受任何论据。


#### 退货
(array): 包含调用数组中所有键的新数组。


#### 例子
```autohotkey
["Bill", "Ted", "Socrates"].keys()
; => [1, 2, 3]
```
<!-- end of keys -->


## .lastIndexOf
> `array.lastIndexOf(valueToFind[, fromIndex])`

返回在数组中可以找到给定元素的第一个索引，如果不存在则返回`-1`。

#### 论点
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | 价值        | 必需的. 要搜索的值。 |
|  fromIndex     | 数字       | 选修的. （默认为`1`）开始向后搜索的索引。 |


#### 退货
(number): 数组中元素的最后一个索引


#### 例子
```autohotkey
["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Ted")
; => 4

["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Socrates")
; => 3
```
<!-- end of lastIndexOf -->


## .map
> `array.map(func("function"))`

创建一个新数组，其中填充了对调用数组中每个元素调用所提供函数的结果。

#### 论点
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | 功能     | 必需的. 为 arr 的每个元素调用的函数。 |


#### 退货
(array): 一个新数组，其中每个元素都是回调函数的结果。


#### 例子
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

对数组的每个元素执行归约函数，产生单个输出值。

#### 论点
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      | 功能     | 必需的. 对数组中的每个元素执行的函数（如果没有提供初始值，则第一个元素除外）。 |


#### 退货
(value): 减少产生的单一值。


#### 例子
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

对累加器和数组的每个值（从右到左）应用函数，以将其减少为单个值。

#### 论点
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      | 功能     | 必需的. 对数组中的每个元素执行的函数（如果没有提供初始值，则第一个元素除外）。 |


#### 退货
(value): 减少产生的单一值。


#### 例子
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

就地反转数组。

> [!Note]
> 该方法修改调用数组

#### 论点
不接受任何论据。


#### 退货
(array): 颠倒的数组。


#### 例子
```autohotkey
[1, 2, 3].reverse()
; => [3, 2, 1]
```
<!-- end of reverse -->


## .shift
> `array.shift()`

从数组中删除第一个元素并返回该删除的元素。

> [!Note]
> 该方法修改调用数组

#### 论点
不接受任何论据。


#### 退货
(value): 从数组中删除的元素； 


#### 例子
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

将数组的一部分的浅拷贝返回到从开始到结束（不包括结束）选择的新数组对象中，其中开始和结束表示该数组中项目的索引。

#### 论点
| Argument       | Type                      | Description  |
| :------------- | :------------------------ | :----------- |
|  start         | 数字 | 选修的. （默认为`1`）开始提取的索引。 |
|  end           | 数字 | 选修的. （默认 `array.Count()`）结束提取的索引。 |


#### 退货
(value): 包含提取元素的新数组。


#### 例子
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

测试数组中至少一个元素是否通过所提供函数实现的测试。

#### 论点
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)      | 功能     | 必需的. 对数组中的每个元素执行的函数。 |


#### 退货
(boolean): 如果回调函数为数组中至少一个元素返回真值，则为`true`。


#### 例子
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

对数组的元素进行就地排序并返回排序后的数组。

> [!Note]
> 该方法修改调用数组

#### 论点
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  compareFunction(firstElement, secondElement)      | 功能     | 选修的. 指定定义排序顺序的函数。 |

| compareFunction(a, b) return value | sort order |
| :------------- | :----------- |
| > 0			 | 将`b`排序在`a`之前 |
| < 0			 | 将`a`排序在`b`之前 |
| == 0			 | 保持`a`和`b`的原始顺序 |


#### 退货
(array): 已排序的数组。


#### 例子
```autohotkey
[1, 30, 4, 21, 100000].sort()
; => [1, 4, 21, 30, 100000]

["ted", "Bill", "bill", "Ted", "Socrates", "Lincoln"].sort()
; => ["Bill", "Lincoln", "Socrates, "Ted", "bill, "ted"]
```
<!-- end of sort -->


## .splice
> `array.splice(start, [end, values*])`

通过删除或替换现有元素和/或添加新元素来更改数组的内容。

> [!Note]
> 该方法修改调用数组

#### 论点
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  start         | 数字       | 必需的. 开始更改数组的索引。 |
|  deleteCount    | 数字       | 选修的. (Default `-1`) 一个整数，指示数组中要删除的元素数。 |
|  values*        | 价值/目的 | 选修的. (Default `""`) 要添加到数组的值。 |


#### 退货
(array): 包含已删除元素的数组。


#### 例子
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

返回表示指定数组及其元素的字符串。

#### 论点
不接受任何论据。


#### 退货
(string): 表示数组所有元素的字符串。


#### 例子
```autohotkey
["Bill", "Ted"].toString()
; => "Bill,Ted"
```
<!-- end of toString -->


## .unshift
> `array.unshift(element*)`

将一个或多个元素添加到数组的开头并返回数组的新长度。

> [!Note]
> 该方法修改调用数组

#### 论点
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  element*      | 价值/目的 | 必需的. 要添加到数组前面的元素。 |



#### 退货
调用该方法的数组的新 array.Count() 长度。


#### 例子
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

返回一个新数组，其中包含调用数组中每个元素的值。

#### 论点
不接受任何论据。


#### 退货
(array): 包含调用数组中所有值的新数组。


#### 例子
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
