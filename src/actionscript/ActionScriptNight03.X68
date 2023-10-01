;*******************************************************************************
; Night 3 is Day 7 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_TLODGE
;*******************************************************************************
ActionScriptNight03TLodgeInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[ScriptedEventNight03_01_TLodge]
;[set FLAG_NIGHT03_EVENT00_TLodge]

	rts		

;*******************************************************************************
; SCENE_ID_CNOW
;*******************************************************************************
ActionScriptNight03CNowInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;Different text based on whether or not you saw the dialog with Victor FLAG_GLOBAL_Victor1204]
;[ScriptedEventNight03_02_CNow]
;[ScriptedEventNight03_02_CNowAlt]
;Set [FLAG_NIGHT03_EVENT01_CNow]
;
;After each check if [FLAG_NIGHT03_EVENT00_TLodge] and [FLAG_NIGHT03_EVENT01_CNow] are set, if so
;[Set objective to OBJECTIVE_D03_O04_CheckIn]
;[Set story event at NShack]

	rts		

;*******************************************************************************
; SCENE_ID_SHALL
;*******************************************************************************
ActionScriptNight03SHallExit:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; Blocked from entering Nut Shack until [FLAG_NIGHT03_EVENT00_TLodge] and [FLAG_NIGHT03_EVENT01_CNow] are set
; Blocked from exiting until [FLAG_NIGHT03_EVENT02_NShack]

	rts	
	
;*******************************************************************************
; SCENE_ID_NSHACK
;*******************************************************************************
ActionScriptNight03NShackInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[Story event at NShack - "hey, you're late dialog" "there are these two strange guys I ran into after hours - don't know if they're connected"]
;[ScriptedEventNight03_03_NShack]
;[set FLAG_NIGHT03_EVENT02_NShack]
;[set story event at South Hall or parking lot after]

	rts		

;*******************************************************************************
; SCENE_ID_CPLANET
;*******************************************************************************
ActionScriptNight03CPlanetInteract:	
	bsr.w ShowDefaultText

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	rts		

ActionScriptNight03CPlanetRespond:	
	bsr.w ShowDefaultText
	rts
	
;*******************************************************************************
; SCENE_ID_WWAPPLIANCES
;*******************************************************************************
ActionScriptNight03WWAppliancesInteract:	
	bsr.w ShowDefaultText

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	rts		

ActionScriptNight03WWAppliancesRespond:	
	bsr.w ShowDefaultText
	rts		
