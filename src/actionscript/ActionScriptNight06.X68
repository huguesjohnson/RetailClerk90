;*******************************************************************************
; Night 6 is Day 13 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_BASEMENTCAFE
;*******************************************************************************
ActionScriptNight06BasementCafeInteract:	
	move.w	(MEM_ACTION_TARGET_NPCID),d7 ; copy the npc id to d7
	cmpi.w	#$FFFF,d7 ; test if the target is even an npnc
	beq.s	.default
	;---------------------------------------------------------------
	; npc 0 is the target
	;---------------------------------------------------------------
	cmpi.w	#$0000,d7 ; test for npc0
	bne.s	.default
	;---------------------------------------------------------------
	; else check if the event is complete
	;---------------------------------------------------------------
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT06_EVENT00_BASEMENTKITCHEN,d7 ; test if the event is complete
	bne.s	.default ; show default text if the event is complete
	;---------------------------------------------------------------------------
	; else update flags and run the scripted event
	;---------------------------------------------------------------------------
	bsr.w Night06UpdateState
	; setup scripted event
	lea ScriptedEventNight06_01_BasementKitchenStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
.default
	bsr.w ShowDefaultText
	rts

Night06UpdateState: ; assumes d7 has MEM_DAY_EVENT_FLAGS
	bset.l	#FLAG_NIGHT06_EVENT00_BASEMENTKITCHEN,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#SCENE_ID_NSHACK,(MEM_STORY_EVENT1_SCENE_ID) ; update story event
	rts

;*******************************************************************************
; SCENE_ID_SHALL
;*******************************************************************************
ActionScriptNight06SHallExit:	
	move.w	(MEM_PLAYER_SPRITE_DIRECTION),d7 ; copy player sprite direction to d7
	cmpi.w	#DIRECTION_DOWN,d7 ; is the player facing south?
	beq.s	.cantleavesouth ; branch if so
	cmpi.w	#DIRECTION_RIGHT,d7 ; is the player facing east?
	beq.s	.east ; branch if so
.default
	bsr.w	DefaultExitScene ; default scene exit
	rts	
.cantleavesouth
	lea ScriptedEventNotTimeToLeaveCarlStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event	
	rts
.east
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT06_EVENT00_BASEMENTKITCHEN,d7 ; test if the event is complete
	beq.s	.cantleaveeast ; event not complete, can't enter yet
	; else prompt to enter
	lea	StoryTextNight06EnterNShackChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog
	rts
.cantleaveeast
	lea Night03EastExitBlockedStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event	
	rts

ActionScriptNight06SHallRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	bne.s	.choice1
.choice0	
	lea	StoryTextNight06EnterNShackChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the dialog
	bsr.w	EndNight06
	rts
.choice1
	lea	StoryTextNight06EnterNShackChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the dialog
	lea ScriptedEventPlayerSpriteLeft4Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts

;*******************************************************************************
; SCENE_ID_CPLANET
;*******************************************************************************
ActionScriptNight06CPlanetInteract:	
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
 	btst.l	#FLAG_NIGHT06_OPTIONAL2,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	; check if the final event is available
	cmpi.w	#MAX_REL,(MEM_REL_ELIZA)	
	bne.s	.default ; not available, show default text	
	;---------------------------------------------------------------------------
	; else update flags and run the scripted event
	;---------------------------------------------------------------------------
	bset.l	#FLAG_NIGHT06_OPTIONAL2,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT2_SCENE_ID) ; clear optional event
	; update global events
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_GLOBAL_REL3Complete,d7 ; set event is done
	move.l	d7,(MEM_GLOBAL_EVENT_FLAGS) ; save updated flags
	; setup scripted event
	lea ScriptedEventNight06_Optional01Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
.default
	bsr.w ShowDefaultText
	rts
	
;*******************************************************************************
; SCENE_ID_VB
;*******************************************************************************
ActionScriptNight06VBInteract:	
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
 	btst.l	#FLAG_NIGHT06_OPTIONAL3,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	; check if the final event is available
	cmpi.w	#MAX_REL,(MEM_REL_GRUNBERG)	
	bne.s	.default ; not available, show default text	
	;---------------------------------------------------------------------------
	; else update flags and run the scripted event
	;---------------------------------------------------------------------------
	bset.l	#FLAG_NIGHT06_OPTIONAL3,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT3_SCENE_ID) ; clear optional event
	; update global events
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_GLOBAL_REL4Complete,d7 ; set event is done
	move.l	d7,(MEM_GLOBAL_EVENT_FLAGS) ; save updated flags
	; setup scripted event
	lea ScriptedEventNight06_Optional02Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
.default
	bsr.w ShowDefaultText
	rts
	
;*******************************************************************************
; SCENE_ID_WWAPPLIANCES
;*******************************************************************************
ActionScriptNight06WWAppliancesInteract:	
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
 	btst.l	#FLAG_NIGHT06_OPTIONAL1,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	; check if the final event is available
	cmpi.w	#MAX_REL,(MEM_REL_LAURA)	
	bne.s	.default ; not available, show default text	
	;---------------------------------------------------------------------------
	; else update flags and run the scripted event
	;---------------------------------------------------------------------------
	bset.l	#FLAG_NIGHT06_OPTIONAL1,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT1_SCENE_ID) ; clear optional event
	; update global events
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_GLOBAL_REL5Complete,d7 ; set event is done
	move.l	d7,(MEM_GLOBAL_EVENT_FLAGS) ; save updated flags
	; setup scripted event
	lea ScriptedEventNight06_Optional00Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
.default
	bsr.w ShowDefaultText
	rts
	
	
;*******************************************************************************
; SCENE_ID_BASEMENTWDORM
;*******************************************************************************
ActionScriptNight06BasementWDormEnter:
	;---------------------------------------------------------------------------
	; is the hidden event available?
	;---------------------------------------------------------------------------
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7 ; copy global event flags to d7
	btst.l	#FLAG_GLOBAL_Day06Hidden,d7 ; test if the event is available
	beq.s	.default ; not set, don't run
	;---------------------------------------------------------------------------
	; has the hidden event already run?
	;---------------------------------------------------------------------------
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT06_HIDDEN0,d7 ; test if the event is complete
	bne.s	.default ; show default text if the event is complete
	;---------------------------------------------------------------------------
	; else update flags and run the scripted event
	;---------------------------------------------------------------------------
	bset.l	#FLAG_NIGHT06_HIDDEN0,d7 ; set event complete
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; setup scripted event
	lea ScriptedEventNight06_HiddenStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
.default
	rts
	
;*******************************************************************************
; End of the day
;*******************************************************************************
EndNight06:

SetupEndGame:
	; --------------------------------------------------------------------------
	; test if the player did all required interactions
	; bad = no final character events complete
	; good = at least one final character event complete 
	; perfect = all final character events viewed, and trading sequence complete
	; --------------------------------------------------------------------------
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7 ; copy global event flags to d7
	tst	d7 ; if d7 is zero we definitely have a bad ending
	beq.s	.badending
	cmpi.l	#ALL_GLOBAL_FLAGS_SET,d7 ; test if all flags are set
	beq.s	.perfectending
	; --------------------------------------------------------------------------
	; at this point, it's either or good or bad ending
	; test thing that trigger good ending
	; this will fall through to the bad ending by default
	; --------------------------------------------------------------------------
	btst.l	#FLAG_GLOBAL_REL0Complete,d7
	beq.s	.goodending
	btst.l	#FLAG_GLOBAL_REL1Complete,d7
	beq.s	.goodending
	btst.l	#FLAG_GLOBAL_REL2Complete,d7
	beq.s	.goodending
	btst.l	#FLAG_GLOBAL_REL3Complete,d7
	beq.s	.goodending
	btst.l	#FLAG_GLOBAL_REL4Complete,d7
	beq.s	.goodending
	btst.l	#FLAG_GLOBAL_REL5Complete,d7
	beq.s	.goodending
.badending
	lea	ScriptedEventEndBadStart,a6	; point a6 to event to load
	bra.s	.queue
.perfectending
	lea	ScriptedEventEndPerfectStart,a6	; point a6 to event to load
	bra.s	.queue
.goodending
	; set which NPCs appear in the good ending
	; d7 should have (MEM_GLOBAL_EVENT_FLAGS)
.testrel3
	btst.l	#FLAG_GLOBAL_REL3Complete,d7 ; test if this one is done
	beq.s	.testrel4 ; not done
	or.l	#$0000000B,(MEM_NPC_LOCATION_END_GOOD) ; add eliza to good ending
.testrel4
	btst.l	#FLAG_GLOBAL_REL4Complete,d7 ; test if this one is done
	beq.s	.testrel5 ; not done	
	or.l	#$000C0000,(MEM_NPC_LOCATION_END_GOOD) ; add grunberg to good ending
.testrel5
	btst.l	#FLAG_GLOBAL_REL5Complete,d7 ; test if this one is done
	beq.s	.loadse ; not done	
	or.l	#$00001D00,(MEM_NPC_LOCATION_END_GOOD) ; add laura to good ending
.loadse
	lea	ScriptedEventEndGoodStart,a6	; point a6 to event to load
.queue
	bsr.w QueueScriptedEvent	; queue the event
	rts

