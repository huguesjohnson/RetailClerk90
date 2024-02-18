;*******************************************************************************
; Day 1 is Day 2 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_DENIMCOUNTRY
;*******************************************************************************
ActionScriptDay01DenimCountryInteract:
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY01_EVENT00_CPLANET,d7 ; test if event is done
	beq.s	.notdone
	btst.l	#FLAG_DAY01_EVENT01_WWAPPLIANCES,d7 ; test if event is done
	beq.s	.notdone
	; subtasks are done - so this part of the day is over
	bsr.w	EndDay01
	rts		
.notdone:
	lea	StoryTextDay01DenimCountryNotDone,a6 ; text to display
	bsr.w	ShowDialog ; show the first response
	rts
.default:	
	bsr.w ShowDefaultText
	rts

;*******************************************************************************
; SCENE_ID_CPLANET
;*******************************************************************************
ActionScriptDay01CPlanetInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY01_EVENT00_CPLANET,d7 ; test if event is done
	bne.s	.default ; event is done
	bset.l	#FLAG_DAY01_EVENT00_CPLANET,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#$FFFF,(MEM_STORY_EVENT1_SCENE_ID) ; clear story event	
	bsr.w	TestDay01Events ; text if all events are complete
	; setup scripted event
	lea ScriptedEventDay01_01_CPlanetStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
.default:
	bsr.w ShowDefaultText
	rts

;*******************************************************************************
; SCENE_ID_SHALL
;*******************************************************************************
ActionScriptDay01SouthHallExit:	
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
; SCENE_ID_WWAPPLIANCES
;*******************************************************************************
ActionScriptDay01WWAppliancesInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY01_EVENT01_WWAPPLIANCES,d7 ; test if event is done
	bne.s	.default ; event is done
	bset.l	#FLAG_DAY01_EVENT01_WWAPPLIANCES,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#$FFFF,(MEM_STORY_EVENT2_SCENE_ID) ; clear story event	
	bsr.w	TestDay01Events ; text if all events are complete
	; setup scripted event
	lea ScriptedEventDay01_02_WWAppliancesStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
.default:
	bsr.w ShowDefaultText
	rts

TestDay01Events:
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY01_EVENT00_CPLANET,d7 ; test if the event is complete
	beq.s	.exit ; exit if not complete
	btst.l	#FLAG_DAY01_EVENT01_WWAPPLIANCES,d7 ; test if the event is complete
	beq.s	.exit ; exit if not complete
	; both events are complete
	move.w	#SCENE_ID_DENIMCOUNTRY,(MEM_STORY_EVENT1_SCENE_ID) ; 1st story event
	move.w	#OBJECTIVE_D01_O01_ReportBack,(MEM_OBJECTIVE) ; update objective
.exit
	rts
		
;*******************************************************************************
; SCENE_ID_CAVERN
;*******************************************************************************
ActionScriptDay01CavernInteract:	
	move.w	(MEM_ACTION_TARGET_NPCID),d7 ; copy the npc id to d7
	cmpi.w	#$FFFF,d7 ; test if the target is even an npnc
	beq.s	.default
	;---------------------------------------------------------------
	; npc 1 is the clerk this time
	;---------------------------------------------------------------
	cmpi.w	#$0001,d7 ; test for npc0
	bne.s	.default
	;---------------------------------------------------------------
	; else check if the event is complete
	;---------------------------------------------------------------
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY01_OPTIONAL1,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextDay01CavernChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptDay01CavernRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextDay01CavernChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_DB) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_DAY01_OPTIONAL1,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT1_SCENE_ID)
	; change NPCs in the area afterward
	move.l	#$210F0000,(MEM_NPC_LOCATION_CAVERN)	
	; setup the scripted event
	lea	StoryTextDay01CavernChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay01_Optional00_DBStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; SCENE_ID_FCBCAMPING
;*******************************************************************************
ActionScriptDay01FCBCampingInteract:	
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
	btst.l	#FLAG_DAY01_OPTIONAL2,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextDay01FCBCampingChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptDay01FCBCampingRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextDay01FCBCampingChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_GRANT) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_DAY01_OPTIONAL2,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT2_SCENE_ID)
	; setup the scripted event
	lea	StoryTextDay01FCBCampingChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay01_Optional01_GrantStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts			
		
;*******************************************************************************
; End of the day
;*******************************************************************************
EndDay01:
	bsr.s	EndDay01SetupGameState
	;---------------------------------------------------------------------------	
	; queue the ending dialog and transition to night
	;---------------------------------------------------------------------------	
	lea ScriptedEventNight01_00_IntroStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
EndDay01SetupGameState: ; separated to help with debugging
	;---------------------------------------------------------------------------	
	; setup the next day
	;---------------------------------------------------------------------------	
	move.w	#$0003,(MEM_DAY) ; increment day
	move.w	#OBJECTIVE_D01_O02_FollowGuy,(MEM_OBJECTIVE) ; initial objective
	and.l	#$00000000,(MEM_DAY_EVENT_FLAGS) ; clear event flags
	move.w	#SCENE_ID_CAVERN,(MEM_STORY_EVENT1_SCENE_ID) ; initial story event
	move.w	#$FFFF,(MEM_STORY_EVENT2_SCENE_ID) ; no 2nd story event
	move.w	#SCENE_ID_WWAPPLIANCES,(MEM_OPTIONAL_EVENT1_SCENE_ID) ; 1st optional event
	move.w	#SCENE_ID_VB,(MEM_OPTIONAL_EVENT2_SCENE_ID) ; 2nd optional event
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT3_SCENE_ID) ; no 3rd optional event
	move.w	#PLAYER_SPRITE_CARL,(MEM_PLAYER_SPRITE) ; initial sprite
	move.w	#DIRECTION_UP,(MEM_PLAYER_SPRITE_DIRECTION)
	move.w	#$00DE,(MEM_PLAYER_SPRITE_X)
	move.w	#$00EE,(MEM_PLAYER_SPRITE_Y)
	;---------------------------------------------------------------------------	
	; update NPC locations
	;---------------------------------------------------------------------------	
	bsr.w	InitNPCLocationsNight ; reset the NPC locations
	move.l	#$18000000,(MEM_NPC_LOCATION_WEHALL) ; brett starts in wehall
	move.l	#$11000000,(MEM_NPC_LOCATION_SHALL) ; put the guard somewhere 		
	rts	

