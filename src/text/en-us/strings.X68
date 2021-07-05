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


;ItemDescriptionNothing:
;	;		"123456789012345678"
;	dc.b	"A deep void in",LF
;	dc.b	"your pocket that",LF
;	dc.b	"yearns to be",LF
;	dc.b	"filled.",ETX


;ItemDescriptionKeys:
;	;		"123456789012345678"
;	dc.b	"Oversized keyring",LF
;	dc.b	"with keys to every",LF
;	dc.b	"store. Earned over",LF
;	dc.b	"the summer. These",LF
;	dc.b	"allow entry to",LF
;	dc.b	"stores after the",LF
;	dc.b	"mall is closed.",ETX

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
