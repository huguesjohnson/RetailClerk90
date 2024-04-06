ProcessTitleScreen:
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
	mulu.w	#TITLE_MENU_INC_Y,d7 ; increment
	add.w	#TITLE_MENU_NEWGAME_Y,d7	; starting y-coordinate
	move.l	#VDP_VRAM_WRITE_SPRITE,d6	; add to sprite table address
	move.l	d6,(VDP_CONTROL)	; set write location in VDP
	move.w	d7,(VDP_DATA)	; copy the new y-coordinate;
TestTitleScreenTestStartPressedLoop:
	subq	#$1,(MEM_INTRO_SCENE_COUNTER)	; decrement counter
	bne.w	ExitProcessTitleScreen	; loop until the counter is zero
	; if still on the intro screen restart, if on load screen wait it out
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	btst.l	#STATE_FLAG_LOAD_MENU,d7	; test if on load menu
	bne.w	ExitProcessTitleScreen	; flag is set, keep looping
	bra.w	NewGame	; counter is zero, restart
TestTitleLoadSelectedScreen:
	; clear MEM_CONTROL_PRESSED to prevent entering pause state immediately
	move.w	#$0000,(MEM_CONTROL_PRESSED)
	; --------------------------------------------------------------------------
	; start button was pressed on the title screen
	; --------------------------------------------------------------------------
	bclr.l	#STATE_FLAG_TITLE_SCREEN,d7 ; clear game state flag
	tst.w	(MEM_MENU_SELECTION)	; which item was selected?
	beq.w	TestTitleLoadNewGame	; new game selected
	if _DEBUG_
	cmpi.w	#$0002,(MEM_MENU_SELECTION)	; debug menu selected?
	beq.s	TestTitleLoadDebugMenu	; branch to debug menu
	endif
	; switch to load screen
	move.w	#$0000,(MEM_MENU_SELECTION)	; clear menu selection
	bset.l	#STATE_FLAG_LOAD_MENU,d7 ; set load menu flag
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
	bra.w	ExitProcessTitleScreen	;	return to start of game loop
	if _DEBUG_
TestTitleLoadDebugMenu:
	move.w	#$0000,(MEM_MENU_SELECTION)	; clear menu selection
	bset.l	#STATE_FLAG_DEBUG_MENU,d7 ; set debug menu flag
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	lea	SceneDebugMenu,a6	; address of the scene for the debug menu
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	LoadPlayerSprite ; load the player sprite (also loads sprite 0)
	; hide the player sprite
	move.w	#$0000,(MEM_PLAYER_SPRITE_X)
	move.w	#$0000,(MEM_PLAYER_SPRITE_Y)
	bsr.w	FixSprites	
	bsr.w	FadeIn	; fade in to the new scene
	bra.s	ExitProcessTitleScreen	;	return to start of game loop
	endif
TestTitleLoadNewGame:
	bset.l	#STATE_FLAG_INTRO_SCREEN,d7 ; set intro screen flag
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	; set the initial story event
	move.w	#SCENE_ID_DENIMCOUNTRY,(MEM_STORY_EVENT1_SCENE_ID)
	; set the intro screen counter
	move.w	#INTRO_SCREEN_COUNTER_START,(MEM_INTRO_SCENE_COUNTER)
	lea	SceneIntroDay00,a6	; address of the scene for the title screen
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	FadeIn	; fade in to the new scene
ExitProcessTitleScreen:
	rts

