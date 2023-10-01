;*******************************************************************************
; Day 3 is Day 6 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_POGODAWG
;*******************************************************************************
ActionScriptDay03PogoDawgInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[ScriptedEventDay03_01_PogoDawg]
;[set FLAG_DAY03_EVENT00_PogoDawg]
;[Set objective to OBJECTIVE_D03_O01_DeliverLunches]
;
;Need to check for FLAG_DAY03_EVENT03_LunchesDelivered
;[ScriptedEventDay03_05_PogoDawg]
;[Set FLAG_DAY03_EVENT04_Done]
;[Set objective to OBJECTIVE_D03_O02_ReportBack]

	rts		

;*******************************************************************************
; SCENE_ID_CHECKERS
;*******************************************************************************
ActionScriptDay03CheckersInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[ScriptedEventDay03_02_Checkers]
;[set FLAG_DAY03_EVENT01_Checkers]

	rts		

;*******************************************************************************
; SCENE_ID_CNOW
;*******************************************************************************
ActionScriptDay03CNowInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[ScriptedEventDay03_03_ClothesNow]
;[set FLAG_DAY03_EVENT02_ClothesNow]
;
;After both [FLAG_DAY03_EVENT01_Checkers] and [FLAG_DAY03_EVENT02_ClothesNow]
;[Set objective to OBJECTIVE_D03_O02_ReportBack]
;[Set FLAG_DAY03_EVENT03_LunchesDelivered]
;[Story event at PogoDawg]
;[Move Brett to south hall]

	rts		

;*******************************************************************************
; SCENE_ID_DENIMCOUNTRY
;*******************************************************************************
ActionScriptDay03DenimCountryInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; OBJECTIVE_D03_O02_ReportBack - reporting back after everything is done
	rts	

;*******************************************************************************
; SCENE_ID_SHALL
;*******************************************************************************
ActionScriptDay03SHallEnter:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;South hall - on enter
;[ScriptedEventDay03_04_SouthHall]
;Story event at south hall - also where you also run into Brett - or maybe in PogoDawg itself
;[Set FLAG_DAY03_EVENT03_SouthHall]

	rts	
	
ActionScriptDay03SHallExit:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;South exit blocked 

	rts

;*******************************************************************************
; SCENE_ID_SVIDEO
;*******************************************************************************
ActionScriptDay03SVideoInteract:	
	bsr.w ShowDefaultText

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	rts		

ActionScriptDay03SVideoRespond:	
	bsr.w ShowDefaultText
	rts
	
;*******************************************************************************
; SCENE_ID_VB
;*******************************************************************************
ActionScriptDay03VBInteract:	
	bsr.w ShowDefaultText

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	rts		

ActionScriptDay03VBRespond:	
	bsr.w ShowDefaultText
	rts			
		
