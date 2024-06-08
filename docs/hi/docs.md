## .concat
> `array.concat([value*])`

दो या दो से अधिक सारणियों को जोड़ने के लिए उपयोग किया जाता है।


#### बहस
| Argument       | Type                                                 | Description  |
| :------------- | :--------------------------------------------------- | :----------- |
|  value*        | कीमत/वस्तु | वैकल्पिक. (डिफ़ॉल्ट `[]`) सारणी और/या मानों को एक नई सारणी में संयोजित करने के लिए। |


#### रिटर्न
(array): एक नया ऐरे उदाहरण.


#### उदाहरण
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

परीक्षण करता है कि सरणी के सभी तत्व दिए गए फ़ंक्शन द्वारा कार्यान्वित परीक्षण पास करते हैं या नहीं।


#### बहस
| Argument                              | Type                   | Description  |
| :------------------------------------ | :--------------------- | :----------- |
|  function(element, index, array)      | समारोह | आवश्यक. सरणी में प्रत्येक तत्व के लिए चलाया जाने वाला एक फ़ंक्शन। |


#### रिटर्न
(boolean): यदि सभी तत्व परीक्षण फ़ंक्शन को पास करते हैं तो `सही`, अन्यथा यदि कोई नहीं होता है तो `गलत`।


#### उदाहरण
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

सभी सरणी तत्वों को स्थिर मान से भरें।

> [!Note]
> यह विधि कॉलिंग ऐरे को संशोधित करती है

#### बहस
| Argument       | Type                       | Description  |
| :------------- | :------------------------- | :----------- |
|  value         | कीमत | आवश्यक. सरणी को भरने के लिए मान. |
|  start         | संख्या | वैकल्पिक. (डिफ़ॉल्ट `1`) सरणी भरना शुरू करने के लिए सूचकांक। |
|  end           | संख्या | वैकल्पिक. (डिफ़ॉल्ट `array.Count()`) सरणी को भरने के लिए मान। |


#### रिटर्न
(array): संशोधित सरणी, मान से भरी हुई।


#### उदाहरण
```autohotkey
[1, 2, 3].fill(1)
; => [1, 1, 1]
```
<!-- end of fill -->


## .filter
> `array.filter(func("function"))`

प्रदान किए गए फ़ंक्शन द्वारा कार्यान्वित परीक्षण पास करने वाले सभी तत्वों के साथ एक नई सरणी बनाता है।

#### बहस
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | समारोह     | आवश्यक. सरणी के प्रत्येक तत्व का परीक्षण करने के लिए फ़ंक्शन एक विधेय है। |


#### रिटर्न
(array): परीक्षण में उत्तीर्ण होने वाले तत्वों के साथ एक नई सरणी।


#### उदाहरण
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

दिए गए सरणी में पहले तत्व का मान लौटाता है जो दिए गए परीक्षण फ़ंक्शन को संतुष्ट करता है।

#### बहस
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | समारोह     | आवश्यक. सरणी में प्रत्येक मान पर निष्पादित करने का कार्य। |


#### रिटर्न
(value): सरणी में पहले तत्व का मान जो दिए गए परीक्षण फ़ंक्शन को संतुष्ट करता है।


#### उदाहरण
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

सरणी में पहले तत्व का सूचकांक लौटाता है जो दिए गए परीक्षण फ़ंक्शन को संतुष्ट करता है।

#### बहस
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | समारोह | आवश्यक. सरणी में प्रत्येक मान पर निष्पादित करने का कार्य। |


#### रिटर्न
(value): सरणी में पहले तत्व का सूचकांक या कुंजी मान जो दिए गए परीक्षण फ़ंक्शन को संतुष्ट करता है।


#### उदाहरण
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

प्रत्येक सरणी तत्व के लिए एक बार दिए गए फ़ंक्शन को निष्पादित करता है।

#### बहस
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | समारोह | आवश्यक. सरणी में प्रत्येक मान पर निष्पादित करने का कार्य। |


#### रिटर्न
(""): `""` हमेशा लौटाया जाता है.


#### उदाहरण
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

यह निर्धारित करता है कि क्या किसी सरणी में उसकी प्रविष्टियों के बीच एक निश्चित मान शामिल है, जो उचित हो तो सही या गलत लौटाता है।

#### बहस
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  valueToFind   | *            | आवश्यक. खोजने योग्य मान. |
|  fromIndex     | संख्या       | वैकल्पिक. (डिफ़ॉल्ट `1`) खोज शुरू करने के लिए सूचकांक। |


#### रिटर्न
(boolean): `सही` यदि मान valueToFind सरणी के भीतर पाया जाता है (या यदि निर्दिष्ट हो तो इंडेक्स fromIndex द्वारा इंगित सरणी का भाग)।


#### उदाहरण
```autohotkey
[1, 2, 3, 4].includes(2)
; => true

[1, 2, 3, 4].includes("Socrates")
; => false
```
<!-- end of includes -->


## .indexOf
> `array.indexOf(valueToFind[, fromIndex])`

पहला सूचकांक लौटाता है जिस पर किसी दिए गए तत्व को सरणी में पाया जा सकता है, या यदि यह मौजूद नहीं है तो `-1` लौटाता है।

#### बहस
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | कीमत        | आवश्यक. खोजने योग्य मान. |
|  fromIndex     | संख्या       | वैकल्पिक. (डिफ़ॉल्ट `1`) खोज शुरू करने के लिए सूचकांक। |


#### रिटर्न
(number): सरणी में पहले तत्व का सूचकांक या कुंजी मान जो searchElement से मेल खाता है।


#### उदाहरण
```autohotkey
["Bill", "Ted"].indexOf("Socrates")
; => -1

["four", "three", "two", "one"].indexOf("three")
; => 2
```
<!-- end of indexOf -->


## .join
> `array.join(valueToFind[, fromIndex])`

किसी सरणी में सभी तत्वों को अल्पविराम या निर्दिष्ट विभाजक स्ट्रिंग द्वारा अलग करके एक नई स्ट्रिंग लौटाता है।

#### बहस
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  separator     | डोरी       | वैकल्पिक. (डिफ़ॉल्ट `","`) सरणी के आसन्न तत्वों की प्रत्येक जोड़ी को अलग करने के लिए एक स्ट्रिंग निर्दिष्ट करता है। |


#### रिटर्न
(string): सभी सरणी तत्वों के साथ एक स्ट्रिंग जुड़ी हुई है।


#### उदाहरण
```autohotkey
[1, 2, 3].join()
; => "1,2,3"

["Bill", "Ted"].join(" and ")
; => "Bill and Ted"
```
<!-- end of join -->


## .keys
> `array.keys()`

एक नई सरणी लौटाता है जिसमें सरणी में प्रत्येक सूचकांक के लिए कुंजियाँ होती हैं।

#### बहस
किसी भी तर्क को स्वीकार नहीं करता.


#### रिटर्न
(array): एक नई सारणी जिसमें कॉलिंग सारणी की सभी कुंजियाँ शामिल हैं।


#### उदाहरण
```autohotkey
["Bill", "Ted", "Socrates"].keys()
; => [1, 2, 3]
```
<!-- end of keys -->


## .lastIndexOf
> `array.lastIndexOf(valueToFind[, fromIndex])`

पहला सूचकांक लौटाता है जिस पर किसी दिए गए तत्व को सरणी में पाया जा सकता है, या यदि यह मौजूद नहीं है तो `-1` लौटाता है।

#### बहस
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  searchElement | कीमत        | आवश्यक. खोजने योग्य मान. |
|  fromIndex     | संख्या       | वैकल्पिक. (डिफ़ॉल्ट `1`) वह सूचकांक जिस पर पीछे की ओर खोज शुरू करनी है। |


#### रिटर्न
(number): सरणी में तत्व का अंतिम सूचकांक


#### उदाहरण
```autohotkey
["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Ted")
; => 4

["Bill", "Ted", "Socrates", "Ted"].lastIndexOf("Socrates")
; => 3
```
<!-- end of lastIndexOf -->


## .map
> `array.map(func("function"))`

कॉलिंग ऐरे में प्रत्येक तत्व पर दिए गए फ़ंक्शन को कॉल करने के परिणामों से भरा हुआ एक नया ऐरे बनाता है।

#### बहस
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)    | समारोह     | आवश्यक. वह फ़ंक्शन जिसे गिरफ्तारी के प्रत्येक तत्व के लिए बुलाया जाता है। |


#### रिटर्न
(array): प्रत्येक तत्व के साथ एक नई सरणी कॉलबैक फ़ंक्शन का परिणाम है।


#### उदाहरण
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

सरणी के प्रत्येक तत्व पर एक रिड्यूसर फ़ंक्शन निष्पादित करता है, जिसके परिणामस्वरूप एकल आउटपुट मान प्राप्त होता है।

#### बहस
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      | समारोह     | आवश्यक. सरणी में प्रत्येक तत्व पर निष्पादित करने के लिए एक फ़ंक्शन (पहले को छोड़कर, यदि कोई प्रारंभिक वैल्यू प्रदान नहीं किया गया है)। |


#### रिटर्न
(value): एकल मान जो कमी से उत्पन्न होता है।


#### उदाहरण
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

इसे एकल मान तक कम करने के लिए एक संचायक और सरणी के प्रत्येक मान (दाएं से बाएं) के विरुद्ध एक फ़ंक्शन लागू करता है।

#### बहस
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(accumulator, element, index, array)      | समारोह     | आवश्यक. सरणी में प्रत्येक तत्व पर निष्पादित करने के लिए एक फ़ंक्शन (पहले को छोड़कर, यदि कोई प्रारंभिक वैल्यू प्रदान नहीं किया गया है)। |


#### रिटर्न
(value): एकल मान जो कमी से उत्पन्न होता है।


#### उदाहरण
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

किसी सरणी को उसके स्थान पर उलट देता है.

> [!Note]
> यह विधि कॉलिंग ऐरे को संशोधित करती है

#### बहस
किसी भी तर्क को स्वीकार नहीं करता.


#### रिटर्न
(array): उलटा सरणी.


#### उदाहरण
```autohotkey
[1, 2, 3].reverse()
; => [3, 2, 1]
```
<!-- end of reverse -->


## .shift
> `array.shift()`

किसी सरणी से पहला तत्व हटाता है और हटाए गए तत्व को लौटाता है।

> [!Note]
> यह विधि कॉलिंग ऐरे को संशोधित करती है

#### बहस
किसी भी तर्क को स्वीकार नहीं करता.


#### रिटर्न
(value): सरणी से हटाया गया तत्व;


#### उदाहरण
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

प्रारंभ से अंत (अंत शामिल नहीं) तक चयनित एक नए सरणी ऑब्जेक्ट में किसी सरणी के एक हिस्से की एक उथली प्रतिलिपि लौटाता है, जहां प्रारंभ और अंत उस सरणी में आइटमों के सूचकांक का प्रतिनिधित्व करते हैं।

#### बहस
| Argument       | Type                      | Description  |
| :------------- | :------------------------ | :----------- |
|  start         | संख्या | वैकल्पिक. (डिफ़ॉल्ट `1`) वह सूचकांक जिस पर निष्कर्षण शुरू करना है। |
|  end           | संख्या | वैकल्पिक. (डिफ़ॉल्ट `array.Count()`) वह सूचकांक जिस पर निष्कर्षण समाप्त करना है। |


#### रिटर्न
(value): निकाले गए तत्वों से युक्त एक नई सरणी।


#### उदाहरण
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

परीक्षण करता है कि सरणी में कम से कम एक तत्व दिए गए फ़ंक्शन द्वारा कार्यान्वित परीक्षण पास करता है या नहीं।

#### बहस
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  function(element, index, array)      | समारोह     | आवश्यक. सरणी में प्रत्येक तत्व के लिए निष्पादित करने के लिए एक फ़ंक्शन। |


#### रिटर्न
(boolean): `सही` यदि कॉलबैक फ़ंक्शन सरणी में कम से कम एक तत्व के लिए सत्य मान लौटाता है।


#### उदाहरण
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

किसी सरणी के तत्वों को उनके स्थान पर क्रमबद्ध करता है और क्रमबद्ध सरणी को लौटाता है।

> [!Note]
> यह विधि कॉलिंग ऐरे को संशोधित करती है

#### बहस
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  compareFunction(firstElement, secondElement)      | समारोह     | वैकल्पिक. एक फ़ंक्शन निर्दिष्ट करता है जो सॉर्ट क्रम को परिभाषित करता है। |

| compareFunction(a, b) return value | sort order |
| :------------- | :----------- |
| > 0			 | `b` से पहले `a` क्रमबद्ध करें |
| < 0			 | `a` को `b` से पहले क्रमबद्ध करें |
| == 0			 | `a` और `b` का मूल क्रम रखें |


#### रिटर्न
(array): क्रमबद्ध सरणी.


#### उदाहरण
```autohotkey
[1, 30, 4, 21, 100000].sort()
; => [1, 4, 21, 30, 100000]

["ted", "Bill", "bill", "Ted", "Socrates", "Lincoln"].sort()
; => ["Bill", "Lincoln", "Socrates, "Ted", "bill, "ted"]
```
<!-- end of sort -->


## .splice
> `array.splice(start, [deleteCount, values*])`

मौजूदा तत्वों को हटाकर या प्रतिस्थापित करके और/या स्थान पर नए तत्व जोड़कर किसी सरणी की सामग्री को बदलता है।

> [!Note]
> यह विधि कॉलिंग ऐरे को संशोधित करती है

#### बहस
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  start         | संख्या       | आवश्यक. वह सूचकांक जिस पर सरणी बदलना शुरू करना है। |
|  deleteCount    | संख्या       | वैकल्पिक. (Default `-1`) एक पूर्णांक जो हटाए जाने वाले सरणी में तत्वों की संख्या दर्शाता है। |
|  values*        | कीमत/वस्तु | वैकल्पिक. (Default `""`) सरणी में जोड़े जाने वाले मान. |


#### रिटर्न
(array): हटाए गए तत्वों वाली एक सरणी।


#### उदाहरण
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

निर्दिष्ट सरणी और उसके तत्वों का प्रतिनिधित्व करने वाली एक स्ट्रिंग लौटाता है।

#### बहस
किसी भी तर्क को स्वीकार नहीं करता.


#### रिटर्न
(string): सरणी के सभी तत्वों का प्रतिनिधित्व करने वाली एक स्ट्रिंग।


#### उदाहरण
```autohotkey
["Bill", "Ted"].toString()
; => "Bill,Ted"
```
<!-- end of toString -->


## .unshift
> `array.unshift(element*)`

किसी सरणी की शुरुआत में एक या अधिक तत्व जोड़ता है और सरणी की नई लंबाई लौटाता है।

> [!Note]
> यह विधि कॉलिंग ऐरे को संशोधित करती है

#### बहस
| Argument       | Type         | Description  |
| :------------- | :----------- | :----------- |
|  element*      | कीमत/वस्तु | आवश्यक. सरणी के सामने जोड़ने के लिए तत्व। |



#### रिटर्न
उस सरणी की नई array.Count() लंबाई जिस पर विधि को कॉल किया गया था।


#### उदाहरण
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

एक नई सरणी लौटाता है जिसमें कॉलिंग सरणी में प्रत्येक तत्व के लिए मान शामिल होते हैं।

#### बहस
किसी भी तर्क को स्वीकार नहीं करता.


#### रिटर्न
(array): एक नई सारणी जिसमें कॉलिंग सारणी के सभी मान शामिल हैं।


#### उदाहरण
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
