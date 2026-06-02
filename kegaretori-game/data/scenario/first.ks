;一番最初に呼び出されるファイル

[title name="ケガレトリ"]

[stop_keyconfig]
@call storage="tyrano.ks"

; Codex: theme_kopanda_18_free, menu/config screens only.
[sysview type="menu" storage="./data/others/plugin/theme_kopanda_18_free/html/menu.html"]
[loadjs storage="plugin/theme_kopanda_18_free/testMessagePlus/gMessageTester.js"]
[loadcss file="./data/others/plugin/theme_kopanda_18_free/testMessagePlus/style.css"]

[macro name="test_message_start"]
[eval exp="gMessageTester.create()"]
[endmacro]

[macro name="test_message_end"]
[eval exp="gMessageTester.destroy()"]
[endmacro]

[macro name="test_message_reset"]
[eval exp="gMessageTester.currentTextNumber=0;gMessageTester.next(true)"]
[endmacro]

@layopt layer="message" visible=false
[hidemenubutton]
@jump storage="title.ks"
[s]
