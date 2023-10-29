;*******************************************************************************
; Day 6 is Day 12 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_SHALL
;*******************************************************************************
ActionScriptDay06SHallExit:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; Should be prompted before entering NShack

	rts	

ActionScriptDay06SHallRespond:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; Should be prompted before entering NShack
;
;[Story event on enter]
;[ScriptedEventDay06_01_NShack]
;Transition to night

	rts	


;*******************************************************************************
; SCENE_ID_CAVERN
;*******************************************************************************
ActionScriptDay06CavernInteract:	
	bsr.w ShowDefaultText

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	rts		

ActionScriptDay06CavernRespond:	
	bsr.w ShowDefaultText
	rts
	
;*******************************************************************************
; SCENE_ID_SVIDEO
;*******************************************************************************
ActionScriptDay06SVideoInteract:	
	bsr.w ShowDefaultText

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	rts		

ActionScriptDay06SVideoRespond:	
	bsr.w ShowDefaultText
	rts	
	
;*******************************************************************************
; SCENE_ID_FCBCAMPING
;*******************************************************************************
ActionScriptDay06FCBCampingInteract:	
	bsr.w ShowDefaultText

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	rts		

ActionScriptDay06FCBCampingRespond:	
	bsr.w ShowDefaultText
	rts
	
;*******************************************************************************
; End of the day
;*******************************************************************************
EndDay06:

;Intro scene - 
;[ScriptedEventNight06_00_Intro]
;Scene where he's training his replacement and can now leave before closing for the first time.
;[Set objective to OBJECTIVE_D06_O01_FinalDay]
;[set story event at BasementKitchen]


	rts	
		
		
