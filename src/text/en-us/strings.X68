;-------------------------------------------------------------------------------
; title screen
;-------------------------------------------------------------------------------
TitleScreenTextNewGame:
	dc.b	"{New Game",ETX

TitleScreenTextLoadGame:
	dc.b	"{Load Game",ETX

TitleScreenTextDebug:
	dc.b	"{Debug",ETX
	
TitleScreenTextFooter:
	;		"12345678901234567890123456789012345678"
	dc.b	"       Placeholder Title Screen",ETX

TitleScreenTextFooterDebug:
	;		"12345678901234567890123456789012345678"
	dc.b	"       Placeholder Title Screen",ETX

	; 28 lines available on the debug screen (28-1 = 1B)

	DebugScreenLine00:
	;		"12345678901234567890123456789012345678"
	dc.b	"Debug menu",ETX

	DebugScreenLine01:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine02:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine03:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine04:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine05:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine06:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine07:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine08:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine09:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine0A:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine0B:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine0C:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine0D:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine0E:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine0F:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine10:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine11:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine12:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine13:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine14:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine15:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine16:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine17:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine18:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine19:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine1A:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

	DebugScreenLine1B:
	;		"12345678901234567890123456789012345678"
	dc.b	"{(not implemented)  {(not implemented)",ETX

;-------------------------------------------------------------------------------
; credits and end screen
;-------------------------------------------------------------------------------
CreditsScreen00Line00:
	;		"12345678901234567890123456789012345678"
	dc.b	"                Credits               ",ETX

CreditsScreen00Line01:
	;		"12345678901234567890123456789012345678"
	dc.b	" ",ETX

CreditsScreen00Line02:
	;		"12345678901234567890123456789012345678"
	dc.b	"Story & program by Hugues Johnson",ETX

CreditsScreen00Line03:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX

CreditsScreen00Line04:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX

CreditsScreen00Line05:
	;		"12345678901234567890123456789012345678"
	dc.b	"Assembly code compiled using vasm",ETX

CreditsScreen00Line06:
	;		"12345678901234567890123456789012345678"
	dc.b	"http://sun.hasenbraten.de/vasm/",ETX

CreditsScreen00Line07:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX

CreditsScreen00Line08:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX

CreditsScreen00Line09:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX

CreditsScreen00Line0A:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX

CreditsScreen00Line0B:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX

CreditsScreen01Line00:
	;		"12345678901234567890123456789012345678"
	dc.b	"               Graphics               ",ETX

CreditsScreen01Line01:
	;		"12345678901234567890123456789012345678"
	dc.b	" ",ETX

CreditsScreen01Line02:
	;		"12345678901234567890123456789012345678"
	dc.b	"Logo font based on Audiowide",ETX

CreditsScreen01Line03:
	;		"12345678901234567890123456789012345678"
	dc.b	"Copyright (c) 2012 Brian J Bonislawsky",ETX

CreditsScreen01Line04:
	;		"12345678901234567890123456789012345678"
	dc.b	" ",ETX

CreditsScreen01Line05:
	;		"12345678901234567890123456789012345678"
	dc.b	"Some scenery is based on tilesets",ETX

CreditsScreen01Line06:
	;		"12345678901234567890123456789012345678"
	dc.b	"created by Sithjester",ETX

CreditsScreen01Line07:
	;		"12345678901234567890123456789012345678"
	dc.b	"untamed.wild-refuge.net/rpgxp.php",ETX

CreditsScreen01Line08:
	;		"12345678901234567890123456789012345678"
	dc.b	" ",ETX

CreditsScreen01Line09:
	;		"12345678901234567890123456789012345678"
	dc.b	"Some scenery is based off tilesets",ETX

CreditsScreen01Line0A:
	;		"12345678901234567890123456789012345678"
	dc.b	"from Pixel Art World",ETX

CreditsScreen01Line0B:
	;		"12345678901234567890123456789012345678"
	dc.b	"http://yms.main.jp/page-s1/terms.html",ETX

CreditsScreen02Line00:
	;		"12345678901234567890123456789012345678"
	dc.b	"                Audio                 ",ETX

CreditsScreen02Line01:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX

CreditsScreen02Line02:
	;		"12345678901234567890123456789012345678"
	dc.b	"Echo Sound Driver by Javier Degirolmo",ETX

CreditsScreen03Line03:
	;		"12345678901234567890123456789012345678"
	dc.b	"https://github.com/sikthehedgehog/Echo",ETX

CreditsScreen03Line04:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX

CreditsScreen03Line05:
	;		"12345678901234567890123456789012345678"
	dc.b	"xm2esf was used for audio conversion",ETX

CreditsScreen03Line06:
	;		"12345678901234567890123456789012345678"
	dc.b	"https://github.com/oerg866/xm2esf",ETX

CreditsScreen03Line07:
	;		"12345678901234567890123456789012345678"
	dc.b	" ",ETX

CreditsScreen03Line08:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX

CreditsScreen03Line09:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX

CreditsScreen03Line0A:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX

CreditsScreen03Line0B:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX

EndScreenLine00BadEnding:
	;		"12345678901234567890123456789012345678"
	dc.b	"    Retail Clerk '90 - Bad Ending     ",ETX

EndScreenLine00GoodEnding:
	;		"12345678901234567890123456789012345678"
	dc.b	"    Retail Clerk '90 - Good Ending    ",ETX

EndScreenLine00PerfectEnding:
	;		"12345678901234567890123456789012345678"
	dc.b	"  Retail Clerk '90 - Perfect Ending   ",ETX

EndScreenTextLine1:
	;		"12345678901234567890123456789012345678"
	dc.b	"Thank you for trying this little demo!",ETX

EndScreenTextLine2:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX

EndScreenTextLine3:
	;		"12345678901234567890123456789012345678"
	dc.b	"Check out my other projects over at",ETX

EndScreenTextLine4:
	;		"12345678901234567890123456789012345678"
	dc.b	"https://HuguesJohnson.com/",ETX

EndScreenTextLine5:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX

EndScreenTextLine6:
	;		"12345678901234567890123456789012345678"
	dc.b	"Press the start button to reset.",ETX

;-------------------------------------------------------------------------------
; general messages
;-------------------------------------------------------------------------------
DialogTextNothing:
	;		"1234567890123456789012"
	dc.b	"There's nothing very",LF
	dc.b	"interesting here.",ETX

DialogTextNothingHappens:
	;		"1234567890123456789012"
	dc.b	"Nothing happens.",ETX

;-------------------------------------------------------------------------------
; default NPC talk responses
;-------------------------------------------------------------------------------
	align 2
DialogTextUnknownNPC:
	dc.w	$2000
	;		"1234567890123456789012"
	dc.b	"If you see this then I",LF
	dc.b	"really messed up. (hj)",ETX

DialogTextErynDay00:
DialogTextErynDay01:
DialogTextErynDay02:
DialogTextErynDay03:
DialogTextErynDay04:
DialogTextErynDay05:
	align 2
DialogTextErynDay06:
	dc.w	OBJ_NPC_ERYN
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextCarlDay00:
	dc.w	OBJ_NPC_CARL
	;		"1234567890123456789012"
	dc.b	"This is my day 00",LF
	dc.b	"text.",ETX
DialogTextCarlDay01:
DialogTextCarlDay02:
DialogTextCarlDay03:
DialogTextCarlDay04:
DialogTextCarlDay05:
	align 2
DialogTextCarlDay06:
	dc.w	OBJ_NPC_CARL
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextFrankDay00:
	dc.w	OBJ_NPC_FRANK
	;		"1234567890123456789012"
	dc.b	"This is my day 00",LF
	dc.b	"text.",ETX
DialogTextFrankDay01:
DialogTextFrankDay02:
DialogTextFrankDay03:
DialogTextFrankDay04:
DialogTextFrankDay05:
	align 2
DialogTextFrankDay06:
	dc.w	OBJ_NPC_FRANK
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextCarolDay00:
	dc.w	OBJ_NPC_CAROL
	;		"1234567890123456789012"
	dc.b	"This is my day 00",LF
	dc.b	"text.",ETX
DialogTextCarolDay01:
DialogTextCarolDay02:
DialogTextCarolDay03:
DialogTextCarolDay04:
DialogTextCarolDay05:
	align 2
DialogTextCarolDay06:
	dc.w	OBJ_NPC_CAROL
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextLisaDay00:
	dc.w	OBJ_NPC_LISA
	;		"1234567890123456789012"
	dc.b	"This is my day 00",LF
	dc.b	"text.",ETX
DialogTextLisaDay01:
DialogTextLisaDay02:
DialogTextLisaDay03:
DialogTextLisaDay04:
DialogTextLisaDay05:
	align 2
DialogTextLisaDay06:
	dc.w	OBJ_NPC_LISA
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextGrunbergDay00:
	dc.w	OBJ_NPC_GRUNBERG
	;		"1234567890123456789012"
	dc.b	"This is my day 00",LF
	dc.b	"text.",ETX
DialogTextGrunbergDay01:
DialogTextGrunbergDay02:
DialogTextGrunbergDay03:
DialogTextGrunbergDay04:
DialogTextGrunbergDay05:
	align 2
DialogTextGrunbergDay06:
	dc.w	OBJ_NPC_GRUNBERG
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextJenDay00:
	dc.w	OBJ_NPC_JEN
	;		"1234567890123456789012"
	dc.b	"This is my day 00",LF
	dc.b	"text.",ETX
DialogTextJenDay01:
DialogTextJenDay02:
DialogTextJenDay03:
DialogTextJenDay04:
DialogTextJenDay05:
	align 2
DialogTextJenDay06:
	dc.w	OBJ_NPC_JEN
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextGriffyDay00:
	dc.w	OBJ_NPC_GRIFFY
	;		"1234567890123456789012"
	dc.b	"This is my day 00",LF
	dc.b	"text.",ETX
DialogTextGriffyDay01:
DialogTextGriffyDay02:
DialogTextGriffyDay03:
DialogTextGriffyDay04:
DialogTextGriffyDay05:
	align 2
DialogTextGriffyDay06:
	dc.w	OBJ_NPC_GRIFFY
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextScottDay00:
	dc.w	OBJ_NPC_SCOTT
	;		"1234567890123456789012"
	dc.b	"This is my day 00",LF
	dc.b	"text.",ETX
DialogTextScottDay01:
DialogTextScottDay02:
DialogTextScottDay03:
DialogTextScottDay04:
DialogTextScottDay05:
	align 2
DialogTextScottDay06:
	dc.w	OBJ_NPC_SCOTT
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextToddDay00:
	dc.w	OBJ_NPC_TODD
	;		"1234567890123456789012"
	dc.b	"This is my day 00",LF
	dc.b	"text.",ETX
DialogTextToddDay01:
DialogTextToddDay02:
DialogTextToddDay03:
DialogTextToddDay04:
DialogTextToddDay05:
	align 2
DialogTextToddDay06:
	dc.w	OBJ_NPC_TODD
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextElizaDay00:
	dc.w	OBJ_NPC_ELIZA
	;		"1234567890123456789012"
	dc.b	"This is my day 00",LF
	dc.b	"text.",ETX
DialogTextElizaDay01:
DialogTextElizaDay02:
DialogTextElizaDay03:
DialogTextElizaDay04:
DialogTextElizaDay05:
	align 2
DialogTextElizaDay06:
	dc.w	OBJ_NPC_ELIZA
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextBeckyDay00:
	dc.w	OBJ_NPC_BECKY
	;		"1234567890123456789012"
	dc.b	"This is my day 00",LF
	dc.b	"text.",ETX
DialogTextBeckyDay01:
DialogTextBeckyDay02:
DialogTextBeckyDay03:
DialogTextBeckyDay04:
DialogTextBeckyDay05:
	align 2
DialogTextBeckyDay06:
	dc.w	OBJ_NPC_BECKY
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextCharlesDay00:
DialogTextCharlesDay01:
DialogTextCharlesDay02:
DialogTextCharlesDay03:
DialogTextCharlesDay04:
DialogTextCharlesDay05:
	align 2
DialogTextCharlesDay06:
	dc.w	OBJ_NPC_CHARLES
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextRandyDay00:
	dc.w	OBJ_NPC_RANDY
	;		"1234567890123456789012"
	dc.b	"This is my day 00",LF
	dc.b	"text.",ETX
DialogTextRandyDay01:
DialogTextRandyDay02:
DialogTextRandyDay03:
DialogTextRandyDay04:
DialogTextRandyDay05:
	align 2
DialogTextRandyDay06:
	dc.w	OBJ_NPC_RANDY
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextDBDay00:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"This is my day 00",LF
	dc.b	"text.",ETX
DialogTextDBDay01:
DialogTextDBDay02:
DialogTextDBDay03:
DialogTextDBDay04:
DialogTextDBDay05:
	align 2
DialogTextDBDay06:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextDaniDay00:
DialogTextDaniDay01:
DialogTextDaniDay02:
DialogTextDaniDay03:
DialogTextDaniDay04:
DialogTextDaniDay05:
	align 2
DialogTextDaniDay06:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextGuardDay00:
DialogTextGuardDay01:
DialogTextGuardDay02:
DialogTextGuardDay03:
DialogTextGuardDay04:
DialogTextGuardDay05:
	align 2
DialogTextGuardDay06:
	dc.w	OBJ_NPC_GUARD
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextBillyDay00:
DialogTextBillyDay01:
DialogTextBillyDay02:
DialogTextBillyDay03:
DialogTextBillyDay04:
DialogTextBillyDay05:
	align 2
DialogTextBillyDay06:
	dc.w	OBJ_NPC_BILLY
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextAlDay00:
DialogTextAlDay01:
DialogTextAlDay02:
DialogTextAlDay03:
DialogTextAlDay04:
DialogTextAlDay05:
	align 2
DialogTextAlDay06:
	dc.w	OBJ_NPC_AL
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextThomasDay00:
DialogTextThomasDay01:
DialogTextThomasDay02:
DialogTextThomasDay03:
DialogTextThomasDay04:
DialogTextThomasDay05:
	align 2
DialogTextThomasDay06:
	dc.w	OBJ_NPC_THOMAS
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextHeatherDay00:
DialogTextHeatherDay01:
DialogTextHeatherDay02:
DialogTextHeatherDay03:
DialogTextHeatherDay04:
DialogTextHeatherDay05:
	align 2
DialogTextHeatherDay06:
	dc.w	OBJ_NPC_HEATHER
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextGaryDay00:
DialogTextGaryDay01:
DialogTextGaryDay02:
DialogTextGaryDay03:
DialogTextGaryDay04:
DialogTextGaryDay05:
	align 2
DialogTextGaryDay06:
	dc.w	OBJ_NPC_GARY
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextGrantDay00:
DialogTextGrantDay01:
DialogTextGrantDay02:
DialogTextGrantDay03:
DialogTextGrantDay04:
DialogTextGrantDay05:
	align 2
DialogTextGrantDay06:
	dc.w	OBJ_NPC_GRANT
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextBrettDay00:
DialogTextBrettDay01:
DialogTextBrettDay02:
DialogTextBrettDay03:
DialogTextBrettDay04:
DialogTextBrettDay05:
	align 2
DialogTextBrettDay06:
	dc.w	OBJ_NPC_BRETT
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextNickyDay00:
DialogTextNickyDay01:
DialogTextNickyDay02:
DialogTextNickyDay03:
DialogTextNickyDay04:
DialogTextNickyDay05:
	align 2
DialogTextNickyDay06:
	dc.w	OBJ_NPC_NICKY
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextTanyaDay00:
DialogTextTanyaDay01:
DialogTextTanyaDay02:
DialogTextTanyaDay03:
DialogTextTanyaDay04:
DialogTextTanyaDay05:
	align 2
DialogTextTanyaDay06:
	dc.w	OBJ_NPC_TANYA
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextCraigDay00:
DialogTextCraigDay01:
DialogTextCraigDay02:
DialogTextCraigDay03:
DialogTextCraigDay04:
DialogTextCraigDay05:
	align 2
DialogTextCraigDay06:
	dc.w	OBJ_NPC_CRAIG
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextJuanDay00:
DialogTextJuanDay01:
DialogTextJuanDay02:
DialogTextJuanDay03:
DialogTextJuanDay04:
DialogTextJuanDay05:
	align 2
DialogTextJuanDay06:
	dc.w	OBJ_NPC_JUAN
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextLauraDay00:
DialogTextLauraDay01:
DialogTextLauraDay02:
DialogTextLauraDay03:
DialogTextLauraDay04:
DialogTextLauraDay05:
	align 2
DialogTextLauraDay06:
	dc.w	OBJ_NPC_LAURA
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextGinaDay00:
DialogTextGinaDay01:
DialogTextGinaDay02:
DialogTextGinaDay03:
DialogTextGinaDay04:
DialogTextGinaDay05:
	align 2
DialogTextGinaDay06:
	dc.w	OBJ_NPC_GINA
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextSantaDay00:
DialogTextSantaDay01:
DialogTextSantaDay02:
DialogTextSantaDay03:
DialogTextSantaDay04:
DialogTextSantaDay05:
	align 2
DialogTextSantaDay06:
	dc.w	OBJ_NPC_SANTA
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextLostGuyDay00:
DialogTextLostGuyDay01:
DialogTextLostGuyDay02:
DialogTextLostGuyDay03:
DialogTextLostGuyDay04:
DialogTextLostGuyDay05:
	align 2
DialogTextLostGuyDay06:
	dc.w	OBJ_NPC_LOSTGUY
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextRockerDay00:
DialogTextRockerDay01:
DialogTextRockerDay02:
DialogTextRockerDay03:
DialogTextRockerDay04:
DialogTextRockerDay05:
	align 2
DialogTextRockerDay06:
	dc.w	OBJ_NPC_ROCKER
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextShopperDay00:
DialogTextShopperDay01:
DialogTextShopperDay02:
DialogTextShopperDay03:
DialogTextShopperDay04:
DialogTextShopperDay05:
	align 2
DialogTextShopperDay06:
	dc.w	OBJ_NPC_SHOPPER
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextBusyMomDay00:
DialogTextBusyMomDay01:
DialogTextBusyMomDay02:
DialogTextBusyMomDay03:
DialogTextBusyMomDay04:
DialogTextBusyMomDay05:
	align 2
DialogTextBusyMomDay06:
	dc.w	OBJ_NPC_BUSYMOM
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextMallratDay00:
DialogTextMallratDay01:
DialogTextMallratDay02:
DialogTextMallratDay03:
DialogTextMallratDay04:
DialogTextMallratDay05:
	align 2
DialogTextMallratDay06:
	dc.w	OBJ_NPC_MALLRAT
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextPreppyDay00:
DialogTextPreppyDay01:
DialogTextPreppyDay02:
DialogTextPreppyDay03:
DialogTextPreppyDay04:
DialogTextPreppyDay05:
	align 2
DialogTextPreppyDay06:
	dc.w	OBJ_NPC_PREPPY
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextYuppieDay00:
DialogTextYuppieDay01:
DialogTextYuppieDay02:
DialogTextYuppieDay03:
DialogTextYuppieDay04:
DialogTextYuppieDay05:
	align 2
DialogTextYuppieDay06:
	dc.w	OBJ_NPC_YUPPIE
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextNelsonDay00:
DialogTextNelsonDay01:
DialogTextNelsonDay02:
DialogTextNelsonDay03:
DialogTextNelsonDay04:
DialogTextNelsonDay05:
	align 2
DialogTextNelsonDay06:
	dc.w	OBJ_NPC_NELSON
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextVictorDay00:
DialogTextVictorDay01:
DialogTextVictorDay02:
DialogTextVictorDay03:
DialogTextVictorDay04:
DialogTextVictorDay05:
	align 2
DialogTextVictorDay06:
	dc.w	OBJ_NPC_VICTOR
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextAlOldDay00:
DialogTextAlOldDay01:
DialogTextAlOldDay02:
DialogTextAlOldDay03:
DialogTextAlOldDay04:
DialogTextAlOldDay05:
	align 2
DialogTextAlOldDay06:
	dc.w	OBJ_NPC_AL
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX


	align 2
DialogTextHiddenHJ:
	dc.w	OBJ_NPC_HIDDENHJ
	;		"1234567890123456789012"
	dc.b	"It's too bad, I have",LF
	dc.b	"all of these already.^",FF
	dc.b	"It was still worth the",LF
	dc.b	"visit though.        ^",FF
	dc.b	"I should go find my",LF
	dc.b	"wife now.            ^",FF
	dc.b	"I'm sure she doesn't",LF
	dc.b	"want to stay too long.",ETX

	align 2
DialogTextHiddenMJ:
	dc.w	OBJ_NPC_HIDDENMJ
	;		"1234567890123456789012"
	dc.b	"I came all the way",LF
	dc.b	"here & still can't   ^",FF
	dc.b	"find the Kathleen",LF
	dc.b	"Sunfire book.        ^",FF
	dc.b	"I think it's about",LF
	dc.b	"time to go back home.",ETX

DialogTextErynNight00:
DialogTextErynNight01:
DialogTextErynNight02:
DialogTextErynNight03:
DialogTextErynNight04:
DialogTextErynNight05:
	align 2
DialogTextErynNight06:
	dc.w	OBJ_NPC_ERYN
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextCarlNight00:
	dc.w	OBJ_NPC_CARL
	;		"1234567890123456789012"
	dc.b	"This is my Night 00",LF
	dc.b	"text.",ETX
DialogTextCarlNight01:
DialogTextCarlNight02:
DialogTextCarlNight03:
DialogTextCarlNight04:
DialogTextCarlNight05:
	align 2
DialogTextCarlNight06:
	dc.w	OBJ_NPC_CARL
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextFrankNight00:
	dc.w	OBJ_NPC_FRANK
	;		"1234567890123456789012"
	dc.b	"This is my Night 00",LF
	dc.b	"text.",ETX
DialogTextFrankNight01:
DialogTextFrankNight02:
DialogTextFrankNight03:
DialogTextFrankNight04:
DialogTextFrankNight05:
	align 2
DialogTextFrankNight06:
	dc.w	OBJ_NPC_FRANK
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextCarolNight00:
	dc.w	OBJ_NPC_CAROL
	;		"1234567890123456789012"
	dc.b	"This is my Night 00",LF
	dc.b	"text.",ETX
DialogTextCarolNight01:
DialogTextCarolNight02:
DialogTextCarolNight03:
DialogTextCarolNight04:
DialogTextCarolNight05:
	align 2
DialogTextCarolNight06:
	dc.w	OBJ_NPC_CAROL
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextLisaNight00:
	dc.w	OBJ_NPC_LISA
	;		"1234567890123456789012"
	dc.b	"This is my Night 00",LF
	dc.b	"text.",ETX
DialogTextLisaNight01:
DialogTextLisaNight02:
DialogTextLisaNight03:
DialogTextLisaNight04:
DialogTextLisaNight05:
	align 2
DialogTextLisaNight06:
	dc.w	OBJ_NPC_LISA
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextGrunbergNight00:
	dc.w	OBJ_NPC_GRUNBERG
	;		"1234567890123456789012"
	dc.b	"This is my Night 00",LF
	dc.b	"text.",ETX
DialogTextGrunbergNight01:
DialogTextGrunbergNight02:
DialogTextGrunbergNight03:
DialogTextGrunbergNight04:
DialogTextGrunbergNight05:
	align 2
DialogTextGrunbergNight06:
	dc.w	OBJ_NPC_GRUNBERG
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextJenNight00:
	dc.w	OBJ_NPC_JEN
	;		"1234567890123456789012"
	dc.b	"This is my Night 00",LF
	dc.b	"text.",ETX
DialogTextJenNight01:
DialogTextJenNight02:
DialogTextJenNight03:
DialogTextJenNight04:
DialogTextJenNight05:
	align 2
DialogTextJenNight06:
	dc.w	OBJ_NPC_JEN
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextGriffyNight00:
	dc.w	OBJ_NPC_GRIFFY
	;		"1234567890123456789012"
	dc.b	"This is my Night 00",LF
	dc.b	"text.",ETX
DialogTextGriffyNight01:
DialogTextGriffyNight02:
DialogTextGriffyNight03:
DialogTextGriffyNight04:
DialogTextGriffyNight05:
	align 2
DialogTextGriffyNight06:
	dc.w	OBJ_NPC_GRIFFY
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextScottNight00:
	dc.w	OBJ_NPC_SCOTT
	;		"1234567890123456789012"
	dc.b	"This is my Night 00",LF
	dc.b	"text.",ETX
DialogTextScottNight01:
DialogTextScottNight02:
DialogTextScottNight03:
DialogTextScottNight04:
DialogTextScottNight05:
	align 2
DialogTextScottNight06:
	dc.w	OBJ_NPC_SCOTT
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextToddNight00:
	dc.w	OBJ_NPC_TODD
	;		"1234567890123456789012"
	dc.b	"This is my Night 00",LF
	dc.b	"text.",ETX
DialogTextToddNight01:
DialogTextToddNight02:
DialogTextToddNight03:
DialogTextToddNight04:
DialogTextToddNight05:
	align 2
DialogTextToddNight06:
	dc.w	OBJ_NPC_TODD
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextElizaNight00:
	dc.w	OBJ_NPC_ELIZA
	;		"1234567890123456789012"
	dc.b	"This is my Night 00",LF
	dc.b	"text.",ETX
DialogTextElizaNight01:
DialogTextElizaNight02:
DialogTextElizaNight03:
DialogTextElizaNight04:
DialogTextElizaNight05:
	align 2
DialogTextElizaNight06:
	dc.w	OBJ_NPC_ELIZA
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextBeckyNight00:
	dc.w	OBJ_NPC_BECKY
	;		"1234567890123456789012"
	dc.b	"This is my Night 00",LF
	dc.b	"text.",ETX
DialogTextBeckyNight01:
DialogTextBeckyNight02:
DialogTextBeckyNight03:
DialogTextBeckyNight04:
DialogTextBeckyNight05:
	align 2
DialogTextBeckyNight06:
	dc.w	OBJ_NPC_BECKY
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextCharlesNight00:
DialogTextCharlesNight01:
DialogTextCharlesNight02:
DialogTextCharlesNight03:
DialogTextCharlesNight04:
DialogTextCharlesNight05:
	align 2
DialogTextCharlesNight06:
	dc.w	OBJ_NPC_CHARLES
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextRandyNight00:
	dc.w	OBJ_NPC_RANDY
	;		"1234567890123456789012"
	dc.b	"This is my Night 00",LF
	dc.b	"text.",ETX
DialogTextRandyNight01:
DialogTextRandyNight02:
DialogTextRandyNight03:
DialogTextRandyNight04:
DialogTextRandyNight05:
	align 2
DialogTextRandyNight06:
	dc.w	OBJ_NPC_RANDY
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextDBNight00:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"This is my Night 00",LF
	dc.b	"text.",ETX
DialogTextDBNight01:
DialogTextDBNight02:
DialogTextDBNight03:
DialogTextDBNight04:
DialogTextDBNight05:
	align 2
DialogTextDBNight06:
	dc.w	OBJ_NPC_DB
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextDaniNight00:
DialogTextDaniNight01:
DialogTextDaniNight02:
DialogTextDaniNight03:
DialogTextDaniNight04:
DialogTextDaniNight05:
	align 2
DialogTextDaniNight06:
	dc.w	OBJ_NPC_DANI
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextGuardNight00:
DialogTextGuardNight01:
DialogTextGuardNight02:
DialogTextGuardNight03:
DialogTextGuardNight04:
DialogTextGuardNight05:
	align 2
DialogTextGuardNight06:
	dc.w	OBJ_NPC_GUARD
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextBillyNight00:
DialogTextBillyNight01:
DialogTextBillyNight02:
DialogTextBillyNight03:
DialogTextBillyNight04:
DialogTextBillyNight05:
	align 2
DialogTextBillyNight06:
	dc.w	OBJ_NPC_BILLY
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextAlNight00:
DialogTextAlNight01:
DialogTextAlNight02:
DialogTextAlNight03:
DialogTextAlNight04:
DialogTextAlNight05:
	align 2
DialogTextAlNight06:
	dc.w	OBJ_NPC_AL
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextThomasNight00:
DialogTextThomasNight01:
DialogTextThomasNight02:
DialogTextThomasNight03:
DialogTextThomasNight04:
DialogTextThomasNight05:
	align 2
DialogTextThomasNight06:
	dc.w	OBJ_NPC_THOMAS
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextHeatherNight00:
DialogTextHeatherNight01:
DialogTextHeatherNight02:
DialogTextHeatherNight03:
DialogTextHeatherNight04:
DialogTextHeatherNight05:
	align 2
DialogTextHeatherNight06:
	dc.w	OBJ_NPC_HEATHER
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextGaryNight00:
DialogTextGaryNight01:
DialogTextGaryNight02:
DialogTextGaryNight03:
DialogTextGaryNight04:
DialogTextGaryNight05:
	align 2
DialogTextGaryNight06:
	dc.w	OBJ_NPC_GARY
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextGrantNight00:
DialogTextGrantNight01:
DialogTextGrantNight02:
DialogTextGrantNight03:
DialogTextGrantNight04:
DialogTextGrantNight05:
	align 2
DialogTextGrantNight06:
	dc.w	OBJ_NPC_GRANT
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextBrettNight00:
DialogTextBrettNight01:
DialogTextBrettNight02:
DialogTextBrettNight03:
DialogTextBrettNight04:
DialogTextBrettNight05:
	align 2
DialogTextBrettNight06:
	dc.w	OBJ_NPC_BRETT
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextNickyNight00:
DialogTextNickyNight01:
DialogTextNickyNight02:
DialogTextNickyNight03:
DialogTextNickyNight04:
DialogTextNickyNight05:
	align 2
DialogTextNickyNight06:
	dc.w	OBJ_NPC_NICKY
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextTanyaNight00:
DialogTextTanyaNight01:
DialogTextTanyaNight02:
DialogTextTanyaNight03:
DialogTextTanyaNight04:
DialogTextTanyaNight05:
	align 2
DialogTextTanyaNight06:
	dc.w	OBJ_NPC_TANYA
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextCraigNight00:
DialogTextCraigNight01:
DialogTextCraigNight02:
DialogTextCraigNight03:
DialogTextCraigNight04:
DialogTextCraigNight05:
	align 2
DialogTextCraigNight06:
	dc.w	OBJ_NPC_CRAIG
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextJuanNight00:
DialogTextJuanNight01:
DialogTextJuanNight02:
DialogTextJuanNight03:
DialogTextJuanNight04:
DialogTextJuanNight05:
	align 2
DialogTextJuanNight06:
	dc.w	OBJ_NPC_JUAN
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextLauraNight00:
DialogTextLauraNight01:
DialogTextLauraNight02:
DialogTextLauraNight03:
DialogTextLauraNight04:
DialogTextLauraNight05:
	align 2
DialogTextLauraNight06:
	dc.w	OBJ_NPC_LAURA
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextGinaNight00:
DialogTextGinaNight01:
DialogTextGinaNight02:
DialogTextGinaNight03:
DialogTextGinaNight04:
DialogTextGinaNight05:
	align 2
DialogTextGinaNight06:
	dc.w	OBJ_NPC_GINA
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextSantaNight00:
DialogTextSantaNight01:
DialogTextSantaNight02:
DialogTextSantaNight03:
DialogTextSantaNight04:
DialogTextSantaNight05:
	align 2
DialogTextSantaNight06:
	dc.w	OBJ_NPC_SANTA
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextLostGuyNight00:
DialogTextLostGuyNight01:
DialogTextLostGuyNight02:
DialogTextLostGuyNight03:
DialogTextLostGuyNight04:
DialogTextLostGuyNight05:
	align 2
DialogTextLostGuyNight06:
	dc.w	OBJ_NPC_LOSTGUY
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextRockerNight00:
DialogTextRockerNight01:
DialogTextRockerNight02:
DialogTextRockerNight03:
DialogTextRockerNight04:
DialogTextRockerNight05:
	align 2
DialogTextRockerNight06:
	dc.w	OBJ_NPC_ROCKER
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextShopperNight00:
DialogTextShopperNight01:
DialogTextShopperNight02:
DialogTextShopperNight03:
DialogTextShopperNight04:
DialogTextShopperNight05:
	align 2
DialogTextShopperNight06:
	dc.w	OBJ_NPC_SHOPPER
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextBusyMomNight00:
DialogTextBusyMomNight01:
DialogTextBusyMomNight02:
DialogTextBusyMomNight03:
DialogTextBusyMomNight04:
DialogTextBusyMomNight05:
	align 2
DialogTextBusyMomNight06:
	dc.w	OBJ_NPC_BUSYMOM
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextMallratNight00:
DialogTextMallratNight01:
DialogTextMallratNight02:
DialogTextMallratNight03:
DialogTextMallratNight04:
DialogTextMallratNight05:
	align 2
DialogTextMallratNight06:
	dc.w	OBJ_NPC_MALLRAT
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextPreppyNight00:
DialogTextPreppyNight01:
DialogTextPreppyNight02:
DialogTextPreppyNight03:
DialogTextPreppyNight04:
DialogTextPreppyNight05:
	align 2
DialogTextPreppyNight06:
	dc.w	OBJ_NPC_PREPPY
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextYuppieNight00:
DialogTextYuppieNight01:
DialogTextYuppieNight02:
DialogTextYuppieNight03:
DialogTextYuppieNight04:
DialogTextYuppieNight05:
	align 2
DialogTextYuppieNight06:
	dc.w	OBJ_NPC_YUPPIE
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextNelsonNight00:
DialogTextNelsonNight01:
DialogTextNelsonNight02:
DialogTextNelsonNight03:
DialogTextNelsonNight04:
DialogTextNelsonNight05:
	align 2
DialogTextNelsonNight06:
	dc.w	OBJ_NPC_NELSON
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextVictorNight00:
DialogTextVictorNight01:
DialogTextVictorNight02:
DialogTextVictorNight03:
DialogTextVictorNight04:
DialogTextVictorNight05:
	align 2
DialogTextVictorNight06:
	dc.w	OBJ_NPC_VICTOR
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

;-------------------------------------------------------------------------------
; menus
;-------------------------------------------------------------------------------
	align 2
NPCMenu:
	;		"1234567890123456789012"
	dc.b	"{Look  {Talk  {Give",ETX

	align 2
ObjectMenu:
	;		"1234567890123456789012"
	dc.b	"{Look  {Use   {Take",ETX

	align 2
ItemMenu:
	;		"1234567890123456789012"
	dc.b	"{",ITEMNAMESTART

;-------------------------------------------------------------------------------
; default object descriptions 
;-------------------------------------------------------------------------------
ObjectDescriptionDCMerch:
	;		"1234567890123456789012"
	dc.b	"The lastest fashions",LF
	dc.b	"neatly folded.",ETX

ObjectDescriptionVB8Bit:
	;		"1234567890123456789012"
	dc.b	"There must be over 100",LF
	dc.b	"Nintendo games here.",ETX

ObjectDescriptionVBMags:
	;		"1234567890123456789012"
	dc.b	"Below the counter are",LF
	dc.b	"various magazines.",ETX

ObjectDescriptionVBGen:
	;		"1234567890123456789012"
	dc.b	"Phantasy Star II looks",LF
	dc.b	"interesting.         ^",FF
	dc.b	"Is it really worth $70",LF
	dc.b	"though?",ETX

ObjectDescriptionVBTG:
	;		"1234567890123456789012"
	dc.b	"$400 to play Ys I&II?",LF
	dc.b	"It's still tempting.",ETX

ObjectDescriptionVBGB:
	;		"1234567890123456789012"
	dc.b	"This portable gaming",LF
	dc.b	"thing might take off.",ETX

ObjectDescriptionVBPC:
	;		"1234567890123456789012"
	dc.b	"PC games with over-",LF
	dc.b	"sized boxes.",ETX

ObjectDescriptionBench:
	;		"1234567890123456789012"
	dc.b	"It doesn't look very",LF
	dc.b	"comfortable.",ETX

ObjectDescriptionFCBFirepit:
	;		"1234567890123456789012"
	dc.b	"It doesn't look like",LF
	dc.b	"it was used recently.",ETX

ObjectDescriptionFCBTent:
	;		"1234567890123456789012"
	dc.b	"It looks kind of cozy",LF
	dc.b	"in there.",ETX

ObjectDescriptionFCBGunCase:
	;		"1234567890123456789012"
	dc.b	"They sell everything",LF
	dc.b	"at the mall now.",ETX

ObjectDescriptionFCBFishingPoles:
	;		"1234567890123456789012"
	dc.b	"Assorted fishing",LF
	dc.b	"poles.",ETX

ObjectDescriptionSVideoVideoWall:
	;		"1234567890123456789012"
	dc.b	"Hundreds of VHS tapes",LF
	dc.b	"line the wall.",ETX

ObjectDescriptionSVideoVideoRack:
	;		"1234567890123456789012"
	dc.b	"These appear to be the",LF
	dc.b	"new releases.",ETX

ObjectDescriptionMannequin:
	;		"1234567890123456789012"
	dc.b	"Why are you trying",LF
	dc.b	"to touch them?",ETX

ObjectDescriptionCheckersClothing:
	;		"1234567890123456789012"
	dc.b	"Stacks of folded",LF
	dc.b	"shirts & pants.",ETX

ObjectDescriptionCPlanetTapes:
	;		"1234567890123456789012"
	dc.b	"Hundreds of cassette",LF
	dc.b	"tapes by genre.",ETX

ObjectDescriptionCPlanetCDs:
	;		"1234567890123456789012"
	dc.b	"All the new music is",LF
	dc.b	"coming in these now.",ETX

ObjectDescriptionCavernArcade00:
	;		"1234567890123456789012"
	dc.b	"'Xenowave'",LF
	dc.b	"Defend the space     ^",FF
	dc.b	"colony from swarms of",LF
	dc.b	"hungry aliens.",ETX

ObjectDescriptionCavernArcade01:
	;		"1234567890123456789012"
	dc.b	"'Racin'",LF
	dc.b	"Featuring more       ^",FF
	dc.b	"polygons than any",LF
	dc.b	"other game.",ETX

ObjectDescriptionCavernArcade02:
	;		"1234567890123456789012"
	dc.b	"'Glorious Golf'",LF
	dc.b	"The most realistic   ^",FF
	dc.b	"golf simulator ever",LF
	dc.b	"made for 1-4 players.",ETX

ObjectDescriptionCavernArcade03:
	;		"1234567890123456789012"
	dc.b	"'Comic Book Man'",LF
	dc.b	"Save the fictional   ^",FF
	dc.b	"big city from the evil",LF
	dc.b	"clown brigade.",ETX

ObjectDescriptionCavernArcade04:
	;		"1234567890123456789012"
	dc.b	"'The Bash Show'",LF
	dc.b	"Bludgeon people with ^",FF
	dc.b	"household items and",LF
	dc.b	"win prizes.",ETX

ObjectDescriptionCavernArcade05:
	;		"1234567890123456789012"
	dc.b	"'Super Secret Agent'",LF
	dc.b	"A nuclear weapon has ^",FF
	dc.b	"been smuggled out of",LF
	dc.b	"Russia, go find it.",ETX

ObjectDescriptionCavernArcade06:
	;		"1234567890123456789012"
	dc.b	"'Mystical Duke'",LF
	dc.b	"Save the kingdom from^",FF
	dc.b	"the dark wizard and",LF
	dc.b	"his army of trolls.",ETX

ObjectDescriptionCavernArcade07:
	;		"1234567890123456789012"
	dc.b	"'Street Beat 3'",LF
	dc.b	"Your girlfriend has  ^",FF
	dc.b	"been kidnapped by",LF
	dc.b	"thugs & lowlifes.",ETX

ObjectDescriptionCavernArcade08:
	;		"1234567890123456789012"
	dc.b	"'DigiFigher'",LF
	dc.b	"Cutting-edge digital ^",FF
	dc.b	"graphics that look",LF
	dc.b	"totally real.",ETX

ObjectDescriptionPlant:
	;		"1234567890123456789012"
	dc.b	"It's hard to believe",LF
	dc.b	"this survives here.",ETX

ObjectDescriptionTBooksFiction:
	;		"1234567890123456789012"
	dc.b	"Just over 90% Stephen",LF
	dc.b	"King books.",ETX

ObjectDescriptionTBooksRomance:
	;		"1234567890123456789012"
	dc.b	"If you enjoy romance",LF
	dc.b	"books then check out ^",FF
	dc.b	"'Too Good Too Be Real'",LF
	dc.b	"by Melonie Johnson.  ^",FF
	dc.b	"Due in stores summer",LF
	dc.b	"2021.",ETX

ObjectDescriptionTBooksHistory:
	;		"1234567890123456789012"
	dc.b	"There might be a",LF
	dc.b	"useful reference here.",ETX

ObjectDescriptionTBooksCooking:
	;		"1234567890123456789012"
	dc.b	"Low-fat cooking seems",LF
	dc.b	"to be the hot fad.",ETX

ObjectDescriptionTrashCan:
	;		"1234567890123456789012"
	dc.b	"It looks really gross",LF
	dc.b	"in there.",ETX

ObjectDescriptionPogoDawgTable:
	;		"1234567890123456789012"
	dc.b	"This obviously hasn't",LF
	dc.b	"been cleaned recently.",ETX

ObjectDescriptionPogoDawgTrash:
	;		"1234567890123456789012"
	dc.b	"The customers here are",LF
	dc.b	"way too lazy.",ETX

ObjectDescriptionNShackCase:
	;		"1234567890123456789012"
	dc.b	"Display case with",LF
	dc.b	"fancy nut platters.",ETX

ObjectDescriptionNShackBarrel:
	;		"1234567890123456789012"
	dc.b	"Barrel of self-serve",LF
	dc.b	"nuts.",ETX

ObjectDescriptionTLodgeDisks:
	;		"1234567890123456789012"
	dc.b	"Computer disks in many",LF
	dc.b	"different formats.",ETX

ObjectDescriptionTLodgeRadios:
	;		"1234567890123456789012"
	dc.b	"Radios and cassette",LF
	dc.b	"player in many colors.",ETX

ObjectDescriptionTLodgeTVs:
	;		"1234567890123456789012"
	dc.b	"Portable TVs for",LF
	dc.b	"people on the go.",ETX

ObjectDescriptionTLodgeClocks:
	;		"1234567890123456789012"
	dc.b	"Several dozen styles",LF
	dc.b	"of alarm clocks.",ETX

ObjectDescriptionTLodgeVHS:
	;		"1234567890123456789012"
	dc.b	"Blank VHS tapes.",LF
	dc.b	"",ETX

ObjectDescriptionSHallPhone:
	;		"1234567890123456789012"
	dc.b	"Part of a phone number",LF
	dc.b	"is written here.",ETX

ObjectDescriptionCenterTree:
	;		"1234567890123456789012"
	dc.b	"Festive seasonal tree.",ETX

ObjectDescriptionCenterFireplace:
	;		"1234567890123456789012"
	dc.b	"It doesn't appear to",LF
	dc.b	"have a fire.",ETX

ObjectDescriptionEWHallTree:
	;		"1234567890123456789012"
	dc.b	"This is close to",LF
	dc.b	"hitting the ceiling.",ETX

ObjectDescriptionWWCheckoutLaserDiscs:
	;		"1234567890123456789012"
	dc.b	"LaserDisc movies for",LF
	dc.b	"trendy people.",ETX

ObjectDescriptionWWTVLargeTV:
	;		"1234567890123456789012"
	dc.b	"Oversized television.",ETX

ObjectDescriptionWWTVWall:
	;		"1234567890123456789012"
	dc.b	"Wall filled with",LF
	dc.b	"televisions.",ETX

ObjectDescriptionWWAudioWall:
	;		"1234567890123456789012"
	dc.b	"Car radios, some with",LF
	dc.b	"CD players.",ETX

ObjectDescriptionWWAudioWoodStereo:
	;		"1234567890123456789012"
	dc.b	"This must weigh well",LF
	dc.b	"over 100 pounds.",ETX

ObjectDescriptionWWAudioBlackStereo:
	;		"1234567890123456789012"
	dc.b	"Modern looking stereo.",ETX

ObjectDescriptionWWApplianceWall:
	;		"1234567890123456789012"
	dc.b	"Owning a home seems",LF
	dc.b	"expensive.",ETX

ObjectDescriptionWWApplianceFridge:
	;		"1234567890123456789012"
	dc.b	"Do I need to keep",LF
	dc.b	"anything cold?",ETX

ObjectDescriptionBasementBed:
	;		"1234567890123456789012"
	dc.b	"It looks like it's",LF
	dc.b	"been used recently.",ETX

ObjectDescriptionBasementLadder:
	;		"1234567890123456789012"
	dc.b	"This leads back to",LF
	dc.b	"the main floor.",ETX

ObjectDescriptionBasementCrate:
	;		"1234567890123456789012"
	dc.b	"Dusty old crate.",ETX

ObjectDescriptionCafeRack:
	;		"1234567890123456789012"
	dc.b	"Shelves with canned",LF
	dc.b	"food.",ETX

ObjectDescriptionCafeTable:
	;		"1234567890123456789012"
	dc.b	"Messy table, looks",LF
	dc.b	"recently used.",ETX

ObjectDescriptionBasementComputer1:
	;		"1234567890123456789012"
	dc.b	"There's a list of",LF
	dc.b	"locations in the mall^",FF
	dc.b	"and menus to control",LF
	dc.b	"the background music.",ETX

ObjectDescriptionBasementComputer2:
	;		"1234567890123456789012"
	dc.b	"It looks like this one",LF
	dc.b	"controls the climate.",ETX

ObjectDescriptionDeadArcadeGame:
	;		"1234567890123456789012"
	dc.b	"This is just good for",LF
	dc.b	"parts now.",ETX

ObjectDescriptionCavernBackroomLadder:
	;		"1234567890123456789012"
	dc.b	"This appears to lead",LF
	dc.b	"to a basement level.",ETX

;-------------------------------------------------------------------------------
; signs in stores
;-------------------------------------------------------------------------------
StoreSignFiction:
	dc.b	"Fiction",ETX

StoreSignRomance:
	dc.b	"Romance",ETX

StoreSignCooking:
	dc.b	"Cooking",ETX

StoreSignHistory:
	dc.b	"History",ETX

;-------------------------------------------------------------------------------
; item names and descriptions
; item names can be 16 characters
; item descriptions can be up to 7 lines of 18 characters
;-------------------------------------------------------------------------------
ItemNameNothing:
	;		"1234567890123456"
	dc.b	"(Nothing)",ITEMNAMEEND

ItemDescriptionNothing:
	;		"123456789012345678"
	dc.b	"A deep void in",LF
	dc.b	"your pocket that",LF
	dc.b	"yearns to be",LF
	dc.b	"filled.",ETX

ItemNameKeys:
	;		"1234567890123456"
	dc.b	"Store keys",ITEMNAMEEND

ItemDescriptionKeys:
	;		"123456789012345678"
	dc.b	"Oversized keyring",LF
	dc.b	"with keys to every",LF
	dc.b	"store. Earned over",LF
	dc.b	"the summer. These",LF
	dc.b	"allow entry to",LF
	dc.b	"stores after the",LF
	dc.b	"mall is closed.",ETX

;-------------------------------------------------------------------------------
; day intros
;-------------------------------------------------------------------------------
Day00IntroText:
	;		"1234567890123456789012345678901234567890"
	dc.b	"           November 18, 1990            ",ETX

Day00IntroTip0:
	;		"1234567890123456789012345678901234567890"
	dc.b	"D-Pad: Move Player,change menu selection",ETX

Day00IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"A button: Interact with people & objects",ETX

Day00IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"C button: Open the menu screen",ETX

Day00IntroTip3:
	;		"1234567890123456789012345678901234567890"
	dc.b	"A or C button: Confirm menu selection",ETX

Day00IntroTip4:
	;		"1234567890123456789012345678901234567890"
	dc.b	"B button: Cancel dialog, exit menu",ETX

Day00IntroTip5:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Z button: Hold for fast-forward",ETX

Day00IntroTip6:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Start: Pause, exit this screen",ETX

Day01IntroText:
	;		"1234567890123456789012345678901234567890"
	dc.b	"           November 23, 1990            ",ETX

Day01IntroTip0:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day01IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day01IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day01IntroTip3:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day01IntroTip4:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day01IntroTip5:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day01IntroTip6:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day02IntroText:
	;		"1234567890123456789012345678901234567890"
	dc.b	"           December 4, 1990             ",ETX

Day02IntroTip0:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day02IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day02IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day02IntroTip3:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day02IntroTip4:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day02IntroTip5:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day02IntroTip6:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day03IntroText:
	;		"1234567890123456789012345678901234567890"
	dc.b	"           December 16, 1990            ",ETX

Day03IntroTip0:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day03IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day03IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day03IntroTip3:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day03IntroTip4:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day03IntroTip5:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day03IntroTip6:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day04IntroText:
	;		"1234567890123456789012345678901234567890"
	dc.b	"           December 20, 1990            ",ETX

Day04IntroTip0:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day04IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day04IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day04IntroTip3:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day04IntroTip4:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day04IntroTip5:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day04IntroTip6:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day05IntroText:
	;		"1234567890123456789012345678901234567890"
	dc.b	"           December 24, 1990            ",ETX

Day05IntroTip0:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day05IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day05IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day05IntroTip3:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day05IntroTip4:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day05IntroTip5:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day05IntroTip6:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day06IntroText:
	;		"1234567890123456789012345678901234567890"
	dc.b	"           December 31, 1990            ",ETX

Day06IntroTip0:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Wow, thanks for playing this far!",ETX

Day06IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"It's the last day of the story.",ETX

Day06IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Don't forget to say bye to new friends.",ETX

Day06IntroTip3:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day06IntroTip4:
	;		"1234567890123456789012345678901234567890"
	dc.b	"There are three possible endings.",ETX

Day06IntroTip5:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day06IntroTip6:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

;-------------------------------------------------------------------------------
; menu screen
;-------------------------------------------------------------------------------
MenuScreenNavMap:
	dc.b	"{Map",ETX

MenuScreenNavStatus:
	dc.b	"{Status",ETX

MenuScreenNavData:
	dc.b	"{Data",ETX

MenuScreenNavHelp:
	dc.b	"{Help",ETX

StatusScreenSave:
	dc.b	"Save",ETX

StatusScreenLoad:
	dc.b	"Load",ETX

StatusScreenInventory:
	dc.b	"Inventory",ETX

;-------------------------------------------------------------------------------
; map menu
;-------------------------------------------------------------------------------

StatusScreenMapLegend:
	dc.b	"Legend",ETX

StatusScreenMapYouAreHere:
	dc.b	" = you are here",ETX

StatusScreenMapOptionalEvent:
	dc.b	" = optional event",ETX

StatusScreenMapStoryEvent:
	dc.b	" = story event",ETX

StatusScreenMapFastTravel:
	dc.b	"Fast Travel",ETX

StatusScreenMapFastTravel00:
	;		"12345678901234567"
	dc.b	"{West hall",ETX

StatusScreenMapFastTravel01:
	;		"12345678901234567"
	dc.b	"{East hall",ETX

StatusScreenMapFastTravel02:
	;		"12345678901234567"
	dc.b	"{Wire Warehouse",ETX

StatusScreenMapFastTravel03:
	;		"12345678901234567"
	dc.b	"{Information desk",ETX

StatusScreenMapFastTravel04:
	;		"12345678901234567"
	dc.b	"{The Cavern",ETX

StatusScreenMapFastTravel05:
	;		"12345678901234567"
	dc.b	"{Denim Country",ETX

StatusScreenMapFastTravel06:
	;		"12345678901234567"
	dc.b	"{ThoreauBooks",ETX

StatusScreenMapFastTravel07:
	;		"12345678901234567"
	dc.b	"{Mall exit",ETX

;-------------------------------------------------------------------------------
; help menu
;-------------------------------------------------------------------------------

StatusScreenHelpControls:
	;		"1234567890123456789012345678901234567890"
	dc.b	"                Controls                ",ETX

StatusScreenHelpTip6:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Start: Pause",ETX

StatusScreenHelpHints:
	;		"1234567890123456789012345678901234567890"
	dc.b	"                 Events                 ",ETX

StatusScreenHelpHints00:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Completing story events advances time.",ETX

StatusScreenHelpHints01:
	;		"1234567890123456789012345678901234567890"
	dc.b	"Optional events do not advance time but",ETX

StatusScreenHelpHints02:
	;		"1234567890123456789012345678901234567890"
	dc.b	"not all can be completed in one day.",ETX

;-------------------------------------------------------------------------------
; status screen objectives
;-------------------------------------------------------------------------------
StatusScreenDay00Objective00:
	;		"12345678901234567890123456789012345678"
	dc.b	"November 18, 1990: Evening",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"Help the customers in your store.",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"Use the A button to interact.",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"Press A to confirm a choice.",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"Press B to cancel a selection window.",LF
	;		"1234567890123456789012345678901234567"
	dc.b	" ",ETX

StatusScreenDay00Objective01:
StatusScreenDay00Objective02:
StatusScreenDay00Objective03:
StatusScreenDay00Objective04:
	;		"12345678901234567890123456789012345678"
	dc.b	"November 18, 1990: ",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"another line 0",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"another line 1",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"another line 2",ETX

StatusScreenDay01Objective00:
StatusScreenDay01Objective01:
StatusScreenDay01Objective02:
StatusScreenDay01Objective03:
StatusScreenDay01Objective04:
	;		"12345678901234567890123456789012345678"
	dc.b	"November 23, 1990: ",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"another line",ETX

StatusScreenDay02Objective00:
StatusScreenDay02Objective01:
StatusScreenDay02Objective02:
StatusScreenDay02Objective03:
StatusScreenDay02Objective04:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 4, 1990: ",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"another line",ETX

StatusScreenDay03Objective00:
StatusScreenDay03Objective01:
StatusScreenDay03Objective02:
StatusScreenDay03Objective03:
StatusScreenDay03Objective04:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 16, 1990: ",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"another line",ETX

StatusScreenDay04Objective00:
StatusScreenDay04Objective01:
StatusScreenDay04Objective02:
StatusScreenDay04Objective03:
StatusScreenDay04Objective04:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 20, 1990: ",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"another line",ETX

StatusScreenDay05Objective00:
StatusScreenDay05Objective01:
StatusScreenDay05Objective02:
StatusScreenDay05Objective03:
StatusScreenDay05Objective04:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 24, 1990: ",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"another line",ETX

StatusScreenDay06Objective00:
StatusScreenDay06Objective01:
StatusScreenDay06Objective02:
StatusScreenDay06Objective03:
StatusScreenDay06Objective04:
	;		"12345678901234567890123456789012345678"
	dc.b	"December 31, 1990: ",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"another line",ETX

;-------------------------------------------------------------------------------
; save game titles
;-------------------------------------------------------------------------------
SaveGameTitleDay00Objective00:
SaveGameTitleDay00Objective01:
SaveGameTitleDay00Objective02:
SaveGameTitleDay00Objective03:
SaveGameTitleDay00Objective04:
	;		"123456789012345678901"
	dc.b	"{November 18 (Night)",ETX

SaveGameTitleDay01Objective00:
SaveGameTitleDay01Objective01:
SaveGameTitleDay01Objective02:
SaveGameTitleDay01Objective03:
SaveGameTitleDay01Objective04:
	;		"123456789012345678901"
	dc.b	"{November 23 (Day)",ETX

SaveGameTitleDay02Objective00:
SaveGameTitleDay02Objective01:
SaveGameTitleDay02Objective02:
SaveGameTitleDay02Objective03:
SaveGameTitleDay02Objective04:
	;		"123456789012345678901"
	dc.b	"{December 4 (Day)",ETX

SaveGameTitleDay03Objective00:
SaveGameTitleDay03Objective01:
SaveGameTitleDay03Objective02:
SaveGameTitleDay03Objective03:
SaveGameTitleDay03Objective04:
	;		"123456789012345678901"
	dc.b	"{December 16 (Day)",ETX

SaveGameTitleDay04Objective00:
SaveGameTitleDay04Objective01:
SaveGameTitleDay04Objective02:
SaveGameTitleDay04Objective03:
SaveGameTitleDay04Objective04:
	;		"123456789012345678901"
	dc.b	"{December 20 (Day)",ETX
	
SaveGameTitleDay05Objective00:
SaveGameTitleDay05Objective01:
SaveGameTitleDay05Objective02:
SaveGameTitleDay05Objective03:
SaveGameTitleDay05Objective04:
	;		"123456789012345678901"
	dc.b	"{December 24 (Day)",ETX

SaveGameTitleDay06Objective00:
SaveGameTitleDay06Objective01:
SaveGameTitleDay06Objective02:
SaveGameTitleDay06Objective03:
SaveGameTitleDay06Objective04:
	;		"123456789012345678901"
	dc.b	"{December 31 (Day)",ETX
	
StatusScreenEmptySave:
	;		"123456789012345678901"
	dc.b	"{(empty)             ",ETX

StatusScreenDefaultSave:
	dc.b	"{",ETX

StatusScreenSaveDialog:
	dc.b	"Saved",ETX

LoadScreenCaption:
	;		"123456789012345678901"
	dc.b	"Select game to load",ETX

LoadScreenHelp0:
	dc.b	"Press Start to load game",ETX

LoadScreenHelp1:
	dc.b	"Press B to cancel",ETX

;-------------------------------------------------------------------------------
; store names
;-------------------------------------------------------------------------------
StoreName00:
	;		"1234567890123456"
	dc.b	"Video Buffet",ETX

StoreName01:
	;		"1234567890123456"
	dc.b	"Cassette Planet",ETX

StoreName02:
	;		"1234567890123456"
	dc.b	"ThoreauBooks",ETX

StoreName03:
	;		"1234567890123456"
	dc.b	"ClothesNow",ETX

StoreName04:
	;		"1234567890123456"
	dc.b	"Pogo Dawg",ETX

StoreName05:
	;		"1234567890123456"
	dc.b	"Nut Shack",ETX

StoreName06:
	;		"1234567890123456"
	dc.b	"Checkers",ETX

StoreName07:
	;		"1234567890123456"
	dc.b	"The Cavern",ETX

StoreName08:
	;		"1234567890123456"
	dc.b	"Denim Country",ETX

StoreName09:
	;		"1234567890123456"
	dc.b	"Transistor Lodge",ETX

StoreName0A:
	;		"1234567890123456"
	dc.b	"Sunset Video",ETX

StoreName0B:
	;		"1234567890123456"
	dc.b	"Fish or Cut Bait",ETX

StoreName0C:
	;		"1234567890123456"
	dc.b	"Santa's Workshop",ETX

;-------------------------------------------------------------------------------
; legal screen text
;-------------------------------------------------------------------------------

LegalScreenLine00:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX
LegalScreenLine01:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX
LegalScreenLine02:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX
LegalScreenLine03:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX
LegalScreenLine04:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX
LegalScreenLine05:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX
LegalScreenLine06:
	;		"12345678901234567890123456789012345678"
	dc.b	"           Retail Clerk '90           ",ETX
LegalScreenLine07:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX
LegalScreenLine08:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX
LegalScreenLine09:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX
LegalScreenLine10:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX
LegalScreenLine11:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX
LegalScreenLine12:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX
LegalScreenLine13:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX
LegalScreenLine14:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX
LegalScreenLine15:
	;		"12345678901234567890123456789012345678"
	dc.b	" Copyright (c) 2019-2021",ETX
LegalScreenLine16:
	;		"12345678901234567890123456789012345678"
	dc.b	" Hugues Johnson (HuguesJohnson.com)",ETX
LegalScreenLine17:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX
LegalScreenLine18:
	;		"12345678901234567890123456789012345678"
	dc.b	" This demo is not licensed by Sega.",ETX
LegalScreenLine19:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX
LegalScreenLine20:
	;		"12345678901234567890123456789012345678"
	dc.b	" There is no relationship between the",ETX
LegalScreenLine21:
	;		"12345678901234567890123456789012345678"
	dc.b	" author of this demo and Sega.",ETX
LegalScreenLine22:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX
LegalScreenLine23:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX
LegalScreenLine24:
	;		"12345678901234567890123456789012345678"
	dc.b	" Inspired by '90s malls and culture.",ETX
LegalScreenLine25:
	;		"12345678901234567890123456789012345678"
	dc.b	" However.. all events, characters,",ETX
LegalScreenLine26:
	;		"12345678901234567890123456789012345678"
	dc.b	" and places are purely fictitious.",ETX
LegalScreenLine27:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX

;-------------------------------------------------------------------------------
; end
;-------------------------------------------------------------------------------
	align 2
