;*******************************************************************************
; scene 08 - Denim Country
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
	beq.s	ActionScriptDay00SceneDenimCountryInteractNPC2
	cmpi.w	#$0001,d7 ; test for npc1
	beq.s	ActionScriptDay00SceneDenimCountryInteractNPC1
	; else default to npc0
ActionScriptDay00SceneDenimCountryInteractNPC0: ; lisa
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY00_EVENT00_CUSTOMER0,d7 ; test the flag for talking to npc1
	beq.s	.customers
	btst.l	#FLAG_DAY00_EVENT01_CUSTOMER1,d7 ; test the flag for talking to npc2
	beq.s	.customers
	btst.l	#FLAG_DAY00_EVENT02_CANEXITDC,d7 ; test the flag for completing the first events
	bne.s	.default
	bset.l	#FLAG_DAY00_EVENT02_CANEXITDC,d7 ; update the state
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; copy the updated state back
	move.w	#OBJECTIVE_D00_O01_VisitInfo,(MEM_OBJECTIVE) ; update the objective
	move.w	#SCENE_ID_SOUTH_CENTER,(MEM_STORY_EVENT1_SCENE_ID) ; update story event
	move.l	#$05000000,(MEM_NPC_LOCATION_DENIMCOUNTRY) ; update npcs in denim country
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
	
