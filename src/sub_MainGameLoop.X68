;*******************************************************************************
; main game loop
;*******************************************************************************
MainGameLoop:
	bsr.w	WaitVBlank ; wait for vblank to complete
	addq	#$1,(MEM_MAINLOOP_COUNTER) ; increment counter
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	if _DEBUG_
	btst.l	#STATE_FLAG_DEBUG_MENU,d7 ; test game state
	bne.w	ProcessDebugScreen
	endif
	; test if load screen is showing
	btst.l	#STATE_FLAG_LOAD_MENU,d7 ; test game state
	bne.w	ProcessLoadScreen
	; test if exploring	
	btst.l	#STATE_FLAG_EXPLORING,d7 ; test game state
	beq.w	TestTitleScreen	; not exploring, branch
;-------------------------------------------------------------------------------
; pause/unpause
;-------------------------------------------------------------------------------
TestPauseToggle:
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.b	#BUTTON_START,d6	; test if the start button was pressed
	beq.s	TestPause	; start button is not pressed test if still paused
	; clear MEM_CONTROL_PRESSED to prevent pause state from flipping in loop
	move.w	#$0000,(MEM_CONTROL_PRESSED)
	btst.l	#STATE_FLAG_PAUSED,d7	; is the paused bit set?
	bne.s	Unpause	; if so branch to unpause 
Pause:
	bset.l	#STATE_FLAG_PAUSED,d7	; set the paused bit
	; flip to paused palette
	jsr	Echo_StopBGM	; pause the background music
SetPausedPalette:
	bsr.w	WaitVBlank	; wait to load palettes until VBlank
	lea	(MEM_SCENE_PALETTE),a0	; point a0 to the scene palette
	move.l	#VDP_CRAM_WRITE,(VDP_CONTROL) ; set up VDP write to CRAM
	moveq	#$003F,d0	; 64 words of palette data
SetPausedPaletteLoop:
	move.w	(a0)+,d1	; get the next palette entry
	lsr	#1,d1	; shift color intensity
	;	      0000BBBSGGGSRRRS
	and.w	#%0000011001100110,d1	; prevent color overflow
	move.w	d1,(VDP_DATA)	; write the palette entry
	dbf	d0,SetPausedPaletteLoop	; decrement d0 and loop
	bra.s	UpdatePause	; save the paused state
Unpause:
	bclr.l	#STATE_FLAG_PAUSED,d7	; clear the paused bit
	jsr	Echo_ResumeBGM	; unpause the background music
	bsr.w	WaitVBlank	; wait to load palettes until VBlank
	lea	(MEM_SCENE_PALETTE),a0	; point to scene palette
	moveq	#$0004,d0	; number of palettes to load
	move.l	#VDP_CRAM_WRITE,d1	; initial write address
	bsr.w	LoadPalettes	; branch to LoadPalettes subroutine
	move.w	#$0000,(MEM_FRAME_COUNTER)	; reset frame counter
UpdatePause:
	move.l	d7,(MEM_GAME_STATE)	; save the new paused state
TestPause:
	btst.l	#STATE_FLAG_PAUSED,d7	; test if paused
	beq.s	TestAction	; not paused, move to next test
	bra.w	MainGameLoop	; paused, return to start of game loop
;-------------------------------------------------------------------------------
; determine if there is an action queued
;-------------------------------------------------------------------------------
TestAction:
	btst.l	#STATE_FLAG_ACTION,d7 ; test game state
	beq.w	TestScriptedEvent	; no action queued, move to next test
	bsr.w	ProcessAction	; process the pending action
	;---------------------------------------------------------------------------
	; setup action event for entering a scene if appropriate
	; there's one catch to this implementation..
	; if the player tries to leave a scene but is blocked this event will fire
	;---------------------------------------------------------------------------
	cmpi.w	#ACTION_EXIT_SCENE,(MEM_ACTION_ID) ; test if last action was exiting
	bne.w	MainGameLoop ; if not then back to the start of the game loop
	move.w	(MEM_ACTIVE_SCENE_ID),d7 ; copy current scene id to d7
	cmpi.w	#MAX_STORE_ID,d7 ; is the new scene a store?
	bgt.w	MainGameLoop ; if not then back to the start of the game loop
	move.l	(MEM_GAME_STATE),d7 ; copy game state to d7
	bset.l	#STATE_FLAG_ACTION,d7 ; set the action flag
	move.l	d7,(MEM_GAME_STATE) ; save it back
	move.w	#ACTION_ENTER_SCENE,(MEM_ACTION_ID) ; set the action id
	bra.w	MainGameLoop ; return to start of game loop
;-------------------------------------------------------------------------------
; determine if there is a scripted event to process
;-------------------------------------------------------------------------------
TestScriptedEvent:
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	btst.l	#STATE_FLAG_SCRIPTED_EVENT,d7 ; test game state
	beq.w	TestDialog	; not in a scripted event, move to next test
	btst.l	#STATE_FLAG_DIALOG,d7 ; test if we need to wait for a dialog
	bne.w	TestDialogUpdateFrequency	; wait for dialog interaction to finish
	;---------------------------------------------------------------------------
	; dialog is not displaying - process next scripted event
	;---------------------------------------------------------------------------
	bsr.w	ProcessScriptedEvent
	bra.w	MainGameLoop
;-------------------------------------------------------------------------------
; determine if the player is opening or interacting with a dialog
;-------------------------------------------------------------------------------
TestDialog:
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	btst.l	#STATE_FLAG_DIALOG,d7 ; test game state
	beq.w	TestStatusScreen	; dialog not displaying, move to next test
TestDialogUpdateFrequency:
	move.b	(MEM_CONTROL_6_HELD),d6	; copy pressed buttons to d6
	andi.b	#BUTTON_Z,d6	; test if the Z button is held
	bne.s	.1	; Z button is held, skip test
	cmpi.w	#DIALOG_UPDATE_FREQUENCY,(MEM_FRAME_COUNTER); is it time to update?
	blt.s	TestDialogOpen	; branch if it's not time to move
	; how would this test ever be different than the previous one?
	; what was I thinking here? commenting out for now
	;blt.w	MainGameLoop	; branch if it's not time to move
.1	
	move.w	#$0000,(MEM_FRAME_COUNTER)	; reset counter to 0	
	bsr.w	ProcessDialog	; dialog is set, jump to process dialog sub-routine
	bra.w	MainGameLoop	; return to start of game loop
TestDialogOpen:
	; if the dialog is open then update frequency is ignored
	move.l	(MEM_DIALOG_FLAGS),d7	; copy current game state to d7
	btst.l	#DIALOG_FLAG_TEXT_OPEN,d7 ; test if the dialog is open
	beq.w	MainGameLoop	; dialog is not open, move to next test
	; else branch to process dialog
	bsr.w	ProcessDialog	; dialog is set, jump to process dialog sub-routine
	bra.w	MainGameLoop	; return to start of game loop
;-------------------------------------------------------------------------------
; determine if the player is on the status screen
;-------------------------------------------------------------------------------
TestStatusScreen:
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	btst.l	#STATE_FLAG_STATUS_SCREEN,d7 ; test game state
	beq.w	TestExploring	; not in status screen, move to next test
	;---------------------------------------------------------------------------
	; player is on the status screen
	;---------------------------------------------------------------------------
	bsr.w	ProcessStatusScreen	; branch to process the status screen
	move.w	#$0000,(MEM_FRAME_COUNTER)	; reset frame counter
	bra.w	MainGameLoop	; return to start of game loop
;-------------------------------------------------------------------------------
; determine if the player is in free exploration mode
;-------------------------------------------------------------------------------
TestExploring:
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	btst.l	#STATE_FLAG_EXPLORING,d7	; test game state
	beq.w	TestTitleScreen	; not exploring, branch to next test
TestCButtonPressed:	; test if the player pressed the C button
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.b	#BUTTON_C,d6	; test if the C button was pressed
	beq.w	TestAButtonPressed	; C button is not pressed
	move.w	#MENU_PAGE_MAP,(MEM_MENU_SCREEN_PAGE)
	; test if fast travel is available
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	btst.l	#STATE_FLAG_FAST_TRAVEL_AVAILABLE,d7 ; test fast travel flag
	beq.s	.NoFastTravel
	lea	SceneMenuMap,a6	; address of the scene for the map screen
	bra.s	.DrawMap
.NoFastTravel
	lea	SceneMenuMapNoTravel,a6	; address of the scene for the map screen
.DrawMap
	adda.l	#$2,a6	; skip scene id before branching to DrawScene
	bsr.w	DrawScene	; branch to subroutine to draw the scene
	bsr.w	BuildStatusScreen	; build the status screen
	bsr.w	FadeIn	; fade in the status screen
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bset.l	#STATE_FLAG_STATUS_SCREEN,d7	; update game state
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	bra.w	MainGameLoop	; go back the start of the game loop
TestAButtonPressed: ; test if the player pressed the A button
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.b	#BUTTON_A,d6	; test if the A button was pressed
	beq.w	MainGameLoopUpdateSprites	; A button is not pressed
	;---------------------------------------------------------------------------
	; build event table address and branch to code
	;---------------------------------------------------------------------------
	; clear MEM_CONTROL_PRESSED to prevent state from flipping in loop
	move.w	#$0000,(MEM_CONTROL_PRESSED)
	lea	MEM_PLAYER_SPRITE_ID,a6	; point a6 to player sprite
	bsr.w	StopSprite ; stop the player sprite
	bsr.w	BuildNPCObjectList	; update the location of NPCs
	bsr.w	FindActionTarget	; find the target of the player's action
	cmpi.w	#OBJ_NOTHING,(MEM_ACTION_TARGET_OBJID)	; is the target nothing?
	beq.s	NoActionTarget	; branch if no target
	; queue the event	
	move.w	#ACTION_INTERACT,(MEM_ACTION_ID)
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	bset.l	#STATE_FLAG_ACTION,d7	; set the action flag
	move.l	d7,(MEM_GAME_STATE)	; save it back
	bra.w	MainGameLoop	; return to start of game loop
NoActionTarget: 	; if target is 0 then display the default message
	lea	DialogTextNothing,a6	; load default text
	move.l	a6,MEM_DIALOG_TEXT	; copy address to MEM_DIALOG_TEXT
	bsr.w	SetDialogOpening	; set dialog state to opening
	bra.w	MainGameLoop	; return to start of game loop
;-------------------------------------------------------------------------------
; determine if sprites need to be moved and move them
;-------------------------------------------------------------------------------
MainGameLoopUpdateSprites:
	; if Z button is held then skip the test
	move.b	(MEM_CONTROL_6_HELD),d6	; copy pressed buttons to d6
	andi.b	#BUTTON_Z,d6	; test if the Z button is held
	bne.s	.1	; Z button is held, skip test
	; test if it's time to move sprites
	cmpi.w	#SPRITE_MOVE_FREQUENCY,(MEM_FRAME_COUNTER); is it time to move?
	blt.w	MainGameLoopEnd	; exit if it's not time to move
.1
	; move the player sprite
	move.w	#$0000,(MEM_FRAME_COUNTER)	; reset counter to 0
	bsr.w	MovePlayer	; move the player sprite
	; move NPCs
	tst.w	(MEM_ACTIVE_NPC_COUNT)	; are there any NPCs to move?
	beq.w	MainGameLoop	; return to start of game loop if no NPCs
	move.w	(MEM_ACTIVE_NPC_COUNT),(MEM_NPC_LOOP_COUNTER)	; setup loop control
	lea	MEM_NPC0_SPRITE_ID,a5	; point to first NPC
MainGameLoopUpdateNPCSpritesLoop:
	; if STRUCT_SPRITE_MOVE_FREQUENCY = $FFFF then don't move the sprite
	cmpi.w	#$FFFF,(STRUCT_SPRITE_MOVE_FREQUENCY,a5)	; test
	beq.s	MainGameLoopUpdateNPCSpritesLoopEnd	; branch if equal
	cmpi.w	#$0000,(STRUCT_SPRITE_MOVEMENT_COUNTER,a5)	; is the NPC moving?
	bne	.2	; if MOVEMENT_COUNTER > 0 then the sprite is moving
	; test if it's time for them to move again
	move.w	(MEM_VBLANK_COUNTER),d6	; copy vblank counter
	and.w	(STRUCT_SPRITE_MOVE_FREQUENCY,a5),d6	; and against it
	cmp.w	(STRUCT_SPRITE_MOVE_FREQUENCY,a5),d6	; test 
	bne.s	MainGameLoopUpdateNPCSpritesLoopEnd ; not time to move
	move.w	#NPC_SPRITE_MOVE_STEPS,(STRUCT_SPRITE_MOVEMENT_COUNTER,a5)	; reset
	; set the direction
	addq	#$2,(STRUCT_SPRITE_MOVE_INDEX,a5)	; increment index of movement
	move.w	(STRUCT_SPRITE_MOVE_PATTERN_LENGTH,a5),d6
	cmp.w	(STRUCT_SPRITE_MOVE_INDEX,a5),d6	; end of the array?
	bge.s	.1	; not at the end of the array
	move.w	#$0000,(STRUCT_SPRITE_MOVE_INDEX,a5)	; reset to zero
.1
	move.l	(STRUCT_SPRITE_MOVE_PATTERN,a5),a6
	adda	(STRUCT_SPRITE_MOVE_INDEX,a5),a6
	move.w	(a6),(STRUCT_SPRITE_DIRECTION,a5)
.2	; decrement NPC movement counter and test if they should stop moving
	subq	#$0001,(STRUCT_SPRITE_MOVEMENT_COUNTER,a5)	; decrement counter
	bne	.3	; if MOVEMENT_COUNTER=0 now then we need to stop the sprite
	move.l a5,a6	; setup call to StopSprite
	bsr.w	StopSprite ; stop the sprite
	bra.s	MainGameLoopUpdateNPCSpritesLoopEnd ; done updating this sprite
.3	; move the NPC sprite
	move.l a5,a6	; setup call to MoveSprite
	bsr.w	MoveSprite	; branch to move MoveSprite
	; did the sprite move successfully?
	tst.w	(MEM_COLLISION_RESULT)	; test result of last collision
	beq.s	MainGameLoopUpdateNPCSpritesLoopEnd ; done updating this sprite	
	addq	#$0001,(STRUCT_SPRITE_MOVEMENT_COUNTER,a5)	; rollback counter
MainGameLoopUpdateNPCSpritesLoopEnd:
	; move to next NPC sprite
	adda.l	#NPC_RECORD_SIZE,a5	; increment a5	
	; apparently dbra doesn't work against a memory address
	subq	#$1,(MEM_NPC_LOOP_COUNTER)	; decrement loop counter
	bgt.w	MainGameLoopUpdateNPCSpritesLoop	; branch
	; done looping through NPC sprites
	bra.w	MainGameLoop	; return to start of game loop
;-------------------------------------------------------------------------------
; title screen
;-------------------------------------------------------------------------------
TestTitleScreen:
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	btst.l	#STATE_FLAG_TITLE_SCREEN,d7 ; test game state
	beq.w	TestEndScreen	; not on the title screen, move to next test
TestTitleScreenTestStartPressed:
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.b	#BUTTON_START,d6	; test if the start button was pressed
	;---------------------------------------------------------------------------
	; handle selector movement
	;---------------------------------------------------------------------------
	bne.w	TestTitleLoadSelectedScreen	; start button pressed, load next screen
TestTitleScreenTestDPadPressed:
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.b	#BUTTON_UP,d6	; test if the up button was pressed
	bne.s	TestTitleScreenDecrementSelector	; dpad pressed, branch
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.b	#BUTTON_DOWN,d6	; test if the down button was pressed
	bne.s	TestTitleScreenIncrementSelector	; dpad pressed, branch
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.b	#BUTTON_LEFT,d6	; test if the left button was pressed
	bne.s	TestTitleScreenDecrementSelector	; dpad pressed, branch
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.b	#BUTTON_RIGHT,d6	; test if the right button was pressed
	bne.s	TestTitleScreenIncrementSelector	; dpad pressed, branch
	bra.s	TestTitleScreenTestStartPressedLoop	; dpad not pressed
	if _DEBUG_
TestTitleScreenIncrementSelector:
	cmpi.w	#$0002,(MEM_MENU_SELECTION)
	bne	.1
	move.w	#$0000,(MEM_MENU_SELECTION)
	bra.s	TestTitleScreenMoveSelector
.1	
	add.w	#$0001,(MEM_MENU_SELECTION)
	bra.s	TestTitleScreenMoveSelector
TestTitleScreenDecrementSelector:
	tst.w	(MEM_MENU_SELECTION)
	bne	.2
	move.w	#$0002,(MEM_MENU_SELECTION)
	bra.s	TestTitleScreenMoveSelector
.2	
	sub.w	#$0001,(MEM_MENU_SELECTION)
	else
TestTitleScreenIncrementSelector:
	cmpi.w	#$0001,(MEM_MENU_SELECTION)
	bne	.1
	move.w	#$0000,(MEM_MENU_SELECTION)
	bra.s	TestTitleScreenMoveSelector
.1	
	add.w	#$0001,(MEM_MENU_SELECTION)
	bra.s	TestTitleScreenMoveSelector
TestTitleScreenDecrementSelector:
	tst.w	(MEM_MENU_SELECTION)
	bne	.2
	move.w	#$0001,(MEM_MENU_SELECTION)
	bra.s	TestTitleScreenMoveSelector
.2	
	sub.w	#$0001,(MEM_MENU_SELECTION)
	endif
TestTitleScreenMoveSelector:
	move.w	(MEM_MENU_SELECTION),d7	; menu position
	mulu.w	#$10,d7	; 16 pixels
	add.w	#$0118,d7	; starting y-coordinate
	move.l	#VDP_VRAM_WRITE_SPRITE,d6	; add to sprite table address
	move.l	d6,(VDP_CONTROL)	; set write location in VDP
	move.w	d7,(VDP_DATA)	; copy the new y-coordinate;
TestTitleScreenTestStartPressedLoop:
	subq	#$1,(MEM_INTRO_SCENE_COUNTER)	; decrement counter
	bne.w	MainGameLoop	; loop until the counter is zero
	; if still on the intro screen restart, if on load screen wait it out
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	btst.l	#STATE_FLAG_LOAD_MENU,d7	; test if on load menu
	bne.w	MainGameLoop	; flag is set, keep looping
	bra.w	NewGame	; counter is zero, restart
TestTitleLoadSelectedScreen:
	; clear MEM_CONTROL_PRESSED to prevent entering pause state immediately
	move.w	#$0000,(MEM_CONTROL_PRESSED)
	; --------------------------------------------------------------------------
	; start button was pressed on the title screen
	; --------------------------------------------------------------------------
	bclr.l	#STATE_FLAG_TITLE_SCREEN,d7 ; clear game state flag
	tst.w	(MEM_MENU_SELECTION)	; which item was selected?
	beq.s	TestTitleLoadNewGame	; new game selected
	if _DEBUG_
	cmpi.w	#$0002,(MEM_MENU_SELECTION)	; debug menu selected?
	beq.s	TestTitleLoadDebugMenu	; branch to debug menu
	endif
	; switch to load screen
	move.w	#$0000,(MEM_MENU_SELECTION)	; clear menu selection
	bset.l	#STATE_FLAG_LOAD_MENU,d7 ; set debug menu flag
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	lea	SceneLoad,a6	; address of the scene for the debug menu
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	LoadPlayerSprite	; load the player sprite (also loads sprite 0)
	; hide the player sprite
	move.w	#$0000,(MEM_PLAYER_SPRITE_X)
	move.w	#$0000,(MEM_PLAYER_SPRITE_Y) 
	bsr.w	FixSprites
	; build and show the load screen
	bsr.w	BuildLoadScreen	; builds the text on the screen
	bsr.w	FadeIn	; fade in to the new scene
	bra.w	MainGameLoop	;	return to start of game loop
	if _DEBUG_
TestTitleLoadDebugMenu:
	move.w	#$0000,(MEM_MENU_SELECTION)	; clear menu selection
	bset.l	#STATE_FLAG_DEBUG_MENU,d7 ; set debug menu flag
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	lea	SceneDebugMenu,a6	; address of the scene for the debug menu
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	LoadPlayerSprite	; load the player sprite (also loads sprite 0)
	bsr.w	FadeIn	; fade in to the new scene
	bra.w	MainGameLoop	;	return to start of game loop
	endif
TestTitleLoadNewGame:
	bset.l	#STATE_FLAG_INTRO_SCREEN,d7 ; set intro screen flag
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	; set the intro screen counter
	move.w	#INTRO_SCREEN_COUNTER_START,(MEM_INTRO_SCENE_COUNTER)
	lea	SceneIntroDay00,a6	; address of the scene for the title screen
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	FadeIn	; fade in to the new scene
	bra.w	MainGameLoop	;	return to start of game loop
;-------------------------------------------------------------------------------
; end screen
;-------------------------------------------------------------------------------
TestEndScreen:
	btst.l	#STATE_FLAG_END_SCREEN,d7 ; test game state
	beq.w	TestIntroScreen	; not on the end screen, move to next test
TestEndScreenTestStartPressed:
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.b	#BUTTON_START,d6	; test if the start button was pressed
	beq.w	MainGameLoop	; start button not pressed, loop
	; --------------------------------------------------------------------------
	; start button was pressed on the end screen - loop back to the beginning
	; --------------------------------------------------------------------------
	; clear MEM_CONTROL_PRESSED to prevent entering pause state immediately
	move.w	#$0000,(MEM_CONTROL_PRESSED)
EndScreenRestart:
	bra.w	NewGame	; restart
;-------------------------------------------------------------------------------
; day intro screen
;-------------------------------------------------------------------------------
TestIntroScreen:
	btst.l	#STATE_FLAG_INTRO_SCREEN,d7 ; test game state
	beq.w	MainGameLoopEnd	; not on the intro screen, move to next test
	tst.w	(MEM_INTRO_SCENE_COUNTER)	; is the counter already zero
	beq.s	TestIntroScreenWaitButtonPress	; wait for button press
	subq	#$1,(MEM_INTRO_SCENE_COUNTER)	; decrement counter
	bne.w	MainGameLoop	; loop until the counter is zero
TestIntroScreenWaitButtonPress:
	; counter is zero, test if button was pressed
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.b	#BUTTON_START,d6	; test if the start button was pressed
	beq.w	MainGameLoop	; loop until start is pressed
TestIntroScreenLoadScene:
	; load the next scene
	bclr.l	#STATE_FLAG_INTRO_SCREEN,d7 ; clear game state flag
	bset.l	#STATE_FLAG_EXPLORING,d7	; initial mode is exploring
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	; determine which scene to load
	move.w	(MEM_ACTIVE_SCENE_EXIT_N),d6	; copy any exit to d6
	mulu.w	#LWORD_SIZE,d6	; SceneDefinitionTable entries are long values
	lea	SceneDefinitionTable,a5	; point to scene table
	adda.w	d6,a5	; move to offset location
	move.l	(a5),a6	; a5 has the address of the scene to load
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	LoadPlayerSprite	; load the player sprite
TestIntroScreenEnd:
	; reorder all the sprites
	bsr.w	OrderSprites	; order sprites
	; workaround to issue where links aren't set if the table is already sorted
	move.w	#$2700,sr		; disable interrupts
	bsr.w	SetSpriteLinks
	move.w	#$2000,sr		; re-enable interrupts
	move.w	#$0000,(MEM_FRAME_COUNTER)	; reset frame counter
	bsr.w	FadeIn	; fade in now that everything is setup
MainGameLoopEnd:
	bra.w	MainGameLoop	; return to start of game loop

