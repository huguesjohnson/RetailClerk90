;*******************************************************************************
; Day 3 is Day 6 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_POGODAWG
;*******************************************************************************
ActionScriptDay03PogoDawgInteract:
	move.w	(MEM_ACTION_TARGET_NPCID),d7 ; copy the npc id to d7
	cmpi.w	#$FFFF,d7 ; test if the target is even an npnc
	beq.s	.default
	;---------------------------------------------------------------
	; npc 0 is the clerk
	;---------------------------------------------------------------
	cmpi.w	#$0000,d7 ; test for npc0
	bne.s	.default
	;---------------------------------------------------------------------------
	; FLAG_DAY03_EVENT00_POGODAWG=0 -> start the subtask
	;
	; FLAG_DAY03_EVENT04_DONE=1 -> default
	;
	; FLAG_DAY03_EVENT00_POGODAWG=1
	; &&FLAG_DAY03_EVENT03_LUNCHESDELIVERED=0 -> inprogress
	;
	; FLAG_DAY03_EVENT00_POGODAWG=1
	; &&FLAG_DAY03_EVENT03_LUNCHESDELIVERED=1
	; &&FLAG_DAY03_EVENT04_DONE=0 -> finish the subtask
	;---------------------------------------------------------------------------
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY03_EVENT00_POGODAWG,d7 ; test if the event is complete
	beq.s	.start ; start the subtask
	btst.l	#FLAG_DAY03_EVENT04_DONE,d7 ; test if the event is complete
	bne.s	.default ; everything done, default
	;---------------------------------------------------------------------------
	; at this point FLAG_DAY03_EVENT00_POGODAWG is not 0
	; and FLAG_DAY03_EVENT04_DONE is zero
	; so only need to test FLAG_DAY03_EVENT03_LUNCHESDELIVERED
	;---------------------------------------------------------------------------	
	btst.l	#FLAG_DAY03_EVENT03_LUNCHESDELIVERED,d7 ; test if the event is complete
	beq.s .inprogress
	; otherwise we fall into the finish part
.finish
	bsr.s	ActionScriptDay04PogoDawgFinishedState
	; setup scripted event
	lea	StoryTextDay03PogoDawg2Line1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay03_05_PogoDawgStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
.start
	bset.l	#FLAG_DAY03_EVENT00_POGODAWG,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#SCENE_ID_CHECKERS,(MEM_STORY_EVENT1_SCENE_ID) ; set story event
	move.w	#SCENE_ID_CNOW,(MEM_STORY_EVENT2_SCENE_ID) ; set story event
	move.w	#OBJECTIVE_D03_O01_DeliverLunches,(MEM_OBJECTIVE) ; update objective
	; setup scripted event
	lea	StoryTextDay03PogoDawgLine1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay03_01_PogoDawgStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
.inprogress
	; just show a message
	lea	StoryTextDay03PogoDawgInprogress,a6 ; point a6 to the dialog
	bsr.w	ShowDialog ; show the first dialog
	rts
.default
	bsr.w ShowDefaultText
	rts

; assumes d7 has MEM_DAY_EVENT_FLAGS
ActionScriptDay04PogoDawgFinishedState:
	bset.l	#FLAG_DAY03_EVENT04_DONE,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#SCENE_ID_DENIMCOUNTRY,(MEM_STORY_EVENT1_SCENE_ID) ; set story event
	move.w	#OBJECTIVE_D03_O04_CheckIn,(MEM_OBJECTIVE) ; update objective
	rts

;*******************************************************************************
; SCENE_ID_CHECKERS
;*******************************************************************************
ActionScriptDay03CheckersInteract:	
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
	btst.l	#FLAG_DAY03_EVENT01_CHECKERS,d7 ; test if the event is complete
	bne.s	.default ; show default text if the event is complete
	;---------------------------------------------------------------------------
	; else update flags and run the scripted event
	;---------------------------------------------------------------------------
	bset.l	#FLAG_DAY03_EVENT01_CHECKERS,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#$FFFF,(MEM_STORY_EVENT1_SCENE_ID) ; clear story event
	bsr.w	CheckDay03Events
	; setup scripted event
	lea	StoryTextDay03CheckersLine1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay03_02_CheckersStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
.default
	bsr.w ShowDefaultText
	rts

;*******************************************************************************
; SCENE_ID_CNOW
;*******************************************************************************
ActionScriptDay03CNowInteract:
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
	btst.l	#FLAG_DAY03_EVENT02_CLOTHESNOW,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	;---------------------------------------------------------------------------
	; else update flags and run the scripted event
	;---------------------------------------------------------------------------
	bset.l	#FLAG_DAY03_EVENT02_CLOTHESNOW,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#$FFFF,(MEM_STORY_EVENT2_SCENE_ID) ; clear story event
	bsr.w	CheckDay03Events
	; setup scripted event
	lea	StoryTextDay03CNowLine1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay03_03_ClothesNowStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
.default
	bsr.w ShowDefaultText
	rts

CheckDay03Events:
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY03_EVENT01_CHECKERS,d7 ; test if event is complete
	beq.s	.exit ; event not complete, exit
	btst.l	#FLAG_DAY03_EVENT02_CLOTHESNOW,d7 ; test if event is complete
	beq.s	.exit ; event not complete, exit
	; otherwise update story event, objective, and npc locations
	bset.l	#FLAG_DAY03_EVENT03_LUNCHESDELIVERED,d7 ; set events complete
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#OBJECTIVE_D03_O02_ReportBack,(MEM_OBJECTIVE) ; update objective	
	move.w	#SCENE_ID_SHALL,(MEM_STORY_EVENT1_SCENE_ID) ; update story event
	move.l	#$18000000,(MEM_NPC_LOCATION_SHALL) ; move characters
.exit
	rts

;*******************************************************************************
; SCENE_ID_DENIMCOUNTRY
;*******************************************************************************
ActionScriptDay03DenimCountryInteract:	
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
	btst.l	#FLAG_DAY03_EVENT04_DONE,d7 ; test if the optional event is complete
	beq.s	.inprogress ; still inprogress
	;---------------------------------------------------------------------------
	; else end of the day
	;---------------------------------------------------------------------------
	bra.w	EndDay03
.inprogress
	; just show a message
	lea	StoryTextDay03DenimCountryInprogress,a6 ; point a6 to the dialog
	bsr.w	ShowDialog ; show the first dialog
	rts
.default
	bsr.w ShowDefaultText
	rts
	
;*******************************************************************************
; SCENE_ID_SHALL
;*******************************************************************************
ActionScriptDay03SHallEnter:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY03_EVENT05_SOUTHHALL,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	;---------------------------------------------------------------------------
	; else update flags and run the scripted event
	;---------------------------------------------------------------------------
	bset.l	#FLAG_DAY03_EVENT05_SOUTHHALL,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#SCENE_ID_POGODAWG,(MEM_STORY_EVENT1_SCENE_ID) ; update story event
	move.w	#OBJECTIVE_D01_O01_ReportBack,(MEM_OBJECTIVE) ; update objective
	move.l	#$00000000,(MEM_NPC_LOCATION_SHALL) ; shall is empty again
	; setup scripted event
	lea	StoryTextDay03PogoDawg2Line1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay03_04_SouthHallStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
.default
	rts
	
ActionScriptDay03SHallExit:	
	move.w	(MEM_PLAYER_SPRITE_DIRECTION),d7 ; copy player sprite direction to d7
	cmpi.w	#DIRECTION_DOWN,d7 ; is the player facing south?
	beq.s	.south ; branch if so
	bsr.w	DefaultExitScene ; default scene exit
	rts	
.south
	lea ScriptedEventNotTimeToLeaveErynStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event	
	rts

;*******************************************************************************
; SCENE_ID_SVIDEO
;*******************************************************************************
ActionScriptDay03SVideoInteract:	
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
	btst.l	#FLAG_DAY03_OPTIONAL1,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextDay03SVideoChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptDay03SVideoRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextDay03SVideoChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_NICKY) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_DAY03_OPTIONAL1,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT1_SCENE_ID)
	; setup the scripted event
	lea	StoryTextDay03SVideoChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay03_Optional01_NickyStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; SCENE_ID_CAVERN
;*******************************************************************************
ActionScriptDay03CavernInteract:	
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
	btst.l	#FLAG_DAY03_OPTIONAL1,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextDay03CavernChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptDay03CavernRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextDay03CavernChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_DB) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_DAY03_OPTIONAL2,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT2_SCENE_ID)
	; setup the scripted event
	lea	StoryTextDay03CavernChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay03_Optional00_DBStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; End of the day
;*******************************************************************************
EndDay03:
	bsr.s	EndDay03SetupGameState
	;---------------------------------------------------------------------------	
	; queue the introduction
	;---------------------------------------------------------------------------	
	lea ScriptedEventNight03_00_IntroStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
	
EndDay03SetupGameState: ; separated to help with debugging		
	;---------------------------------------------------------------------------	
	; setup the next day
	;---------------------------------------------------------------------------	
	move.w	#$0007,(MEM_DAY) ; increment day
	move.w	#OBJECTIVE_D03_O03_Revisit,(MEM_OBJECTIVE) ; initial objective
	and.l	#$00000000,(MEM_DAY_EVENT_FLAGS) ; clear event flags
	move.w	#SCENE_ID_TLODGE,(MEM_STORY_EVENT1_SCENE_ID) ; 1st story event
	move.w	#SCENE_ID_CNOW,(MEM_STORY_EVENT2_SCENE_ID) ; 2nd story event
	move.w	#SCENE_ID_CPLANET,(MEM_OPTIONAL_EVENT1_SCENE_ID) ; 1st optional event
	move.w	#SCENE_ID_WWCHECKOUT,(MEM_OPTIONAL_EVENT2_SCENE_ID) ; 2nd optional event
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT3_SCENE_ID) ; no 3rd optional event
	move.w	#PLAYER_SPRITE_CARL,(MEM_PLAYER_SPRITE) ; initial sprite
	move.w	#DIRECTION_UP,(MEM_PLAYER_SPRITE_DIRECTION)
	move.w	#$00DE,(MEM_PLAYER_SPRITE_X)
	move.w	#$00EE,(MEM_PLAYER_SPRITE_Y)
	;---------------------------------------------------------------------------	
	; update NPC locations
	;---------------------------------------------------------------------------	
	bsr.w	InitNPCLocationsNight ; reset the NPC locations
	move.l	#$07010000,(MEM_NPC_LOCATION_NSHACK)
	move.l	#$00000000,(MEM_NPC_LOCATION_WWAPPLIANCES)	
	move.l	#$1A1D0000,(MEM_NPC_LOCATION_WWCHECKOUT)	
	move.l	#$11000000,(MEM_NPC_LOCATION_WWHALL) ; put the guard somewhere	
	rts	
