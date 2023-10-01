;*******************************************************************************
; Day 4 is Day 8 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_CAVERN
;*******************************************************************************
ActionScriptDay04CavernInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[Story event at The Cavern - D.B. - explains about the basement or maybe doesn't yet]
;[ScriptedEventDay04_01_Cavern]
;[Set objective to OBJECTIVE_D04_O01_NShack]
;[set FLAG_DAY04_EVENT00_Cavern]

	rts		

;*******************************************************************************
; SCENE_ID_NSHACK
;*******************************************************************************
ActionScriptDay04NShackInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[ScriptedEventDay04_02_NShack]
;[Story event at Nut Shack - likely a conversation about the letter and complaining about Lisa]
;Transition to night

	rts		

;*******************************************************************************
; SCENE_ID_SVIDEO
;*******************************************************************************
ActionScriptDay04SVideoInteract:	
	bsr.w ShowDefaultText

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	rts		

ActionScriptDay04SVideoRespond:	
	bsr.w ShowDefaultText
	rts
	
;*******************************************************************************
; SCENE_ID_FCBCAMPING
;*******************************************************************************
ActionScriptDay04FCBCampingInteract:	
	bsr.w ShowDefaultText

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	rts		

ActionScriptDay04FCBCampingRespond:	
	bsr.w ShowDefaultText
	rts			
		
