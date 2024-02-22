## .concat
> `array.concat([value*])`

2 つ以上の配列を結合するために使用されます。


#### 引数
| Argument       | Type                                                 | Description  |
| :------------- | :--------------------------------------------------- | :----------- |
|  value*        | 価値/物体 | オプション. (デフォルト `[]`) 新しい配列に連結する配列および/または値。 |


#### 戻り値
(array): 新しい配列インスタンス。


#### 例
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

配列内のすべての要素が、提供された関数によって実装されたテストに合格するかどうかをテストします。


#### 引数
| Argument                              | Type                   | Description  |
| :------------------------------------ | :--------------------- | :----------- |
|  function(element, index, array)      | 関数 | 必須. 配列内の各要素に対して実行される関数。 |


#### 戻り値
(boolean): すべての要素がテスト関数に合格した場合は`true`、テスト関数に合格しなかった要素がある場合は`false`。


#### 例
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

すべての配列要素に静的な値を入力します。

> [!Note]
> このメソッドは呼び出し元の配列を変更します

#### 引数
| Argument       | Type                       | Description  |
| :------------- | :------------------------- | :----------- |
|  value         | 価値 | 必須. 配列に入力する値。 |
|  start         | 番号 | オプション. (デフォルト `1`) 配列への埋め込みを開始するインデックス。 |
|  end           | 番号 | オプション. (デフォルトの `array.Count()`) 配列に埋める値。 |


#### 戻り値
(array): 値が入力された、変更された配列。


#### 例
```autohotkey
[1, 2, 3].fill(1)
; => [1, 1, 1]
```
<!-- end of fill -->


## .filter
> `array.filter(func("function"))`

提供された関数によって実装されたテストに合格したすべての要素を含む新しい配列を作成します。

#### 引数
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | 関数     | 必須. 関数は述語であり、配列の各要素をテストします。 |


#### 戻り値
(array): テストに合格した要素を含む新しい配列。


#### 例
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

指定されたテスト関数を満たす、指定された配列内の最初の要素の値を返します。

#### 引数
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | 関数     | 必須. 配列内の各値に対して実行する関数。 |


#### 戻り値
(value): 提供されたテスト関数を満たす、配列内の最初の要素の値。


#### 例
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

指定されたテスト関数を満たす配列内の最初の要素のインデックスを返します。

#### 引数
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | 関数 | 必須. 配列内の各値に対して実行する関数。 |


#### 戻り値
(value): 提供されたテスト関数を満たす、配列内の最初の要素のインデックスまたはキー値。


#### 例
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

提供された関数を配列要素ごとに 1 回実行します。

#### 引数
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | 関数 | 必須. 配列内の各値に対して実行する関数。 |


#### 戻り値
(""): `""` 常に返されます。


#### 例
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

配列のエントリに特定の値が含まれているかどうかを判断し、必要に応じて true または false を返します。

#### 引数
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  valueToFind   | *            | 必須. 検索する値。 |
|  fromIndex     | 番号       | オプション. (デフォルト `1`) 検索を開始するインデックス。 |


#### 戻り値
(boolean): valueToFind の値が配列 (または指定されている場合はインデックス fromIndex によって示される配列の一部) 内で見つかった場合は`true`。


#### 例
```autohotkey
[1, 2, 3, 4].includes(2)
; => true

[1, 2, 3, 4].includes("Socrates")
; => false
```
<!-- end of includes -->


## .indexOf
> `array.indexOf(valueToFind[, fromIndex])`

配列内で指定された要素が見つかる最初のインデックスを返します。要素が存在しない場合は `-1` を返します。

#### 引数
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | 価値        | 必須. 検索する値。 |
|  fromIndex     | 番号       | オプション. (デフォルト `1`) 検索を開始するインデックス。 |


#### 戻り値
(number): searchElement に一致する配列内の最初の要素のインデックスまたはキー値。


#### 例
```autohotkey
["Bill", "Ted"].indexOf("Socrates")
; => -1

["four", "three", "two", "one"].indexOf("three")
; => 2
```
<!-- end of indexOf -->


## .join
> `array.join(valueToFind[, fromIndex])`

配列内のすべての要素をコンマまたは指定された区切り文字列で区切って連結して、新しい文字列を返します。

#### 引数
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  separator     | 弦       | オプション. (デフォルト `","`) 配列の隣接する要素の各ペアを区切る文字列を指定します。 |


#### 戻り値
(string): すべての配列要素が結合された文字列。 


#### 例
```autohotkey
[1, 2, 3].join()
; => "1,2,3"

["Bill", "Ted"].join(" and ")
; => "Bill and Ted"
```
<!-- end of join -->


## .keys
> `array.keys()`

配列内の各インデックスのキーを含む新しい配列を返します。

#### 引数
引数は受け付けません。


#### 戻り値
(array): 呼び出し元の配列内のすべてのキーを含む新しい配列。


#### 例
```autohotkey
["Bill", "Ted", "Socrates"].keys()
; => [1, 2, 3]
```
<!-- end of keys -->


## .lastIndexOf
> `array.lastIndexOf(valueToFind[, fromIndex])`

配列内で指定された要素が見つかる最初のインデックスを返します。要素が存在しない場合は `-1` を返します。

#### 引数
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | 価値        | 必須. 検索する値。 |
|  fromIndex     | 番号       | オプション. (デフォルト `1`) 逆方向の検索を開始するインデックス。 |


#### 戻り値
(number): 配列内の要素の最後のインデックス


#### 例
```autohotkey
["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Ted")
; => 4

["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Socrates")
; => 3
```
<!-- end of lastIndexOf -->


## .map
> `array.map(func("function"))`

呼び出し元の配列内のすべての要素に対して、指定された関数を呼び出した結果を格納した新しい配列を作成します。

#### 引数
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | 関数     | 必須. arr の要素ごとに呼び出される関数。 |


#### 戻り値
(array): 各要素がコールバック関数の結果である新しい配列。


#### 例
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

配列の各要素に対してリデューサー関数を実行し、単一の出力値を生成します。 

#### 引数
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      | 関数     | 必須. 配列内の各要素に対して実行する関数 (initialValue が指定されていない場合、最初の要素を除く)。 |


#### 戻り値
(value): リダクションの結果として得られる単一の値。


#### 例
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

アキュムレータと配列の各値に対して (右から左に) 関数を適用して、値を 1 つの値に減らします。 

#### 引数
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      | 関数     | 必須. 配列内の各要素に対して実行する関数 (initialValue が指定されていない場合、最初の要素を除く)。 |


#### 戻り値
(value): リダクションの結果として得られる単一の値。


#### 例
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

配列をその場で反転します。

> [!Note]
> このメソッドは呼び出し元の配列を変更します

#### 引数
引数は受け付けません。


#### 戻り値
(array): 反転した配列。


#### 例
```autohotkey
[1, 2, 3].reverse()
; => [3, 2, 1]
```
<!-- end of reverse -->


## .shift
> `array.shift()`

配列から最初の要素を削除し、削除された要素を返します。

> [!Note]
> このメソッドは呼び出し元の配列を変更します

#### 引数
引数は受け付けません。


#### 戻り値
(value): 配列から削除された要素。 


#### 例
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

配列の一部の浅いコピーを、開始から終了まで選択された新しい配列オブジェクトに返します (終了は含まれません)。開始と終了はその配列内の項目のインデックスを表します。

#### 引数
| Argument       | Type                      | Description  |
| :------------- | :------------------------ | :----------- |
|  start         | 番号 | オプション. (デフォルト `1`) 抽出を開始するインデックス。 |
|  end           | 番号 | オプション. (デフォルト `array.Count()`) 抽出を終了するインデックス。 |


#### 戻り値
(value): 抽出された要素を含む新しい配列。


#### 例
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

配列内の少なくとも 1 つの要素が、提供された関数によって実装されたテストに合格するかどうかをテストします。

#### 引数
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)      | 関数     | 必須. 配列内の各要素に対して実行する関数。 |


#### 戻り値
(boolean): コールバック関数が配列内の少なくとも 1 つの要素に対して真の値を返す場合は`true`。


#### 例
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

配列の要素をその場でソートし、ソートされた配列を返します。

> [!Note]
> このメソッドは呼び出し元の配列を変更します

#### 引数
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  compareFunction(firstElement, secondElement)      | 関数     | オプション. ソート順序を定義する関数を指定します。 |

| compareFunction(a, b) return value | sort order |
| :------------- | :----------- |
| > 0			 | `b`を`a`の前にソートする |
| < 0			 | `a`を`b`の前にソートする |
| == 0			 | 元の `a` と `b` の順序を維持する |


#### 戻り値
(array): ソートされた配列。


#### 例
```autohotkey
[1, 30, 4, 21, 100000].sort()
; => [1, 4, 21, 30, 100000]

["ted", "Bill", "bill", "Ted", "Socrates", "Lincoln"].sort()
; => ["Bill", "Lincoln", "Socrates, "Ted", "bill, "ted"]
```
<!-- end of sort -->


## .splice
> `array.splice(start, [end, values*])`

既存の要素を削除または置換したり、新しい要素を所定の位置に追加したりして、配列の内容を変更します。

> [!Note]
> このメソッドは呼び出し元の配列を変更します

#### 引数
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  start         | 番号       | 必須. 配列の変更を開始するインデックス。 |
|  deleteCount    | 番号       | オプション. (Default `-1`) 削除する配列内の要素の数を示す整数。 |
|  values*        | 価値/物体 | オプション. (Default `""`) 配列に追加する値。 |


#### 戻り値
(array): 削除された要素を含む配列。


#### 例
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

指定された配列とその要素を表す文字列を返します。

#### 引数
引数は受け付けません。


#### 戻り値
(string): 配列のすべての要素を表す文字列。


#### 例
```autohotkey
["Bill", "Ted"].toString()
; => "Bill,Ted"
```
<!-- end of toString -->


## .unshift
> `array.unshift(element*)`

1 つ以上の要素を配列の先頭に追加し、配列の新しい長さを返します。

> [!Note]
> このメソッドは呼び出し元の配列を変更します

#### 引数
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  element*      | 価値/物体 | 必須. 配列の先頭に追加する要素。 |



#### 戻り値
メソッドが呼び出された配列の新しい array.Count() の長さ。


#### 例
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

呼び出した配列の各要素の値を含む新しい配列を返します。

#### 引数
引数は受け付けません。


#### 戻り値
(array): 呼び出し元の配列内のすべての値を含む新しい配列。


#### 例
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
