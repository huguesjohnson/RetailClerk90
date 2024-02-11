;*******************************************************************************
; Night 0 is Day 1 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_TBOOKS
;*******************************************************************************
ActionScriptNight00TBooksExit:
	move.l	#$00000000,(MEM_NPC_LOCATION_TBOOKS)
	bsr.w	DefaultExitScene ; default scene exit
	rts

;*******************************************************************************
; SCENE_ID_EEHALL
;*******************************************************************************
ActionScriptNight00EEHallEnter:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy flags to d7
	btst.l	#FLAG_NIGHT00_EVENT00_EEHALL,d7 ; test if event ran already
	beq.s	.event ; branch if not set
	rts ; otherwise exit
.event
	bset.l	#FLAG_NIGHT00_EVENT00_EEHALL,d7 ; set that event ran
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags	
	; the npcs in the area are different after the event
	move.l	#$11000000,(MEM_NPC_LOCATION_EEHALL)			
	lea	ScriptedEventNight00_01_EEHallStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
	
;*******************************************************************************
; SCENE_ID_SVIDEO
;*******************************************************************************
ActionScriptNight00SVideoInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy flags to d7
	btst.l	#FLAG_NIGHT00_EVENT01_SVIDEO,d7 ; test if event ran already
	beq.s	.event ; branch if not set
.default
	bsr.w ShowDefaultText
	rts	
.event	
	bsr.s	ActionScriptNight00UpdateStateAfterSVideo
	lea	ScriptedEventNight00_01_SVideoStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts

; assumes d7 has MEM_DAY_EVENT_FLAGS
ActionScriptNight00UpdateStateAfterSVideo:
	bset.l	#FLAG_NIGHT00_EVENT01_SVIDEO,d7 ; set that event ran
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags		
	move.w	#SCENE_ID_SHALL,(MEM_STORY_EVENT1_SCENE_ID) ; update story event
	move.l	#$28000000,(MEM_NPC_LOCATION_SHALL) ; move victor to the south hall
	move.w	#OBJECTIVE_D00_O04_Leave,(MEM_OBJECTIVE) ; update the objective		
	rts

;*******************************************************************************
; SCENE_ID_SHALL
;*******************************************************************************
ActionScriptNight00SouthHallEnter:
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT00_EVENT02_STORYEVENTSDONE,d7 ; test if required event ran
	bne.s	.default
	btst.l	#FLAG_NIGHT00_EVENT00_EEHALL,d7 ; test if required event ran
	beq.s	.default
	btst.l	#FLAG_NIGHT00_EVENT01_SVIDEO,d7 ; test if required event ran
	bne.s	.event
.default	
	rts
.event	
	bsr.s	ActionScriptNight00UpdateStateAfterSHall
	; run the scripted event
	lea	ScriptedEventNight00_02_VictorEncounterStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts		
	
; assumes d7 has MEM_DAY_EVENT_FLAGS
ActionScriptNight00UpdateStateAfterSHall:
	bset.l	#FLAG_NIGHT00_EVENT02_STORYEVENTSDONE,d7 ; set that required event ran
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.l	#$00000000,(MEM_NPC_LOCATION_SHALL) ; no npcs in south hall after the event
	rts	

ActionScriptNight00SouthHallExit:
	move.w	(MEM_PLAYER_SPRITE_DIRECTION),d7 ; copy player sprite direction to d7
	cmpi.w	#DIRECTION_DOWN,d7 ; is the player facing south?
	beq.s	.south ; branch if so
	bsr.w	DefaultExitScene ; default scene exit
	rts	
.south
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT00_EVENT00_EEHALL,d7 ; test if the mandatory event is complete
	beq.s	.cantleave ; branch if not
	btst.l	#FLAG_NIGHT00_EVENT01_SVIDEO,d7 ; test if the mandatory event is complete
	beq.s	.cantleave ; branch if not
	btst.l	#FLAG_NIGHT00_EVENT02_STORYEVENTSDONE,d7 ; test if the mandatory event is complete
	beq.s	.cantleave ; branch if not
	bsr.w	EndNight00 ; transition to night
	rts	
.cantleave
	lea ScriptedEventNotTimeToLeaveCarlStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event	
	rts
	
;*******************************************************************************
; SCENE_ID_VB
;*******************************************************************************
ActionScriptNight00VBInteract:	
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
	btst.l	#FLAG_NIGHT00_OPTIONAL1,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextNight00VBChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptNight00VBRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextNight00VBChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_GRUNBERG) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_NIGHT00_OPTIONAL1,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT1_SCENE_ID)
	; setup the scripted event
	lea	StoryTextNight00VBChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventNight00_Optional00_GrunbergStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; SCENE_ID_CPLANET
;*******************************************************************************
ActionScriptNight00CPlanetInteract:	
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
	btst.l	#FLAG_NIGHT00_OPTIONAL2,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextNight00CPlanetChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptNight00CPlanetRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextNight00CPlanetChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_ELIZA) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_NIGHT00_OPTIONAL2,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT2_SCENE_ID)
	; setup the scripted event
	lea	StoryTextNight00CPlanetChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventNight00_Optional01_ElizaStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; End of the day
;*******************************************************************************
EndNight00:
	bsr.s	EndNight00SetGameState
	;---------------------------------------------------------------------------	
	; set the intro screen
	;---------------------------------------------------------------------------	
	move.l	(MEM_GAME_STATE),d7	; copy game state
	bset.l	#STATE_FLAG_INTRO_SCREEN,d7 ; set intro screen flag
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	; set the intro screen counter
	move.w	#INTRO_SCREEN_COUNTER_START,(MEM_INTRO_SCENE_COUNTER)
	lea	SceneIntroDay01,a6	; address of the scene for the title screen
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	FadeIn	; fade in to the new scene
	; queue scripted event to launch
	lea ScriptedEventDay01_00_IntroStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
EndNight00SetGameState: ; separated out to help with debugging
	;---------------------------------------------------------------------------	
	; setup the next day
	;---------------------------------------------------------------------------	
	move.w	#$0002,(MEM_DAY) ; increment day
	move.w	#OBJECTIVE_D01_O00_RumorSearch,(MEM_OBJECTIVE) ; initial objective
	and.l	#$00000000,(MEM_DAY_EVENT_FLAGS) ; clear day event flags
	move.w	#SCENE_ID_CPLANET,(MEM_STORY_EVENT1_SCENE_ID) ; story event 1
	move.w	#SCENE_ID_WWAPPLIANCES,(MEM_STORY_EVENT2_SCENE_ID) ; story event 2
	move.w	#SCENE_ID_CAVERN,(MEM_OPTIONAL_EVENT1_SCENE_ID) ; 1st optional event
	move.w	#SCENE_ID_FCBCAMPING,(MEM_OPTIONAL_EVENT2_SCENE_ID) ; 2nd optional event
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT3_SCENE_ID) ; no 3rd optional event
	move.w	#PLAYER_SPRITE_ERYN,(MEM_PLAYER_SPRITE) ; initial sprite
	move.w	#DIRECTION_UP,(MEM_PLAYER_SPRITE_DIRECTION)
	move.w	#$00C2,(MEM_PLAYER_SPRITE_X)
	move.w	#$00D0,(MEM_PLAYER_SPRITE_Y)
	;---------------------------------------------------------------------------	
	; update NPC locations
	;---------------------------------------------------------------------------	
	bsr.w	InitNPCLocationsDay ; reset the NPC locations
	; for optional event
	move.l	#$120F0000,(MEM_NPC_LOCATION_CAVERN)
	;---------------------------------------------------------------------------	
	; scatter some NPCs around
	;---------------------------------------------------------------------------	
	move.l	#$08220000,(MEM_NPC_LOCATION_POGODAWG)
	move.l	#$09250000,(MEM_NPC_LOCATION_TLODGE)
	move.l	#$0B240000,(MEM_NPC_LOCATION_CPLANET)
	move.l	#$0C230000,(MEM_NPC_LOCATION_CNOW)	
	move.l	#$02200000,(MEM_NPC_LOCATION_TBOOKS)	
	move.l	#$1B260000,(MEM_NPC_LOCATION_WWAUDIO)
	move.l	#$11000000,(MEM_NPC_LOCATION_WEHALL)	
	rts	

