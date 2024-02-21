# array.ahk
## JavaScript 数组方法到 AutoHotkey 的转换


AutoHotkey 缺乏内置的迭代辅助方法（截至 1.1.33) 来执行其他语言中常见的许多常见数组行为。

### 移植方法
* [concat](/zh/docs?id=concat)
* [every](/zh/docs?id=every)
* [fill](/zh/docs?id=fill)
* [filter](/zh/docs?id=filter)
* [find](/zh/docs?id=find)
* [findIndex](/zh/docs?id=findIndex)
* [forEach](/zh/docs?id=forEach)
* [includes](/zh/docs?id=includes)
* [indexOf](/zh/docs?id=indexOf)
* [join](/zh/docs?id=join)
* [lastIndexOf](/zh/docs?id=lastIndexOf)
* [map](/zh/docs?id=map)
* [reduce](/zh/docs?id=reduce)
* [reduceRight](/zh/docs?id=reduceRight)
* [reverse](/zh/docs?id=reverse)
* [shift](/zh/docs?id=shift)
* [slice](/zh/docs?id=slice)
* [some](/zh/docs?id=some)
* [sort](/zh/docs?id=sort)
* [splice](/zh/docs?id=splice)
* [toString](/zh/docs?id=toString)
* [unshift](/zh/docs?id=unshift)

### 安装

在导航到项目文件夹的终端或命令行中：

```bash
npm install array.ahk
```
您还可以从 GitHub 上的 [./export.ahk](https://raw.githubusercontent.com/chunjee/array.ahk/master/export.ahk) 查看或复制该库


在你的代码中：

```autohotkey
#Include %A_ScriptDir%\node_modules
#Include array.ahk\export.ahk

msgbox, % [1,2,3].join()
; => "1,2,3"
```

### 用法

Usage: `array.<fn>([params*])`
```autohotkey
; 映射到双倍值
arrayInt := [1, 5, 10]
arrayInt.map(func("fn_doubleInt"))
; => [2, 10, 20]

fn_doubleInt(int) {
	return int * 2
}


; 映射到对象属性
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]
arrayObj.map(func("fn_returnName"))
; => ["bob", "tom"]

fn_returnName(obj) {
	return obj.name
}


; 方法链接
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]
msgbox, % arrayObj.map(func("fn_returnProp").bind("age"))
	.map(func("fn_doubleInt"))
	.join(",")
; => "44,102"

fn_returnProp(prop, obj) {
	return obj[prop]
}
```

### 排序

JavaScript 不公开开始/结束或左/右参数，这种排序也不公开。

`array.sort([params*])`
```autohotkey
arrayInt := [11,9,5,10,1,6,3,4,7,8,2]
arrayInt.sort()
; => [1,2,3,4,5,6,7,8,9,10,11]
```
