NewGame:

	move.w	#$2700,sr		; disable interrupts

;-------------------------------------------------------------------------------
; init SRAM
;-------------------------------------------------------------------------------
	bsr.w	InitSRAM

InitCounters:
	move.w	#$0000,(MEM_VBLANK_COUNTER)
	move.w	#$0000,(MEM_MAINLOOP_COUNTER)
	move.w	#$0000,(MEM_FRAME_COUNTER)

InitGameState:
	move.l	#$00000000,d0
	bset.l	#STATE_FLAG_TITLE_SCREEN,d0	; set title screen flag
	move.l	d0,(MEM_GAME_STATE)	; save game state
	move.w	#$0000,(MEM_DAY)	; starting day is zero
	move.w	#OBJECTIVE_D00_O00_HelpCustomers,(MEM_OBJECTIVE) ; initial objective
	and.l	#$00000000,(MEM_GLOBAL_EVENT_FLAGS)	; clear event flags
	and.l	#$00000000,(MEM_DAY_EVENT_FLAGS)	; clear event flags
	and.l	#$00000000,(MEM_SCENE_BGM)	; clear BGM
	move.w	#$FFFF,(MEM_STORY_EVENT1_SCENE_ID) ; no story events
	move.w	#$FFFF,(MEM_STORY_EVENT2_SCENE_ID) ; no story events
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT1_SCENE_ID) ; no optional events
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT2_SCENE_ID) ; no optional events
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT3_SCENE_ID) ; no optional events
	move.w	#PLAYER_SPRITE_ERYN,(MEM_PLAYER_SPRITE)	; initial sprite
	bsr.w	ClearPlayerInventory	; clear player inventory
	lea	MEM_PLAYER2_ITEM_COUNT,a1 ; point to 2nd pc inventory
	move.w	#OBJ_ITEM_KEYS,d7 ; add item 2nd player starts with
	bsr.w	AddItem ; add item to inventory			
	move.w	#$0000,(MEM_CUSTOMER_FEEDBACK_SCORE)	; clear customer feedback
	move.w	#$0000,(MEM_PLAYER1_REL0) ; clear relationship scores
	move.w	#$0000,(MEM_PLAYER1_REL1) ; clear relationship scores
	move.w	#$0000,(MEM_PLAYER1_REL2) ; clear relationship scores
	move.w	#$0000,(MEM_PLAYER2_REL0) ; clear relationship scores
	move.w	#$0000,(MEM_PLAYER2_REL1) ; clear relationship scores
	move.w	#$0000,(MEM_PLAYER2_REL2) ; clear relationship scores
	move.l	#$00000000,(MEM_TRADING_SEQUENCE_DAY) ; clear trading sequence
	move.l	#$00000000,(MEM_TRADING_SEQUENCE_NIGHT) ; clear trading sequence

;-------------------------------------------------------------------------------
; load the initial NPC locations
;-------------------------------------------------------------------------------
	bsr.w	InitNPCLocationsDay ; moves all npcs back to their starting point
	; add the two npcs that need to be present at the start
	move.l	#$05232100,(MEM_NPC_LOCATION_DENIMCOUNTRY)	
	move.l	#$02240000,(MEM_NPC_LOCATION_TBOOKS)	

	move.w	#$2000,sr		; re-enable interrupts
;-------------------------------------------------------------------------------
; load the initial scene
;-------------------------------------------------------------------------------
	clr	d6
DisplayLegalScene:
	lea	SceneLegal,a6	; address of the scene for the title screen
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	FadeIn	; fade in to the intro scene
	move.w	#LEGAL_SCREEN_LOOP,d7	; use d7 for loop control
DisplayLegalSceneLoop:
	move.b	(MEM_CONTROL_6_HELD),d6	; copy pressed buttons to d6
	andi.b	#BUTTON_Z,d6	; test if the Z button is held
	bne.w	LoadTitleScene	; Z button is held, skip scene
	bsr.w	WaitVBlank	; wait for vblank
	dbf	d7,DisplayLegalSceneLoop	; loop

LoadTitleScene:
	if _DEBUG_
	lea	SceneTitleDebug,a6	; address of the scene for the title screen
	else
	lea	SceneTitle,a6	; address of the scene for the title screen
	endif
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	FadeIn	; fade in to the intro scene
	move.w	#TITLE_SCREEN_COUNTER_START,(MEM_INTRO_SCENE_COUNTER)

;-------------------------------------------------------------------------------
; load and setup the sprites
;-------------------------------------------------------------------------------
	move.w	#$2700,sr	; disable interrupts

; sprite zero is used on the menu screen
LoadSpriteZero:
	lea     SpriteZeroDefinition,a0	; store address of sprite definition
	moveq	#$01,d0	; 1 sprite = 2 longs
	move.l	#VDP_VRAM_WRITE_SPRITE,(VDP_CONTROL) ; set write location
LoadSpriteZeroLoop:
	move.l  (a0)+,(VDP_DATA)
	dbra    d0,LoadSpriteZeroLoop

; move sprite zero to the first menu item
	;---------------------------------------------------------------------------
	; update y
	;---------------------------------------------------------------------------
	move.l	#VDP_VRAM_WRITE_SPRITE,d6 ; add to sprite table address
	move.l	d6,(VDP_CONTROL) ; set write location in VDP
	move.w	#TITLE_MENU_NEWGAME_Y,(VDP_DATA) ; copy the new y-coordinate
	;---------------------------------------------------------------------------
	; update x
	;---------------------------------------------------------------------------
	add.l	#$00060000,d6 ; move to x-coordinate
	move.l	d6,(VDP_CONTROL) ; set write location in VDP
	move.w	#TITLE_MENU_NEWGAME_X,(VDP_DATA) ; copy the new x-coordinate

InitPlayerSprite:
	; player	
	move.w	#$0001,(MEM_PLAYER_SPRITE_ID)	; player sprite is the 2nd entry
	move.w	#SPRITE_PLAYER_INIT_X,(MEM_PLAYER_SPRITE_X)	; starting x location
	move.w	#SPRITE_PLAYER_INIT_Y,(MEM_PLAYER_SPRITE_Y)	; starting y location
	move.w	#SPRITE_PLAYER_PATTERN,(MEM_PLAYER_SPRITE_PATTERN_INDEX) ; pattern
	move.w	#DIRECTION_DOWN,(MEM_PLAYER_SPRITE_DIRECTION)	; direction
	move.w	#$0000,(MEM_PLAYER_SPRITE_FRAME)	; frame
	; setting SPRITE_STEP_COUNTER to SPRITE_ANIMATION_STEPS forces movement
	; animation to trigger the next time the sprite moves
	move.w	#SPRITE_ANIMATION_STEPS,(MEM_PLAYER_SPRITE_STEP_COUNTER)

	move.w	#$2000,sr		; re-enable interrupts
