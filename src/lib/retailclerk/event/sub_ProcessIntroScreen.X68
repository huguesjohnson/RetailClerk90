ProcessIntroScreen:
	tst.w	(MEM_INTRO_SCENE_COUNTER)	; is the counter already zero
	beq.s	TestIntroScreenWaitButtonPress	; wait for button press
	subq	#$1,(MEM_INTRO_SCENE_COUNTER)	; decrement counter
	bne.w	ExitProcessIntroScreen	; loop until the counter is zero
TestIntroScreenWaitButtonPress:
	; counter is zero, test if button was pressed
	move.b	(MEM_CONTROL_PRESSED),d6	; copy pressed buttons to d6
	andi.b	#BUTTON_START,d6	; test if the start button was pressed
	beq.w	ExitProcessIntroScreen	; loop until start is pressed
TestIntroScreenLoadScene:
	; load the next scene
	bclr.l	#STATE_FLAG_INTRO_SCREEN,d7 ; clear game state flag
	bset.l	#STATE_FLAG_EXPLORING,d7	; initial mode is exploring
	move.l	d7,(MEM_GAME_STATE)	; save updated game state
	btst.l	#STATE_FLAG_SCRIPTED_EVENT,d7 ; test if a scripted event is queued
	bne.s	ExitProcessIntroScreen ; if so, have that handle loading the next scene
	; otherwise determine which scene to load
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
ExitProcessIntroScreen:
	rts
