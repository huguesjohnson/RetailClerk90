	if	_DEBUG_

; 50 possible options
DebugTable:
	dc.l	LaunchDebug00
	dc.l	LaunchDebug01
	dc.l	LaunchDebug02
	dc.l	LaunchDebug03
	dc.l	LaunchDebug04
	dc.l	LaunchDebug05
	dc.l	LaunchDebug06
	dc.l	LaunchDebug07
	dc.l	LaunchDebug08
	dc.l	LaunchDebug09
	dc.l	LaunchDebug10
	dc.l	LaunchDebug11
	dc.l	LaunchDebug12
	dc.l	LaunchDebug13
	dc.l	LaunchDebug14
	dc.l	LaunchDebug15
	dc.l	LaunchDebug16
	dc.l	LaunchDebug17
	dc.l	LaunchDebug18
	dc.l	LaunchDebug19
	dc.l	LaunchDebug20
	dc.l	LaunchDebug21
	dc.l	LaunchDebug22
	dc.l	LaunchDebug23
	dc.l	LaunchDebug24
	dc.l	LaunchDebug25
	dc.l	LaunchDebug26
	dc.l	LaunchDebug27
	dc.l	LaunchDebug28
	dc.l	LaunchDebug29
	dc.l	LaunchDebug30
	dc.l	LaunchDebug31
	dc.l	LaunchDebug32	
	dc.l	LaunchDebug33
	dc.l	LaunchDebug34
	dc.l	LaunchDebug35	
	dc.l	LaunchDebug36
	dc.l	LaunchDebug37	
	dc.l	LaunchDebug38
	dc.l	LaunchDebug39
	dc.l	LaunchDebug40	
	dc.l	LaunchDebug41
	dc.l	LaunchDebug42
	dc.l	LaunchDebug43
	dc.l	LaunchDebug44
	dc.l	LaunchDebug45
	dc.l	LaunchDebug46
	dc.l	LaunchDebug47
	dc.l	LaunchDebug48
	dc.l	LaunchDebug49

ProcessDebugScreen:
	; process start press
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.b	#BUTTON_START,d6	; test if the start button was pressed
	beq.s	ProcessDebugScreenTestDpad	; start not pressed, branch
	lea	DebugTable,a5	; point to the table
	move.w	(MEM_MENU_SELECTION),d7	; copy menu selection to d7
	mulu.w	#LWORD_SIZE,d7	; multiply by lword size to get offset
	adda.w	d7,a5	; move to offset location
	move.w	#$0000,(MEM_MENU_SELECTION)	; clear menu selection
	; clear debug flag	
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	bclr.l	#STATE_FLAG_DEBUG_MENU,d7 ; set debug menu flag
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	move.l	(a5),a6	; a5 has the address of the subroutine to jump to
	jsr	(a6)	; jump to location of code to process this event
	bra.w	ExitProcessDebugScreen	; exit
ProcessDebugScreenTestDpad:
	; process dpad press
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.b	#BUTTON_UP,d6	; test if the up button was pressed
	bne.s	ProcessDebugScreenDecrementSelector	; up pressed, branch
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.b	#BUTTON_DOWN,d6	; test if the down button was pressed
	bne.s	ProcessDebugScreenIncrementSelector	; down pressed, branch
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.b	#BUTTON_LEFT,d6	; test if the left button was pressed
	bne.w	ProcessDebugScreenLeftRight	; left pressed, branch
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.b	#BUTTON_RIGHT,d6	; test if the right button was pressed
	bne.s	ProcessDebugScreenLeftRight	; right pressed, branch
	bra.w	ProcessDebugScreenMoveSelector
ProcessDebugScreenIncrementSelector: ; down pressed
	; are we at the last item in the left column?
	cmpi.w	#$0018,(MEM_MENU_SELECTION)
	bne.s	.1 ; not at the last item in the left column
	move.w	#$0000,(MEM_MENU_SELECTION)
	bra.w	ProcessDebugScreenMoveSelector
.1
	; are we at the last item in the right column?
	cmpi.w	#$0031,(MEM_MENU_SELECTION)
	bne.s	.2 ; not at the last item in the right column
	move.w	#$0019,(MEM_MENU_SELECTION)
	bra.w	ProcessDebugScreenMoveSelector
.2
	; default increment
	add.w	#$0001,(MEM_MENU_SELECTION)
	bra.w	ProcessDebugScreenMoveSelector
ProcessDebugScreenDecrementSelector: ; up pressed
	; are we at the first item in the left column?
	cmpi.w	#$0000,(MEM_MENU_SELECTION)
	bne.s	.1 ; not at the first item in the left column
	move.w	#$0018,(MEM_MENU_SELECTION)
	bra.w	ProcessDebugScreenMoveSelector
.1
	; are we at the first item in the right column?
	cmpi.w	#$0019,(MEM_MENU_SELECTION)
	bne.s	.2 ; not at the first item in the right column
	move.w	#$0031,(MEM_MENU_SELECTION)
	bra.w	ProcessDebugScreenMoveSelector
.2
	; default decrement
	sub.w	#$0001,(MEM_MENU_SELECTION)
	bra.w	ProcessDebugScreenMoveSelector
ProcessDebugScreenLeftRight: ; l/r pressed
	cmpi.w	#$0018,(MEM_MENU_SELECTION)
	bgt.s	.1
	add.w	#$0019,(MEM_MENU_SELECTION)
	bra.w	ProcessDebugScreenMoveSelector
.1
	sub.w	#$0019,(MEM_MENU_SELECTION)
	bra.w	ProcessDebugScreenMoveSelector
ProcessDebugScreenMoveSelector:
	; move selector sprite based on menu selection
	move.w	(MEM_MENU_SELECTION),d7	; copy current value to d7
	cmpi.w	#$0019,d7 ; test if in the right or left column
	blt.s	.1 ; left column
	sub.w	#$0019,d7 ; subtract number of items before mulu
.1
	mulu.w	#$0008,d7	; rows are 8 apart
	add.w	#$0090,d7	; first row 
	move.l	#VDP_VRAM_WRITE_SPRITE,d6	; add to sprite table address
	move.l	d6,(VDP_CONTROL)	; set write location in VDP
	move.w	d7,(VDP_DATA)	; copy the new y-coordinate
	add.l	#$00060000,d6	; move to x-coordinate
	move.l	d6,(VDP_CONTROL)	; set write location in VDP
	cmpi.w	#$0019,(MEM_MENU_SELECTION)
	blt.s	.2
	move.w	#$0120,(VDP_DATA)	; copy the new x-coordinate
	bra.s	ExitProcessDebugScreen
.2
	move.w	#$0088,(VDP_DATA)	; copy the new x-coordinate
ExitProcessDebugScreen:
	rts

LaunchDebug00: ; day00 - after initial event
	bsr.w	InitGlobalEvents
	;---------------------------------------------------------------------------
	; set events complete
	;---------------------------------------------------------------------------
	move.w	#$0000,(MEM_DAY)
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_DAY00_EVENT00_CUSTOMER0,d7 ; set the flag for talking to npc1
	bset.l	#FLAG_DAY00_EVENT01_CUSTOMER1,d7 ; set the flag for talking to npc2
	bsr.w	ActionScriptDay00UpdateStateAfterCustomerEventsDone
	;---------------------------------------------------------------------------
	; load starting scene and sprites
	;---------------------------------------------------------------------------
	lea	SceneSouthCenter,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$0100,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts	
	
LaunchDebug01: ; day00 - after visiting info desk
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceDay	
	;---------------------------------------------------------------------------
	; set events complete
	;---------------------------------------------------------------------------
	move.w	#$0000,(MEM_DAY)
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_DAY00_EVENT00_CUSTOMER0,d7 ; set the flag for talking to npc1
	bset.l	#FLAG_DAY00_EVENT01_CUSTOMER1,d7 ; set the flag for talking to npc2
	bsr.w	ActionScriptDay00UpdateStateAfterCustomerEventsDone
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bsr.w	ActionScriptDay00UpdateStateAfterInfoDesk		
	;---------------------------------------------------------------------------
	; load starting scene and sprites
	;---------------------------------------------------------------------------
	lea	SceneSHall,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$0100,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts	

LaunchDebug02: ; night 00 - start
	bsr.w	InitGlobalEvents
	bsr.w	EndDay00
	rts

LaunchDebug03: ; night 00 - after trading sequence
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceNight
	move.w	#$0001,(MEM_DAY) ; set day	
	move.w	#PLAYER_SPRITE_CARL,(MEM_PLAYER_SPRITE) ; initial sprite
	;---------------------------------------------------------------------------	
	; update NPC locations
	;---------------------------------------------------------------------------	
	bsr.w	InitNPCLocationsNight ; reset the NPC locations
	move.l	#$00000000,(MEM_NPC_LOCATION_TBOOKS)
	move.l	#$11000000,(MEM_NPC_LOCATION_EEHALL)	
	;---------------------------------------------------------------------------	
	; set events complete
	;---------------------------------------------------------------------------	
	and.l	#$00000000,d7 ; clear out d7
	bset.l	#FLAG_NIGHT00_EVENT00_EEHALL,d7
	bset.l	#FLAG_NIGHT00_EVENT01_SVIDEO,d7
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; update event flags
	bsr.w	ActionScriptNight00UpdateStateAfterSVideo
	;---------------------------------------------------------------------------	
	; optional events are still available
	;---------------------------------------------------------------------------	
	move.w	#SCENE_ID_VB,(MEM_OPTIONAL_EVENT1_SCENE_ID) ; 1st optional event
	move.w	#SCENE_ID_CPLANET,(MEM_OPTIONAL_EVENT2_SCENE_ID) ; 2nd optional event
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT3_SCENE_ID) ; no 3rd optional event	
	;---------------------------------------------------------------------------
	; load starting scene and sprites
	;---------------------------------------------------------------------------
	lea	SceneSVideo,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$0100,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts	

LaunchDebug04: ; night 00 - after required events are done
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceNight
	move.w	#$0001,(MEM_DAY) ; set day	
	move.w	#PLAYER_SPRITE_CARL,(MEM_PLAYER_SPRITE) ; initial sprite
	;---------------------------------------------------------------------------	
	; set events complete
	;---------------------------------------------------------------------------	
	and.l	#$00000000,d7 ; clear out d7
	bset.l	#FLAG_NIGHT00_EVENT00_EEHALL,d7
	bset.l	#FLAG_NIGHT00_EVENT01_SVIDEO,d7
	bsr.w	ActionScriptNight00UpdateStateAfterSVideo	
	bset.l	#FLAG_NIGHT00_EVENT02_STORYEVENTSDONE,d7
	bsr.w	ActionScriptNight00UpdateStateAfterSHall
	;---------------------------------------------------------------------------	
	; update NPC locations
	;---------------------------------------------------------------------------	
	bsr.w	InitNPCLocationsNight ; reset the NPC locations
	move.l	#$00000000,(MEM_NPC_LOCATION_TBOOKS)
	move.l	#$11000000,(MEM_NPC_LOCATION_EEHALL)	
	;---------------------------------------------------------------------------
	; load starting scene and sprites
	;---------------------------------------------------------------------------
	lea	SceneSHall,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$0100,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts	
	
LaunchDebug05: ; day 01 - at the start
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceDay	
	bsr.w	EndNight00
	rts	

LaunchDebug06: ; day 01 - after required events are done
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceDay	
	bsr.w	EndNight00SetGameState
	;---------------------------------------------------------------------------	
	; set events complete
	;---------------------------------------------------------------------------	
	move.w	#$FFFF,(MEM_STORY_EVENT1_SCENE_ID) 
	move.w	#$FFFF,(MEM_STORY_EVENT2_SCENE_ID) 
	and.l	#$00000000,d7
	bset.l	#FLAG_DAY01_EVENT00_CPLANET,d7
	bset.l	#FLAG_DAY01_EVENT01_WWAPPLIANCES,d7	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; set day event flags
	bsr.w	TestDay01Events
	;---------------------------------------------------------------------------	
	; optional events are still available
	;---------------------------------------------------------------------------	
	move.w	#SCENE_ID_CAVERN,(MEM_OPTIONAL_EVENT1_SCENE_ID) ; 1st optional event
	move.w	#SCENE_ID_FCBCAMPING,(MEM_OPTIONAL_EVENT2_SCENE_ID) ; 2nd optional event
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT3_SCENE_ID) ; no 3rd optional event
	;---------------------------------------------------------------------------
	; load starting scene and sprites
	;---------------------------------------------------------------------------
	lea	SceneDenimCountry,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$0100,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts	

LaunchDebug07: ; night 01 - at the cavern
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceNight
	bsr.w	EndDay01SetupGameState
	;---------------------------------------------------------------------------
	; load starting scene and sprites
	;---------------------------------------------------------------------------
	lea	SceneCavern,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$0100,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts	

LaunchDebug08: ; night 01 - after main events are done
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceNight
	bsr.w	EndDay01SetupGameState	
	;---------------------------------------------------------------------------	
	; set events complete
	;---------------------------------------------------------------------------	
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bsr.w	ActionScriptNight01CavernUpdateState
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bsr.w	ActionScriptNight01EEHallUpdateState
	;---------------------------------------------------------------------------
	; load starting scene and sprites
	;---------------------------------------------------------------------------
	lea	SceneSouthCenter,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$0100,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts

LaunchDebug09: ; night 01 - can leave 
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceNight
	bsr.w	EndDay01SetupGameState	
	;---------------------------------------------------------------------------	
	; set events complete
	;---------------------------------------------------------------------------	
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bsr.w	ActionScriptNight01CavernUpdateState
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bsr.w	ActionScriptNight01EEHallUpdateState	
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bsr.w	ActionScriptNight01SouthHallUpdateState
	;---------------------------------------------------------------------------
	; load starting scene and sprites
	;---------------------------------------------------------------------------
	lea	SceneSHall,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$0100,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts

LaunchDebug10: ; day 02 - midpoint
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceDay	
	bsr.w	EndNight01SetupGameState
	;---------------------------------------------------------------------------	
	; set events complete
	;---------------------------------------------------------------------------	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 
	bset.l	#FLAG_DAY02_EVENT00_TLODGE,d7
	bset.l	#FLAG_DAY02_EVENT01_TBOOKS,d7 
	move.l	d7,(MEM_DAY_EVENT_FLAGS)
	bsr.w	CheckDay02Flags
	move.w	#$FFFF,(MEM_STORY_EVENT2_SCENE_ID) ; clear story event	
	;---------------------------------------------------------------------------
	; load starting scene and sprites
	;---------------------------------------------------------------------------
	lea	SceneDenimCountry,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$0100,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts	

LaunchDebug11: ; day 02 - after main events are done
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceDay	
	bsr.w	EndNight01SetupGameState
	;---------------------------------------------------------------------------	
	; set events complete
	;---------------------------------------------------------------------------	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 
	bset.l	#FLAG_DAY02_EVENT00_TLODGE,d7
	bset.l	#FLAG_DAY02_EVENT01_TBOOKS,d7 
	move.l	d7,(MEM_DAY_EVENT_FLAGS)
	bsr.w	CheckDay02Flags
	move.l	(MEM_DAY_EVENT_FLAGS),d7 	
	bsr.w	ActionScriptDay02DenimCountryUpdateState
	;---------------------------------------------------------------------------
	; load starting scene and sprites
	;---------------------------------------------------------------------------
	lea	SceneSHall,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$0100,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts	

LaunchDebug12: ; night 02 - midpoint
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceNight
	bsr.w	EndDay02SetupGameState
	move.w	#PLAYER_SPRITE_CARL,(MEM_PLAYER_SPRITE)	
	;---------------------------------------------------------------------------	
	; set events complete
	;---------------------------------------------------------------------------	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bsr.w	Night02WWHallUpdateState
	move.l	(MEM_DAY_EVENT_FLAGS),d7 
	bset.l	#FLAG_NIGHT02_EVENT00_FCBCAMPING,d7
	bset.l	#FLAG_NIGHT02_EVENT01_NSHACK,d7 
	move.l	d7,(MEM_DAY_EVENT_FLAGS)
	bsr.w	CheckNight02Flags
	;---------------------------------------------------------------------------
	; load starting scene and sprites
	;---------------------------------------------------------------------------
	lea	SceneWEHall,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$0100,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts

LaunchDebug13: ; night 02 - after main events are done
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceNight
	bsr.w	EndDay02SetupGameState
	;---------------------------------------------------------------------------	
	; set events complete
	;---------------------------------------------------------------------------	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 
	bset.l	#FLAG_NIGHT02_EVENT00_FCBCAMPING,d7
	bset.l	#FLAG_NIGHT02_EVENT01_NSHACK,d7 
	move.l	d7,(MEM_DAY_EVENT_FLAGS)
	bsr.w	CheckNight02Flags
	move.l	d7,(MEM_DAY_EVENT_FLAGS)
	bsr.w	Night02WWHallUpdateState
	move.l	d7,(MEM_DAY_EVENT_FLAGS)
	bsr.w	Night02CNowUpdateState
	;---------------------------------------------------------------------------
	; load starting scene and sprites
	;---------------------------------------------------------------------------
	lea	SceneSHall,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$0100,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts
	
LaunchDebug14: ; day 03 - start
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceDay	
	bsr.w	EndNight02
	rts
	
LaunchDebug15: ; day 03 - midpoint
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceDay	
	bsr.w	EndNight02SetupGameState
	;---------------------------------------------------------------------------	
	; set events complete
	;---------------------------------------------------------------------------	
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bset.l	#FLAG_DAY03_EVENT01_CHECKERS,d7
	bset.l	#FLAG_DAY03_EVENT02_CLOTHESNOW,d7
	bsr.w	CheckDay03Events
	;---------------------------------------------------------------------------
	; load starting scene and sprites
	;---------------------------------------------------------------------------
	lea	SceneSouthCenter,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$0100,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts
	
LaunchDebug16: ; day 03 - after main events are done
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceDay	
	bsr.w	EndNight02SetupGameState
	;---------------------------------------------------------------------------	
	; set events complete
	;---------------------------------------------------------------------------	
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bset.l	#FLAG_DAY03_EVENT01_CHECKERS,d7
	bset.l	#FLAG_DAY03_EVENT02_CLOTHESNOW,d7
	bsr.w	CheckDay03Events
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bsr.w	ActionScriptDay04PogoDawgFinishedState
	;---------------------------------------------------------------------------
	; load starting scene and sprites
	;---------------------------------------------------------------------------
	lea	SceneDenimCountry,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$0100,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts
	
LaunchDebug17: ; night 03 - midpoint
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceNight
	bsr.w	EndDay03SetupGameState	
	;---------------------------------------------------------------------------	
	; set events complete
	;---------------------------------------------------------------------------	
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bset.l	#FLAG_NIGHT03_EVENT00_TLODGE,d7	
	bset.l	#FLAG_NIGHT03_EVENT01_CNOW,d7	
	move.l	d7,(MEM_DAY_EVENT_FLAGS)
	bsr.w	CheckNight03Events
	;---------------------------------------------------------------------------
	; load starting scene and sprites
	;---------------------------------------------------------------------------
	lea	SceneSHall,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$0100,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts
	
LaunchDebug18: ; night 03 - after main events are done
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceNight
	bsr.w	EndDay03SetupGameState	
	;---------------------------------------------------------------------------	
	; set events complete
	;---------------------------------------------------------------------------	
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bset.l	#FLAG_NIGHT03_EVENT00_TLODGE,d7	
	bset.l	#FLAG_NIGHT03_EVENT01_CNOW,d7	
	move.l	d7,(MEM_DAY_EVENT_FLAGS)
	bsr.w	CheckNight03Events
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bsr.w	ActionScriptNight03NShackUpdateState
	;---------------------------------------------------------------------------
	; load starting scene and sprites
	;---------------------------------------------------------------------------
	lea	SceneSHall,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$0100,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts
	
LaunchDebug19: ; day 04 - start
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceDay	
	bsr.w	EndNight03
	rts
	
LaunchDebug20: ; day 04 - midpoint
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceDay	
	bsr.w	EndNight03SetupGameState
	;---------------------------------------------------------------------------	
	; set events complete
	;---------------------------------------------------------------------------	
	; nothing really this time
	;---------------------------------------------------------------------------
	; load starting scene and sprites
	;---------------------------------------------------------------------------
	lea	SceneCavern,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$0100,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts
	
LaunchDebug21: ; day 04 - after main events are done
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceDay	
	bsr.w	EndNight03SetupGameState
	;---------------------------------------------------------------------------	
	; set events complete
	;---------------------------------------------------------------------------	
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bsr.w	ActionScriptDay04CavernUpdateState
	;---------------------------------------------------------------------------
	; load starting scene and sprites
	;---------------------------------------------------------------------------
	lea	SceneNShack,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$00D0,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts
	
LaunchDebug22: ; night 04 - midpoint
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceNight
	bsr.w	EndDay04SetupGameState
	;---------------------------------------------------------------------------	
	; set events complete
	;---------------------------------------------------------------------------	
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bsr.w	ActionScriptNight04NShackUpdateState
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bsr.w	ActionScriptNight04CavernUpdateState
	;---------------------------------------------------------------------------
	; load starting scene and sprites
	;---------------------------------------------------------------------------
	lea	SceneCavernBackroom,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$0100,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts
	
LaunchDebug23: ; night 04 - after main events are done
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceNight
	bsr.w	EndDay04SetupGameState
	;---------------------------------------------------------------------------	
	; set events complete
	;---------------------------------------------------------------------------	
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bsr.w	ActionScriptNight04NShackUpdateState
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bsr.w	ActionScriptNight04CavernUpdateState
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bsr.w	ActionScriptNight04CavernBackroomUpdateState
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bsr.w	ActionScriptNight04SHallUpdateState
	;---------------------------------------------------------------------------
	; load starting scene and sprites
	;---------------------------------------------------------------------------
	lea	SceneSHall,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$0100,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts
	
LaunchDebug24: ; day 05 - start
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceDay	
	bsr.w	EndNight04
	rts
	
LaunchDebug25: ; day 05 - midpoint1
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceDay	
	bsr.w	EndNight04SetupGameState
	;---------------------------------------------------------------------------	
	; set events complete
	;---------------------------------------------------------------------------	
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bset.l	#FLAG_DAY05_EVENT00_FCBFIREARMS,d7
	move.l	d7,(MEM_DAY_EVENT_FLAGS)
	move.l	#$0E000000,(MEM_NPC_LOCATION_FCBFIREARMS)
	bsr.w	CheckDay05Events
	;bsr.w	ActionScriptDay05DenimCountryExit	
	;---------------------------------------------------------------------------
	; load starting scene and sprites
	;---------------------------------------------------------------------------
	lea	SceneWWAudio,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$0100,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts
	
LaunchDebug26: ; day 05 - midpoint2
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceDay	
	bsr.w	EndNight04SetupGameState
	;---------------------------------------------------------------------------	
	; set events complete
	;---------------------------------------------------------------------------	
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bset.l	#FLAG_DAY05_EVENT01_WWAUDIO,d7
	move.l	d7,(MEM_DAY_EVENT_FLAGS)
	move.l	#$1B000000,(MEM_NPC_LOCATION_WWAUDIO)
	bsr.w	CheckDay05Events
	;bsr.w	ActionScriptDay05DenimCountryExit
	;---------------------------------------------------------------------------
	; load starting scene and sprites
	;---------------------------------------------------------------------------
	lea	SceneFCBFirearms,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$0100,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts
	
LaunchDebug27: ; day 05 - after main events are done
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceDay	
	bsr.w	EndNight04SetupGameState
	;---------------------------------------------------------------------------	
	; set events complete
	;---------------------------------------------------------------------------	
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bset.l	#FLAG_DAY05_EVENT00_FCBFIREARMS,d7
	bset.l	#FLAG_DAY05_EVENT01_WWAUDIO,d7
	move.l	d7,(MEM_DAY_EVENT_FLAGS)
	bsr.w	CheckDay05Events
	;bsr.w	ActionScriptDay05DenimCountryExit
	;---------------------------------------------------------------------------
	; load starting scene and sprites
	;---------------------------------------------------------------------------
	lea	SceneDenimCountry,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$0100,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts
	
LaunchDebug28: ; night 05 - @EEHallway
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceNight
	bsr.w	EndDay05SetupGameState
	;---------------------------------------------------------------------------
	; load starting scene and sprites
	;---------------------------------------------------------------------------
	lea	SceneEEHall,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$00C0,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts
	
LaunchDebug29: ; night 05 - events done
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceNight
	bsr.w	EndDay05SetupGameState
	;---------------------------------------------------------------------------	
	; set events complete
	;---------------------------------------------------------------------------	
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bsr.w	ActionScriptNight05CavernUpdateState
	move.l	(MEM_DAY_EVENT_FLAGS),d7
	bset.l	#FLAG_NIGHT05_EVENT01_BASEMENTMDORM,d7
	bset.l	#FLAG_NIGHT05_EVENT02_BASEMENTOFFICE,d7
	move.l	d7,(MEM_DAY_EVENT_FLAGS)
	bsr.w	CheckNight05Events
	;---------------------------------------------------------------------------
	; load starting scene and sprites
	;---------------------------------------------------------------------------
	lea	SceneSHall,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$0100,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts
	
LaunchDebug30: ; day 06 - intro - bad
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceDay	
	;---------------------------------------------------------------------------
	; setup relationship levels
	;---------------------------------------------------------------------------
	move.w	#$0000,(MEM_REL_DB)
	move.w	#$0000,(MEM_REL_GRANT)
	move.w	#$0000,(MEM_REL_NICKY)
	move.w	#$0000,(MEM_REL_LAURA)
	move.w	#$0000,(MEM_REL_ELIZA)
	move.w	#$0000,(MEM_REL_GRUNBERG)
	bsr.w	EndNight05
	rts
	
LaunchDebug31: ; day 06 - intro - good
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceDay	
	;---------------------------------------------------------------------------
	; setup relationship levels
	;---------------------------------------------------------------------------
	move.w	#MAX_REL,(MEM_REL_DB)
	move.w	#MAX_REL,(MEM_REL_GRANT)
	move.w	#MAX_REL,(MEM_REL_NICKY)
	move.w	#MAX_REL,(MEM_REL_LAURA)
	move.w	#MAX_REL,(MEM_REL_ELIZA)
	move.w	#MAX_REL,(MEM_REL_GRUNBERG)
	bsr.w	EndNight05
	rts
	
LaunchDebug32: ; day 06 - intro - perfect
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceNight
	;---------------------------------------------------------------------------
	; setup relationship levels
	;---------------------------------------------------------------------------
	move.w	#MAX_REL,(MEM_REL_DB)
	move.w	#MAX_REL,(MEM_REL_GRANT)
	move.w	#MAX_REL,(MEM_REL_NICKY)
	move.w	#MAX_REL,(MEM_REL_LAURA)
	move.w	#MAX_REL,(MEM_REL_ELIZA)
	move.w	#MAX_REL,(MEM_REL_GRUNBERG)
	;---------------------------------------------------------------------------
	; setup global events
	;---------------------------------------------------------------------------		
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7	
	bset.l	#FLAG_GLOBAL_EVENT00_TLodgeEvent1123Night,d7
	bset.l	#FLAG_GLOBAL_Victor1204,d7
	move.l	d7,(MEM_GLOBAL_EVENT_FLAGS)
	bsr.w	EndNight05
	rts
	
LaunchDebug33: ; night 06 - intro - bad
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceNight
	;---------------------------------------------------------------------------
	; setup relationship levels
	;---------------------------------------------------------------------------
	move.w	#$0000,(MEM_REL_DB)
	move.w	#$0000,(MEM_REL_GRANT)
	move.w	#$0000,(MEM_REL_NICKY)
	move.w	#$0000,(MEM_REL_LAURA)
	move.w	#$0000,(MEM_REL_ELIZA)
	move.w	#$0000,(MEM_REL_GRUNBERG)
	bsr.w	EndDay06
	rts
	
LaunchDebug34: ; night 06 - intro - good
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceNight
	;---------------------------------------------------------------------------
	; setup relationship levels
	;---------------------------------------------------------------------------
	move.w	#MAX_REL,(MEM_REL_DB)
	move.w	#MAX_REL,(MEM_REL_GRANT)
	move.w	#MAX_REL,(MEM_REL_NICKY)
	move.w	#MAX_REL,(MEM_REL_LAURA)
	move.w	#MAX_REL,(MEM_REL_ELIZA)
	move.w	#MAX_REL,(MEM_REL_GRUNBERG)	
	bsr.w	EndDay06
	rts

LaunchDebug35: ; night 06 - intro - perfect
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceNight
	;---------------------------------------------------------------------------
	; setup relationship levels
	;---------------------------------------------------------------------------
	move.w	#MAX_REL,(MEM_REL_LAURA)
	move.w	#MAX_REL,(MEM_REL_ELIZA)
	move.w	#MAX_REL,(MEM_REL_GRUNBERG)	
	;---------------------------------------------------------------------------
	; setup global events
	;---------------------------------------------------------------------------		
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7	
	bset.l	#FLAG_GLOBAL_REL0Complete,d7
	bset.l	#FLAG_GLOBAL_REL1Complete,d7
	bset.l	#FLAG_GLOBAL_REL2Complete,d7
	bset.l	#FLAG_GLOBAL_EVENT00_TLodgeEvent1123Night,d7
	bset.l	#FLAG_GLOBAL_Victor1204,d7
	bset.l	#FLAG_GLOBAL_TradingDayComplete,d7			
	move.l	d7,(MEM_GLOBAL_EVENT_FLAGS)
	bsr.w	EndDay06
	rts

LaunchDebug36: ; test text distortion effect
	bsr.w	InitGlobalEvents
	;---------------------------------------------------------------------------
	; not the scene I plan to use this effect in
	; it's just the first one and any works for testing
	;---------------------------------------------------------------------------
	move.w	#$0000,(MEM_DAY)
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_DAY00_EVENT00_CUSTOMER0,d7 ; set the flag for talking to npc1
	bset.l	#FLAG_DAY00_EVENT01_CUSTOMER1,d7 ; set the flag for talking to npc2
	bsr.w	ActionScriptDay00UpdateStateAfterCustomerEventsDone
	lea	SceneDenimCountry,a6
	bsr.w LoadScene
	; the part being tested	
	;move.w	#$2700,sr		; disable interrupts	
	;bsr.w	LoadFontTilesSlightDistort
	;move.w	#$2000,sr		; re-enable interrupts	
	; back to usual business
	lea	ScriptedEventTradingSequenceDenimCountryStart,a6
	bsr.w	QueueScriptedEvent
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$0100,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts

LaunchDebug37: ; test mystery item name distortion effect
	bsr.w	InitGlobalEvents
	; the item being tested
	lea	MEM_PLAYER2_ITEM_COUNT,a1 ; point to 2nd pc inventory
	move.w	#OBJ_ITEM_FINALITEM,d7 ; item to add
	bsr.w	AddItem ; add item to inventory		
	; some other items to make sure I didn't break anything
	lea	MEM_PLAYER2_ITEM_COUNT,a1 ; point to 2nd pc inventory
	move.w	#OBJ_ITEM_KEYS,d7 ; item to add
	bsr.w	AddItem ; add item to inventory		
	lea	MEM_PLAYER2_ITEM_COUNT,a1 ; point to 2nd pc inventory
	move.w	#OBJ_ITEM_SHIRT,d7 ; item to add
	bsr.w	AddItem ; add item to inventory		
	lea	MEM_PLAYER2_ITEM_COUNT,a1 ; point to 2nd pc inventory
	move.w	#OBJ_ITEM_FM_CONVERTER,d7 ; item to add
	bsr.w	AddItem ; add item to inventory		
	;---------------------------------------------------------------------------
	; not the scene I plan to use this effect in
	; it's just the first one and any works for testing
	;---------------------------------------------------------------------------
	bsr.w	EndDay01SetupGameState
	lea	SceneCavern,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$0100,(MEM_PLAYER_SPRITE_X)
	move.w	#$0100,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts

LaunchDebug38: ; night 06 - outside south hall, events complete, trading & optional events available
	bsr.w	InitGlobalEvents
	bsr.w	SetupTradingSequenceNight
	;---------------------------------------------------------------------------
	; setup relationship levels
	;---------------------------------------------------------------------------
	move.w	#MAX_REL,(MEM_REL_LAURA)
	move.w	#MAX_REL,(MEM_REL_ELIZA)
	move.w	#MAX_REL,(MEM_REL_GRUNBERG)	
	;---------------------------------------------------------------------------
	; setup global events
	;---------------------------------------------------------------------------		
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7	
	bset.l	#FLAG_GLOBAL_REL0Complete,d7
	bset.l	#FLAG_GLOBAL_REL1Complete,d7
	bset.l	#FLAG_GLOBAL_REL2Complete,d7
	bset.l	#FLAG_GLOBAL_EVENT00_TLodgeEvent1123Night,d7
	bset.l	#FLAG_GLOBAL_Victor1204,d7
	bset.l	#FLAG_GLOBAL_TradingDayComplete,d7			
	move.l	d7,(MEM_GLOBAL_EVENT_FLAGS)
	move.w	#PLAYER_SPRITE_CARL,(MEM_PLAYER_SPRITE) ; initial sprite
	bsr.w	EndDay06SetupGameState
	bsr.w	Night06UpdateState
	lea	SceneSHall,a6
	bsr.w LoadScene
	bsr.w LoadPlayerSprite
	move.w	#$01A8,(MEM_PLAYER_SPRITE_X)
	move.w	#$00F0,(MEM_PLAYER_SPRITE_Y)
	bsr.w FixSprites	
	bsr.w FadeIn
	rts


LaunchDebug39:
LaunchDebug40:	
LaunchDebug41:
LaunchDebug42:
LaunchDebug43:
LaunchDebug44:
LaunchDebug45:
LaunchDebug46:

DebugNotImplemented:
	bra.w	NewGame

LaunchDebug47: ; test bad ending here
	bsr.w	InitGlobalEvents
	;---------------------------------------------------------------------------
	; setup
	;---------------------------------------------------------------------------
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7 ; copy global event flags to d7
	and.l	#$00000000,d7
	move.l	d7,(MEM_GLOBAL_EVENT_FLAGS)
	move.l	#$07010F00,(MEM_NPC_LOCATION_NSHACK)
	move.w	#PLAYER_SPRITE_CARL,(MEM_PLAYER_SPRITE) ; initial sprite
	bsr.w	SetupEndGame
	rts

LaunchDebug48: ; test good ending here
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7 ; copy global event flags to d7
	bset.l	#FLAG_GLOBAL_REL0Complete,d7
	move.l	d7,(MEM_GLOBAL_EVENT_FLAGS)
	bsr.w	SetupEndGame
	rts

LaunchDebug49: ; test perfect ending here
	move.l	#ALL_GLOBAL_FLAGS_SET,(MEM_GLOBAL_EVENT_FLAGS)
	bsr.w	SetupEndGame
	rts


CatchAll:
	; prevent freezing in case I messed up
	bra.w	NewGame

InitGlobalEvents:
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	bset.l	#STATE_FLAG_EXPLORING,d7 ; set exploring flag
	bset.l	#STATE_FLAG_FAST_TRAVEL_AVAILABLE,d7 ; fast travel is available
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	rts

SetupTradingSequenceDay:
	lea	MEM_PLAYER1_ITEM_COUNT,a1 ; point to 1st pc inventory
	move.w	#OBJ_ITEM_SCARF,d7 ; add item for the trading sequence
	bsr.w	AddItem ; add item to inventory		
	rts
	
SetupTradingSequenceNight:
	lea	MEM_PLAYER2_ITEM_COUNT,a1 ; point to 2nd pc inventory
	move.w	#OBJ_ITEM_VHS_TAPE,d7 ; add item for the trading sequence
	bsr.w	AddItem ; add item to inventory		
	rts
	
	endif
