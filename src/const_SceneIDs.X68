;-------------------------------------------------------------------------------
; mall locations
;-------------------------------------------------------------------------------
SCENE_ID_VB=$0000
SCENE_ID_WWHALL=$0001
SCENE_ID_WEHALL=$0002
SCENE_ID_CENTER=$0003
SCENE_ID_SHALL=$0004
SCENE_ID_CAVERN_BACKROOM=$0005
SCENE_ID_EWHALL=$0006
SCENE_ID_EEHALL=$0007
SCENE_ID_DENIMCOUNTRY=$0008
SCENE_ID_CHECKERS=$0009
SCENE_ID_TLODGE=$000A
SCENE_ID_CAVERN=$000B
SCENE_ID_SVIDEO=$000C
SCENE_ID_NSHACK=$000D
SCENE_ID_POGODAWG=$000E
SCENE_ID_CPLANET=$000F
SCENE_ID_CNOW=$0010
SCENE_ID_TBOOKS=$0011
SCENE_ID_FCBCHECKOUT=$0012
SCENE_ID_FCBFIREARMS=$0013
SCENE_ID_FCBFISHING=$0014
SCENE_ID_FCBCAMPING=$0015
SCENE_ID_SOUTH_CENTER=$0016
SCENE_ID_WWCHECKOUT=$0017
SCENE_ID_WWTV=$0018
SCENE_ID_WWAUDIO=$0019
SCENE_ID_WWAPPLIANCES=$001A
SCENE_ID_BASEMENTWDORM=$001B
SCENE_ID_BASEMENTMDORM=$001C
SCENE_ID_BASEMENTCAFE=$001D
SCENE_ID_BASEMENTOFFICE=$001E
MAX_STORE_ID=SCENE_ID_BASEMENTOFFICE

;-------------------------------------------------------------------------------
; credits scenes
;-------------------------------------------------------------------------------
SCENE_ID_ENDING_BAD0=$001F
SCENE_ID_ENDING_BAD1=$0020
SCENE_ID_ENDING_BAD2=$0021
SCENE_ID_ENDING_BAD3=$0022
SCENE_ID_ENDING_GOOD0=$0023
SCENE_ID_ENDING_GOOD1=$0024
SCENE_ID_ENDING_GOOD2=$0025
SCENE_ID_ENDING_GOOD3=$0026
SCENE_ID_ENDING_PERFECT0=$0027

;-------------------------------------------------------------------------------
; scenes used in cut-scenes
;-------------------------------------------------------------------------------
SCENE_ID_DREAM=$0028

;-------------------------------------------------------------------------------
; day transition screens
;-------------------------------------------------------------------------------
SCENE_ID_INTRO_DAY00=$0E00
SCENE_ID_INTRO_DAY01=$0E01
SCENE_ID_INTRO_DAY02=$0E02
SCENE_ID_INTRO_DAY03=$0E03
SCENE_ID_INTRO_DAY04=$0E04
SCENE_ID_INTRO_DAY05=$0E05
SCENE_ID_INTRO_DAY06=$0E06

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
