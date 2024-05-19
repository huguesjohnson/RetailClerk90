;*******************************************************************************
; Night 4 is Day 9 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_NSHACK
;*******************************************************************************
ActionScriptNight04NShackInteract:	
	;---------------------------------------------------------------
	; clerk hit region is an object because they are behind the counter
	;---------------------------------------------------------------
	move.w	(MEM_ACTION_TARGET_OBJID),d7 ; copy the object id to d7
	cmpi.w	#OBJ_NPC_JEN,d7 ; test if the target is the clerk
	beq.s	.npc0
	; not even sure if it's possible to interact with the clerk directly but whatever
	move.w	(MEM_ACTION_TARGET_NPCID),d7 ; copy the npc id to d7
	cmpi.w	#$FFFF,d7 ; test if the target is even an npnc
	beq.s	.default
.npc0
	;---------------------------------------------------------------
	; else check if the event is complete
	;---------------------------------------------------------------
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT04_EVENT00_NSHACKNIGHT,d7 ; test if the event is complete
	bne.s	.default ; show default text if the event is complete
	;---------------------------------------------------------------------------
	; else update flags and run the scripted event
	;---------------------------------------------------------------------------
	bsr.s	ActionScriptNight04NShackUpdateState
	; setup scripted event
	lea ScriptedEventNight04_01_NShackStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
.default
	bsr.w ShowDefaultText
	rts		

; assumes d7 has MEM_DAY_EVENT_FLAGS
ActionScriptNight04NShackUpdateState:
	bset.l	#FLAG_NIGHT04_EVENT00_NSHACKNIGHT,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#SCENE_ID_CAVERN,(MEM_STORY_EVENT1_SCENE_ID) ; update story event
	move.w	#OBJECTIVE_D04_O03_Cavern,(MEM_OBJECTIVE) ; update objective
	rts

;*******************************************************************************
; SCENE_ID_CAVERN
;*******************************************************************************
ActionScriptNight04CavernEnterScene:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT04_EVENT01_CAVERN,d7 ; test if the event is complete
	bne.s	.default ; default if set
	;---------------------------------------------------------------------------
	; else update flags and run the scripted event
	;---------------------------------------------------------------------------
	bsr.s	ActionScriptNight04CavernUpdateState
	; setup scripted event
	lea ScriptedEventNight04_02_CavernStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
.default
	bsr.w	DefaultEnterScene
	rts
	
ActionScriptNight04CavernExitScene:	
	bsr.w	DefaultExitScene ; default scene exit
	rts	
	
; assumes d7 has MEM_DAY_EVENT_FLAGS
ActionScriptNight04CavernUpdateState:
	bset.l	#FLAG_NIGHT04_EVENT01_CAVERN,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#SCENE_ID_CAVERN_BACKROOM,(MEM_STORY_EVENT1_SCENE_ID) ; update story event
	rts

;*******************************************************************************
; SCENE_ID_EEHALL
;*******************************************************************************
ActionScriptNight04EEHallExit:	
	move.w	(MEM_PLAYER_SPRITE_DIRECTION),d7 ; copy player sprite direction to d7
	cmpi.w	#DIRECTION_UP,d7 ; is the player facing north?
	beq.s	.north ; branch if so
	bsr.w	DefaultExitScene ; default scene exit
	rts	
.north
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT04_EVENT00_NSHACKNIGHT,d7 ; test if event is complete
	beq.s	.cantleavenorth ; exit if not
	; otherwise default
	bsr.w	DefaultExitScene ; default scene exit
	rts	
.cantleavenorth
	lea Night04NorthExitBlockedStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event	
	rts

;*******************************************************************************
; SCENE_ID_CAVERN_BACKROOM
;*******************************************************************************
ActionScriptNight04CavernBackroomExit:
	;---------------------------------------------------------------------------
	; once again annoyed at how I implemented this
	;---------------------------------------------------------------------------
	cmpi.w	#MAP_MID_X+$0040,(MEM_PLAYER_SPRITE_X)
	bge.s	.stairs ; player X is > midpoint, use staircase exit
	move.w	#SCENE_ID_CAVERN,d6 ; player X is midpoint, use cavern exit
	bsr.w	DefaultExitSceneLoadNewScene
	rts
.stairs
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT04_EVENT02_CAVERNBACKROOM,d7 ; test if the event is complete
	bne.s	.cantusestairs ; event is already complete
.firsttime
	bsr.s	ActionScriptNight04CavernBackroomUpdateState
.cantusestairs
	lea	StoryTextNight04CantUseStairs,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea Night04CantUseStairsStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
.default
	bsr.w	DefaultExitScene ; default scene exit
	rts
	
; assumes d7 has MEM_DAY_EVENT_FLAGS
ActionScriptNight04CavernBackroomUpdateState:	
	bset.l	#FLAG_NIGHT04_EVENT02_CAVERNBACKROOM,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#SCENE_ID_SHALL,(MEM_STORY_EVENT1_SCENE_ID) ; clear story event
	move.w	#OBJECTIVE_D04_O04_Leave,(MEM_OBJECTIVE) ; update objective
	move.l	#$28000000,(MEM_NPC_LOCATION_SHALL) ; move victor to south hall
	rts

;*******************************************************************************
; SCENE_ID_SHALL
;*******************************************************************************
ActionScriptNight04SHallExit:	
	move.w	(MEM_PLAYER_SPRITE_DIRECTION),d7 ; copy player sprite direction to d7
	cmpi.w	#DIRECTION_DOWN,d7 ; is the player facing south?
	beq.s	.south ; branch if so
	bsr.w	DefaultExitScene ; default scene exit
	rts	
.south
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT04_EVENT03_SHALL,d7 ; test if event is complete
	beq.s	.cantleave ; branch if not
	; events are done
	bsr.w	EndNight04 ; transition to night
	rts	
.cantleave
	lea ScriptedEventNotTimeToLeaveCarlStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event	
	rts	

ActionScriptNight04SHallEnter:	
	;---------------------------------------------------------------------------
	; event should run if
	; FLAG_NIGHT04_EVENT02_CAVERNBACKROOM is set
	; FLAG_NIGHT04_EVENT03_SHALL is not set
	;---------------------------------------------------------------------------
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT04_EVENT02_CAVERNBACKROOM,d7 ; test if the event is complete
	beq.s	.default ; not set, go to default
	btst.l	#FLAG_NIGHT04_EVENT03_SHALL,d7 ; test if the event is complete
	bne.s	.default ; set, go to default
	;---------------------------------------------------------------------------
	; else update flags and run the scripted event
	;---------------------------------------------------------------------------
	bsr.s	ActionScriptNight04SHallUpdateState
	; setup scripted event
	lea ScriptedEventNight04_03_SouthHallStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
.default
	bsr.w	DefaultEnterScene
	rts

; assumes d7 has MEM_DAY_EVENT_FLAGS
ActionScriptNight04SHallUpdateState:
	bset.l	#FLAG_NIGHT04_EVENT03_SHALL,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.l	#$00000000,(MEM_NPC_LOCATION_SHALL) ; victor is out of south hall after this scene
	rts	

;*******************************************************************************
; SCENE_ID_VB
;*******************************************************************************
ActionScriptNight04VBInteract:	
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
	btst.l	#FLAG_NIGHT04_OPTIONAL1,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextNight04VBChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptNight04VBRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextNight04VBChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_GRUNBERG) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_NIGHT04_OPTIONAL1,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT1_SCENE_ID)
	; setup the scripted event
	lea	StoryTextNight04VBChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventNight04_Optional01_GrunbergStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
	
;*******************************************************************************
; SCENE_ID_WWTV
;*******************************************************************************
ActionScriptNight04WWTVInteract:	
	move.w	(MEM_ACTION_TARGET_NPCID),d7 ; copy the npc id to d7
	cmpi.w	#$FFFF,d7 ; test if the target is even an npnc
	beq.s	.default
	;---------------------------------------------------------------
	; npc 1 is the target
	;---------------------------------------------------------------
	cmpi.w	#$0001,d7 ; test for npc0
	bne.s	.default
	;---------------------------------------------------------------
	; else check if the event is complete
	;---------------------------------------------------------------
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT04_OPTIONAL2,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextNight04WWTVChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptNight04WWTVRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextNight04WWTVChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_LAURA) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_NIGHT04_OPTIONAL2,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT2_SCENE_ID)
	; setup the scripted event
	lea	StoryTextNight04WWTVChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventNight04_Optional00_LauraStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; End of the day
;*******************************************************************************
EndNight04:
	bsr.s	EndNight04SetupGameState
	;---------------------------------------------------------------------------	
	; set the intro screen
	;---------------------------------------------------------------------------	
	move.l	(MEM_GAME_STATE),d7	; copy game state
	bset.l	#STATE_FLAG_INTRO_SCREEN,d7 ; set intro screen flag
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	; set the intro screen counter
	move.w	#INTRO_SCREEN_COUNTER_START,(MEM_INTRO_SCENE_COUNTER)
	lea	SceneIntroDay05,a6	; address of the scene for the title screen
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	FadeIn	; fade in to the new scene
	; queue scripted event to launch
	lea ScriptedEventDay05_00_IntroStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	

EndNight04SetupGameState: ; separated to help with debugging		
	;---------------------------------------------------------------------------	
	; setup the next day
	;---------------------------------------------------------------------------	
	move.w	#$000A,(MEM_DAY) ; increment day
	move.w	#OBJECTIVE_D05_O00_Contest,(MEM_OBJECTIVE) ; initial objective
	and.l	#$00000000,(MEM_DAY_EVENT_FLAGS) ; clear day event flags
	move.w	#SCENE_ID_FCBFIREARMS,(MEM_STORY_EVENT1_SCENE_ID) ; story event 1
	move.w	#SCENE_ID_WWAUDIO,(MEM_STORY_EVENT2_SCENE_ID) ; story event 2
	move.w	#SCENE_ID_CAVERN,(MEM_OPTIONAL_EVENT1_SCENE_ID) ; 1st optional event
	move.w	#SCENE_ID_FCBCAMPING,(MEM_OPTIONAL_EVENT2_SCENE_ID) ; 2nd optional event
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT3_SCENE_ID) ; no 3rd optional event
	move.w	#PLAYER_SPRITE_ERYN,(MEM_PLAYER_SPRITE) ; initial sprite
	move.w	#DIRECTION_DOWN,(MEM_PLAYER_SPRITE_DIRECTION)
	move.w	#$00E5,(MEM_PLAYER_SPRITE_X)
	move.w	#$00B4,(MEM_PLAYER_SPRITE_Y)
	;---------------------------------------------------------------------------	
	; update NPC locations
	;---------------------------------------------------------------------------	
	bsr.w	InitNPCLocationsDay ; reset the NPC locations
	move.l	#$060D0000,(MEM_NPC_LOCATION_VB)	
	move.l	#$05100000,(MEM_NPC_LOCATION_DENIMCOUNTRY)
	move.l	#$0E240000,(MEM_NPC_LOCATION_FCBFIREARMS)
	move.l	#$1B250000,(MEM_NPC_LOCATION_WWAUDIO)
	move.l	#$100F0000,(MEM_NPC_LOCATION_CAVERN)	
	;---------------------------------------------------------------------------	
	; scatter some NPCs around
	;---------------------------------------------------------------------------	
	move.l	#$09260000,(MEM_NPC_LOCATION_TLODGE)
	move.l	#$19000000,(MEM_NPC_LOCATION_SVIDEO)
	move.l	#$15230000,(MEM_NPC_LOCATION_FCBFISHING)
	move.l	#$1D220000,(MEM_NPC_LOCATION_WWAPPLIANCES)
	move.l	#$0A200000,(MEM_NPC_LOCATION_CHECKERS)
	move.l	#$08210000,(MEM_NPC_LOCATION_POGODAWG)
	move.l	#$11000000,(MEM_NPC_LOCATION_WWHALL)
	move.l	#$12000000,(MEM_NPC_LOCATION_SHALL)		
	rts		
