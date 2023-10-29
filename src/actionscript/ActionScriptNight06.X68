;*******************************************************************************
; Night 6 is Day 13 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_BASEMENTCAFE
;*******************************************************************************
ActionScriptNight06BasementCafeInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[Story event in basement - Brett is moving out]
;[ScriptedEventNight06_01_BasementKitchen]
;[set FLAG_NIGHT06_EVENT00_BasementKitchen]

	rts		


;*******************************************************************************
; SCENE_ID_SHALL
;*******************************************************************************
ActionScriptNight06SHallExit:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; south exit should be blocked
;
;2) Final event is in Nut Shack - triggered on enter
;Entrance to NShack should be blocked until other things are complete or you should be prompted before entering if [FLAG_NIGHT06_EVENT00_BasementKitchen] is set
;[ScriptedEventEndGood]
;[ScriptedEventEndBad]
;[ScriptedEventEndPerfect]

	rts	


;*******************************************************************************
; SCENE_ID_CPLANET
;*******************************************************************************
ActionScriptNight06CPlanetInteract:	
	bsr.w ShowDefaultText

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	rts		

ActionScriptNight06CPlanetRespond:	
	bsr.w ShowDefaultText
	rts
	
;*******************************************************************************
; SCENE_ID_VB
;*******************************************************************************
ActionScriptNight06VBInteract:	
	bsr.w ShowDefaultText

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	rts		

ActionScriptNight06VBRespond:	
	bsr.w ShowDefaultText
	rts	
	
;*******************************************************************************
; SCENE_ID_WWAPPLIANCES
;*******************************************************************************
ActionScriptNight06WWAppliancesInteract:	
	bsr.w ShowDefaultText

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	rts		

ActionScriptNight06WWAppliancesRespond:	
	bsr.w ShowDefaultText
	rts		
	
;*******************************************************************************
; End of the day
;*******************************************************************************
EndNight06:
	rts	
	
	
