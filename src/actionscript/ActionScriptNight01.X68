;*******************************************************************************
; Night 1 is Day 3 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_CAVERN
;*******************************************************************************
ActionScriptNight01CavernInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[Story event at the cavern - "It's not my business. Too much snooping can cause drama."]
;[ScriptedEventNight01_01_Cavern]
;[set FLAG_NIGHT_01_EVENT00_Cavern]

	rts		

;*******************************************************************************
; SCENE_ID_EEHALL
;*******************************************************************************
ActionScriptNight01EEHallEnter:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[ScriptedEventNight01_02_EEHall]
;[set FLAG_NIGHT_01_EVENT01_EEHall]
;move sprites
;Victor to TLodge
;Eryn to south hall
;
;At the end of these scenes Carl wonders where the Brett character might be hiding
;[Set objective to OBJECTIVE_D01_O03_Leave]

	rts		

;*******************************************************************************
; SCENE_ID_TLODGE
;*******************************************************************************
ActionScriptNight01TLodgeEnter:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[if you follow him he's in TLodge and there's a scene where he can't believe the store lasted this long - need to set something in MEM_GLOBAL_EVENT_FLAGS, like FLAG_GLOBAL_EVENT00_TLodgeEvent1123Night]

	rts	

;*******************************************************************************
; SCENE_ID_SHALL
;*******************************************************************************
ActionScriptNight01SHallEnter:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[Story Event at South Hall on enter - Main characters meet after close]
;[ScriptedEventNight01_03_SouthHall]
;[set FLAG_NIGHT_01_EVENT02_StoryEventsDone]
	rts	
	
ActionScriptNight01SHallExit:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;Check FLAG_NIGHT_01_EVENT02_StoryEventsDone when trying to exit from south hall with generic “forgetting something” message

	rts		
	
;*******************************************************************************
; SCENE_ID_WWAPPLIANCES
;*******************************************************************************
ActionScriptNight01WWAppliancesInteract:	

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	bsr.w ShowDefaultText
	rts		

ActionScriptNight01WWAppliancesRespond:	
	bsr.w ShowDefaultText
	rts
	
;*******************************************************************************
; SCENE_ID_VB
;*******************************************************************************
ActionScriptNight01VBInteract:	
	bsr.w ShowDefaultText

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	rts		

ActionScriptNight01VBRespond:	
	bsr.w ShowDefaultText
	rts		
