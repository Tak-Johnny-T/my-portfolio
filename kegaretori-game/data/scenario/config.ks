; 2020/08/31 @ko10panda edit

;===============================================================================

; コンフィグ モード　画面作成

;===============================================================================
[mask time="100"]

[layopt layer="message0" visible="false"]
[clearfix]
[stop_keyconfig]
[free_layermode time="100" wait="true"]
[reset_camera time="100" wait="true"]
[hidemenubutton]

[iscript]

$(".layer_camera").empty();
$("#bgmovie").remove();

TG.config.autoRecordLabel = "true";

/*
 * コンフィグ内のみで使用する変数類
 *
 * tf.img_path            画像類のパス
 * tf.uiConfig            画像のサイズや配置座標を格納したオブジェクト
 *
 * bgmVolValues           BGM音量を格納している配列
 * seVolValues            効果音音量を格納している配列
 * chSpeedValues          テキスト速度を格納している配列
 * autoSpeedValues        オート時のウェイトを格納している配列
 *
 * tf.config_num_bgm      BGM音量のインデックス
 * tf.config_num_se       SE音量のインデックス
 * tf.config_num_ch       テキスト速度のインデックス
 * tf.config_num_auto     オートウェイトのインデックス
 *
 * tf.current_bgm_vol     現在のBGM音量
 * tf.current_se_vol      現在のSE音量
 * tf.current_ch_speed    現在のテキスト速度
 * tf.current_auto_speed  現在のオートウェイト
 *
 * tf.text_skip           現在の未読スキップの状態
 *
 * sf.prev_vol_list       BGMとSEの音量とインデックスを保存している配列（ミュート解除時に必要なため）
*/

tf.img_path = '../others/plugin/theme_kopanda_18_free/image/config/';

tf.uiConfig = {

	img_btn : tf.img_path + 'c_btn.gif',

	gauge : {
		img     : tf.img_path + 'gauge_act.png',
		img_hov : tf.img_path + 'gauge_hov.png',
		posx    : [0, 340, 404, 468, 532, 596, 660, 724, 788, 852, 916],
		posy    : [180, 260, 340, 420],
		width   : 48,
		height  : 48
	},

	mute : {
		img        : tf.img_path + 'mute_act.png',
		img_hov    : tf.img_path + 'mute_hov.png',
		pos_bgm    : [1056, 182],
		pos_se     : [1056, 262],
		width      : 48,
		height     : 48
	},

	skip : {
		img_off    : tf.img_path + 'skip_off_act.png',
		img_on     : tf.img_path + 'skip_on_act.png',
		img_hov    : tf.img_path + 'skip_hov.png',
		pos_off    : [340, 500],
		pos_on     : [532, 500],
		width      : 176,
		height     : 50
	}
};

	// unRead Text Skip
	tf.text_skip ="ON";
	if(TG.config.unReadTextSkip != "true") {
		tf.text_skip ="OFF";
	}

	// BGM Volume
	const bgmVolValues    = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
	tf.current_bgm_vol    = parseInt(TG.config.defaultBgmVolume);
	tf.config_num_bgm     = bgmVolValues.indexOf(tf.current_bgm_vol);

	// SE Volume
	const seVolValues     = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100];
	tf.current_se_vol     = parseInt(TG.config.defaultSeVolume);
	tf.config_num_se      = seVolValues.indexOf(tf.current_se_vol);

	// Text Speed
	const chSpeedValues   = [100, 80, 50, 40, 30, 25, 20, 11, 8, 5];
	tf.current_ch_speed   = parseInt(TG.config.chSpeed);
	tf.config_num_ch      = chSpeedValues.indexOf(tf.current_ch_speed);

	// Auto Text Speed
	const autoSpeedValues = [5000, 4500, 4000, 3500, 3000, 2500, 2000, 1300, 800, 500];
	tf.current_auto_speed = parseInt(TG.config.autoSpeed);
	tf.config_num_auto    = autoSpeedValues.indexOf(tf.current_auto_speed);

	// Array variable to store BGM and SE volumes before mute
	sf.prev_vol_list = sf.prev_vol_list ?? [tf.current_bgm_vol, tf.config_num_bgm, tf.current_se_vol, tf.config_num_se];

[endscript]

[cm]

; background
[bg storage="&tf.img_path +'config_bg.png'" time="100" wait="false"]

; btn back
[button fix="true" graphic="&tf.img_path + 'btn_back.png'" enterimg="&tf.img_path + 'btn_back_hov.png'" activeimg="&tf.img_path + 'btn_back_clk.png'" target="*backtitle" x="24" y="646"]

[jump target="*config_page"]

*config_page
[clearstack]

;-------------------------------------------------------------------------------
; BGM Volume
;-------------------------------------------------------------------------------
[button name="bgmvol" fix="true" target="*vol_bgm_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[1]"  y="&tf.uiConfig.gauge.posy[0]" exp="tf.current_bgm_vol =  10; tf.config_num_bgm = 1"]
[button name="bgmvol" fix="true" target="*vol_bgm_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[2]"  y="&tf.uiConfig.gauge.posy[0]" exp="tf.current_bgm_vol =  20; tf.config_num_bgm = 2"]
[button name="bgmvol" fix="true" target="*vol_bgm_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[3]"  y="&tf.uiConfig.gauge.posy[0]" exp="tf.current_bgm_vol =  30; tf.config_num_bgm = 3"]
[button name="bgmvol" fix="true" target="*vol_bgm_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[4]"  y="&tf.uiConfig.gauge.posy[0]" exp="tf.current_bgm_vol =  40; tf.config_num_bgm = 4"]
[button name="bgmvol" fix="true" target="*vol_bgm_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[5]"  y="&tf.uiConfig.gauge.posy[0]" exp="tf.current_bgm_vol =  50; tf.config_num_bgm = 5"]
[button name="bgmvol" fix="true" target="*vol_bgm_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[6]"  y="&tf.uiConfig.gauge.posy[0]" exp="tf.current_bgm_vol =  60; tf.config_num_bgm = 6"]
[button name="bgmvol" fix="true" target="*vol_bgm_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[7]"  y="&tf.uiConfig.gauge.posy[0]" exp="tf.current_bgm_vol =  70; tf.config_num_bgm = 7"]
[button name="bgmvol" fix="true" target="*vol_bgm_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[8]"  y="&tf.uiConfig.gauge.posy[0]" exp="tf.current_bgm_vol =  80; tf.config_num_bgm = 8"]
[button name="bgmvol" fix="true" target="*vol_bgm_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[9]"  y="&tf.uiConfig.gauge.posy[0]" exp="tf.current_bgm_vol =  90; tf.config_num_bgm = 9"]
[button name="bgmvol" fix="true" target="*vol_bgm_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[10]" y="&tf.uiConfig.gauge.posy[0]" exp="tf.current_bgm_vol = 100; tf.config_num_bgm = 10"]

; Mute BGM
[button name="bgmvol" fix="true" target="*vol_bgm_mute" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.mute.img_hov" width="&tf.uiConfig.mute.width" height="&tf.uiConfig.mute.height" x="&tf.uiConfig.mute.pos_bgm[0]" y="&tf.uiConfig.mute.pos_bgm[1]"]

;-------------------------------------------------------------------------------
; SE Volume
;-------------------------------------------------------------------------------
[button name="sevol" fix="true" target="*vol_se_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[1]"  y="&tf.uiConfig.gauge.posy[1]" exp="tf.current_se_vol =  10; tf.config_num_se =  1"]
[button name="sevol" fix="true" target="*vol_se_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[2]"  y="&tf.uiConfig.gauge.posy[1]" exp="tf.current_se_vol =  20; tf.config_num_se =  2"]
[button name="sevol" fix="true" target="*vol_se_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[3]"  y="&tf.uiConfig.gauge.posy[1]" exp="tf.current_se_vol =  30; tf.config_num_se =  3"]
[button name="sevol" fix="true" target="*vol_se_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[4]"  y="&tf.uiConfig.gauge.posy[1]" exp="tf.current_se_vol =  40; tf.config_num_se =  4"]
[button name="sevol" fix="true" target="*vol_se_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[5]"  y="&tf.uiConfig.gauge.posy[1]" exp="tf.current_se_vol =  50; tf.config_num_se =  5"]
[button name="sevol" fix="true" target="*vol_se_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[6]"  y="&tf.uiConfig.gauge.posy[1]" exp="tf.current_se_vol =  60; tf.config_num_se =  6"]
[button name="sevol" fix="true" target="*vol_se_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[7]"  y="&tf.uiConfig.gauge.posy[1]" exp="tf.current_se_vol =  70; tf.config_num_se =  7"]
[button name="sevol" fix="true" target="*vol_se_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[8]"  y="&tf.uiConfig.gauge.posy[1]" exp="tf.current_se_vol =  80; tf.config_num_se =  8"]
[button name="sevol" fix="true" target="*vol_se_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[9]"  y="&tf.uiConfig.gauge.posy[1]" exp="tf.current_se_vol =  90; tf.config_num_se =  9"]
[button name="sevol" fix="true" target="*vol_se_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[10]" y="&tf.uiConfig.gauge.posy[1]" exp="tf.current_se_vol = 100; tf.config_num_se = 10"]

; Mute SE
[button name="sevol" fix="true" target="*vol_se_mute" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.mute.img_hov" width="&tf.uiConfig.mute.width" height="&tf.uiConfig.mute.height" x="&tf.uiConfig.mute.pos_se[0]" y="&tf.uiConfig.mute.pos_se[1]"]

;-------------------------------------------------------------------------------
; Text Speed
;-------------------------------------------------------------------------------
[button name="ch" fix="true" target="*ch_speed_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[1]"  y="&tf.uiConfig.gauge.posy[2]" exp="tf.set_ch_speed =100; tf.config_num_ch = 0"]
[button name="ch" fix="true" target="*ch_speed_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[2]"  y="&tf.uiConfig.gauge.posy[2]" exp="tf.set_ch_speed = 80; tf.config_num_ch = 1"]
[button name="ch" fix="true" target="*ch_speed_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[3]"  y="&tf.uiConfig.gauge.posy[2]" exp="tf.set_ch_speed = 50; tf.config_num_ch = 2"]
[button name="ch" fix="true" target="*ch_speed_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[4]"  y="&tf.uiConfig.gauge.posy[2]" exp="tf.set_ch_speed = 40; tf.config_num_ch = 3"]
[button name="ch" fix="true" target="*ch_speed_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[5]"  y="&tf.uiConfig.gauge.posy[2]" exp="tf.set_ch_speed = 30; tf.config_num_ch = 4"]
[button name="ch" fix="true" target="*ch_speed_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[6]"  y="&tf.uiConfig.gauge.posy[2]" exp="tf.set_ch_speed = 25; tf.config_num_ch = 5"]
[button name="ch" fix="true" target="*ch_speed_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[7]"  y="&tf.uiConfig.gauge.posy[2]" exp="tf.set_ch_speed = 20; tf.config_num_ch = 6"]
[button name="ch" fix="true" target="*ch_speed_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[8]"  y="&tf.uiConfig.gauge.posy[2]" exp="tf.set_ch_speed = 11; tf.config_num_ch = 7"]
[button name="ch" fix="true" target="*ch_speed_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[9]"  y="&tf.uiConfig.gauge.posy[2]" exp="tf.set_ch_speed =  8; tf.config_num_ch = 8"]
[button name="ch" fix="true" target="*ch_speed_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[10]" y="&tf.uiConfig.gauge.posy[2]" exp="tf.set_ch_speed =  5; tf.config_num_ch = 9"]

;-------------------------------------------------------------------------------
; Auto Text Speed
;-------------------------------------------------------------------------------
[button name="auto" fix="true" target="*auto_speed_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[1]"  y="&tf.uiConfig.gauge.posy[3]" exp="tf.set_auto_speed = 5000; tf.config_num_auto = 0"]
[button name="auto" fix="true" target="*auto_speed_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[2]"  y="&tf.uiConfig.gauge.posy[3]" exp="tf.set_auto_speed = 4500; tf.config_num_auto = 1"]
[button name="auto" fix="true" target="*auto_speed_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[3]"  y="&tf.uiConfig.gauge.posy[3]" exp="tf.set_auto_speed = 4000; tf.config_num_auto = 2"]
[button name="auto" fix="true" target="*auto_speed_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[4]"  y="&tf.uiConfig.gauge.posy[3]" exp="tf.set_auto_speed = 3500; tf.config_num_auto = 3"]
[button name="auto" fix="true" target="*auto_speed_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[5]"  y="&tf.uiConfig.gauge.posy[3]" exp="tf.set_auto_speed = 3000; tf.config_num_auto = 4"]
[button name="auto" fix="true" target="*auto_speed_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[6]"  y="&tf.uiConfig.gauge.posy[3]" exp="tf.set_auto_speed = 2500; tf.config_num_auto = 5"]
[button name="auto" fix="true" target="*auto_speed_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[7]"  y="&tf.uiConfig.gauge.posy[3]" exp="tf.set_auto_speed = 2000; tf.config_num_auto = 6"]
[button name="auto" fix="true" target="*auto_speed_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[8]"  y="&tf.uiConfig.gauge.posy[3]" exp="tf.set_auto_speed = 1300; tf.config_num_auto = 7"]
[button name="auto" fix="true" target="*auto_speed_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[9]"  y="&tf.uiConfig.gauge.posy[3]" exp="tf.set_auto_speed =  800; tf.config_num_auto = 8"]
[button name="auto" fix="true" target="*auto_speed_change" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.gauge.img_hov" width="&tf.uiConfig.gauge.width" height="&tf.uiConfig.gauge.height" x="&tf.uiConfig.gauge.posx[10]" y="&tf.uiConfig.gauge.posy[3]" exp="tf.set_auto_speed =  500; tf.config_num_auto = 9"]

;-------------------------------------------------------------------------------
; Unread Text Skip
;-------------------------------------------------------------------------------
; Off
[button name="unread_off" fix="true" target="*skip_off" graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.skip.img_hov" width="&tf.uiConfig.skip.width" height="&tf.uiConfig.skip.height" x="&tf.uiConfig.skip.pos_off[0]" y="&tf.uiConfig.skip.pos_off[1]"]

; On
[button name="unread_on"  fix="true" target="*skip_on"  graphic="&tf.uiConfig.img_btn" enterimg="&tf.uiConfig.skip.img_hov" width="&tf.uiConfig.skip.width" height="&tf.uiConfig.skip.height" x="&tf.uiConfig.skip.pos_on[0]" y="&tf.uiConfig.skip.pos_on[1]"]

;-------------------------------------------------------------------------------
; Load on Config Mode startup
;-------------------------------------------------------------------------------
[layopt layer="0" visible="true"]

[call target="*load_bgm_img"]
[call target="*load_se_img"]
[call target="*load_ch_img"]
[call target="*load_auto_img"]
[call target="*load_skip_img"]

[test_message_start]

[mask_off time="300"]

[s]

;-------------------------------------------------------------------------------
; Exit Config Mode
;-------------------------------------------------------------------------------
*backtitle
[mask time="250"]

[cm]
[layopt layer="message1" visible="false"]
[endkeyframe]
[freeimage layer="0"]
[freeimage layer="base"]
[clearfix]
[clearstack]
[start_keyconfig]

[iscript]
	$(".layer_free").empty();
[endscript]

[mask_off time="10"]

[awakegame]

;===============================================================================

; Handle button click

;===============================================================================
;-------------------------------------------------------------------------------
; BGM Volume
;-------------------------------------------------------------------------------
*vol_bgm_mute
[iscript]

if(tf.current_bgm_vol != 0) {
	sf.prev_vol_list[0] = tf.current_bgm_vol;
	sf.prev_vol_list[1] = tf.config_num_bgm;
	tf.current_bgm_vol = 0;
	tf.config_num_bgm  = 0;
} else {
	tf.current_bgm_vol = sf.prev_vol_list[0];
	tf.config_num_bgm  = sf.prev_vol_list[1];
}

[endscript]

*vol_bgm_change
[free layer="0" name="bgmvol" time="0" wait="true"]
[call target="*load_bgm_img"]
[bgmopt volume="&tf.current_bgm_vol"]

[return]

;-------------------------------------------------------------------------------
; SE Volume
;-------------------------------------------------------------------------------
*vol_se_mute
[iscript]

if( tf.current_se_vol != 0 ) {
	sf.prev_vol_list[2] = tf.current_se_vol;
	sf.prev_vol_list[3] = tf.config_num_se;
	tf.current_se_vol = 0;
	tf.config_num_se  = 0;
} else {
	tf.current_se_vol = sf.prev_vol_list[2];
	tf.config_num_se  = sf.prev_vol_list[3];
}

[endscript]

*vol_se_change
[free layer="0" name="sevol" time="0" wait="true"]
[call target="*load_se_img"]
[seopt volume="&tf.current_se_vol"]

[return]

;-------------------------------------------------------------------------------
; Text Speed
;-------------------------------------------------------------------------------
*ch_speed_change
[eval exp="tf.current_ch_speed = tf.set_ch_speed"]
[free layer="0" name="ch" time="0" wait="true"]
[call target="*load_ch_img"]
[configdelay speed="&tf.set_ch_speed"]
[test_message_reset]

[return]

;-------------------------------------------------------------------------------
; Auto Text Speed
;-------------------------------------------------------------------------------
*auto_speed_change
[eval exp="tf.current_auto_speed = tf.set_auto_speed"]
[free layer="0" name="auto" time="0" wait="true"]
[call target="*load_auto_img"]
[autoconfig speed="&tf.set_auto_speed"]

[return]

;-------------------------------------------------------------------------------
; Unread Text Skip -- Off
;-------------------------------------------------------------------------------
*skip_off
[free layer="0" name="unread_on" time="10"]
[image layer="0" name="unread_off" storage="&tf.uiConfig.skip.img_off" x="&tf.uiConfig.skip.pos_off[0]" y="&tf.uiConfig.skip.pos_off[1]"]
[config_record_label skip="false"]

[return]

;-------------------------------------------------------------------------------
; Unread Text Skip -- On
;-------------------------------------------------------------------------------
*skip_on
[free layer="0" name="unread_off" time="10"]
[image layer="0" name="unread_on" storage="&tf.uiConfig.skip.img_on" x="&tf.uiConfig.skip.pos_on[0]" y="&tf.uiConfig.skip.pos_on[1]"]
[config_record_label skip="true"]

[return]

;===============================================================================

; Update image

;===============================================================================
;-------------------------------------------------------------------------------
; BGM Volume
;-------------------------------------------------------------------------------
*load_bgm_img
[if exp="tf.config_num_bgm == 0"]
	[image layer="0" name="bgmvol" storage="&tf.uiConfig.mute.img"  x="&tf.uiConfig.mute.pos_bgm[0]" y="&tf.uiConfig.mute.pos_bgm[1]"]
[else]
	[image layer="0" name="bgmvol" storage="&tf.uiConfig.gauge.img" x="&tf.uiConfig.gauge.posx[tf.config_num_bgm]" y="&tf.uiConfig.gauge.posy[0]"]
[endif]

[return]

;-------------------------------------------------------------------------------
; SE Volume
;-------------------------------------------------------------------------------
*load_se_img
[if exp="tf.config_num_se == 0"]
	[image layer="0" name="sevol" storage="&tf.uiConfig.mute.img" x="&tf.uiConfig.mute.pos_se[0]" y="&tf.uiConfig.mute.pos_se[1]"]
[else]
	[image layer="0" name="sevol" storage="&tf.uiConfig.gauge.img" x="&tf.uiConfig.gauge.posx[tf.config_num_se]" y="&tf.uiConfig.gauge.posy[1]"]
[endif]

[return]

;-------------------------------------------------------------------------------
; Text Speed
;-------------------------------------------------------------------------------
*load_ch_img
[image layer="0" name="ch" storage="&tf.uiConfig.gauge.img" x="&tf.uiConfig.gauge.posx[tf.config_num_ch + 1]" y="&tf.uiConfig.gauge.posy[2]"]

[return]

;-------------------------------------------------------------------------------
; Auto Text Speed
;-------------------------------------------------------------------------------
*load_auto_img
[image layer="0" name="auto"  storage="&tf.uiConfig.gauge.img" x="&tf.uiConfig.gauge.posx[tf.config_num_auto + 1]" y="&tf.uiConfig.gauge.posy[3]"]

[return]

;-------------------------------------------------------------------------------
; Unread Text Skip
;-------------------------------------------------------------------------------
*load_skip_img
[if exp="tf.text_skip == 'ON'"]
	[image layer="0" name="unread_on"  storage="&tf.uiConfig.skip.img_on" x="&tf.uiConfig.skip.pos_on[0]"  y="&tf.uiConfig.skip.pos_on[1]"]
[else]
	[image layer="0" name="unread_off" storage="&tf.uiConfig.skip.img_off" x="&tf.uiConfig.skip.pos_off[0]" y="&tf.uiConfig.skip.pos_off[1]"]
[endif]

[return]
