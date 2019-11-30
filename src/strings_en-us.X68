;*******************************************************************************
; There's a 0.000001% chance this will ever be translated to another language.
; (Almost) All the game text is in one file to make it easier if that happens.
;
; The best way to go about it is:
;  1) Copy this file and rename it to 'string_[locale].X68'
;  2) Painfully change all the text
;  3) Not rename any of the labels
;  4) Change the include path in the main file
;  5) Change version in init_Header to avoid confusion
;  6) Rebuild
;
; Things that will make translations difficult:
;  1) In the overhead view, the dialog displays a fixed 22 chars per row
;  2) Game font only includes ASCII, unused chars could be re-purposed though
;  3) The game logo text is not in this file
;  4) Character & item names are also restricted to small values
;
; The second item is the one I feel worst about..
; It makes adding non-English characters a complete nightmare.
; Another option would be extending the dialog font but that has issues too..
; Hint: If you try doing that also make sure to update DIALOG_BASE_TILE.
;
; Yes, this script was written by a native English speaker.
; I know that is very difficult to believe.
;*******************************************************************************

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
	dc.b	"New Game",ETX

TitleScreenTextLoadGame:
	dc.b	"Load Game",ETX

	if _DEBUG_

TitleScreenTextDebug:
	dc.b	"Debug",ETX

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

;	DebugScreenLine00:
;	;		"12345678901234567890123456789012345678"
;	dc.b	"Debug starting scene                  ",ETX


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

CreditsScreen00Line04:
	;		"12345678901234567890123456789012345678"
	dc.b	"Some code is based on examples by ",ETX

CreditsScreen00Line05:
	;		"12345678901234567890123456789012345678"
	dc.b	"Matt Phillips (tanglewoodgame.com)",ETX

CreditsScreen00Line06:
	;		"12345678901234567890123456789012345678"
	dc.b	" ",ETX

CreditsScreen00Line07:
	;		"12345678901234567890123456789012345678"
	dc.b	"               Graphics               ",ETX

CreditsScreen00Line08:
	;		"12345678901234567890123456789012345678"
	dc.b	"Title screen font based on Audiowide",ETX

CreditsScreen00Line09:
	;		"12345678901234567890123456789012345678"
	dc.b	"Copyright (c) 2012 Brian J Bonislawsky",ETX

CreditsScreen00Line0A:
	;		"12345678901234567890123456789012345678"
	dc.b	"Dialog & menu font based on",ETX

CreditsScreen00Line0B:
	;		"12345678901234567890123456789012345678"
	dc.b	"Deathwake font by Zee-3",ETX

CreditsScreen00Line0C:
	;		"12345678901234567890123456789012345678"
	dc.b	"Santa sign is based on Tragic Marker",ETX

CreditsScreen00Line0D:
	;		"12345678901234567890123456789012345678"
	dc.b	"Copyright (c) 2016 Missy Meyer",ETX

CreditsScreen00Line0E:
	;		"12345678901234567890123456789012345678"
	dc.b	"Some scenery is based on tilesets",ETX

CreditsScreen00Line0F:
	;		"12345678901234567890123456789012345678"
	dc.b	"created by Sithjester",ETX

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
	dc.b	"Chip Overture, The Radix Point, and",ETX

CreditsScreen00Line14:
	;		"12345678901234567890123456789012345678"
	dc.b	"October Chip by Drozerix",ETX

CreditsScreen00Line15:
	;		"12345678901234567890123456789012345678"
	dc.b	"All under Public Domain license",ETX

CreditsScreen00Line16:
	;		"12345678901234567890123456789012345678"
	dc.b	"Soundtrack contains a conversion of",ETX

CreditsScreen00Line17:
	;		"12345678901234567890123456789012345678"
	dc.b	"The Spirit of Mods by Blurry",ETX

CreditsScreen00Line18:
	;		"12345678901234567890123456789012345678"
	dc.b	"Under Attribution Share Alike license",ETX

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
	dc.b	"    Retail Clerk '89 - Bad Ending     ",ETX

LegalScreenLine00GoodEnding:
	;		"12345678901234567890123456789012345678"
	dc.b	"    Retail Clerk '89 - Good Ending    ",ETX

LegalScreenLine00PerfectEnding:
	;		"12345678901234567890123456789012345678"
	dc.b	"  Retail Clerk '89 - Perfect Ending   ",ETX

;-------------------------------------------------------------------------------
; general messages
;-------------------------------------------------------------------------------
DialogTextNothing:
	;		"1234567890123456789012"
	dc.b	"There's nothing very",LF
	dc.b	"interesting here.",ETX

DialogTextNoItems:
	;		"1234567890123456789012"
	dc.b	"You aren't carrying",LF
	dc.b	"anything right now.",ETX

DialogTextNothingHappens:
	;		"1234567890123456789012"
	dc.b	"Nothing happens.",ETX

DialogTextCantTake:
	;		"1234567890123456789012"
	dc.b	"You can't take this.",ETX

DialogTextCantLeaveStoreUnattended:
	;		"1234567890123456789012"
	dc.b	"You can't leave the",LF
	dc.b	"store unattended.",ETX

DialogTextStoreClosed:
	;		"1234567890123456789012"
	dc.b	"They are closed for ",LF
	dc.b	"the night.           ^",FF
	dc.b	"Maybe if you had a key",LF
	dc.b	"to the store...",ETX


;-------------------------------------------------------------------------------
; information desk
;-------------------------------------------------------------------------------

;	align 2
;DialogTextInfoDeskDay00R0:	; mall news
;	dc.w	OBJ_NPC_CENTER_STAFF
;	;		"1234567890123456789012"
;	dc.b	"Santa's Workshop",LF
;	dc.b	"opened this morning. ^",FF
;	dc.b	"It was already very",LF
;	dc.b	"busy there today.",ETX

;	align 2
;DialogTextInfoDeskDay00R1:	; events
;	dc.w	OBJ_NPC_CENTER_STAFF
;	;		"1234567890123456789012"
;	dc.b	"The mall opens at 6:00",LF
;	dc.b	"AM on Black Friday!",ETX

;	align 2
;DialogTextInfoDeskDay00R2:	; store news
;	dc.w	OBJ_NPC_CENTER_STAFF
;	;		"1234567890123456789012"
;	dc.b	"We now have a Fish or",LF
;	dc.b	"Cut Bait store.      ^",FF
;	dc.b	"All their employees",LF
;	dc.b	"dress as lumberjacks.",ETX

;	align 2
;DialogTextInfoDeskDay00R3:	; rumors
;	dc.w	OBJ_NPC_CENTER_STAFF
;	;		"1234567890123456789012"
;	dc.b	"I really shouldn't",LF
;	dc.b	"tell you this but..  ^",FF
;	dc.b	"One store isn't doing",LF
;	dc.b	"well & might close.  ^",FF
;	dc.b	"It might happen at the",LF
;	dc.b	"end of the year.",ETX


;-------------------------------------------------------------------------------
; radio stations
;-------------------------------------------------------------------------------

;DialogTextRadioDay00R0:	; WNWT (news and weather)
;DialogTextRadioDay00R1:	; WOCX (talk radio)
;DialogTextRadioDay00R2:	; WCAS (top 40)
;DialogTextRadioDay00R3:	; WVVX (hair metal)


;-------------------------------------------------------------------------------
; default object descriptions
;-------------------------------------------------------------------------------
;DialogText8Bit:
;	;		"1234567890123456789012"
;	dc.b	"The shelves are lined",LF
;	dc.b	"with 8-bit games.",ETX

;-------------------------------------------------------------------------------
; default NPC descriptions
;-------------------------------------------------------------------------------
;DialogTextMaleShopper00DefaultLook:
;	;		"1234567890123456789012"
;	dc.b	"He has been browsing",LF
;	dc.b	"for over an hour now.",ETX


;-------------------------------------------------------------------------------
; default NPC talk responses
;-------------------------------------------------------------------------------
;	align 2
;DialogTextGreenbergDefaultTalk:
;	dc.w	OBJ_NPC_GREENBERG
;	;		"1234567890123456789012"
;	dc.b	"Did you see the new",LF
;	dc.b	"games that came in?",ETX

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

;	align 2
;InfoDeskMenu:
;	dc.w	OBJ_NPC_CENTER_STAFF
;	;		"{1234567890{1234567890"	
;	dc.b	"What do you want to",LF
;	dc.b	"know about today?    ^",FFR
;	dc.b	"{Mall news {Store news",LF
;	dc.b	"{Events    {Rumors",ETX

	align 2
RadioMenu:
	;		"{1234567890{1234567890"	
	dc.b	"{WNWT      {WCAS",LF
	dc.b	"{WOCX      {WVVX",ETX

;-------------------------------------------------------------------------------
; take menus and messages
;-------------------------------------------------------------------------------
TakeMenuItemTaken:
	;		"1234567890123456789012"
	dc.b	"Taken.",ETX

TakeMenuAlreadyCarrying:
	;		"1234567890123456789012"
	dc.b	"You're already",LF
	dc.b	"carrying one.",ETX

TakeMenuFull:
	;		"1234567890123456789012"
	dc.b	"You can't carry any",LF
	dc.b	"more items.",ETX

;-------------------------------------------------------------------------------
; default give messages
;-------------------------------------------------------------------------------
;	align 2
;DialogTextDaniDefaultGive:
;	dc.w	OBJ_NPC_DANI
;	;		"1234567890123456789012"
;	dc.b	"Yeah, whatever.",ETX

;-------------------------------------------------------------------------------
; object names
;-------------------------------------------------------------------------------
;ObjectName8Bit:
;	dc.b	"Wall of 8-bit games",OBJNAMEEND

;-------------------------------------------------------------------------------
; npc names
;-------------------------------------------------------------------------------
;NPCNameUnknown:
	;		"1234567890123456789012"
;	dc.b	"????",NPCNAMEEND

;-------------------------------------------------------------------------------
; item names and descriptions
;-------------------------------------------------------------------------------
ItemNameNothing:
	;		"1234567890"
	dc.b	"Nothing",ITEMNAMEEND

;-------------------------------------------------------------------------------
; day intros
;-------------------------------------------------------------------------------
;Day00IntroText:
;	;		"1234567890123456789012345678901234567890"
;	dc.b	"           November 19, 1989            ",ETX

;-------------------------------------------------------------------------------
; status screen
;-------------------------------------------------------------------------------
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
