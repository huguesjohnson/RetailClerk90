;*******************************************************************************
; Day 0 is Day 0 in the action script
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_DENIMCOUNTRY
;*******************************************************************************
ActionScriptDay00SceneDenimCountyInteract:
	move.w	(MEM_ACTION_TARGET_NPCID),d7 ; copy the npc id to d7
	cmpi.w	#$FFFF,d7 ; test if the target is even an npnc
	beq.w	ActionScriptDay00SceneDenimCountryInteractDefault ; branch if not an npc
	;---------------------------------------------------------------
	; npc 0 is the clerk
	; npcs 1 & 2 are shoppers and their character ids don't matter
	; they could be swapped for other shoppers with no changes here
	;---------------------------------------------------------------
	cmpi.w	#$0002,d7 ; test for npc2
	beq.w	ActionScriptDay00SceneDenimCountryInteractNPC2
	cmpi.w	#$0001,d7 ; test for npc1
	beq.w	ActionScriptDay00SceneDenimCountryInteractNPC1
	; else default to npc0
ActionScriptDay00SceneDenimCountryInteractNPC0: ; lisa
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY00_EVENT00_CUSTOMER0,d7 ; test the flag for talking to npc1
	beq.s	.customers
	btst.l	#FLAG_DAY00_EVENT01_CUSTOMER1,d7 ; test the flag for talking to npc2
	beq.s	.customers
	btst.l	#FLAG_DAY00_EVENT02_CANEXITDC,d7 ; test the flag for completing the first events
	bne.s	.default
	bsr.s	ActionScriptDay00UpdateStateAfterCustomerEventsDone
	lea	StoryTextDay00LisaWorriedLine0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea Day00SceneDenimCountryLisaWorriedStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
.default
	; default
	bsr.w	ShowDefaultText
	rts
.customers
	lea	StoryTextDay00NPC0Customers,a6 ; point to text to display
	bsr.w	ShowDialog
	rts
ActionScriptDay00SceneDenimCountryInteractNPC1: ; shopper 1
	lea	StoryTextDay00NPC1Choice,a6 ; load dialog text	
	bra.s	ActionScriptDay00SceneDenimCountryInteractShow2ChoiceDialog
ActionScriptDay00SceneDenimCountryInteractNPC2: ; shopper 2
	lea	StoryTextDay00NPC2Choice,a6 ; load dialog text	
ActionScriptDay00SceneDenimCountryInteractShow2ChoiceDialog:
	bsr.w	Show2ChoiceDialog
	rts
ActionScriptDay00SceneDenimCountryInteractDefault:
	bsr.w	ShowDefaultText
	rts

; assumes d7 has MEM_DAY_EVENT_FLAGS
ActionScriptDay00UpdateStateAfterCustomerEventsDone:
	bset.l	#FLAG_DAY00_EVENT02_CANEXITDC,d7 ; update the state
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; copy the updated state back
	move.l	(MEM_GAME_STATE),d7 ; copy game state to d7
	bset.l	#STATE_FLAG_FAST_TRAVEL_AVAILABLE,d7 ; fast travel is now available
	move.l	d7,(MEM_GAME_STATE) ; save updated state
	move.w	#OBJECTIVE_D00_O01_VisitInfo,(MEM_OBJECTIVE) ; update the objective
	move.w	#SCENE_ID_SOUTH_CENTER,(MEM_STORY_EVENT1_SCENE_ID) ; update story event
	move.w	#SCENE_ID_CAVERN,(MEM_OPTIONAL_EVENT1_SCENE_ID) ; update optional event
	move.w	#SCENE_ID_SVIDEO,(MEM_OPTIONAL_EVENT2_SCENE_ID) ; update optional event
	move.l	#$05000000,(MEM_NPC_LOCATION_DENIMCOUNTRY) ; update npcs in denim country
	rts

ActionScriptDay00SceneDenimCountryRespond:
	bsr.w	ResetDialog
	cmpi.w	#$0002,(MEM_ACTION_TARGET_NPCID) ; test for npc2	
	beq.s	ActionScriptDay00SceneDenimCountryRespondNPC2
	; else default to npc1	
ActionScriptDay00SceneDenimCountryRespondNPC1:
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_DAY00_EVENT00_CUSTOMER0,d7 ; set the flag for talking to npc1
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; copy them back
	; now check which option was selected
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	bne.s	ActionScriptDay00SceneDenimCountryRespondNPC1Choice1
	lea	StoryTextDay00NPC1Choice0Line0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea Day00SceneDenimCountryRespondNPC1Respond0Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
ActionScriptDay00SceneDenimCountryRespondNPC1Choice1:
	lea	StoryTextDay00NPC1Choice1Line0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea Day00SceneDenimCountryRespondNPC1Respond1Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
ActionScriptDay00SceneDenimCountryRespondNPC2:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_DAY00_EVENT01_CUSTOMER1,d7 ; set the flag for talking to npc2
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; copy them back
	; now check which option was selected
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	bne.s	ActionScriptDay00SceneDenimCountryRespondNPC2Choice1
	lea	StoryTextDay00NPC2Choice0Line0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea Day00SceneDenimCountryRespondNPC2Respond0Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
ActionScriptDay00SceneDenimCountryRespondNPC2Choice1:
	lea	StoryTextDay00NPC2Choice1Line0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea Day00SceneDenimCountryRespondNPC2Respond1Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
	
ActionScriptDay00SceneDenimCountryExit:
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY00_EVENT02_CANEXITDC,d7 ; test if events are complete
	beq.s	.exitblocked ; branch if flag is not set
	; else default exit
	bsr.w	DefaultExitScene
	rts	
.exitblocked
	move.w	(MEM_PLAYER_SPRITE_DIRECTION),d7 ; copy player sprite direction to d7
	cmpi.w	#DIRECTION_LEFT,d7 ; is the player facing west?
	beq.s	.exitblockedwest ; branch if so
.exitblockednorth
	lea Day00NorthExitBlockedStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
.exitblockedwest
	lea Day00WestExitBlockedStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
	
;*******************************************************************************
; SCENE_ID_SOUTH_CENTER
;*******************************************************************************
ActionScriptDay00InfoDeskInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY00_EVENT03_INFODESKVISITED,d7 ; test if event already ran
	beq.s	.scriptedevent ; if not, branch to run the scripted event
	bsr.w ShowDefaultText ; show default text by default
	rts
.scriptedevent
	bsr.s	ActionScriptDay00UpdateStateAfterInfoDesk
	lea ScriptedEventDay00_01_InfoDeskStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
	
; assumes d7 has MEM_DAY_EVENT_FLAGS 	
ActionScriptDay00UpdateStateAfterInfoDesk:
	bset.l	#FLAG_DAY00_EVENT03_INFODESKVISITED,d7 ; set event flag
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#SCENE_ID_SHALL,(MEM_STORY_EVENT1_SCENE_ID) ; update story event
	; add item that is received during the scripted event
	lea	MEM_PLAYER1_ITEM_COUNT,a1 ; point to 1st pc inventory
	move.w	#OBJ_ITEM_SCARF,d7 ; add item from trading sequence
	bsr.w	AddItem ; add item to inventory	
	move.w	#OBJECTIVE_D00_O02_LeaveWhenReady,(MEM_OBJECTIVE) ; update the objective		
	rts	
	
;*******************************************************************************
; SCENE_ID_SHALL
;*******************************************************************************
ActionScriptDay00SouthHallExit:	
	move.w	(MEM_PLAYER_SPRITE_DIRECTION),d7 ; copy player sprite direction to d7
	cmpi.w	#DIRECTION_DOWN,d7 ; is the player facing south?
	beq.s	.south ; branch if so
	bsr.w	DefaultExitScene ; default scene exit
	rts	
.south
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY00_EVENT03_INFODESKVISITED,d7 ; test if the mandatory event is complete
	beq.s	.cantleave ; branch if not
	bsr.w	EndDay00 ; transition to night
	rts	
.cantleave
	lea ScriptedEventNotTimeToLeaveErynStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event	
	rts

	
;*******************************************************************************
; SCENE_ID_CAVERN
;*******************************************************************************
ActionScriptDay00CavernInteract:
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY00_OPTIONAL1,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextDay00CavernChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts
	
ActionScriptDay00CavernRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextDay00CavernChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_DB) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_DAY00_OPTIONAL1,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT1_SCENE_ID)
	; setup the scripted event
	lea	StoryTextDay00CavernChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay00_Optional00_DBStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; SCENE_ID_SVIDEO
;*******************************************************************************
ActionScriptDay00SVideoInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY00_OPTIONAL2,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextDay00SVideoChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts			

ActionScriptDay00SVideoRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextDay00SVideoChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_NICKY) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_DAY00_OPTIONAL2,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT2_SCENE_ID)
	; setup the scripted event
	lea	StoryTextDay00SVideoChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay00_Optional01_NickyStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	

;*******************************************************************************
; End of the day
;*******************************************************************************
EndDay00:
	;---------------------------------------------------------------------------	
	; setup the next day
	;---------------------------------------------------------------------------	
	move.w	#$0001,(MEM_DAY) ; increment day
	move.w	#OBJECTIVE_D00_O03_SVideo,(MEM_OBJECTIVE) ; initial objective
	and.l	#$00000000,(MEM_DAY_EVENT_FLAGS) ; clear event flags
	move.w	#SCENE_ID_SVIDEO,(MEM_STORY_EVENT1_SCENE_ID) ; initial story event
	move.w	#$FFFF,(MEM_STORY_EVENT2_SCENE_ID) ; no 2nd story event
	move.w	#SCENE_ID_VB,(MEM_OPTIONAL_EVENT1_SCENE_ID) ; 1st optional event
	move.w	#SCENE_ID_CPLANET,(MEM_OPTIONAL_EVENT2_SCENE_ID) ; 2nd optional event
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT3_SCENE_ID) ; no 3rd optional event
	move.w	#PLAYER_SPRITE_CARL,(MEM_PLAYER_SPRITE) ; initial sprite
	move.w	#DIRECTION_UP,(MEM_PLAYER_SPRITE_DIRECTION)
	move.w	#$00DE,(MEM_PLAYER_SPRITE_X)
	move.w	#$00EE,(MEM_PLAYER_SPRITE_Y)
	; add item that is needed for the first trading sequence
	lea	MEM_PLAYER2_ITEM_COUNT,a1 ; point to 1st pc inventory
	move.w	#OBJ_ITEM_SPECIAL_ORDER,d7 ; add item for the trading sequence
	bsr.w	AddItem ; add item to inventory		
	;---------------------------------------------------------------------------	
	; update NPC locations
	;---------------------------------------------------------------------------	
	bsr.w	InitNPCLocationsNight ; reset the NPC locations
	move.l	#$03000000,(MEM_NPC_LOCATION_TBOOKS)
	move.l	#$11180000,(MEM_NPC_LOCATION_EEHALL)	
	;---------------------------------------------------------------------------	
	; queue the introduction
	;---------------------------------------------------------------------------	
	lea ScriptedEventNight00_00_IntroStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
	
