[img]https://i.imgur.com/ctnXAiX.png[/img]

[url=https://www.npmjs.com/package/biga.ahk][img]https://img.shields.io/npm/v/biga.ahk?style=for-the-badge&logo=npm[/img][/url] [url=https://www.npmjs.com/package/biga.ahk][img]https://img.shields.io/npm/dm/biga.ahk?style=for-the-badge[/img][/url] [url=https://github.com/biga-ahk/biga.ahk][img]https://img.shields.io/badge/source-code-red?style=for-the-badge&logo=github[/img][/url] [url=https://biga-ahk.github.io/biga.ahk][img]https://img.shields.io/badge/full-documentation-blue?style=for-the-badge[/img][/url] [url=https://github.com/biga-ahk/biga.ahk/blob/master/LICENSE][img]https://img.shields.io/npm/l/biga.ahk?color=tan&style=for-the-badge[/img][/url]





[hr]

[size=200][/size]


[code=bash]
npm install biga.ahk
[/code]



[code=autohotkey]
#Include %A_ScriptDir%\node_modules
#Include biga.ahk\export.ahk
A := new biga()
msgbox, % A.join(["a", "b", "c"], " ")
; => "a b c"
[/code]



[size=200]API[/size]


[code=autohotkey]
A := new biga()
wordsArray := A.words("This could be real real useful")
; => ["This", "could", "be", "real, "real", "useful"]
msgbox, % wordsArray.Count()
; => 6
uniqWords := A.uniq(wordsArray)
; => ["This", "could", "be", "real", "useful"]
msgbox, % A.join(uniqWords, " ")
; => "This could be real useful"
[/code]
: https://github.com/biga-ahk/biga.ahk/tree/master/examples

[size=200][/size]
 https://biga-ahk.github.io/biga.ahk
