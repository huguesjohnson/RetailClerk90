;-------------------------------------------------------------------------------
; character constants
;-------------------------------------------------------------------------------
LF=$0A	; '\n' - used to break text into multiple lines
FF=$0C	; form feed - used to break text into pages
FFR=$0D	; form feed & reset dialog style
ETX=$03	; end of text
OBJNAMEEND=$1E	; end of object name
NPCNAMEEND=$1F	; end of NPC name
ITEMNAMESTART=$1C	; indicator to draw the next item name
ITEMNAMEEND=$1D	; end of item name
CHAR_DQUOTE=$22	; ACSII code for double quote character

;-------------------------------------------------------------------------------
; title screen
;-------------------------------------------------------------------------------
TitleScreenTextNewGame:
	dc.b	"{New Game",ETX

TitleScreenTextLoadGame:
	dc.b	"{Load Game",ETX

	if _DEBUG_

TitleScreenTextDebug:
	dc.b	"{Debug",ETX

TitleScreenTextFooter:
	;		"12345678901234567890123456789012345678"
	dc.b	"       Placeholder Title Screen",ETX

	else

TitleScreenTextFooter:
	;		"12345678901234567890123456789012345678"
	dc.b	"       Placeholder Title Screen",ETX
	endif

	if _DEBUG_

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

	endif

;-------------------------------------------------------------------------------
; credits and end screen
;-------------------------------------------------------------------------------
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
	dc.b	"Echo Sound Driver by Javier Degirolmo",ETX

CreditsScreen00Line07:
	;		"12345678901234567890123456789012345678"
	dc.b	"               Graphics               ",ETX

CreditsScreen00Line08:
	;		"12345678901234567890123456789012345678"
	dc.b	"Logo font based on Audiowide",ETX

CreditsScreen00Line09:
	;		"12345678901234567890123456789012345678"
	dc.b	"Copyright (c) 2012 Brian J Bonislawsky",ETX

CreditsScreen00Line0B:
	;		"12345678901234567890123456789012345678"
	dc.b	"Some scenery is based on tilesets",ETX

CreditsScreen00Line0C:
	;		"12345678901234567890123456789012345678"
	dc.b	"created by Sithjester",ETX

CreditsScreen00Line0D:
	;		"12345678901234567890123456789012345678"
	dc.b	"untamed.wild-refuge.net/rpgxp.php",ETX

CreditsScreen00Line0E:
	;		"12345678901234567890123456789012345678"
	dc.b	" ",ETX

CreditsScreen00Line0F:
	;		"12345678901234567890123456789012345678"
	dc.b	" ",ETX


CreditsScreen00Line10:
	;		"12345678901234567890123456789012345678"
	dc.b	" ",ETX

CreditsScreen00Line11:
	;		"12345678901234567890123456789012345678"
	dc.b	"                Music                 ",ETX

CreditsScreen00Line12:
	;		"12345678901234567890123456789012345678"
	dc.b	"Soundtrack contains conversions of",ETX

CreditsScreen00Line13:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX

CreditsScreen00Line14:
	;		"12345678901234567890123456789012345678"
	dc.b	"",ETX

CreditsScreen00Line19:
	;		"12345678901234567890123456789012345678"
	dc.b	" ",ETX

CreditsScreen00Line1A:
	;		"12345678901234567890123456789012345678"
	dc.b	" ",ETX

CreditsScreen00Line1B:
	;		"12345678901234567890123456789012345678"
	dc.b	"See CREDITS & LICENSE for details",ETX

LegalScreenLine00BadEnding:
	;		"12345678901234567890123456789012345678"
	dc.b	"    Retail Clerk '90 - Bad Ending     ",ETX

LegalScreenLine00GoodEnding:
	;		"12345678901234567890123456789012345678"
	dc.b	"    Retail Clerk '90 - Good Ending    ",ETX

LegalScreenLine00PerfectEnding:
	;		"12345678901234567890123456789012345678"
	dc.b	"  Retail Clerk '90 - Perfect Ending   ",ETX

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
DialogTextHiddenHJDay00:
DialogTextHiddenHJDay01:
DialogTextHiddenHJDay02:
DialogTextHiddenHJDay03:
DialogTextHiddenHJDay04:
DialogTextHiddenHJDay05:
	align 2
DialogTextHiddenHJDay06:
	dc.w	OBJ_NPC_HIDDENHJ
	;		"1234567890123456789012"
	dc.b	"This is my default",LF
	dc.b	"text.",ETX

	align 2
DialogTextHiddenMJDay00:
DialogTextHiddenMJDay01:
DialogTextHiddenMJDay02:
DialogTextHiddenMJDay03:
DialogTextHiddenMJDay04:
DialogTextHiddenMJDay05:
	align 2
DialogTextHiddenMJDay06:
	dc.w	OBJ_NPC_HIDDENMJ
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
;-------------------------------------------------------------------------------
ItemNameNothing:
	;		"1234567890"
	dc.b	"Nothing",ITEMNAMEEND

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
	dc.b	"",ETX

Day06IntroTip1:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day06IntroTip2:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day06IntroTip3:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

Day06IntroTip4:
	;		"1234567890123456789012345678901234567890"
	dc.b	"",ETX

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

StatusScreenInventory:
	dc.b	"Inventory",ETX

StatusScreenSave:
	dc.b	"Save",ETX

StatusScreenStoreKeys:
	dc.b	"Store keys",ETX

StatusScreenYouAreHere:
	dc.b	" = you are here",ETX

StatusScreenDay00Objective00:
	;		"12345678901234567890123456789012345678"
	dc.b	"November 19, 1989: Your first day",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"1) Help the customer who won't leave",LF
	;		"1234567890123456789012345678901234567"
	dc.b	"2) Go home",ETX

;-------------------------------------------------------------------------------
; save game titles
;-------------------------------------------------------------------------------
SaveGameTitleD0O0:
	;		"123456789012345678901"
	dc.b	"November 19 (Evening)",ETX
	
StatusScreenEmptySave:
	;		"123456789012345678901"
	dc.b	"(empty)              ",ETX

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
	dc.b	"           Retail Clerk '90           ",ETX
LegalScreenLine01:
	;		"12345678901234567890123456789012345678"
	dc.b	"Copyright (c) 2019-2020 Hugues Johnson",ETX
LegalScreenLine02:
	;		"12345678901234567890123456789012345678"
	dc.b	"This demo is not licensed by Sega     ",ETX
LegalScreenLine03:
	;		"12345678901234567890123456789012345678"
	dc.b	"There is no relationship between the  ",ETX
LegalScreenLine04:
	;		"12345678901234567890123456789012345678"
	dc.b	"author of this demo and Sega          ",ETX
LegalScreenLine05:
	;		"12345678901234567890123456789012345678"
	dc.b	"This demo uses the Echo Sound Driver  ",ETX
LegalScreenLine06:
	;		"12345678901234567890123456789012345678"
	dc.b	"Copyright (c) 2010-2019               ",ETX
LegalScreenLine07:
	;		"12345678901234567890123456789012345678"
	dc.b	"Javier Degirolmo (sikthehedgehog)     ",ETX
LegalScreenLine08:
	;		"12345678901234567890123456789012345678"
	dc.b	"Inspired by '90s malls but all events,",ETX
LegalScreenLine09:
	;		"12345678901234567890123456789012345678"
	dc.b	"characters, and places are fictitious ",ETX

;-------------------------------------------------------------------------------
; end
;-------------------------------------------------------------------------------
	align 2
