;*******************************************************************************
; Night 0 is Day 1 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_EEHALL
;*******************************************************************************
ActionScriptNight00EEHallEnter:	
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;Event on entering EE Hall if FLAG_NIGHT00_EVENT00_EEHall not set
;Security guard hassles Brett for loitering after close
;[Run ScriptedEventNight00_01_EEHall]
;[set FLAG_NIGHT00_EVENT00_EEHall]

	bsr.w ShowDefaultText
	rts		
	
;*******************************************************************************
; SCENE_ID_SVIDEO
;*******************************************************************************
ActionScriptNight00SVideoInteract:	
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;1) Deliver special order to SVideo
;[Story Event in SVideo]
;[Run ScriptedEventNight00_01_SVideo]
;[set FLAG_NIGHT00_EVENT01_SVideo]
;Delivering the special order also begins Carl's trading sequence  
;[Move Victor to South Hall]
;[Story event at south hall]
;[Set objective to OBJECTIVE_D00_O04_Leave] 

	bsr.w ShowDefaultText
	rts		

;*******************************************************************************
; SCENE_ID_SHALL
;*******************************************************************************
ActionScriptNight00SouthHallEnter:	
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;Enter south hall with FLAG_NIGHT00_EVENT00_EEHall set and FLAG_NIGHT00_EVENT01_SVideo not set
;[Run ScriptedEventNight00_02_VictorEncounter]
;scene with Victor where it's clear he recognizes you but you aren't sure where you know him from - like he gives you some kind of good night message and Carl's like "I don't remember him being a customer" - Carl reflects on how weird the mall is at night
;[set FLAG_NIGHT00_EVENT02_StoryEventsDone]

	bsr.w ShowDefaultText
	rts		

ActionScriptNight00SouthHallExit:	
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------;If FLAG_NIGHT00_EVENT02_StoryEventsDone is set, transition to the next day
;Otherwise blocked with message (also a reusable message)

	bsr.w ShowDefaultText
	rts
	
ActionScriptNight00SouthHallRespond:
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; is this really needed?
	bsr.w ShowDefaultText
	rts
	
;*******************************************************************************
; SCENE_ID_VB
;*******************************************************************************
ActionScriptNight00VBInteract:	

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	bsr.w ShowDefaultText
	rts		

ActionScriptNight00VBRespond:	
	bsr.w ShowDefaultText
	rts		
	
;*******************************************************************************
; SCENE_ID_CPLANET
;*******************************************************************************
ActionScriptNight00CPlanetInteract:	

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	bsr.w ShowDefaultText
	rts		

ActionScriptNight00CPlanetRespond:	
	bsr.w ShowDefaultText
	rts			

