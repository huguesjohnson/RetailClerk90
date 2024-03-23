;*******************************************************************************
; Night 1 is Day 3 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_WEHALL:
;*******************************************************************************
ActionScriptNight01WEHallExit:
	; need to clear out NPC who is set there at the start of the day
	move.l	#$00000000,(MEM_NPC_LOCATION_WEHALL)
	bsr.w	DefaultExitScene ; default scene exit
	rts

;*******************************************************************************
; SCENE_ID_CAVERN
;*******************************************************************************
ActionScriptNight01CavernInteract:
	move.w	(MEM_ACTION_TARGET_NPCID),d7 ; copy the npc id to d7
	cmpi.w	#$FFFF,d7 ; test if the target is even an npc
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
	btst.l	#FLAG_NIGHT_01_EVENT00_CAVERN,d7 ; test if the event is complete
	bne.s	.default ; show default text if the event is complete
	;---------------------------------------------------------------------------
	; else update flags and run the scripted event
	;---------------------------------------------------------------------------
	bsr.s	ActionScriptNight01CavernUpdateState
	; setup scripted event
	lea ScriptedEventNight01_01_CavernStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
.default
	bsr.w ShowDefaultText
	rts

; assumes d7 has MEM_DAY_EVENT_FLAGS
ActionScriptNight01CavernUpdateState:
	bset.l	#FLAG_NIGHT_01_EVENT00_CAVERN,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#SCENE_ID_EEHALL,(MEM_STORY_EVENT1_SCENE_ID) ; next story event in in EE hall
	move.w	#OBJECTIVE_D01_O03_Leave,(MEM_OBJECTIVE) ; update objective
	move.l	#$28000000,(MEM_NPC_LOCATION_EEHALL) ; victor is now in eehall
	; fast travel is temporarily unavailable
	move.l	(MEM_GAME_STATE),d7 ; copy game state to d7
	bclr.l	#STATE_FLAG_FAST_TRAVEL_AVAILABLE,d7 ; fast travel is unavailable
	move.l	d7,(MEM_GAME_STATE) ; save updated state
	rts

;*******************************************************************************
; SCENE_ID_EEHALL
;*******************************************************************************
ActionScriptNight01EEHallEnter:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT_01_EVENT00_CAVERN,d7 ; test if the event is complete
	beq.s	.default ; before this event has happened, exit
	btst.l	#FLAG_NIGHT_01_EVENT01_EEHALL,d7 ; test if the event is complete
	bne.s	.default ; after this event has happened, exit
	;---------------------------------------------------------------------------
	; else update flags and run the scripted event
	;---------------------------------------------------------------------------
	bsr.s	ActionScriptNight01EEHallUpdateState
	; setup scripted event
	lea ScriptedEventNight01_02_EEHallStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
.default
	rts

; assumes d7 has MEM_DAY_EVENT_FLAGS
ActionScriptNight01EEHallUpdateState:
	bset.l	#FLAG_NIGHT_01_EVENT01_EEHALL,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#SCENE_ID_SHALL,(MEM_STORY_EVENT1_SCENE_ID) ; update story event
	move.l	#$00000000,(MEM_NPC_LOCATION_EEHALL) ; victor is out of eehall
	move.l	#$09280000,(MEM_NPC_LOCATION_TLODGE) ; victor is in tlodge
	move.l	#$01000000,(MEM_NPC_LOCATION_SHALL) ; eryn is in south hall	
	; fast travel is available again
	move.l	(MEM_GAME_STATE),d7 ; copy game state to d7
	bset.l	#STATE_FLAG_FAST_TRAVEL_AVAILABLE,d7 ; fast travel is available
	move.l	d7,(MEM_GAME_STATE) ; save updated state	
	rts

;*******************************************************************************
; SCENE_ID_TLODGE
;*******************************************************************************
ActionScriptNight01TLodgeInteract:	
	move.w	(MEM_ACTION_TARGET_NPCID),d7 ; copy the npc id to d7
	cmpi.w	#$FFFF,d7 ; test if the target is even an npc
	beq.s	.default
	;---------------------------------------------------------------
	; npc 0 is the clerk
	;---------------------------------------------------------------
	cmpi.w	#$0000,d7 ; test for npc0
	bne.s	.default
	;---------------------------------------------------------------
	; else check if the event is complete
	;---------------------------------------------------------------
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7 ; copy global event flags to d7
	btst.l	#FLAG_GLOBAL_EVENT00_TLodgeEvent1123Night,d7 ; test if the event is complete
	beq.s	.default ; show default text if the event is complete
	; otherwise show alternate text
	lea	StoryTextNight01TLodgeAfterEvent,a6 ; load dialog text	
	bsr.w	ShowDialog ; show the text event
	rts
.default
	bsr.w ShowDefaultText
	rts

ActionScriptNight01TLodgeEnter:	
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7 ; copy global event flags to d7
	btst.l	#FLAG_GLOBAL_EVENT00_TLodgeEvent1123Night,d7 ; test if the event is complete
	bne.s	.default ; show default text if the event is complete
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7	
	btst.l	#FLAG_NIGHT_01_EVENT01_EEHALL,d7 ; check if required event is done
	beq.s	.default ; required event not done	
	;---------------------------------------------------------------------------
	; else update flags and run the scripted event
	;---------------------------------------------------------------------------
	bset.l	#FLAG_GLOBAL_EVENT00_TLodgeEvent1123Night,d7 ; set event is done
	move.l	d7,(MEM_GLOBAL_EVENT_FLAGS) ; save updated flags
	move.l	#$09000000,(MEM_NPC_LOCATION_TLODGE) ; back to default npc in tlodge
	; setup scripted event
	lea ScriptedEventNight01_TLodgeStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
.default
	rts
	


;*******************************************************************************
; SCENE_ID_SOUTH_CENTER
;*******************************************************************************
ActionScriptNight01SouthCenterExit:	
	; test which direction the player is going
	move.w	(MEM_PLAYER_SPRITE_DIRECTION),d7 ; copy player sprite direction to d7
	cmpi.w	#DIRECTION_DOWN,d7 ; is the player facing south?
	bne.s	.default ; branch if not
.south
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT_01_EVENT01_EEHALL,d7 ; test if the event is complete
	beq.s	.default ; not time for this event
	btst.l	#FLAG_NIGHT_01_EVENT02_STORYEVENTSDONE,d7 ; test if the event is complete
	bne.s	.default ; event is already done
	;---------------------------------------------------------------------------
	; else update flags and run the scripted event
	;---------------------------------------------------------------------------
	bsr.s	ActionScriptNight01SouthHallUpdateState
	; setup scripted event
	lea ScriptedEventNight01_03_SouthHallStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
.default
	bsr.w	DefaultExitScene
	rts

; assumes d7 has MEM_DAY_EVENT_FLAGS
ActionScriptNight01SouthHallUpdateState:
	bset.l	#FLAG_NIGHT_01_EVENT02_STORYEVENTSDONE,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#$FFFF,(MEM_STORY_EVENT1_SCENE_ID) ; clear story event
	rts

;*******************************************************************************
; SCENE_ID_SHALL
;*******************************************************************************
ActionScriptNight01SHallExit:	
	; need to clear NPC after ScriptedEventNight01_03_SouthHallStart
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT_01_EVENT02_STORYEVENTSDONE,d7 ; test if event is done
	beq.s	.testdir ; not set
	move.l	#$00000000,(MEM_NPC_LOCATION_SHALL) ; otherwise clear npc	
.testdir
	; test which direction the player is going
	move.w	(MEM_PLAYER_SPRITE_DIRECTION),d7 ; copy player sprite direction to d7
	cmpi.w	#DIRECTION_DOWN,d7 ; is the player facing south?
	beq.s	.south ; branch if so
	bsr.w	DefaultExitScene ; default scene exit
	rts	
.south
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT_01_EVENT02_STORYEVENTSDONE,d7 ; test if the mandatory event is complete
	beq.s	.cantleave ; branch if not
	bsr.w	EndNight01 ; transition to night
	rts	
.cantleave
	lea ScriptedEventNotTimeToLeaveCarlStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event	
	rts		
	
;*******************************************************************************
; SCENE_ID_WWAPPLIANCES
;*******************************************************************************
ActionScriptNight01WWAppliancesInteract:	
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
	lea ScriptedEventNight01_Optional00Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	

	
;*******************************************************************************
; SCENE_ID_VB
;*******************************************************************************
ActionScriptNight01VBInteract:	
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
	bsr.s	EndNight01SetupGameState
	;---------------------------------------------------------------------------	
	; set the intro screen
	;---------------------------------------------------------------------------	
	move.l	(MEM_GAME_STATE),d7	; copy game state
	bset.l	#STATE_FLAG_INTRO_SCREEN,d7 ; set intro screen flag
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	; set the intro screen counter
	move.w	#INTRO_SCREEN_COUNTER_START,(MEM_INTRO_SCENE_COUNTER)
	lea	SceneIntroDay02,a6	; address of the scene for the title screen
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	FadeIn	; fade in to the new scene
	; queue scripted event to launch
	lea ScriptedEventDay02_00_IntroStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
EndNight01SetupGameState: ; separated to help with debugging
	;---------------------------------------------------------------------------	
	; setup the next day
	;---------------------------------------------------------------------------	
	move.w	#$0004,(MEM_DAY) ; increment day
	move.w	#OBJECTIVE_D02_O00_TalkToEmployees,(MEM_OBJECTIVE) ; initial objective
	and.l	#$00000000,(MEM_DAY_EVENT_FLAGS) ; clear day event flags
	move.w	#SCENE_ID_TLODGE,(MEM_STORY_EVENT1_SCENE_ID) ; story event 1
	move.w	#SCENE_ID_TBOOKS,(MEM_STORY_EVENT2_SCENE_ID) ; story event 2
	move.w	#SCENE_ID_SVIDEO,(MEM_OPTIONAL_EVENT1_SCENE_ID) ; 1st optional event
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
	; setup for optional event
	move.l	#$19262021,(MEM_NPC_LOCATION_SVIDEO)	
	;---------------------------------------------------------------------------	
	; scatter some NPCs around
	;---------------------------------------------------------------------------	
	move.l	#$17120000,(MEM_NPC_LOCATION_FCBCAMPING)
	move.l	#$11000000,(MEM_NPC_LOCATION_EWHALL)
	move.l	#$00000000,(MEM_NPC_LOCATION_SHALL)		
	move.l	#$08200000,(MEM_NPC_LOCATION_POGODAWG)
	move.l	#$210F0000,(MEM_NPC_LOCATION_CAVERN)
	move.l	#$14220000,(MEM_NPC_LOCATION_FCBCHECKOUT)
	move.l	#$1B240000,(MEM_NPC_LOCATION_WWAUDIO)
	move.l	#$1D230000,(MEM_NPC_LOCATION_WWAPPLIANCES)
	move.l	#$0B250000,(MEM_NPC_LOCATION_CPLANET)
	rts
