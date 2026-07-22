;=========================================
; 『ケガレトリ』本編シナリオ v4
; TyranoScript v603b 対応
; 想定解像度: 1280x720
; 一行最大24文字で折り返し
;=========================================

*start

;--- 初期設定 ---
[cm]
[clearfix]
[start_keyconfig]
[showmenubutton]

;--- メッセージウィンドウ設定 ---
[position layer="message0" left=120 top=500 width=1040 height=190 page=fore visible=true]
[position layer="message0" page=fore margint="42" marginl="54" marginr="64" marginb="48"]
[layopt layer="message0" visible=true]
[deffont face="Yu Mincho, 游明朝, YuMincho, ＭＳ 明朝, MS Mincho, serif"]
[resetfont]
[font color=0xffffff]
[ptext name="chara_name_area" layer="message0" color="white" size=28 bold=true x=150 y=510]

;--- キャラクター定義（葵：表情差分16種）---
;jname="葵"：本文の話者タグは #aoi で指定し、名前欄には「葵」と表示される（talk_focus連動のため内部名aoiで統一）。
[chara_new  name="aoi" storage="aoi_normal.png" jname="葵" width="980"]
[chara_face name="aoi" face="normal"        storage="aoi_normal.png"]
[chara_face name="aoi" face="eyes_closed"   storage="aoi_eyes_closed.png"]
[chara_face name="aoi" face="surprise"      storage="aoi_surprise.png"]
[chara_face name="aoi" face="smirk"         storage="aoi_smirk_cold.png"]
[chara_face name="aoi" face="skeptical"     storage="aoi_skeptical.png"]
[chara_face name="aoi" face="smile_bright"  storage="aoi_smile_bright.png"]
[chara_face name="aoi" face="radiant"       storage="aoi_radiant.png"]
[chara_face name="aoi" face="serene"        storage="aoi_serene.png"]
[chara_face name="aoi" face="soft_smile"    storage="aoi_soft_smile.png"]
[chara_face name="aoi" face="anxious"       storage="aoi_anxious.png"]
[chara_face name="aoi" face="shock"         storage="aoi_shock.png"]
[chara_face name="aoi" face="fear"          storage="aoi_fear.png"]
[chara_face name="aoi" face="teary"         storage="aoi_teary.png"]
[chara_face name="aoi" face="eyes_shut"     storage="aoi_eyes_shut.png"]
[chara_face name="aoi" face="kami"          storage="aoi_kami_v2.png"]
[chara_face name="aoi" face="mad_laugh"     storage="aoi_mad_laugh.png"]

;--- 立ち絵の発言フォーカス設定 ---
;talk_focus="brightness"：発言者（#名前で識別）を通常の明るさ、非発言キャラを少し暗くする。
;brightness_value=75：非発言時の明度（0-100、既定60）。「少し暗く」程度に控えめ設定。数値を下げるほど暗くなる。
;→ #aoi の行は葵が明るく、#美玲 など葵以外の行では葵が自動で少し暗くなる。
[chara_config ptext="chara_name_area" talk_focus="brightness" brightness_value=75]

;--- スマホ画面UI共通 ---
;phone_blank.png / phone_cracked_blank.png を台紙にし、画面内テキストは ptext で重ねる。
;スマホ表示を消す前、または別画面へ切り替える前に呼ぶ。
[macro name="phone_text_clear"]
[free layer="0" page="fore" name="phone_title"]
[free layer="0" page="fore" name="phone_line1"]
[free layer="0" page="fore" name="phone_line2"]
[free layer="0" page="fore" name="phone_line3"]
[free layer="0" page="fore" name="phone_line4"]
[free layer="0" page="fore" name="phone_line5"]
[free layer="0" page="fore" name="phone_line6"]
[free layer="0" page="fore" name="phone_line7"]
[free layer="0" page="fore" name="phone_note"]
[free layer="0" page="fore" name="phone_logo"]
[free layer="0" page="fore" name="phone_choice1"]
[free layer="0" page="fore" name="phone_choice2"]
[free layer="0" page="fore" name="phone_choice3"]
[free layer="0" page="fore" name="phone_choice4"]
[endmacro]

;地の文や場面転換では、直前の話者名を残さない。
[macro name="speaker_clear"]
[iscript]
TYRANO.kag.stat.current_speaker = "";
if (TYRANO.kag.stat.chara_ptext) {
  $("." + TYRANO.kag.stat.chara_ptext).html("");
}
[endscript]
[endmacro]

;--- 変数初期化 ---
[iscript]
tf.no_count_eula  = 0;
tf.no_count_room  = 0;
tf.no_count_final = 0;
tf.clear_totsuka  = false;
tf.clear_father   = false;
tf.clear_face     = false;
[endscript]


;=========================================
; ① 導入
;=========================================
*intro_classroom

[speaker_clear]
[bg storage="bg_classroom_evening.jpg" time=1000]
;[playbgm storage="bgm_daily.ogg"] ; 現行アセットではBGMなし
[wait time=500]

#美玲
「葵 こういう噂知ってる？」[p]
[speaker_clear]

放課後の教室。窓から夕日が射し込む。[p]

私はシャーペンを指の上で転がしながら[r]
ぼんやりと美玲の話に耳を傾けた。[p]

#美玲
「隣町の■■神社。あそこ古い祠があってさ」[p]
[speaker_clear]

#美玲
「そこにスマホを供えて呪文を唱えると、[r]
自分の『ケガレ』を清めてくれる神様のアプリが[r]
手に入るんだって」[p]
[speaker_clear]

[chara_show name="aoi" face="normal" width="980"]
#aoi
「ケガレ？」[p]
[speaker_clear]

#美玲
「そう。人間、どんなに清く正しく生きようとしたって[r]
やっぱどこか汚れちゃうじゃん」[p]
[speaker_clear]

[chara_mod name="aoi" face="eyes_closed"]

……それは、そう思う。[p]

無垢で純粋だった子供の頃と比べると[r]
今の私は、色々とすす汚れている。[p]

#美玲
「神様がケガレを全部洗い流してくれるんだ。[r]
ほら、よく言うじゃん。デラックス？　みたいな？」[p]
[speaker_clear]

#aoi
「それを言うならデトックスでしょ。[r]
……ていうか怪しすぎない、それ？」[p]
[speaker_clear]

#美玲
「だよね～。[l]まあ、所詮都市伝説だし。[r]
わざわざ隣町まで行って試すほど暇じゃないよね」[p]
[speaker_clear]

[chara_mod name="aoi" face="normal"]

#aoi
「だね。[l]……ところで、その呪文って？」[p]
[speaker_clear]

#美玲
「興味あるんじゃん」[p]
[speaker_clear]

#aoi
「一応聞いてみただけ」[p]
[speaker_clear]

#美玲
「ええとね、確か――」[p]
[speaker_clear]

#美玲
「『祓ひ給へ、清め給へ、我が穢れを喰らひ給へ』[l][r]
……だって」[p]
[speaker_clear]

#aoi
「ふーん」[p]
[speaker_clear]

;長いモノローグ（溜め込んだケガレの振り返り）の間は立ち絵を消す。
[chara_hide name="aoi"]

美玲には気のない返事をしたけど[r]
正直、心は少し揺れた。[p]

——だって私のなかには『ケガレ』が山ほどあるから。[p]

クラスメイトの佐川ゆきな。[l][r]
何が気に入らないのか、私にばかり嫌がらせをする。[p]

担任の戸塚。[l][r]
授業中、私が間違いを指摘してクラス中に笑われた。[r]
それをいつまでも根に持っていて、私にだけ厳しい。[p]

お父さんの怒鳴り声。[l][r]
すぐ怒るし、物を壊す。お母さんは怖がって逆らえない。[r]
家は安心できる場所じゃない。[p]

悲しい。[l]ムカつく。[l]恨めしい。[l]うんざり。[l][r]
じわじわした色んな感情が私の胸で渦巻いている。[p]

このイヤな感情は私の中に沈殿していく。[l][r]
消化されず、どんどんどんどん、溜まっていく。[p]

重くて、[l]暗くて、[l]屈折してて。[p]

そんなケガレを溜め込んだ自分の顔を、[r]
鏡で見るたびに嫌になる。[p]

;モノローグ終了。会話再開に合わせて立ち絵を再表示（美玲の発言中は自動で少し暗くなる）。
[chara_show name="aoi" face="normal" width="980"]

#美玲
「葵、行くの？」[p]
[speaker_clear]

#aoi
「行かないよ」[p]
[speaker_clear]

#美玲
「えー、試してほしかったのになー」[p]
[speaker_clear]

[chara_mod name="aoi" face="smirk"]

#aoi
「人を実験台にしないでよ」[p]
[speaker_clear]

私たちは笑って、その話はそれで終わった。[p]

[chara_hide name="aoi"]
[speaker_clear]
[fadeoutbgm time=1500]

[speaker_clear]
[mask color=0x000000 time=1000]
[wait time=600]

;--- 神社到着 ---
*intro_shrine

[speaker_clear]
[bg storage="bg_shrine_path_night.jpg" time=0]
[playbgm storage="bgm_shrine_nigh.mp3" volume=70]
[mask_off time=1200]
[wait time=800]

——その夜。[l][r]
私は隣町にむけて自転車を漕いでいた。[p]

[playse storage="se_footstep_gravel.mp3" loop=true buf=2 volume=60]

#aoi
「……ここだ」[p]
[speaker_clear]

神社は思っていたよりずっと小さくて、暗かった。[p]

街灯のない参道。スマホのライトを頼りに歩く。[l][r]
砂利を踏む音だけが響く。[p]

木々のざわめき。湿った苔の匂い。[p]

ここだけひんやりと空気が冷たい。[l][r]
腕に鳥肌が立つ。[p]

……やっぱり帰ろうかな。[r]
そんな気持ちが首をもたげる。[p]

いや、せっかく隣町までやってきたんだ。[l][r]
パパッと試して、何もなければそれでいい。[p]
早々に引き上げよう。足早に参道を進む。[p]

[stopse buf=2]
[speaker_clear]
[bg storage="bg_hokora_night.jpg" time=1500]

本殿の奥。古くて小さな建物があった。[l][r]
——祠だ。[p]

木は黒ずんでいる。扉の彫り物は半分剥げている。[l][r]
蜘蛛の巣が屋根の縁から垂れていた。[p]

祠の扉がわずかに空いている。[l][r]
中を覗き込む。[p]

[image layer="0" page="fore" storage="doll_white.png" left=425 top=125 width=430 time=800 folder="image"]
[wait time=1000]

それは、奥にぽつんと安置されていた。[l][r]
……真っ白な 白木の人形。[p]

荒削りで 目も鼻も口もない。[l][r]
四角いこけしのような簡素な姿。[l][r]
両手両足を大の字に広げて無防備に座っている。[p]

表情はないが、なんだか優しそうに見えた。[p]

[freeimage layer="0" page="fore" time=500]
[chara_show name="aoi" face="normal" width="980"]

私はスマホを取り出して祠の前にそっと置いた。[p]

両手を合わせる。[p]

[chara_mod name="aoi" face="eyes_closed"]

#aoi
「祓ひ給へ、清め給へ、我が穢れを喰らひ給へ」[p]
[speaker_clear]

[playse storage="se_sharan.mp3" volume=90]
[wait time=1200]

——シャラン。[l][r]
鈴の音がどこからともなく響いた。[p]

ぞくりと背筋が震えた。[p]

;--- アプリインストール ---
*intro_app

[chara_hide name="aoi"]
[phone_text_clear]
[image layer="0" page="fore" storage="phone_blank.png" left=230 top=35 width=820 time=500 folder="image"]
[image layer="0" page="fore" name="phone_logo" storage="ui_phone_logo.png" folder="image" left=515 top=220 width=250 time=500]
[wait time=600]

スマホを見ると——[l]見覚えのないアプリが。[p]

『ケガレトリ』。[p]

[phone_text_clear]
[freeimage layer="0" page="fore" time=300]
[chara_show name="aoi" face="surprise" width="980"]

#aoi
「うそ。ほんとに入った……？」[p]
[speaker_clear]

[playse storage="se_tap.mp3"]
[playse storage="se_sharan.mp3" volume=80]
[phone_text_clear]
[freeimage layer="0" page="fore" time=300]
[chara_mod name="aoi" face="surprise"]

タップすると、細かい文章がずらりと表示される。[r]
よくある、『規約に同意しますか』的なあれだ。[p]

この手のやつは、同意しないと先に進めない。[r]
最終行まで高速スクロール。[p]

……最後の一行だけ、なぜか目に止まった。[p]

[chara_mod name="aoi" face="skeptical"]

#aoi
「『完全に清められし御魂は、神となります。[r]
是非ともご精進ください……』？」[p]
[speaker_clear]

[chara_mod name="aoi" face="smirk"]

#aoi
「神？」[p]
[speaker_clear]

くすっと笑ってしまった。[p]

#aoi
「私が神様になる？[r]
崇められる存在になれるってこと？」[p]
[speaker_clear]

#aoi
「悪くないじゃん」[p]
[speaker_clear]


;--- 利用規約 選択肢 ---
*eula_choice

[chara_hide name="aoi"]
[phone_text_clear]
[freeimage layer="0" page="fore" time=200]
[image layer="0" page="fore" storage="phone_blank.png" left=230 top=35 width=820 time=500 folder="image"]
[image layer="0" page="fore" name="phone_logo" storage="ui_phone_logo.png" folder="image" left=490 top=170 width=300 time=500]
[ptext layer="0" page="fore" name="phone_line1" x=500 y=270 size=24 color=0x111111 text="利用規約に同意しますか？"]
[glink target="*eula_yes" text="" graphic="ui_phone_yes.png" enterimg="ui_phone_yes_hover.png" clickimg="ui_phone_yes_down.png" x=420 y=320 width=180 height=58]
[glink target="*eula_no" text="" graphic="ui_phone_no.png" enterimg="ui_phone_no_hover.png" clickimg="ui_phone_no_down.png" x=660 y=320 width=180 height=58]
[s]

*eula_no
[cm]
[playse storage="se_tap.mp3"]
[phone_text_clear]
[freeimage layer="0" page="fore" time=300]

[chara_show name="aoi" face="normal" width="980"]

#aoi
「……やめとこ」[p]
[speaker_clear]
[chara_hide name="aoi"]
[speaker_clear]

私は同意せずアプリを閉じてアンインストールした。[p]

そしてスマホをポケットにしまい、祠に背を向けた。[p]

[chara_hide name="aoi"]
[speaker_clear]
[fadeoutbgm time=1500]
[speaker_clear]
[mask color=0x000000 time=1500]
[wait time=1200]

[speaker_clear]
[bg storage="bg_classroom_day.jpg" time=0]
;[playbgm storage="bgm_daily.ogg"] ; 現行アセットではBGMなし
[mask_off time=1200]
[wait time=600]

翌朝。[l][r]
昨日と何も変わらない一日。[p]

佐川ゆきながこちらを見て、口元だけで笑う。[p]

机の中には、くしゃくしゃに丸められたプリント。[l][r]
担任の戸塚は、私の答案だけを冷たく見下ろした。[p]

家に帰れば、お父さんの怒鳴り声が壁を震わせる。[p]

私は何も選ばなかった。[l][r]
だから、何も変わらなかった。[p]

[chara_show name="aoi" face="normal" width="980"]

#aoi
「……やっぱり、試せばよかったのかな」[p]
[speaker_clear]
[chara_hide name="aoi" time=1]

[stopbgm time=1000]
[speaker_clear]
[mask color=0x000000 time=1500]
[wait time=1000]

;--- ゲームオーバー：未同意 ---
*gameover_eula

[speaker_clear]
[bg storage="bg_black.png" time=0]
[mask_off time=500]
[chara_hide name="aoi"]
[phone_text_clear]
[freeimage layer="0" page="fore" time=100]
[cm]
[layopt layer="message0" visible=false]
[playse storage="se_bell_low.mp3" volume=80]
[image layer="0" page="fore" storage="gameover.png" left=0 top=0 width=1280 height=720 time=800 folder="image"]
[wait time=800]

[glink target="*retry_eula_choice" text="" graphic="ui_gameover_retry.png" enterimg="ui_gameover_retry_hover.png" clickimg="ui_gameover_retry_down.png" x=285 y=430 width=300 height=49]
[glink target="*return_title" text="" graphic="ui_gameover_title.png" enterimg="ui_gameover_title_hover.png" clickimg="ui_gameover_title_down.png" x=695 y=430 width=300 height=49]
[s]

*retry_eula_choice
[phone_text_clear]
[freeimage layer="0" page="fore" time=100]
[cm]
[layopt layer="message0" visible=true]
[speaker_clear]
[bg storage="bg_hokora_night.jpg" time=0]
[playbgm storage="bgm_shrine_nigh.mp3" volume=70]
[jump target="*eula_choice"]

*eula_yes
[cm]
[playse storage="se_tap.mp3"]
[playse storage="se_sharan.mp3" volume=80]
[phone_text_clear]
[freeimage layer="0" page="fore" time=400]
[iscript]
tf.clear_totsuka = false;
tf.clear_father  = false;
tf.clear_face    = false;
[endscript]


;--- ケガレ一覧 ---
*kegare_list_first

[chara_hide name="aoi"]
[phone_text_clear]
[freeimage layer="0" page="fore" time=200]
[image layer="0" page="fore" storage="phone_blank.png" left=230 top=35 width=820 time=500 folder="image"]
[ptext layer="0" page="fore" name="phone_title" x=570 y=125 size=24 color=0x111111 text="ケガレ一覧"]
[image layer="0" page="fore" storage="ui_phone_classmate.png" folder="image" left=440 top=190 width=400 height=43 time=200]
[image layer="0" page="fore" storage="ui_phone_teacher.png" folder="image" left=440 top=245 width=400 height=43 time=200]
[image layer="0" page="fore" storage="ui_phone_father.png" folder="image" left=440 top=300 width=400 height=43 time=200]
[image layer="0" page="fore" storage="ui_phone_face.png" folder="image" left=440 top=355 width=400 height=43 time=200]
[wait time=500]

同意を押したら、画面が切り替わった。[p]

[phone_text_clear]
[freeimage layer="0" page="fore" time=300]
[chara_show name="aoi" face="skeptical" width="980"]

——え。[p]

#aoi
「なんでこれ知ってるの……」[p]
[speaker_clear]

ぞわっとした。[p]

けど ぞわっとするより先に指が勝手に動いていた。[p]

;フローチャート2A：初回は《佐川ゆきな　いじめ》だけ選択可能。他項目はクリック音のみ。

*kegare_first_choice
[chara_hide name="aoi"]
[phone_text_clear]
[freeimage layer="0" page="fore" time=100]
[image layer="0" page="fore" storage="phone_blank.png" left=230 top=35 width=820 time=500 folder="image"]
[ptext layer="0" page="fore" name="phone_title" x=570 y=125 size=24 color=0x111111 text="ケガレ一覧"]
[glink target="*tap_sagawa" text="" graphic="ui_phone_classmate.png" enterimg="ui_phone_classmate_hover.png" clickimg="ui_phone_classmate_down.png" x=440 y=190 width=400 height=43]
[glink target="*inactive_kegare_first" text="" graphic="ui_phone_teacher.png" enterimg="ui_phone_teacher_hover.png" clickimg="ui_phone_teacher_down.png" x=440 y=245 width=400 height=43]
[glink target="*inactive_kegare_first" text="" graphic="ui_phone_father.png" enterimg="ui_phone_father_hover.png" clickimg="ui_phone_father_down.png" x=440 y=300 width=400 height=43]
[glink target="*inactive_kegare_first" text="" graphic="ui_phone_face.png" enterimg="ui_phone_face_hover.png" clickimg="ui_phone_face_down.png" x=440 y=355 width=400 height=43]
[s]

*inactive_kegare_first
[playse storage="se_tap.mp3"]
[jump target="*kegare_first_choice"]
*tap_sagawa
[cm]
[iscript]
tf.first_target = "sagawa";
[endscript]
[jump target="*kegare_confirm"]

*kegare_confirm
[playse storage="se_tap.mp3"]
[playse storage="se_sharan.mp3" volume=80]
[wait time=700]
[phone_text_clear]
[freeimage layer="0" page="fore" time=500]

気付くと私は息を止めていた。[l][r]
汗で背中がじっとりと湿っている。[p]

スマホの画面がふっと暗転する。[p]

;[playse storage="se_wind.ogg" volume=50] ; 現行アセットではSEなし

夜風がひゅうと参道を抜け、木々がざわわと揺れた。[p]

なにも起きない。[p]

[chara_show name="aoi" face="smirk" width="980"]

#aoi
「……バカみたい」[p]
[speaker_clear]

ひとり呟いて、神社を後にした。[p]

[chara_hide name="aoi"]
[speaker_clear]
[fadeoutbgm time=1500]
[speaker_clear]
[mask time=1500]
[wait time=1500]


;=========================================
; ② 展開 — 人生バラ色フェーズ
;=========================================
*development_morning

[speaker_clear]
[bg storage="bg_classroom_day.jpg" time=0]
;[playbgm storage="bgm_daily.ogg"] ; 現行アセットではBGMなし
[mask_off time=1500]
[wait time=600]

翌朝 教室の空気が変わっていた。[p]

[phone_text_clear]
[freeimage layer="0" page="fore" time=300]
席についた瞬間 わかった。[p]

誰も 私を見ない。[p]

いつもなら佐川ゆきなが[r]
こっちを見て笑うあの時間。[p]

それがない。[l][r]
ちらりと佐川の席を見る。[p]

——彼女はひとりだった。[l][r]
取り巻きだった子たちが別のグループで笑っている。[p]

たまに佐川のほうを見て目配せして また笑う。[p]

昨日までの私が、そこにいた。[p]

[chara_show name="aoi" face="surprise" width="980"]

#美玲
「葵、おはよ」[p]
[speaker_clear]

#aoi
「あ……うん。おはよ」[p]
[speaker_clear]

#美玲
「……佐川、ハブられてんじゃん。ざまあ」[p]
[speaker_clear]

美玲が小声でくすりと笑う。[p]

[chara_mod name="aoi" face="anxious"]

授業のあいだずっと心臓の音がうるさかった。[p]

——偶然？[p]

——それとも[l][r]
本当にあのアプリのせい？[p]

[chara_hide name="aoi"]
[stopbgm]
[speaker_clear]
[bg storage="bg_aoi_room_day.jpg" time=1000]

放課後 家に帰ってベッドに座った。[p]

震える指で『ケガレトリ』を開く。[p]

[chara_hide name="aoi"]
[phone_text_clear]
[jump target="*kegare_remaining_choice"]

;--- 残りのケガレ選択 ---
*kegare_remaining_choice

[chara_hide name="aoi"]
[phone_text_clear]
[freeimage layer="0" page="fore" time=100]
[if exp="tf.clear_totsuka && tf.clear_father && tf.clear_face"]
[wait time=900]
[jump target="*development_radiant"]
[endif]
[image layer="0" page="fore" storage="phone_blank.png" left=230 top=35 width=820 time=500 folder="image"]
[mask_off time=800]
[wait time=300]

スマホを見る。[l][r]
次は——何を選ぶ？[p]

[ptext layer="0" page="fore" name="phone_title" x=570 y=125 size=24 color=0x111111 text="ケガレ一覧"]
[if exp="!tf.clear_totsuka"]
[glink target="*tap_totsuka" text="" graphic="ui_phone_teacher.png" enterimg="ui_phone_teacher_hover.png" clickimg="ui_phone_teacher_down.png" x=440 y=245 width=400 height=43]
[endif]
[if exp="!tf.clear_father"]
[glink target="*tap_father" text="" graphic="ui_phone_father.png" enterimg="ui_phone_father_hover.png" clickimg="ui_phone_father_down.png" x=440 y=300 width=400 height=43]
[endif]
[if exp="!tf.clear_face"]
[glink target="*tap_face" text="" graphic="ui_phone_face.png" enterimg="ui_phone_face_hover.png" clickimg="ui_phone_face_down.png" x=440 y=355 width=400 height=43]
[endif]
[s]

*tap_totsuka
[cm]
[playse storage="se_tap.mp3"]
[phone_text_clear]
[freeimage layer="0" page="fore" time=500]
[wait time=500]
[speaker_clear]
[mask color=0x000000 time=900]
[wait time=400]

[bg storage="bg_school_gym.jpg" time=0]
[mask_off time=900]
[wait time=500]

次の日の朝礼。[l][r]
担任の戸塚の急な異動が発表された。[p]

#校長
「家庭のご事情で——」[p]
[speaker_clear]

校長の声が体育館にぼそぼそと響く。[p]

#美玲
「えー、なんか急じゃない？」[p]
[speaker_clear]

私はぼんやり聞いていた。[p]

——家庭の事情。[l][r]
本当にそうなのかもしれない。[l][r]
でも……もしかしたら……。[p]

;フローチャート4A：担任教師エピソード完了。4AクリアフラグON。
[iscript]
tf.clear_totsuka = true;
[endscript]
[playse storage="se_sharan.mp3" volume=80]
[mask time=800]
[wait time=500]
[jump target="*kegare_remaining_choice"]

*tap_face
[cm]
[playse storage="se_tap.mp3"]
[phone_text_clear]
[freeimage layer="0" page="fore" time=500]
[wait time=500]
[speaker_clear]
;夜の自室カット（bg_aoi_room_night）を削除し、翌朝の鏡シーンから開始する。
[mask color=0x000000 time=900]
[wait time=400]
[playse storage="se_sharan.mp3" volume=80]
[bg storage="bg_aoi_room_day.jpg" time=0]
[mask_off time=800]
[wait time=500]

翌朝。鏡を見て息が止まった。[p]

いつもと変わらない自分の顔。[l][r]
でも、[l]どこかが違う。[p]

私が纏っていた重たい空気が消え、[l][r]
爽やかな風が吹き渡るような、[r]
そんな雰囲気を纏っている。[p]

肌に張りがある。髪につやがある。[l][r]
目が生き生きしている。[l][r]
背筋が伸びている。[p]

そしてなにより――気分がいい。[p]

[chara_show name="aoi" face="smile_bright" width="980"]

#aoi
「……おはよう」[p]
[speaker_clear]

私は、無意識に鏡の中の自分に[r]
笑いかけていた。[p]

[chara_hide name="aoi"]
[mask time=800]
[bg storage="bg_classroom_day.jpg" time=0]
[mask_off time=800]
[chara_show name="aoi" face="smile_bright" width="980"]

登校すると、すれ違う男子たちが振り返る。[p]

#男子生徒Ａ
「誰あれ？　あんな子いた？」[p]
[speaker_clear]

#男子生徒B
「……もしかして田櫻葵？」[p]
[speaker_clear]

#男子生徒Ａ
「マジ？　あんなかわいかったっけ？」[p]
[speaker_clear]

背中から聞こえるひそひそ声がこそばゆい。[p]

#美玲
「葵、なんか雰囲気変わったよね」[p]
[speaker_clear]

[chara_mod name="aoi" face="soft_smile"]

#aoi
「そうかな。……どのへんが？」[p]
[speaker_clear]

#美玲
「ん～、なんだろう……[l][r]
なんか、キラキラしてるみたいな？」[p]
[speaker_clear]

#aoi
「あははっ、なにそれ」[p]
[speaker_clear]

照れながら答えた。[l][r]
胸がふわふわする。[p]

何も変わっていないのに。[l][r]
全てが変わった気がした。[p]

;フローチャート4C：自分の顔エピソード完了。4CクリアフラグON。
[iscript]
tf.clear_face = true;
[endscript]
[playse storage="se_sharan.mp3" volume=80]
[mask time=800]
[wait time=500]
[jump target="*kegare_remaining_choice"]

*tap_father
[cm]
[playse storage="se_tap.mp3"]
[phone_text_clear]
[freeimage layer="0" page="fore" time=300]
[speaker_clear]
[playse storage="se_sharan.mp3" volume=80]
[chara_hide name="aoi"]
[wait time=500]
[mask color=0x000000 time=900]
[wait time=400]
[bg storage="bg_dining_room.jpg" time=0]
[mask_off time=900]


その日の夕食の席でお父さんがぼそりと言った。[p]

#父
「シンガポール 行くことになった」[p]
[speaker_clear]

#父
「単身赴任。三年」[p]
[speaker_clear]

#母
「えっ……いつから？」[p]
[speaker_clear]

#父
「来月」[p]
[speaker_clear]

#母
「そう……」[p]
[speaker_clear]

いつもの静かな食卓。
でも、家の空気が軽くなるのを感じた。[p]

;フローチャート4B：父親エピソード完了。4BクリアフラグON。
[iscript]
tf.clear_father = true;
[endscript]
[playse storage="se_sharan.mp3" volume=80]
[mask time=800]
[wait time=500]
[jump target="*kegare_remaining_choice"]

;--- 神々しい葵 ---
*development_radiant

[speaker_clear]
[phone_text_clear]
[freeimage layer="0" page="fore" time=300]
[chara_hide name="aoi"]
[mask color=0x000000 time=1200]
[wait time=800]
[bg storage="bg_school_hallway.jpg" time=0]
[chara_show name="aoi" face="radiant" width="980"]
[mask_off time=1200]
[wait time=600]

——気がつけば私の世界は別物だった。[p]

成績は勝手に伸びた。[l][r]
生徒会に推薦された。[p]

自然と声をかけられるようになった。[l][r]
話し方が少し丁寧で、朗らかになった。[p]

ある日、後輩に言われた。[p]

#後輩
「田櫻先輩、最近なんだか神々しいです」[p]
[speaker_clear]

[chara_mod name="aoi" face="smile_bright"]

#aoi
「大袈裟だよ」[p]
[speaker_clear]

照れながら心の奥で思った。[p]

これが本来の私なんだ。[l][r]
ずっとこうあるべきだった。[l][r]
今までの私は何かに邪魔されていたんだ。[p]

[chara_hide name="aoi"]
[speaker_clear]
[mask color=0x000000 time=1000]
[wait time=500]
[bg storage="bg_sunset_road.jpg" time=0]
[chara_show name="aoi" face="serene" width="980"]
[mask_off time=1500]
[wait time=700]

ある日の帰り道。[p]

赤い夕焼けに向かって[r]
私はふと両手を合わせた。[p]

#aoi
「ありがとうございます」[p]
[speaker_clear]

#aoi
「この世のすべてに心から感謝します」[p]
[speaker_clear]

胸の中がしずかに満たされていた。[p]

私の中に、ケガレはもうない。[p]

[chara_hide name="aoi"]
[speaker_clear]
[mask color=0x000000 time=2000]
[wait time=1500]
[jump target="*thanks_visit_start"]

;--- お礼参り ---
*thanks_visit_start
[phone_text_clear]
[freeimage layer="0" page="fore" time=300]
[speaker_clear]
[bg storage="bg_shrine_path_day.jpg" time=0]
[wait time=700]
[mask_off time=1600]
[wait time=800]

晴れた 土曜日の朝。[p]

私はお礼参りに行くことにした。[p]

あの祠にちゃんと感謝を伝えたい。[p]


あの夜と同じように、自転車を[r]
鳥居の外に止めて参道に入る。[p]

あの時はあれほど不気味だった神社が[l][r]
今はまるで違う場所だった。[p]

木漏れ日が砂利の上で揺れている。[l][r]
鳥が鳴いている。[l][r]
風が優しくそよいでいる。[p]

——あの夜の私は、どこに行っちゃったんだろう。[p]

[chara_mod name="aoi" face="soft_smile"]

くすっと笑って本殿でお賽銭を入れて手を合わせる。[p]

[playse storage="se_coin_offering.mp3" volume=70]
[wait time=300]
[playse storage="se_clap_twice.mp3" volume=75]

それから奥の祠へ向かった。[p]

[speaker_clear]
[bg storage="bg_hokora_dayl.jpg" time=1200]

祠の前に立ち、小さく頭を下げる。[p]

[chara_mod name="aoi" face="eyes_closed"]

#aoi
「ありがとうございました。[l][r]
ケガレトリのおかげで私の人生は変わりました」[p]
[speaker_clear]

声に出して伝える。[l][r]
胸がふわっと温かくなる。[p]

[chara_mod name="aoi" face="soft_smile"]

そして——[r]
感謝の念を抱きながら、祠の扉の奥に目をやる。[p]

;--- 黒い人形発覚 ---
*truth_black_doll

[stopbgm time=1500]
;[playse storage="se_heartbeat.ogg" loop=true buf=3 volume=50] ; 現行アセットではSEなし
[image layer="0" page="fore" storage="doll_black_outline.png" left=425 top=125 width=430 time=800 folder="image"]
[wait time=1500]

[chara_mod name="aoi" face="fear"]

——え？[p]

扉の隙間から見えるご神体。木彫りの人形。[l][r]
それが…………黒い。[p]

最初にここに来た夜。[l][r]
覗き込んだとき確かに真っ白だった。[p]

荒削りの 白木の表情のない人形。[r]
それが今は——[l][r]
煤けたような漆黒に変色していた。[p]

[chara_mod name="aoi" face="skeptical"]

#aoi
「……何？」[p]
[speaker_clear]

ご神体に近づく。[p]

……と。[r]
風もないのに、祠の扉がぎいと軋んで開いた。[p]

[playse storage="se_door_creak.mp3" volume=70]

朝の光が祠のなかに差し込む。[p]

[chara_mod name="aoi" face="fear"]

#aoi
「……えっ……！？」[p]
[speaker_clear]

思わず息をのむ。[p]

[freeimage layer="0" page="fore"]
[image layer="0" page="fore" storage="doll_black_many_outline.png" left=295 top=95 width=690 time=1500 folder="image"]
[playbgm storage="bgm_cursed.mp3" volume=60]
[wait time=2000]


人形は、一体じゃなかった。[l][r]
奥に転がっていた。[l]何体も、何体も。[p]

新しい人形、古い人形。[l][r]
どれもこれも真っ黒だった。[p]

古い物は、どのくらい年季が入っているのだろう。[l][r]
手足や頭がもげたりして、ボロボロに朽ち果てている。[p]


#aoi
「……っ」[p]
[speaker_clear]

声が出なかった。[r]
胸がぎゅっと掴まれる。[p]

これが何なのかわからない。[r]
でも、異様な光景だった。[p]

#aoi
「なに、これ……なんで、こんな……」[p]
[speaker_clear]

[playse storage="se_door_close.mp3" volume=80]
[freeimage layer="0" page="fore" time=300]

私は扉を慌てて閉めた。[p]

バタンと大きな音がして[r]
自分の肩がびくりと跳ねる。[p]

[chara_mod name="aoi" face="fear"]

数歩 後ずさる。[l][r]
心臓がばくばく言っている。[p]

;--- 真実の検索 ---
*truth_search

[playse storage="se_tap.mp3" volume=60]
[phone_text_clear]
[freeimage layer="0" page="fore" time=300]
[wait time=500]

震える指でスマホを取り出した。[p]

検索バーに文字を打ち込む。[p]

「ケガレトリ」「神社」「都市伝説」「人形」。[p]

[wait time=600]

古いまとめサイトにたどり着く。[l][r]
寂れた個人ブログだ。[p]

20年以上前の過疎掲示板のログ。[l][r]
その中の、たった一つの書き込み。[p]

;【不具合修正 2026-07-22】ここに単独の [l] があった。
;直前の [p] でクリック待ち→改ページで枠が空になり、そこで [l] が再びクリック待ちになるため
;「2回クリックしないと進まない・1回目は無反応に見える」状態だった（実況動画で発覚）。
;間は直後の [wait time=800] が担っているので [l] は不要。
[wait time=800]
> 「ケガレトリで神になるってのは[r]
> つまり人柱になるってこと」[p]

[chara_mod name="aoi" face="fear"]

血の気が引いた。[p]

スマホを持つ手が震えはじめる。[p]

#aoi
「人柱……？」[p]
[speaker_clear]

震える声が漏れた。[p]

あの人形は。[l][r]
ケガレを浄化され——[l]神になった人間？[p]

[chara_mod name="aoi" face="fear"]

#aoi
「うそ」[p]
[speaker_clear]

ぱっ と顔を上げた。[p]

#aoi
「うそでしょ。うそだよね？」[p]
[speaker_clear]

私はもう一度 祠を振り返る。[p]

扉の隙間から黒い人形がこちらを見ている。[p]

#aoi
「ありえない。ありえないよ。[r]
人間が人形になるなんて……」[p]
[speaker_clear]

膝が笑う。[l][r]
冷たい汗がこめかみを伝う。[p]

#aoi
「ここから去らなきゃ。今すぐに」[p]
[speaker_clear]

私は声に出して呟いた。[l][r]
もつれる足をなんとか前に動かそうとした。[p]

;--- 通知ポップアップ ---
*truth_notification

[playse storage="se_notification.mp3" volume=90]
[freeimage layer="0" page="fore" time=300]
[phone_text_clear]

そのとき。[l][r]
スマホがぶる と震えた。[p]

#aoi
「ひっ！？」[p]
[speaker_clear]

反射的に画面を見る。[l][r]
通知画面にはこう表示されていた。[p]

[phone_text_clear]
[image layer="0" page="fore" storage="phone_blank.png" left=230 top=35 width=820 time=500 folder="image"]
[image layer="0" page="fore" name="phone_logo" storage="ui_phone_logo.png" folder="image" left=525 top=170 width=230 time=500]
[ptext layer="0" page="fore" name="phone_line1" x=505 y=280 size=24 color=0x111111 text="あと一つケガレを祓えば"]
[ptext layer="0" page="fore" name="phone_line2" x=555 y=330 size=30 color=0x990000 text="神になれます"]
[wait time=1500]

> *あと一つケガレを祓えば *[r]
> *神になれます*[p]

#aoi
「あ……ああ……あああ…………！！」[p]
[speaker_clear]

[stopse buf=3]
;[playse storage="se_scream.ogg" volume=80] ; 現行アセットではSEなし
[chara_mod name="aoi" face="fear"]

#aoi
「いやああああああっ！」[p]
[speaker_clear]

[playse storage="se_phone_throw.mp3" volume=90]
[playse storage="se_phone_throw.mp3" volume=90]
[freeimage layer="0" page="fore" time=200]
[phone_text_clear]

私はスマホを神社の石畳に思い切り叩きつけた。[p]


画面が割れる音がした。[p]

[freeimage layer="0" page="fore"]

;ここから逃走の長いモノローグ。走り出すタイミングで立ち絵を消す。
[chara_hide name="aoi"]

そのまま私は、振り返らずに走った。[p]

[playse storage="se_running.mp3" loop=true buf=2 volume=70]

参道を駆け抜ける。[l][r]
砂利が靴底で跳ねる。[p]

[stopse buf=2]
[playse storage="se_bicycle_running.mp3" loop=true buf=2 volume=65]
自転車のグリップを握りしめ必死に漕ぎ出す。[l][r]
振り返らずに、一心不乱に。[p]

なんで？　なんで私が選ばれたの？[p]

——いや、違う。[l][r]
選んだのは……私自身だ。[p]

私が、神になることを選んだ。[l][r]
「同意する」のボタンを押した。[l][r]
その本当の意味もわからずに。[p]

息が上がる。胸が痛い。[l][r]
涙が頬を伝った。[l][r]
振り払うように私は家まで走り続けた。[p]

[chara_hide name="aoi"]
[stopse buf=2]
[speaker_clear]
[mask time=1500]
[wait time=1500]


;=========================================
; ③ 逃亡フェーズ
;=========================================
*escape_room

[speaker_clear]
[bg storage="bg_aoi_room_day.jpg" time=0]
[playbgm storage="bgm_cursed.mp3" volume=60]
[mask_off time=1000]
[wait time=600]

家に着いたら 玄関で靴を脱ぎ捨てて[r]
自分の部屋に駆け込んだ。[p]

ドアを閉めて内側から鍵をかける。[l][r]
そのままベッドで布団を頭まで被る。[p]

[chara_show name="aoi" face="teary" width="980"]

#aoi
「だいじょうぶ、だいじょうぶ……」[p]
[speaker_clear]

#aoi
「だいじょうぶだから……」[p]
[speaker_clear]
[chara_hide name="aoi"]

呪文みたいに繰り返した。[p]

スマホはもうない。[l][r]
神社で壊して捨ててきた。[l][r]
だからもう、大丈夫。[p]

あの場所から離れればもう大丈夫。[l][r]
二度と近寄らなければ大丈夫。[p]

明日になればぜんぶ忘れる。[p]

明日になれば、[r]
いつもの日常に戻るから——[p]

[chara_hide name="aoi"]
[stopbgm time=1500]
[speaker_clear]
[mask color=0x000000 time=2000]
[wait time=2500]


;--- スマホ復活 ---
*escape_phone_return

[bg storage="bg_aoi_room_evening.jpg" time=0]
[mask_off time=1000]
[wait time=500]

いつのまにか私は眠っていたらしい。[p]

まだ判然としない意識の中、[l][r]
自分の手に何かが握られているのに気付く。[p]

——スマホだった。[l][r]
画面がバキバキに割れた、私のスマホ。[l][r]
神社に捨てたはずの私のスマホ。[p]

画面には『ケガレトリ』のアプリ。[l][r]
そこには、こう表示されていた。[p]

[playse storage="se_sharan_reverse.mp3" volume=50]
[phone_text_clear]
[image layer="0" page="fore" storage="phone_cracked_blank.png" left=230 top=35 width=820 time=500 folder="image"]
[image layer="0" page="fore" name="phone_logo" storage="ui_phone_logo.png" folder="image" left=525 top=170 width=230 time=500]
[ptext layer="0" page="fore" name="phone_line1" x=480 y=255 size=24 color=0x111111 text="最後のケガレを祓いますか？"]
[wait time=800]

> *最後のケガレを祓いますか？*[p]

[phone_text_clear]
[freeimage layer="0" page="fore" time=200]
[chara_show name="aoi" face="fear" width="980"]

#aoi
「わああああああああっ！」[p]
[speaker_clear]
[chara_hide name="aoi"]

[playse storage="se_phone_throw.mp3" volume=90]
[playbgm storage="bgm_cursed.mp3" volume=60]
反射的にスマホを放り投げる。[l][r]
壁にゴンとぶつかって、床に落ちる。[p]

[freeimage layer="0" page="fore" time=200]
[phone_text_clear]

私は逃げ出すように部屋を飛び出した。[p]

[stopse buf=3]

;--- 街を逃げる ---
*escape_town

[speaker_clear]

#母
「葵、どうしたの！？」[p]
[speaker_clear]
[chara_hide name="aoi"]

答えず、サンダルを引っかけて家を飛び出した。[p]

遠くへ。どこか遠くへ。[p]

[speaker_clear]
[bg storage="bg_town_evening.jpg" time=1000]
[playse storage="se_bicycle_running.mp3" loop=true buf=2 volume=60]

自転車を走らせる。[l][r]
神社とは正反対の方角へ。[p]

しかし——[p]

[stopse buf=2]
[speaker_clear]
[bg storage="bg_shrine_path_night.jpg" time=1000]
[wait time=800]

気付けばそこは、神社の前だった。[p]

[chara_show name="aoi" face="fear" width="980"]
#aoi
「……なん、で……？」[p]
[speaker_clear]
[chara_hide name="aoi"]

慌てて反対方向に自転車のハンドルを切る。[p]

[speaker_clear]
[bg storage="bg_town_evening.jpg" time=1000]
[playse storage="se_bicycle_running.mp3" loop=true buf=2 volume=60]
自転車を走らせる。逃げるように。ひたすらに。[p]

三十分も走っただろうか。[l][r]
息も切れ切れに、ようやく止まる。[p]
[stopse buf=2]

息を整えて、顔を上げる。[p]

[speaker_clear]
[bg storage="bg_shrine_path_night.jpg" time=1000]

——目の前に神社の鳥居があった。[p]

[chara_show name="aoi" face="fear" width="980"]
#aoi
「うそ……うそうそうそ……」[p]
[speaker_clear]
[chara_hide name="aoi"]

声が震える。[p]

私は回れ右をして、また逃げる。[p]


;--- タクシー ---
[chara_hide name="aoi"]
[speaker_clear]
[bg storage="bg_taxi_interior.jpg" time=1000]
[wait time=600]

タクシーを見つけた。[l][r]
手を上げると すぐに止まってくれた。[p]

自転車を放り投げ、車内に転がり込む。[p]

[chara_show name="aoi" face="fear" width="980"]
#aoi
「▲▲駅まで……お願いします」[p]
[speaker_clear]
[chara_hide name="aoi"]

#運転手
「はい、▲▲駅ですね」[p]
[speaker_clear]

運転手は優しい声で応えた。[p]
車が動き、窓の景色が流れ始める。[p]

心臓が少し落ち着く。[l][r]
電車に乗れば、遠くに行ける。[l][r]
遠くへ、どこか遠くへ――[p]

——車が止まる。[p]

#運転手
「お客さん 着きましたよ」[p]
[speaker_clear]

私は、すぐに扉を開けて外に飛び出した。[p]

[speaker_clear]
[bg storage="bg_shrine_path_night.jpg" time=800]

そこは——神社の前だった。[p]

[chara_show name="aoi" face="fear" width="980"]
#aoi
「あ……う……」[p]
[speaker_clear]

#aoi
「ち、ちょっと運転手さん……ここ――」[p]
[speaker_clear]
[chara_hide name="aoi"]

振り返ると、運転手さんはいなかった。[l][r]
それどころか、タクシーもなかった。[p]

[chara_show name="aoi" face="fear" width="980"]
#aoi
「ふざけないでよ……」[p]
[speaker_clear]

#aoi
「ねえ……ふざけないで……」[p]
[speaker_clear]
[chara_hide name="aoi"]

街じゅうの道 ぜんぶが神社に通じていた。[p]

走っても。[l]乗っても。[l]隠れても。[p]

——世界そのものが私を神社に運んでくる。[p]

私はその場にしゃがみ込んだ。[p]

[speaker_clear]
[bg storage="bg_shrine_path_night.jpg" time=1500]

やがて日が沈む。[r]
夜の闇が辺りを包む。[p]

[speaker_clear]
[bg storage="bg_shrine_path_night.jpg" time=2000]

気付けば私は、参道に立っていた。[p]

[chara_show name="aoi" face="teary" width="980"]
#aoi
「……逃げられないってわけ？」[p]
[speaker_clear]
[chara_hide name="aoi"]

誰に聞いているのかわからない。[p]

誰も答えなかった。[p]

[playse storage="se_footstep_gravel.mp3" loop=true buf=2 volume=50]

見えない糸に引っ張られるように[r]
砂利を踏みしめて私はゆっくり歩き出した。[p]

[chara_hide name="aoi"]
[stopse buf=2]
[speaker_clear]
[fadeoutbgm time=2000]
[speaker_clear]
[mask color=0x000000 time=2500]
[wait time=2500]

;=========================================
; ④ クライマックス
;=========================================
*climax_dark_shrine

[speaker_clear]
[bg storage="bg_hokora_night.jpg" time=0]
[playbgm storage="bgm_climax.mp3" volume=60]
[mask_off time=2000]
[wait time=1000]

境内は真っ暗だった。[p]

街灯はない。[l][r]
月も雲に隠れている。[p]

木々の葉ずれの音だけがざわざわと囁いている。[p]

;[playse storage="se_wind.ogg" loop=true buf=3 volume=40] ; 現行アセットではSEなし

私はフラフラとした足取りで奥の祠へ[r]
向かって歩く。[p]

砂利を踏む音が自分の足の下から響く。[p]

;--- スマホ復帰 ---
*climax_glowing_phone

——遠くに ぽつんと明かりが見えた。[p]

祠の前で光っている。[l][r]
煌々と輝く、人工的な四角い光。[p]

……近くで確かめなくても、わかる。[l][r]
あれは――[p]

[phone_text_clear]
[freeimage layer="0" page="fore"]
[image layer="0" page="fore" storage="phone_cracked_blank.png" left=230 top=35 width=820 time=500 folder="image"]
[image layer="0" page="fore" name="phone_logo" storage="ui_phone_logo.png" folder="image" left=525 top=170 width=230 time=500]
[ptext layer="0" page="fore" name="phone_line1" x=480 y=255 size=24 color=0x111111 text="最後のケガレを祓いますか？"]
[wait time=1500]

[chara_mod name="aoi" face="fear"]

壊して捨てたはずのスマホだ。[p]

#aoi
「…………」[p]
[speaker_clear]

空気が冷たい。[l][r]
息が白くにじむ。[p]

——これは、夢？[p]

スマホの画面に文字が浮かんでいた。[p]

> *最後のケガレを祓いますか？*[p]

[phone_text_clear]
[freeimage layer="0" page="fore" time=300]
[wait time=300]

;--- 葵の独白＆セリフ ---
*climax_breakdown

[chara_mod name="aoi" face="fear"]
;[playse storage="se_heartbeat.ogg" loop=true buf=4 volume=70] ; 現行アセットではSEなし

#aoi
「いやだ……」[p]
[speaker_clear]

声が震えた。[p]

#aoi
「いやだ、いやだ、いやだ」[p]
[speaker_clear]

[chara_mod name="aoi" face="fear"]

#aoi
「ケガレなんて祓わなくていい……」[p]
[speaker_clear]

#aoi
「神様になんかなりたく ない……！！」[p]
[speaker_clear]

涙がぼろぼろと零れ落ちる。[p]

#aoi
「誰か……助けて」[p]
[speaker_clear]

#aoi
「お母さん……」[p]
[speaker_clear]

そんな言葉とは裏腹に、足は前に進む。[l][r]
ゆっくりと、確実に。[p]

気がつくとひびだらけのスマホを手に取っていた。[p]
手の震えで、画面もブルブルと震えている。[p]

見たくない。[l]触りたくない。[l][r]
でも、私の手は勝手に動く。[p]

そして——[p]

;--- 画面切り替え：恐怖心が最後のケガレ ---
*climax_fear_reveal

[playse storage="se_sharan.mp3" volume=80]
[freeimage layer="0" page="fore" time=300]
[phone_text_clear]

画面が切り替わる。[p]

[image layer="0" page="fore" storage="phone_cracked_blank.png" left=230 top=35 width=820 time=500 folder="image"]
[image layer="0" page="fore" name="phone_logo" storage="ui_phone_logo.png" folder="image" left=525 top=145 width=230 time=500]
[ptext layer="0" page="fore" name="phone_line1" x=530 y=230 size=22 color=0x111111 text="最後のケガレ それは"]
[ptext layer="0" page="fore" name="phone_line2" x=495 y=280 size=24 color=0x990000 text="「あなたの恐怖心」です"]
[ptext layer="0" page="fore" name="phone_line3" x=505 y=340 size=22 color=0x111111 text="最後のケガレを浄化して"]
[ptext layer="0" page="fore" name="phone_line4" x=455 y=385 size=20 color=0x111111 text="あらゆる恐怖から解放されましょう"]
[wait time=1200]

> *最後のケガレ それは*[r]
> *「あなたの恐怖心」です*[p]

> *最後のケガレを浄化して*[r]
> *あらゆる恐怖から解放されましょう*[p]

[phone_text_clear]
[freeimage layer="0" page="fore" time=300]

[stopse buf=4]

[chara_mod name="aoi" face="fear"]

#aoi
「……恐怖から……解放……？」[p]
[speaker_clear]

;[playse storage="se_heartbeat.ogg" loop=true buf=4 volume=50] ; 現行アセットではSEなし

ああ、そうか。[p]

この気持ちは、私の中のケガレなんだ。[p]

――こわい。[l]――逃げたい。[l]――隠れたい。[l][r]
[r]
――許して。[l]――来ないで。[l]――放っておいて。[p]

……いらない。こんな感情。[l][r]
今すぐ捨てたい。[l][r]
楽になりたい。[p]

なんだっていい。[l][r]
この恐怖が消えるのなら——。[p]

[chara_mod name="aoi" face="fear"]

;フローチャート5：最後の選択肢。はい→神化END、いいえ→呪い返し人格崩壊END。

;--- 最終選択肢 ---
*climax_final_choice

[phone_text_clear]
[freeimage layer="0" page="fore" time=200]
[image layer="0" page="fore" storage="phone_cracked_blank.png" left=230 top=35 width=820 time=500 folder="image"]
[image layer="0" page="fore" name="phone_logo" storage="ui_phone_logo.png" folder="image" left=525 top=150 width=230 time=500]
[ptext layer="0" page="fore" name="phone_line1" x=480 y=225 size=24 color=0x111111 text="最後のケガレを祓いますか？"]
[glink target="*final_yes" text="" graphic="ui_phone_yes.png" enterimg="ui_phone_yes_hover.png" clickimg="ui_phone_yes_down.png" x=420 y=320 width=180 height=58]
[glink target="*final_no" text="" graphic="ui_phone_no.png" enterimg="ui_phone_no_hover.png" clickimg="ui_phone_no_down.png" x=660 y=320 width=180 height=58]
[s]

*final_no
[cm]
[stopse buf=4]
[playse storage="se_tap.mp3"]
[playse storage="se_notification.mp3" volume=90]
[freeimage layer="0" page="fore" time=300]
[phone_text_clear]
[wait time=300]

[chara_mod name="aoi" face="fear"]

#aoi
「いやだ……私は……ならない。[l][r]
神様なんかに……なりたくない！」[p]
[speaker_clear]

「いいえ」のボタンを押した。[p]
すると画面が切り替わった。[p]

[image layer="0" page="fore" storage="phone_cracked_blank.png" left=230 top=35 width=820 time=500 folder="image"]
[image layer="0" page="fore" name="phone_logo" storage="ui_phone_logo.png" folder="image" left=525 top=145 width=230 time=500]
[ptext layer="0" page="fore" name="phone_line1" x=525 y=250 size=24 color=0x990000 text="拒否を確認しました"]
[ptext layer="0" page="fore" name="phone_line2" x=500 y=330 size=20 color=0x111111 text="祓われたケガレは増幅されて"]
[ptext layer="0" page="fore" name="phone_line3" x=580 y=370 size=20 color=0x111111 text="返還されます"]

> *拒否を確認しました*[p]

> *祓われたケガレは増幅されて返還されます*[p]

[phone_text_clear]
[freeimage layer="0" page="fore" time=300]
[playse storage="se_sharan_reverse.mp3" volume=100]
;[playse storage="se_heartbeat.ogg" loop=true buf=4 volume=80] ; 現行アセットではSEなし
[playse storage="se_sharan_reverse.mp3" buf=5 volume=65]
[chara_mod name="aoi" face="fear"]

佐川の視線。[l]戸塚の冷たい声。[l][r]
お父さんの怒鳴り声。[l]鏡の中の嫌いな顔。[p]

悲しい。[l]ムカつく。[l]恨めしい。[l]うんざり。[l][r]
消したはずの感情が、何倍にも膨れ上がって戻ってくる。[p]

#aoi
「うう……ああああ……！！」[p]
[speaker_clear]

#aoi
「やめて……入ってこないで……！」[p]
[speaker_clear]

頭が、[l]心が、[l]黒く塗り潰される。[p]

言葉がほどけていく。[p]

意識が黒い渦に飲み込まれる。[p]

そして――[p]

#aoi
「………………」[p]
[speaker_clear]

#aoi
「………………ふふっ」[p]
[speaker_clear]

#aoi
「ふふふっ……あはは……」[p]
[speaker_clear]

[freeimage layer="0" page="fore" time=200]
[phone_text_clear]
[chara_show name="aoi" face="mad_laugh" width="980"]

#aoi
「あはははははははははは……！[r]
あはははははははははははははははは！！」[p]
[speaker_clear]

そして――[l]私は、壊れた。[p]

[speaker_clear]
[mask color=0x000000 time=1500]
[wait time=1500]

;--- ゲームオーバー：人格崩壊 ---
*gameover_final

[stopse buf=4]
[speaker_clear]
[bg storage="bg_black.png" time=0]
[mask_off time=500]
[chara_hide name="aoi"]
[phone_text_clear]
[freeimage layer="0" page="fore" time=100]
[cm]
[layopt layer="message0" visible=false]
[playse storage="se_bell_low.mp3" buf=4 volume=35]
;[playse storage="se_distant_laugh.ogg" buf=5 volume=45] ; 現行アセットではSEなし
[playse storage="se_sharan_reverse.mp3" buf=6 volume=80]
[image layer="0" page="fore" storage="gameover.png" left=0 top=0 width=1280 height=720 time=800 folder="image"]
[wait time=800]

[glink target="*retry_final_choice" text="" graphic="ui_gameover_retry.png" enterimg="ui_gameover_retry_hover.png" clickimg="ui_gameover_retry_down.png" x=285 y=430 width=300 height=49]
[glink target="*return_title" text="" graphic="ui_gameover_title.png" enterimg="ui_gameover_title_hover.png" clickimg="ui_gameover_title_down.png" x=695 y=430 width=300 height=49]
[s]

*retry_final_choice
[phone_text_clear]
[freeimage layer="0" page="fore" time=100]
[cm]
[layopt layer="message0" visible=true]
[speaker_clear]
[bg storage="bg_hokora_night.jpg" time=0]
[playbgm storage="bgm_climax.mp3" volume=60]
[jump target="*climax_fear_reveal"]

;--- 最終タップ ---
*final_yes

[cm]
[stopse buf=4]
[playse storage="se_tap.mp3"]
[playse storage="se_sharan.mp3" volume=100]
[phone_text_clear]
[freeimage layer="0" page="fore" time=300]
[wait time=500]
[chara_hide name="aoi"]
[speaker_clear]

震える指が「はい」のボタンを押した。[l][r]
——ゆっくりと。[l]——力強く。[p]

[playbgm storage="bgm_divine.mp3" volume=60]

「……あ」[p]

ふっ――と、体から何かが抜けた。[l][r]
こわばっていた全身が、柔らかくなってゆく。[p]

体の震えが止まった。[l][r]
指先まで 温かい何かがゆっくり満ちていく。[p]

数秒前までの恐怖が嘘のように消えた。[p]

全て洗い流された。[l][r]
恐怖も、[l]なにもかも。[p]

「自分」という輪郭も。[l][r]
静かに溶けていった。[p]

私は微笑む。[l]穏やかに。[l]完璧に。[p]

スマホの画面には最後の一文が表示されていた。[p]

[phone_text_clear]
[image layer="0" page="fore" storage="phone_blank.png" left=230 top=35 width=820 time=500 folder="image"]
[image layer="0" page="fore" name="phone_logo" storage="ui_phone_logo.png" folder="image" left=525 top=170 width=230 time=500]
[ptext layer="0" page="fore" name="phone_line1" x=515 y=280 size=24 color=0x111111 text="おめでとうございます"]
[ptext layer="0" page="fore" name="phone_line2" x=475 y=330 size=30 color=0x990000 text="あなたは 神になりました"]
[wait time=1500]

> *おめでとうございます*[r]
> *あなたは 神になりました*[p]

[phone_text_clear]
[freeimage layer="0" page="fore" time=2000]
[speaker_clear]
[mask color=0xFFFFFF time=3000]
[wait time=3000]
[speaker_clear]
[mask color=0x000000 time=2000]
[wait time=1500]
[bg storage="bg_hokora_night.jpg" time=0]
[mask_off time=1200]
[wait time=1200]

[chara_show name="aoi" face="kami" width="980"]
#aoi
「ありがとうございます。[l][r]
私は、神になりました」[p]
[speaker_clear]

[chara_hide name="aoi" time=1500]

祠の扉を開けて暗闇に潜り込む。[p]

冷たい床に寝そべり、私はそっと目を閉じた。[p]

とても暖かく、幸福な気持ちに包まれながら。[p]

[speaker_clear]
[fadeoutbgm time=3000]
[mask color=0x000000 time=3000]
[wait time=3000]


;=========================================
; エピローグ
;=========================================
*epilogue

[speaker_clear]
[bg storage="bg_shrine_path_day.jpg" time=0]
;[playbgm storage="bgm_loop_calm.ogg" volume=50] ; 現行アセットではBGMなし
[mask_off time=2500]
[wait time=1200]

——それからほどなくして。[p]

[speaker_clear]
[bg storage="bg_hokora_dayl.jpg" time=1500]
[wait time=800]
[image layer="0" page="fore" storage="doll_white.png" left=425 top=125 width=430 time=1200 folder="image"]
[wait time=1000]

祠には、真新しい真っ白な人形が供えられていた。[p]
ぽつんと、[l]たったひとつだけ。[p]

[freeimage layer="0" page="fore" time=800]
[speaker_clear]
[bg storage="bg_shrine_path_day.jpg" time=1500]

参道を見知らぬ女子高生が[r]
ひとり自転車を押してやってきた。[p]

うつむき気味の表情で[r]
制服のスカートの裾をしきりに気にしている。[p]

彼女もまた何かに悩み[r]
何かを変えたいと願ってここまで来たのだろう。[p]

[speaker_clear]
[bg storage="bg_hokora_dayl.jpg" time=1200]

少女は祠の前に立ち、スマホを供える。[p]

両手を合わせ、そして唱える。[p]

#女子高生
「祓ひ給へ、清め給へ、我が穢れを喰らひ給へ」[p]
[speaker_clear]

[playse storage="se_sharan.mp3" volume=100]
[wait time=1500]

鈴の音が祠の奥から響く。[p]

真新しい白木の人形が[l][r]
新たなケガレを、[l]飲み込みはじめる。[p]
[playbgm storage="bgm_cursed.mp3" volume=60]


[speaker_clear]
[mask color=0x000000 time=3000]
[wait time=3000]


;=========================================
; クレジット
;=========================================
*credits

[speaker_clear]
[phone_text_clear]
[freeimage layer="0" page="fore" time=500]
[layopt layer="message0" visible=false]
[bg storage="bg_black.png" time=0]
[mask_off time=1000]
[wait time=600]
;【改修 2026-07-22】クレジットを2画面に分割し、「一定時間経過 または クリック」で進むようにした。
;実況者が「自動で流れるもの」と誤解して待ち続けた事例があったため。
;
;実装上の注意：このバージョンの [wait] は内部で stronglyStop() を呼ぶためクリックを受け付けない
;（canskip 属性も存在しない）。そこで全画面の透明ボタン＋[s] で待機し、
;同時に setTimeout で jump を予約する二段構えにしている。
;**ジャンプ先の先頭では必ず clearTimeout すること**（クリックで進んだ後にタイマーが発火する二重遷移を防ぐ）。
;画面下の「クリックで進む」表示は、操作可能であることを明示するための本命の対策。

;--- 「完」 ---
[ptext layer="0" page="fore" name="end_mark" x=0 y=290 width=1280 align=center size=72 color=0xffffff text="完"]
[button graphic="transparent_button.png" folder="image" x=0 y=0 width=1280 height=720 target="*credits_p1"]
[iscript]
tf.cred_timer = setTimeout(function(){ TYRANO.kag.ftag.startTag("jump", {target:"*credits_p1"}); }, 4000);
[endscript]
[s]

*credits_p1
[iscript]
if (tf.cred_timer) { clearTimeout(tf.cred_timer); tf.cred_timer = null; }
[endscript]
[clearfix]
[free layer="0" page="fore" name="end_mark"]
[wait time=300]

;--- クレジット 1/2：立ち絵・背景・BGM ---
[ptext layer="0" page="fore" name="credit_title" x=0 y=80 width=1280 align=center size=34 color=0xffffff text="CREDITS"]
[ptext layer="0" page="fore" name="credit_01" x=0 y=170 width=1280 align=center size=22 color=0xffffff text="立ち絵、背景"]
[ptext layer="0" page="fore" name="credit_02" x=0 y=205 width=1280 align=center size=22 color=0xffffff text="GPT Image 2"]
[ptext layer="0" page="fore" name="credit_03" x=0 y=285 width=1280 align=center size=22 color=0xffffff text="BGM"]
[ptext layer="0" page="fore" name="credit_04" x=0 y=320 width=1280 align=center size=21 color=0xffffff text="DOVA-SYNDROME"]
[ptext layer="0" page="fore" name="credit_05" x=0 y=358 width=1280 align=center size=20 color=0xffffff text="「丑三つ時」 shimtone様"]
[ptext layer="0" page="fore" name="credit_06" x=0 y=390 width=1280 align=center size=20 color=0xffffff text="「予知夢」 ゆうり(Yuli Audio Craft)様"]
[ptext layer="0" page="fore" name="credit_07" x=0 y=422 width=1280 align=center size=20 color=0xffffff text="「Celesta's Cruel Caress」 MFP【Marron Fields Production】様"]
[ptext layer="0" page="fore" name="credit_08" x=0 y=454 width=1280 align=center size=20 color=0xffffff text="「宇宙 (アンビエント系)」 corico様"]
[ptext layer="0" page="fore" name="credit_hint" x=0 y=660 width=1280 align=center size=18 color=0x888888 text="クリックで進む ▶"]
[button graphic="transparent_button.png" folder="image" x=0 y=0 width=1280 height=720 target="*credits_p2"]
[iscript]
tf.cred_timer = setTimeout(function(){ TYRANO.kag.ftag.startTag("jump", {target:"*credits_p2"}); }, 9000);
[endscript]
[s]

*credits_p2
[iscript]
if (tf.cred_timer) { clearTimeout(tf.cred_timer); tf.cred_timer = null; }
[endscript]
[clearfix]
[free layer="0" page="fore" name="credit_title"]
[free layer="0" page="fore" name="credit_01"]
[free layer="0" page="fore" name="credit_02"]
[free layer="0" page="fore" name="credit_03"]
[free layer="0" page="fore" name="credit_04"]
[free layer="0" page="fore" name="credit_05"]
[free layer="0" page="fore" name="credit_06"]
[free layer="0" page="fore" name="credit_07"]
[free layer="0" page="fore" name="credit_08"]
[free layer="0" page="fore" name="credit_hint"]
[wait time=300]

;--- クレジット 2/2：SE・UIアセット ---
[ptext layer="0" page="fore" name="credit_title" x=0 y=80 width=1280 align=center size=34 color=0xffffff text="CREDITS"]
[ptext layer="0" page="fore" name="credit_09" x=0 y=210 width=1280 align=center size=22 color=0xffffff text="SE"]
[ptext layer="0" page="fore" name="credit_10" x=0 y=250 width=1280 align=center size=21 color=0xffffff text="効果音ラボ"]
[ptext layer="0" page="fore" name="credit_11" x=0 y=284 width=1280 align=center size=21 color=0xffffff text="ノタの森"]
[ptext layer="0" page="fore" name="credit_12" x=0 y=370 width=1280 align=center size=22 color=0xffffff text="UIアセット"]
[ptext layer="0" page="fore" name="credit_13" x=0 y=412 width=1280 align=center size=19 color=0xffffff text="「テーマ一括変換プラグイン その18」 空想曲線（KUUSOU-KYOKUSEN）／こ・ぱんだ様"]
[ptext layer="0" page="fore" name="credit_14" x=0 y=446 width=1280 align=center size=17 color=0xffffff text="https://kopacurve.blog.fc2.com/"]
[ptext layer="0" page="fore" name="credit_hint" x=0 y=660 width=1280 align=center size=18 color=0x888888 text="クリックでタイトルへ ▶"]
[button graphic="transparent_button.png" folder="image" x=0 y=0 width=1280 height=720 target="*credits_end"]
[iscript]
tf.cred_timer = setTimeout(function(){ TYRANO.kag.ftag.startTag("jump", {target:"*credits_end"}); }, 9000);
[endscript]
[s]

*credits_end
[iscript]
if (tf.cred_timer) { clearTimeout(tf.cred_timer); tf.cred_timer = null; }
[endscript]
[clearfix]
[free layer="0" page="fore" name="credit_title"]
[free layer="0" page="fore" name="credit_09"]
[free layer="0" page="fore" name="credit_10"]
[free layer="0" page="fore" name="credit_11"]
[free layer="0" page="fore" name="credit_12"]
[free layer="0" page="fore" name="credit_13"]
[free layer="0" page="fore" name="credit_14"]
[free layer="0" page="fore" name="credit_hint"]
[jump target="*return_title"]

*return_title
[cm]
[phone_text_clear]
[freeimage layer="0" page="fore" time=100]
[chara_hide name="aoi"]
[resetfont]
[font color=0xffffff]
[layopt layer="message0" visible=false]
[stopse buf=4]
[stopse buf=5]
[stopse buf=6]
[stopbgm time=300]
@jump storage="title.ks"
[s]
