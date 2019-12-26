;-------------------------------------------------------------------------------
; mall locations
;-------------------------------------------------------------------------------
SCENE_ID_VB=$0000
SCENE_ID_WWHALL=$0001
SCENE_ID_WEHALL=$0002
SCENE_ID_CENTER=$0003
SCENE_ID_SHALL=$0004
SCENE_ID_PARKINGLOT=$0005
SCENE_ID_EWHALL=$0006
SCENE_ID_EEHALL=$0007
SCENE_ID_DENIMCOUNTRY=$0008
SCENE_ID_CHECKERS=$0009
SCENE_ID_TLODGE=$000A
SCENE_ID_CAVERN=$000B
SCENE_ID_SVIDEO=$000C
SCENE_ID_WORKSHOP=$000D
SCENE_ID_NSHACK=$000E
SCENE_ID_POGODAWG=$000F
SCENE_ID_CPLANET=$0010
SCENE_ID_CNOW=$0011
SCENE_ID_TBOOKS=$0012
SCENE_ID_FCBCHECKOUT=$0013
SCENE_ID_FCBFIREARMS=$0014
SCENE_ID_FCBFISHING=$0015
SCENE_ID_FCBCAMPING=$0016
SCENE_ID_SOUTH_CENTER=$0017
SCENE_ID_WWCHECKOUT=$0018
SCENE_ID_WWTV=$0019
SCENE_ID_WWAUDIO=$001A
SCENE_ID_WWAPPLIANCES=$001B
SCENE_ID_BASEMENTWDORM=$001C
SCENE_ID_BASEMENTMDORM=$001D
SCENE_ID_BASEMENTCAFE=$001E
SCENE_ID_BASEMENTOFFICE=$001F
MAX_STORE_ID=SCENE_ID_BASEMENTOFFICE

;-------------------------------------------------------------------------------
; scenes used in cut-scenes
;-------------------------------------------------------------------------------

;-------------------------------------------------------------------------------
; credits scenes
;-------------------------------------------------------------------------------
SCENE_ID_CREDITS=$0020

;-------------------------------------------------------------------------------
; day transition screens
;-------------------------------------------------------------------------------
SCENE_ID_INTRO_DAY00=$0E00

;-------------------------------------------------------------------------------
; title & end screen
;-------------------------------------------------------------------------------
	if	_DEBUG_
SCENE_ID_DEBUGMENU=$0FF0
	endif
SCENE_ID_LOAD=$0FFC
SCENE_ID_LEGAL=$0FFD
SCENE_ID_END=$0FFE
SCENE_ID_TITLE=$0FFF
