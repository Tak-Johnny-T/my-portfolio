[cm]
@clearstack
[hidemenubutton]
[stopbgm time=300]
[deffont face="Yu Mincho, 游明朝, YuMincho, ＭＳ 明朝, MS Mincho, serif"]
;【軽量化 2026-07-22】1.26MBのPNGからJPEG(0.11MB)へ差し替え。起動時ロードの短縮。
;【2026-07-22】ブラウザは初回クリックがあるまで音を鳴らせないため、TyranoScriptはこの[bg]の直後で
;停止してクリックを待つ。停止中はどのタグも実行されないので、案内はスクリプトでは出せない。
;そのため、ここでは「Click to Start」を焼き込んだ背景を表示し、
;クリックで進行が再開した後に下の[bg]で文字なしの背景へ差し替える。
[bg storage="ui_title_bg_logo_click.jpg" time=100]
;差し替え時にチラつかないよう、文字なし背景も先に読み込んでおく。
[preload storage="./data/bgimage/ui_title_bg_logo.jpg" wait="true" single_use="false"]
[preload storage="./data/image/ui_title_start.png" wait="true" single_use="false"]
[preload storage="./data/image/ui_title_start_hover.png" wait="true" single_use="false"]
[preload storage="./data/image/ui_title_start_down.png" wait="true" single_use="false"]
[preload storage="./data/image/ui_title_load.png" wait="true" single_use="false"]
[preload storage="./data/image/ui_title_load_hover.png" wait="true" single_use="false"]
[preload storage="./data/image/ui_title_load_down.png" wait="true" single_use="false"]
[preload storage="./data/image/ui_title_config.png" wait="true" single_use="false"]
[preload storage="./data/image/ui_title_config_hover.png" wait="true" single_use="false"]
[preload storage="./data/image/ui_title_config_down.png" wait="true" single_use="false"]
[wait time=200]
[playbgm storage="bgm_shrine_nigh.mp3" volume=55 loop="true"]
;クリックで起動したので、案内文の入っていない通常の背景へ戻す。
;文字以外は同じ絵なので、クロスフェードすると「Click to Start」だけが消えていくように見える。
;BGMは先に鳴り始めているため、ここは間をとってゆっくり消す。
[bg storage="ui_title_bg_logo.jpg" time=800]
[image layer="0" page="fore" name="title_btn_start" storage="ui_title_start.png" folder="image" left=130 top=320 width=330 height=54 time=900 wait="false"]
[image layer="0" page="fore" name="title_btn_load" storage="ui_title_load.png" folder="image" left=130 top=425 width=330 height=54 time=900 wait="false"]
[image layer="0" page="fore" name="title_btn_config" storage="ui_title_config.png" folder="image" left=130 top=535 width=330 height=54 time=900 wait="false"]
[wait time=900]
[button graphic="ui_title_start.png" enterimg="ui_title_start_hover.png" clickimg="ui_title_start_down.png" folder="image" target="*gamestart" x=130 y=320 width=330 height=54]
[button graphic="ui_title_load.png" enterimg="ui_title_load_hover.png" clickimg="ui_title_load_down.png" folder="image" role="load" x=130 y=425 width=330 height=54]
[button graphic="ui_title_config.png" enterimg="ui_title_config_hover.png" clickimg="ui_title_config_down.png" folder="image" role="sleepgame" storage="config.ks" x=130 y=535 width=330 height=54]

*start
[s]

*gamestart
[stopbgm time=300]
[freeimage layer="0" page="fore"]
@jump storage="scene1.ks"
[s]