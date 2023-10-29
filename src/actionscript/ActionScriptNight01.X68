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
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT01_OPTIONAL1,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextNight01WWAppliancesChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptNight01WWAppliancesRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextNight01WWAppliancesChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_LAURA) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_NIGHT01_OPTIONAL1,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT1_SCENE_ID)
	; setup the scripted event
	lea	StoryTextNight01WWAppliancesChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventNight01_Optional01Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	

	
;*******************************************************************************
; SCENE_ID_VB
;*******************************************************************************
ActionScriptNight01VBInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT01_OPTIONAL2,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextNight01VBChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptNight01VBRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextNight01VBChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_GRUNBERG) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_NIGHT01_OPTIONAL2,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT2_SCENE_ID)
	; setup the scripted event
	lea	StoryTextNight01VBChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventNight01_Optional01Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; End of the day
;*******************************************************************************
EndNight01:
;[ScriptedEventDay02_00_Intro]
;"Why are you asking me about this?" with Grunberg - response about needing to talk to people here a long time - response about how the store only opened 2 years ago and which stores have been there since 1975
;[Set objective to OBJECTIVE_D02_O00_TalkToEmployees]
;[set Story event at TLodge]
;[set Story event at TBooks]


	rts	
		
