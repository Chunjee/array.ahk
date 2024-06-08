# array.ahk
## जावास्क्रिप्ट की ऐरे विधियों का ऑटोहॉटकी में रूपांतरण


अन्य भाषाओं में पाए जाने वाले कई सामान्य सरणी व्यवहारों को निष्पादित करने के लिए ऑटोहॉटकी में अंतर्निहित पुनरावृत्ति सहायक विधियों (1.1.33 के अनुसार) का अभाव है।

### पोर्टेड तरीके
* [concat](/hi/docs?id=concat)
* [every](/hi/docs?id=every)
* [fill](/hi/docs?id=fill)
* [filter](/hi/docs?id=filter)
* [find](/hi/docs?id=find)
* [findIndex](/hi/docs?id=findIndex)
* [forEach](/hi/docs?id=forEach)
* [includes](/hi/docs?id=includes)
* [indexOf](/hi/docs?id=indexOf)
* [join](/hi/docs?id=join)
* [lastIndexOf](/hi/docs?id=lastIndexOf)
* [map](/hi/docs?id=map)
* [reduce](/hi/docs?id=reduce)
* [reduceRight](/hi/docs?id=reduceRight)
* [reverse](/hi/docs?id=reverse)
* [shift](/hi/docs?id=shift)
* [slice](/hi/docs?id=slice)
* [some](/hi/docs?id=some)
* [sort](/hi/docs?id=sort)
* [splice](/hi/docs?id=splice)
* [toString](/hi/docs?id=toString)
* [unshift](/hi/docs?id=unshift)
* [values](/hi/docs?id=values)

### इंस्टालेशन

आपके प्रोजेक्ट फ़ोल्डर में नेविगेट किए गए टर्मिनल या कमांड लाइन में:

```bash
npm install array.ahk
```
आप GitHub पर [./export.ahk](https://raw.githubusercontent.com/chunjee/array.ahk/master/export.ahk) से लाइब्रेरी की समीक्षा या प्रतिलिपि भी बना सकते हैं।


आपके कोड में:

```autohotkey
#Include %A_ScriptDir%\node_modules
#Include array.ahk\export.ahk

msgbox, % [1,2,3].join()
; => "1,2,3"
```

### प्रयोग

Usage: `array.<fn>([params*])`
```autohotkey
; दोगुने मान पर मैप करें
arrayInt := [1, 5, 10]
arrayInt.map(func("fn_doubleInt"))
; => [2, 10, 20]

fn_doubleInt(int) {
	return int * 2
}


; संपत्ति पर आपत्ति करने के लिए मानचित्र
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]
arrayObj.map(func("fn_returnName"))
; => ["bob", "tom"]

fn_returnName(obj) {
	return obj.name
}


; विधि जंजीर
arrayObj := [{"name": "bob", "age": 22}, {"name": "tom", "age": 51}]
msgbox, % arrayObj.map(func("fn_returnProp").bind("age"))
	.map(func("fn_doubleInt"))
	.join(",")
; => "44,102"

fn_returnProp(prop, obj) {
	return obj[prop]
}
```

### छंटाई

जावास्क्रिप्ट प्रारंभ/अंत या बाएँ/दाएँ मापदंडों को उजागर नहीं करता है और न ही इस प्रकार को उजागर करता है।

`array.sort([params*])`
```autohotkey
[11,9,5,10,1,6,3,4,7,8,2].sort()
; => [1,2,3,4,5,6,7,8,9,10,11]


[11,9,5,10,1,6,3,4,7,8,2].sort(func("fn_reverse"))
fn_reverse(a, b) {
	return b - a
}
; => [11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1])
```
