;*******************************************************************************
; Night 2 is Day 5 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_FCBCAMPING
;*******************************************************************************
ActionScriptNight02FCBInteract:	
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
	btst.l	#FLAG_NIGHT02_EVENT00_FCBCAMPING,d7 ; test if the event is complete
	bne.s	.default ; show default text if the event is complete
	;---------------------------------------------------------------------------
	; else update flags and run the scripted event
	;---------------------------------------------------------------------------
	bset.l	#FLAG_NIGHT02_EVENT00_FCBCAMPING,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#$FFFF,(MEM_STORY_EVENT1_SCENE_ID) ; clear story event
	bsr.w	CheckNight02Flags
	; setup scripted event
	lea ScriptedEventNight02_01_FCBCampingStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
.default
	bsr.w ShowDefaultText
	rts		

;*******************************************************************************
; SCENE_ID_NSHACK
;*******************************************************************************
ActionScriptNight02NShackEnter:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT02_EVENT01_NSHACK,d7 ; test if the event is complete
	bne.s	.default ; show default text if the event is complete
	;---------------------------------------------------------------------------
	; else update flags and run the scripted event
	;---------------------------------------------------------------------------
	bset.l	#FLAG_NIGHT02_EVENT01_NSHACK,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#$FFFF,(MEM_STORY_EVENT2_SCENE_ID) ; clear story event
	bsr.w	CheckNight02Flags
	; setup scripted event
	lea ScriptedEventNight02_02_NShackStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
.default
	rts

CheckNight02Flags:
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT02_EVENT00_FCBCAMPING,d7 ; test if event is complete
	beq.s	.exit ; exit if not
	btst.l	#FLAG_NIGHT02_EVENT01_NSHACK,d7 ; test if event is complete
	beq.s	.exit ; exit if not
	; both flags are set - update objective and story event location
	move.w	#SCENE_ID_SHALL,(MEM_STORY_EVENT1_SCENE_ID) ; update story event
	move.w	#OBJECTIVE_D00_O04_Leave,(MEM_OBJECTIVE) ; update objective
.exit
	rts

;*******************************************************************************
; SCENE_ID_WWHALL
;*******************************************************************************
ActionScriptNight02WWHallEnter:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT02_EVENT02_WWHALL,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	;---------------------------------------------------------------------------
	; else update flags and run the scripted event
	;---------------------------------------------------------------------------
	bsr.s	Night02WWHallUpdateState
	; setup scripted event
	lea ScriptedEventNight02_03_WWHallStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
.default
	rts
	
; assumes d7 has MEM_DAY_EVENT_FLAGS	
Night02WWHallUpdateState:
	bset.l	#FLAG_NIGHT02_EVENT02_WWHALL,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.l	#$00000000,(MEM_NPC_LOCATION_WWHALL) ; victor is out of wwhall
	move.l	#$0C280000,(MEM_NPC_LOCATION_CNOW) ; victor is in cnow	
	move.l	#$07010000,(MEM_NPC_LOCATION_NSHACK) ; eryn is in nshack
	; fast travel is available again
	move.l	(MEM_GAME_STATE),d7 ; copy game state to d7
	bset.l	#STATE_FLAG_FAST_TRAVEL_AVAILABLE,d7 ; fast travel is unavailable
	move.l	d7,(MEM_GAME_STATE) ; save updated state		
	rts

;*******************************************************************************
; SCENE_ID_CNOW
;*******************************************************************************
ActionScriptNight02CNowEnter:	
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_GLOBAL_Victor1204,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	;---------------------------------------------------------------------------
	; else update flags and run the scripted event
	;---------------------------------------------------------------------------
	bsr.s	Night02CNowUpdateState
	; setup scripted event
	lea ScriptedEventNight02_CNowStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
.default
	rts	

; assumes d7 has MEM_GLOBAL_EVENT_FLAGS	
Night02CNowUpdateState:
	bset.l	#FLAG_GLOBAL_Victor1204,d7 ; set event is done
	move.l	d7,(MEM_GLOBAL_EVENT_FLAGS) ; save updated flags
	move.l	#$0C000000,(MEM_NPC_LOCATION_CNOW) ; victor leaves cnow	
	rts

;*******************************************************************************
; SCENE_ID_SHALL
;*******************************************************************************
ActionScriptNight02SHallExit:	
	move.w	(MEM_PLAYER_SPRITE_DIRECTION),d7 ; copy player sprite direction to d7
	cmpi.w	#DIRECTION_DOWN,d7 ; is the player facing south?
	beq.s	.south ; branch if so
	bsr.w	DefaultExitScene ; default scene exit
	rts	
.south
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT02_EVENT00_FCBCAMPING,d7 ; test if event is complete
	beq.s	.cantleave ; exit if not
	btst.l	#FLAG_NIGHT02_EVENT01_NSHACK,d7 ; test if event is complete
	beq.s	.cantleave ; branch if not
	; events are both done
	bsr.w	EndNight02 ; transition to night
	rts	
.cantleave
	lea ScriptedEventNotTimeToLeaveCarlStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event	
	rts		

;*******************************************************************************
; SCENE_ID_CPLANET
;*******************************************************************************
ActionScriptNight02CPlanetInteract:	
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
	btst.l	#FLAG_NIGHT02_OPTIONAL1,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextNight02CPlanetChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptNight02CPlanetRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextNight02CPlanetChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_ELIZA) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_NIGHT02_OPTIONAL1,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT1_SCENE_ID)
	; setup the scripted event
	lea	StoryTextNight02CPlanetChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventNight02_Optional01_ElizaStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; SCENE_ID_VB
;*******************************************************************************
ActionScriptNight02VBInteract:	
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
	btst.l	#FLAG_NIGHT02_OPTIONAL2,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextNight02VBChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptNight02VBRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextNight02VBChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_GRUNBERG) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_NIGHT02_OPTIONAL2,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT2_SCENE_ID)
	; setup the scripted event
	lea	StoryTextNight02VBChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventNight02_Optional00_GrunbergStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; End of the day
;*******************************************************************************
EndNight02:
	bsr.s	EndNight02SetupGameState
	; queue scripted event to launch
	lea ScriptedEventNight02Day03TransitionStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	

EndNight02SetupGameState: ; separated to help with debugging		
	;---------------------------------------------------------------------------	
	; setup the next day
	;---------------------------------------------------------------------------	
	move.w	#$0006,(MEM_DAY) ; increment day
	move.w	#OBJECTIVE_D03_O00_VisitPogoDawg,(MEM_OBJECTIVE) ; initial objective
	and.l	#$00000000,(MEM_DAY_EVENT_FLAGS) ; clear day event flags
	move.w	#SCENE_ID_POGODAWG,(MEM_STORY_EVENT1_SCENE_ID) ; story event 1
	move.w	#$FFFF,(MEM_STORY_EVENT2_SCENE_ID) ; no story event 2
	move.w	#SCENE_ID_SVIDEO,(MEM_OPTIONAL_EVENT1_SCENE_ID) ; 1st optional event
	move.w	#SCENE_ID_CAVERN,(MEM_OPTIONAL_EVENT2_SCENE_ID) ; 2nd optional event
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT3_SCENE_ID) ; no 3rd optional event
	;---------------------------------------------------------------------------	
	; update NPC locations
	;---------------------------------------------------------------------------	
	bsr.w	InitNPCLocationsDay ; reset the NPC locations
	;---------------------------------------------------------------------------	
	; scatter some NPCs around
	;---------------------------------------------------------------------------	
	move.l	#$1D200000,(MEM_NPC_LOCATION_WWAPPLIANCES)
	move.l	#$041F0000,(MEM_NPC_LOCATION_CENTER)
	move.l	#$06240000,(MEM_NPC_LOCATION_VB)
	move.l	#$09210000,(MEM_NPC_LOCATION_TLODGE)
	move.l	#$17120000,(MEM_NPC_LOCATION_FCBCAMPING)
	move.l	#$0E220000,(MEM_NPC_LOCATION_FCBFIREARMS)
	move.l	#$0A230000,(MEM_NPC_LOCATION_CHECKERS)
	move.l	#$0C250000,(MEM_NPC_LOCATION_CNOW)
	move.l	#$11000000,(MEM_NPC_LOCATION_WWHALL)
	move.l	#$26000000,(MEM_NPC_LOCATION_SHALL)		
	rts	
