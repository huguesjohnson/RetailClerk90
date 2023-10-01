;*******************************************************************************
; Night 4 is Day 9 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_NSHACK
;*******************************************************************************
ActionScriptNight04NShackInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[Story event at NShack - Eryn explains she saw a guy head into the Cavern and then disappear]
;[ScriptedEventNight04_01_NShack]
;[Set objective to OBJECTIVE_D04_O03_Cavern]
;[set FLAG_NIGHT04_EVENT00_NShackNight]
;[set story event at Cavern]

	rts		

;*******************************************************************************
; SCENE_ID_CAVERN
;*******************************************************************************
ActionScriptNight04CavernInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; is this really needed?

	rts		

;*******************************************************************************
; SCENE_ID_WWHALL
;*******************************************************************************
ActionScriptNight04WWHallExit:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;Trying to enter the Cavern before [FLAG_DAY04_EVENT01_NShackNight] is set should have a message like “I’ll check back here later”
;
;[ScriptedEventNight04_02_Cavern] [Story event at Cavern backroom - DB is gone, you inspect the staircase but decide against going downstairs]


	rts		

;*******************************************************************************
; SCENE_ID_CAVERN_BACKROOM
;*******************************************************************************
ActionScriptNight04CavernBackroomExit:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;Trying to exit via the ladder or inspecting it
;Set [set FLAG_NIGHT04_EVENT01_CavernBackroom]
;Different text depending on the FLAG_NIGHT04_EVENT01_CavernBackroom
;[Set objective to OBJECTIVE_D04_O04_Leave]
;[Move Victor to south hall]

	rts	

;*******************************************************************************
; SCENE_ID_SHALL
;*******************************************************************************
ActionScriptNight04SHallExit:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;Exit is blocked until [FLAG_DAY04_EVENT03_Done] is set


	rts	

ActionScriptNight04SHallEnter:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;If [FLAG_NIGHT04_EVENT01_CavernBackroom] but not [FLAG_DAY04_EVENT03_Done]
;[ScriptedEventNight04_03_SouthHall] [Story event at South Hall - probably another scene with Victor - a "you know something about this place" scene]
;[Set objective to OBJECTIVE_D04_O05_Done]

	rts	

;*******************************************************************************
; SCENE_ID_VB
;*******************************************************************************
ActionScriptNight04VBInteract:	
	bsr.w ShowDefaultText

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	rts		

ActionScriptNight04VBRespond:	
	bsr.w ShowDefaultText
	rts
	
;*******************************************************************************
; SCENE_ID_WWAPPLIANCES
;*******************************************************************************
ActionScriptNight04WWAppliancesInteract:	
	bsr.w ShowDefaultText

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	rts		

ActionScriptNight04WWAppliancesRespond:	
	bsr.w ShowDefaultText
	rts		
