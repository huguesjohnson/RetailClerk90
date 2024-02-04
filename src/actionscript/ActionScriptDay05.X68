;*******************************************************************************
; Day 5 is Day 10 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_FCBFIREARMS
;*******************************************************************************
ActionScriptDay05FCBFirearmsInteract:	
	move.w	(MEM_ACTION_TARGET_NPCID),d7 ; copy the npc id to d7
	cmpi.w	#$FFFF,d7 ; test if the target is even an npnc
	beq.s	ActionScriptDay05FCBFirearmsInteractDefault ; branch if not an npc
	;---------------------------------------------------------------
	; npc 0 is the clerk
	; npc 1 is the shopper
	;---------------------------------------------------------------
	cmpi.w	#$0000,d7 ; test if the clerk
	bne.s	.customer
.clerk
	bra.s	ActionScriptDay05FCBFirearmsInteractDefault
.customer
	lea	StoryTextDay05FCBFirearmsChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog
	rts
ActionScriptDay05FCBFirearmsInteractDefault:
	bsr.w ShowDefaultText
	rts		

ActionScriptDay05FCBFirearmsRespond:	
	bsr.w	ResetDialog
	move.w	#$FFFF,(MEM_STORY_EVENT1_SCENE_ID) ; clear story event	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_DAY05_EVENT00_FCBFIREARMS,d7 ; set event flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; copy them back
	move.l	#$0E000000,(MEM_NPC_LOCATION_FCBFIREARMS) ; npc leaves after event
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	bne.s	.choice1
.choice0
	lea	StoryTextDay05FCBFirearmsRespond0Line01,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ActionScriptDay05FCBFirearmsRespond0Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
.choice1	
	addq	#$1,(MEM_CUSTOMER_FEEDBACK_SCORE) ; not sure if I'll do anything with this	
	lea	StoryTextDay05FCBFirearmsRespond1Line01,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ActionScriptDay05FCBFirearmsRespond1Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	

;*******************************************************************************
; SCENE_ID_WWAUDIO
;*******************************************************************************
ActionScriptDay05WWAudioInteract:	
	move.w	(MEM_ACTION_TARGET_NPCID),d7 ; copy the npc id to d7
	cmpi.w	#$FFFF,d7 ; test if the target is even an npnc
	beq.s	ActionScriptDay05WWAudioInteractDefault ; branch if not an npc
	;---------------------------------------------------------------
	; npc 0 is the clerk
	; npc 1 is the shopper
	;---------------------------------------------------------------
	cmpi.w	#$0000,d7 ; test if the clerk
	bne.s	.customer
.clerk
	bra.s	ActionScriptDay05WWAudioInteractDefault
.customer
	lea	StoryTextDay05WWAudioChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog
	rts
ActionScriptDay05WWAudioInteractDefault:
	bsr.w ShowDefaultText
	rts		

ActionScriptDay05WWAudioRespond:	
	bsr.w	ResetDialog
	move.w	#$FFFF,(MEM_STORY_EVENT2_SCENE_ID) ; clear story event	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_DAY05_EVENT01_WWAUDIO,d7 ; set event flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; copy them back
	move.l	#$1B000000,(MEM_NPC_LOCATION_WWAUDIO) ; npc leaves after event
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	bne.s	.choice1
.choice0
	addq	#$1,(MEM_CUSTOMER_FEEDBACK_SCORE) ; not sure if I'll do anything with this	
	lea	StoryTextDay05WWAudioRespond0Line01,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ActionScriptDay05WWAudioRespond0Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
.choice1	
	lea	StoryTextDay05WWAudioRespond1Line01,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ActionScriptDay05WWAudioRespond1Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	

CheckDay05Events:
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY05_EVENT00_FCBFIREARMS,d7 ; test if event is complete
	beq.s	.exit ; event not complete, exit
	btst.l	#FLAG_DAY05_EVENT01_WWAUDIO,d7 ; test if event is complete
	beq.s	.exit ; event not complete, exit
	; otherwise update story event, objective, and npc locations
	bset.l	#FLAG_DAY05_EVENT02_CONTESTDONE,d7 ; set events complete
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#OBJECTIVE_D05_O01_ReportBack,(MEM_OBJECTIVE) ; update objective	
	move.w	#SCENE_ID_DENIMCOUNTRY,(MEM_STORY_EVENT1_SCENE_ID) ; update story event
	move.l	#$05102024,(MEM_NPC_LOCATION_DENIMCOUNTRY) ; move characters
.exit
	rts

;*******************************************************************************
; SCENE_ID_DENIMCOUNTRY
;*******************************************************************************
ActionScriptDay05DenimCountryInteract:	
	bsr.w ShowDefaultText
	rts
	
ActionScriptDay05DenimCountryExit:	
	; need to clear out NPC who is set there at the start of the day
	move.l	#$05000000,(MEM_NPC_LOCATION_DENIMCOUNTRY)
	bsr.w	DefaultExitScene ; default scene exit
	rts

ActionScriptDay05DenimCountryEnter:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY05_EVENT02_CONTESTDONE,d7 ; test if the event is complete
	bne.s	.default ; not set, default
	;---------------------------------------------------------------------------
	; else - end of the day
	;---------------------------------------------------------------------------
	bsr.w	EndDay05
.default
	rts

;*******************************************************************************
; SCENE_ID_CAVERN
;*******************************************************************************
ActionScriptDay05CavernInteract:	
	move.w	(MEM_ACTION_TARGET_NPCID),d7 ; copy the npc id to d7
	cmpi.w	#$FFFF,d7 ; test if the target is even an npnc
	beq.s	.default
	;---------------------------------------------------------------
	; npc 0 is the clerk
	;---------------------------------------------------------------
	cmpi.w	#$0000,d7 ; test for npc0
	bne.s	.default
	;---------------------------------------------------------------
	; else check if the event is complete
	;---------------------------------------------------------------
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY05_OPTIONAL1,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextDay05CavernChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptDay05CavernRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextDay05CavernChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_DB) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_DAY05_OPTIONAL1,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT1_SCENE_ID)
	; setup the scripted event
	lea	StoryTextDay05CavernChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay05_Optional00Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; SCENE_ID_FCBCAMPING
;*******************************************************************************
ActionScriptDay05FCBCampingInteract:	
	move.w	(MEM_ACTION_TARGET_NPCID),d7 ; copy the npc id to d7
	cmpi.w	#$FFFF,d7 ; test if the target is even an npnc
	beq.s	.default
	;---------------------------------------------------------------
	; npc 0 is the clerk
	;---------------------------------------------------------------
	cmpi.w	#$0000,d7 ; test for npc0
	bne.s	.default
	;---------------------------------------------------------------
	; else check if the event is complete
	;---------------------------------------------------------------
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY05_OPTIONAL2,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextDay05FCBCampingChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptDay05FCBCampingRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextDay05FCBCampingChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_GRANT) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_DAY05_OPTIONAL2,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT2_SCENE_ID)
	; setup the scripted event
	lea	StoryTextDay05FCBCampingChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay05_Optional01Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
		
;*******************************************************************************
; End of the day
;*******************************************************************************
EndDay05:
	bsr.s	EndDay05SetupGameState
	;---------------------------------------------------------------------------	
	; queue the introduction
	;---------------------------------------------------------------------------	
	lea ScriptedEventNight05_00_IntroStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts

EndDay05SetupGameState: ; separated to help with debugging		
	;---------------------------------------------------------------------------	
	; setup the next day
	;---------------------------------------------------------------------------	
	move.w	#$000B,(MEM_DAY) ; increment day
	move.w	#OBJECTIVE_D05_O02_LastYear,(MEM_OBJECTIVE) ; initial objective
	and.l	#$00000000,(MEM_DAY_EVENT_FLAGS) ; clear event flags
	move.w	#SCENE_ID_CAVERN,(MEM_STORY_EVENT1_SCENE_ID) ; initial story event
	move.w	#$FFFF,(MEM_STORY_EVENT2_SCENE_ID) ; no 2nd story event
	move.w	#SCENE_ID_CPLANET,(MEM_OPTIONAL_EVENT1_SCENE_ID) ; 1st optional event
	move.w	#SCENE_ID_WWAPPLIANCES,(MEM_OPTIONAL_EVENT2_SCENE_ID) ; 2nd optional event
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT3_SCENE_ID) ; no 3rd optional event
	move.w	#PLAYER_SPRITE_CARL,(MEM_PLAYER_SPRITE) ; initial sprite
	move.w	#DIRECTION_UP,(MEM_PLAYER_SPRITE_DIRECTION)
	move.w	#$00DE,(MEM_PLAYER_SPRITE_X)
	move.w	#$00EE,(MEM_PLAYER_SPRITE_Y)
	;---------------------------------------------------------------------------	
	; update NPC locations
	;---------------------------------------------------------------------------	
	bsr.w	InitNPCLocationsNight ; reset the NPC locations
	move.l	#$0D000000,(MEM_NPC_LOCATION_TBOOKS)	
	move.l	#$0F100000,(MEM_NPC_LOCATION_CAVERN) ; db and dani are both in the cavern	
	rts		
