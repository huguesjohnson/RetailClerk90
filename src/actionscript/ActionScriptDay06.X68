;*******************************************************************************
; Day 6 is Day 12 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_SHALL
;*******************************************************************************
ActionScriptDay06SHallExit:	
	move.w	(MEM_PLAYER_SPRITE_DIRECTION),d7 ; copy player sprite direction to d7
	cmpi.w	#DIRECTION_DOWN,d7 ; is the player facing south?
	beq.s	.cantleave ; branch if so
	cmpi.w	#DIRECTION_RIGHT,d7 ; is the player facing east?
	beq.s	.east ; branch if so
.default
	bsr.w	DefaultExitScene ; default scene exit
	rts	
.east
	lea	StoryTextDay06EnterNShackChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog
	rts
.cantleave
	lea ScriptedEventNotTimeToLeaveErynStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event	
	rts

ActionScriptDay06SHallRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	bne.s	.choice1
.choice0	
	bra.w	EndDay06
.choice1
	lea	StoryTextDay06EnterNShackChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the dialog
	lea ScriptedEventPlayerSpriteLeft4Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts

;*******************************************************************************
; SCENE_ID_CAVERN
;*******************************************************************************
ActionScriptDay06CavernInteract:
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
 	btst.l	#FLAG_DAY06_OPTIONAL1,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	; check if the final event is available
	cmpi.w	#MAX_REL,(MEM_REL_DB)	
	bne.s	.default ; not available, show default text	
	;---------------------------------------------------------------------------
	; else update flags and run the scripted event
	;---------------------------------------------------------------------------
	bset.l	#FLAG_DAY06_OPTIONAL1,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT1_SCENE_ID) ; clear optional event
	; update global events
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_GLOBAL_REL0Complete,d7 ; set event is done
	move.l	d7,(MEM_GLOBAL_EVENT_FLAGS) ; save updated flags
	; setup scripted event
	lea	StoryTextDay06CavernLine1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay06_Optional00Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
.default
	bsr.w ShowDefaultText
	rts

;*******************************************************************************
; SCENE_ID_SVIDEO
;*******************************************************************************
ActionScriptDay06SVideoInteract:	
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
 	btst.l	#FLAG_DAY06_OPTIONAL2,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	; check if the final event is available
	cmpi.w	#MAX_REL,(MEM_REL_NICKY)	
	bne.s	.default ; not available, show default text	
	;---------------------------------------------------------------------------
	; else update flags and run the scripted event
	;---------------------------------------------------------------------------
	bset.l	#FLAG_DAY06_OPTIONAL2,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT2_SCENE_ID) ; clear optional event
	; update global events
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_GLOBAL_REL1Complete,d7 ; set event is done
	move.l	d7,(MEM_GLOBAL_EVENT_FLAGS) ; save updated flags
	; setup scripted event
	lea	StoryTextDay06SVideoLine1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay06_Optional01Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
.default
	bsr.w ShowDefaultText
	rts
	
;*******************************************************************************
; SCENE_ID_FCBCAMPING
;*******************************************************************************
ActionScriptDay06FCBCampingInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
 	btst.l	#FLAG_DAY06_OPTIONAL3,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	; check if the final event is available
	cmpi.w	#MAX_REL,(MEM_REL_GRANT)	
	bne.s	.default ; not available, show default text	
	;---------------------------------------------------------------------------
	; else update flags and run the scripted event
	;---------------------------------------------------------------------------
	bset.l	#FLAG_DAY06_OPTIONAL3,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT3_SCENE_ID) ; clear optional event
	; update global events
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_GLOBAL_REL2Complete,d7 ; set event is done
	move.l	d7,(MEM_GLOBAL_EVENT_FLAGS) ; save updated flags
	; setup scripted event
	lea	StoryTextDay06FCBCampingLine1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay06_Optional02Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
.default
	bsr.w ShowDefaultText
	rts
	
;*******************************************************************************
; End of the day
;*******************************************************************************
EndDay06:
	bsr.s	EndDay06SetupGameState
	;---------------------------------------------------------------------------	
	; queue the introduction
	;---------------------------------------------------------------------------	
	lea ScriptedEventNight06_00_IntroStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
	
EndDay06SetupGameState: ; separated to help with debugging		
	;---------------------------------------------------------------------------	
	; setup the next day
	;---------------------------------------------------------------------------	
	move.w	#$000D,(MEM_DAY) ; increment day
	move.w	#OBJECTIVE_D06_O01_FinalDay,(MEM_OBJECTIVE) ; initial objective
	and.l	#$00000000,(MEM_DAY_EVENT_FLAGS) ; clear event flags
	move.w	#SCENE_ID_BASEMENTCAFE,(MEM_STORY_EVENT1_SCENE_ID) ; initial story event
	move.w	#$FFFF,(MEM_STORY_EVENT2_SCENE_ID) ; no 2nd story event
	move.w	#PLAYER_SPRITE_CARL,(MEM_PLAYER_SPRITE) ; initial sprite
	move.w	#DIRECTION_UP,(MEM_PLAYER_SPRITE_DIRECTION)
	move.w	#$00DE,(MEM_PLAYER_SPRITE_X)
	move.w	#$00EE,(MEM_PLAYER_SPRITE_Y)
	;---------------------------------------------------------------------------	
	; determine which optional events are available
	;---------------------------------------------------------------------------	
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT1_SCENE_ID) ; clear all optional events
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT2_SCENE_ID) ; clear all optional events
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT3_SCENE_ID) ; clear all optional events
	cmpi.w	#MAX_REL,(MEM_REL_LAURA)
	bne.s	.1
	move.w	#SCENE_ID_WWAPPLIANCES,(MEM_OPTIONAL_EVENT1_SCENE_ID)	
.1
	cmpi.w	#MAX_REL,(MEM_REL_ELIZA)
	bne.s	.2
	move.w	#SCENE_ID_CPLANET,(MEM_OPTIONAL_EVENT2_SCENE_ID)	
.2
	cmpi.w	#MAX_REL,(MEM_REL_GRUNBERG)
	bne.s	.3
	move.w	#SCENE_ID_VB,(MEM_OPTIONAL_EVENT3_SCENE_ID)	
.3	
	;---------------------------------------------------------------------------	
	; update NPC locations
	;---------------------------------------------------------------------------	
	bsr.w	InitNPCLocationsNight ; reset the NPC locations
	move.l	#$27000000,(MEM_NPC_LOCATION_TBOOKS)
	rts		

