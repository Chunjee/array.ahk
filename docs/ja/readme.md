# array.ahk
## ジャバスクリプト の Array メソッドの オートホットキー への変換


オートホットキー には、他の言語で見られる一般的な配列動作の多くを実行するための組み込み反復ヘルパー メソッド (1.1.33 時点) がありません。

### 移植されたメソッド
* [concat](/ja/docs?id=concat)
* [every](/ja/docs?id=every)
* [fill](/ja/docs?id=fill)
* [filter](/ja/docs?id=filter)
* [find](/ja/docs?id=find)
* [findIndex](/ja/docs?id=findIndex)
* [forEach](/ja/docs?id=forEach)
* [includes](/ja/docs?id=includes)
* [indexOf](/ja/docs?id=indexOf)
* [join](/ja/docs?id=join)
* [lastIndexOf](/ja/docs?id=lastIndexOf)
* [map](/ja/docs?id=map)
* [reduce](/ja/docs?id=reduce)
* [reduceRight](/ja/docs?id=reduceRight)
* [reverse](/ja/docs?id=reverse)
* [shift](/ja/docs?id=shift)
* [slice](/ja/docs?id=slice)
* [some](/ja/docs?id=some)
* [sort](/ja/docs?id=sort)
* [splice](/ja/docs?id=splice)
* [toString](/ja/docs?id=toString)
* [unshift](/ja/docs?id=unshift)

### インストール

ターミナルまたはコマンド ラインでプロジェクト フォルダーに移動します。

```bash
npm install array.ahk
```
[GitHub の ./export.ahk](https://raw.githubusercontent.com/chunjee/array.ahk/master/export.ahk) からライブラリを確認またはコピーすることもできます。


コード内:

```autohotkey
#Include %A_ScriptDir%\node_modules
#Include array.ahk\export.ahk

msgbox, % [1,2,3].join()
; => "1,2,3"
```

### 使用法

Usage: `array.<fn>([params*])`
```autohotkey
; 2 倍の値にマッピング
arrayInt := [1, 5, 10]
arrayInt.map(func("fn_doubleInt"))
; => [2, 10, 20]

fn_doubleInt(int) {
	return int * 2
}


; オブジェクトのプロパティにマップ
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]
arrayObj.map(func("fn_returnName"))
; => ["bob", "tom"]

fn_returnName(obj) {
	return obj.name
}


; メソッドチェーン
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]
msgbox, % arrayObj.map(func("fn_returnProp").bind("age"))
	.map(func("fn_doubleInt"))
	.join(",")
; => "44,102"

fn_returnProp(prop, obj) {
	return obj[prop]
}
```

### 仕分け

ジャバスクリプト は開始/終了または左/右パラメータを公開せず、この並べ替えも公開しません。

`array.sort([params*])`
```autohotkey
arrayInt := [11,9,5,10,1,6,3,4,7,8,2]
arrayInt.sort()
; => [1,2,3,4,5,6,7,8,9,10,11]
```
