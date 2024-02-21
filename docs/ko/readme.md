# array.ahk
## 자바스크립트 의 배열 메소드를 오토핫키 로 변환


오토핫키 에는 다른 언어에서 볼 수 있는 많은 일반적인 배열 동작을 수행하기 위한 내장된 반복 도우미 메서드(1.1.33 기준)가 없습니다.

### 이식된 방법
* [concat](/ko/docs?id=concat)
* [every](/ko/docs?id=every)
* [fill](/ko/docs?id=fill)
* [filter](/ko/docs?id=filter)
* [find](/ko/docs?id=find)
* [findIndex](/ko/docs?id=findIndex)
* [forEach](/ko/docs?id=forEach)
* [includes](/ko/docs?id=includes)
* [indexOf](/ko/docs?id=indexOf)
* [join](/ko/docs?id=join)
* [lastIndexOf](/ko/docs?id=lastIndexOf)
* [map](/ko/docs?id=map)
* [reduce](/ko/docs?id=reduce)
* [reduceRight](/ko/docs?id=reduceRight)
* [reverse](/ko/docs?id=reverse)
* [shift](/ko/docs?id=shift)
* [slice](/ko/docs?id=slice)
* [some](/ko/docs?id=some)
* [sort](/ko/docs?id=sort)
* [splice](/ko/docs?id=splice)
* [toString](/ko/docs?id=toString)
* [unshift](/ko/docs?id=unshift)

### 설치

터미널이나 명령줄에서 프로젝트 폴더로 이동합니다.

```bash
npm install array.ahk
```
[./export.ahk on GitHub](https://raw.githubusercontent.com/chunjee/array.ahk/master/export.ahk)에서 라이브러리를 검토하거나 복사할 수도 있습니다.


코드에서:

```autohotkey
#Include %A_ScriptDir%\node_modules
#Include array.ahk\export.ahk

msgbox, % [1,2,3].join()
; => "1,2,3"
```

### 용법

Usage: `array.<fn>([params*])`
```autohotkey
; 두 배의 값으로 매핑
arrayInt := [1, 5, 10]
arrayInt.map(func("fn_doubleInt"))
; => [2, 10, 20]

fn_doubleInt(int) {
	return int * 2
}


; 객체 속성에 매핑
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]
arrayObj.map(func("fn_returnName"))
; => ["bob", "tom"]

fn_returnName(obj) {
	return obj.name
}


; 메소드 체이닝
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]
msgbox, % arrayObj.map(func("fn_returnProp").bind("age"))
	.map(func("fn_doubleInt"))
	.join(",")
; => "44,102"

fn_returnProp(prop, obj) {
	return obj[prop]
}
```

### 정렬

자바스크립트 는 시작/끝 또는 왼쪽/오른쪽 매개변수를 노출하지 않으며 이 정렬도 마찬가지입니다.

`array.sort([params*])`
```autohotkey
arrayInt := [11,9,5,10,1,6,3,4,7,8,2]
arrayInt.sort()
; => [1,2,3,4,5,6,7,8,9,10,11]
```
