;-------------------------------------------------------------------------------
; process scripted events from the main loop
; I should split this up somehow
;-------------------------------------------------------------------------------
ProcessScriptedEvent:
	;---------------------------------------------------------------------------
	; dialog is not displaying, test if it is time to start a new action
	;---------------------------------------------------------------------------
	cmpi.w	#$0000,(MEM_SCRIPTED_EVENT_STEPS)	; test if 0
	beq.w	NextScriptedEventAction	; if 0 then start next action
	;---------------------------------------------------------------------------
	; continue moving the sprite
	;---------------------------------------------------------------------------
	cmpi.w	#SPRITE_MOVE_FREQUENCY,(MEM_FRAME_COUNTER); is it time to move?
	blt.w	ExitProcessScriptedEvent	; exit if it's not time to move
	move.w	#$0000,(MEM_FRAME_COUNTER)	; reset counter to 0
	subq	#$1,(MEM_SCRIPTED_EVENT_STEPS)	; decrement step counter
	move.l	(MEM_SCRIPTED_SPRITE_ADDR),a6	; point a6 to sprite to move
	bsr.w	MoveSprite	; branch to MoveSprite
	bra.w	ExitProcessScriptedEvent	; exit
NextScriptedEventAction:
	move.l	(MEM_SCRIPTED_SPRITE_ADDR),a6	; point a6 to sprite
	bsr.w	StopSprite	; stop moving the sprite
	move.l	(MEM_SCRIPTED_EVENT_ADDR),a6	; point a6 to next step
	move.w	(MEM_SCRIPTED_EVENT_ACTION),d7	; copy action to d7
	cmpi.w	#SCRIPTED_EVENT_BASE,d7 ; test if this is an action
	bcs.s	ScriptedEventMoveSprite ; I regret how I initially implemented this now
	;---------------------------------------------------------------------------
	; lookup address of next action handler
	;---------------------------------------------------------------------------
	sub.w	#SCRIPTED_EVENT_BASE,d7	; subtract base value to make d7 an index	
	mulu.w	#LWORD_SIZE,d7 ; d7 will be the offset now
	lea	ScriptedEventActionTableStart,a4 ; point to action table
	adda.w	d7,a4 ; move to offset location
	move.l	(a4),a5	; a5 has the address of the subroutine to jump to
	jmp	(a5) ; jump to location of code to process this event
ScriptedEventMoveSprite:
	;---------------------------------------------------------------------------
	; start moving the sprite
	;---------------------------------------------------------------------------
	move.l	(MEM_SCRIPTED_SPRITE_ADDR),a5	; point a5 to sprite to update
	; copy direction to sprite direction 
	adda.w	#STRUCT_SPRITE_DIRECTION,a5	; move to direction
	move.w	(MEM_SCRIPTED_EVENT_ACTION),(a5)	; copy action to direction
	move.w	(a6)+,(MEM_SCRIPTED_EVENT_STEPS)	; copy steps in action
	bra.w	ProcessScriptedEventQueueNextAction ; exit
ScriptedEventEnd:
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bclr.l	#STATE_FLAG_SCRIPTED_EVENT,d7	; clear the scripted event flag
	move.l	d7,(MEM_GAME_STATE)	; save it back
	bra.w	ExitProcessScriptedEvent	; exit
ScriptedEventDialog:
	move.l	(a6)+,(MEM_DIALOG_TEXT)	; copy value at a6 to MEM_DIALOG_TEXT
	move.w	(a6)+,(MEM_SCRIPTED_EVENT_ACTION)	; save next action
	move.l	a6,(MEM_SCRIPTED_EVENT_ADDR)	; save address of next step
	move.w	#$0000,(MEM_SCRIPTED_EVENT_STEPS)	; reset step counter
	; set dialog flags to display the dialog
	move.l	(MEM_DIALOG_FLAGS),d7	; copy current dialog state to d7
	bset.l	#DIALOG_FLAG_TEXT_OPENING,d7	; change state to opening
	bset.l	#DIALOG_FLAG_STYLE_SIMPLE_TEXT,d7	; set style to overworld menu
	bset.l	#DIALOG_FLAG_STYLE_TITLED,d7	; set style to titled
	move.l	d7,(MEM_DIALOG_FLAGS)	; save changes made to the game state
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bset.l	#STATE_FLAG_DIALOG,d7	; set the dialog bit
	move.l	d7,(MEM_GAME_STATE) ; copy game state back to d7
	bra.w	ExitProcessScriptedEvent	; exit
ScriptedEventChangeSprite:
	move.l	(MEM_SCRIPTED_EVENT_ADDR),a6	; point a6 to next step
	bsr.w	QueueScriptedEvent	; this will reset all variables
	bra.w	ExitProcessScriptedEvent	; exit
ScriptedEventChangeScene:
	move.w	(a6)+,d7	; copy scene ID to load to d7
	move.w	(a6)+,(MEM_SCRIPTED_EVENT_ACTION)	; save next action
	move.l	a6,(MEM_SCRIPTED_EVENT_ADDR)	; save address of next step
	mulu.w	#$4,d7	; multiply by 4 to get offset in scene definition table
	lea	SceneDefinitionTable,a6	; point a6 to the scene definition table
	adda.l	d7,a6	; add offset
	move.l	(a6),a6	; have a6 point to the value at a6
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	LoadPlayerSprite	; load the player sprite
	bsr.w	FixSprites	; move player sprite and reset sprite links
	move.w	#EVENT_FRAME_DELAY,d7	; copy delay to d7
	bra.s	ScriptedEventFadeInDelayLoop
ScriptedEventDrawScene:
	move.w	(a6)+,d7	; copy scene ID to load to d7
	move.w	(a6)+,(MEM_SCRIPTED_EVENT_ACTION)	; save next action
	move.l	a6,(MEM_SCRIPTED_EVENT_ADDR)	; save address of next step
	mulu.w	#$4,d7	; multiply by 4 to get offset in scene definition table
	lea	SceneDefinitionTable,a6	; point a6 to the scene definition table
	adda.l	d7,a6	; add offset
	move.l	(a6),a6	; have a6 point to the value at a6
	move.w	(a6)+,d6	; discard first word
	bsr.w	DrawScene	; branch to LoadScene subroutine
	bsr.w	ReloadSpriteTiles	; reload sprite tiles
	move.w	#EVENT_FRAME_DELAY,d7	; copy delay to d7
ScriptedEventFadeInDelayLoop:
	bsr.w	WaitVBlank
	move.b	(MEM_CONTROL_6_HELD),d6	; copy pressed buttons to d6
	andi.b	#BUTTON_Z,d6	; test if the Z button is held
	bne.s	.1	; Z button is held, skip test
	dbf	d7,ScriptedEventFadeInDelayLoop	; loop until counter is zero
.1
	bsr.w	FadeIn	; fade in to the new scene
	bra.w	ExitProcessScriptedEvent	; exit
ScriptedEventChangePlayerSprite:
	move.w	(a6)+,(MEM_PLAYER_SPRITE)	; update sprite
	bra.w	ProcessScriptedEventQueueNextAction ; exit
ScriptedEventSetPlayerSpriteX:
	move.w	(a6)+,(MEM_PLAYER_SPRITE_X)	; update sprite
	bra.w	ProcessScriptedEventQueueNextAction ; exit
ScriptedEventSetPlayerSpriteY:
	move.w	(a6)+,(MEM_PLAYER_SPRITE_Y)	; update sprite
	bra.w	ProcessScriptedEventQueueNextAction ; exit
ScriptedEventSetPlayerSpriteDirection:
	move.w	(a6)+,(MEM_PLAYER_SPRITE_DIRECTION)	; update sprite
	bra.w	ProcessScriptedEventQueueNextAction ; exit
ScriptedEventFadeBlack:
	move.w	(a6)+,(MEM_SCRIPTED_EVENT_ACTION)	; save next action
	move.l	a6,(MEM_SCRIPTED_EVENT_ADDR)	; save address of next step
	bsr.w	FadeOut	; fade out
	; blackout the palette
	lea	MEM_SCENE_PALETTE,a1	; point a1 to scene palette address
	move.w	#$003F,d7	; 64-1 palette entries
ScriptedEventFadeBlackLoop:
	move.w	#$0000,(a1)+	; write the palette data
	dbf	d7,ScriptedEventFadeBlackLoop	; decrement d7 and loop if not 0
	bra.w	ExitProcessScriptedEvent	; exit
ScriptedEventTimer:
	move.w	(a6)+,d7	; copy timer to d7
	move.w	(a6)+,(MEM_SCRIPTED_EVENT_ACTION)	; save next action
	move.l	a6,(MEM_SCRIPTED_EVENT_ADDR)	; save address of next step
ScriptedEventTimerLoop:
	jsr	WaitVBlank	; wait for vblank
	dbf	d7,ScriptedEventTimerLoop	; loop
	bra.w	ExitProcessScriptedEvent	; exit
ScriptedEventEndGame:
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bclr.l	#STATE_FLAG_SCRIPTED_EVENT,d7	; clear the scripted event flag
	move.l	d7,(MEM_GAME_STATE)	; save it back
	bra.w	EndGame
	bra.w	ExitProcessScriptedEvent ; exit
ScriptedEventLoadFont:
	move.w	(a6)+,d7 ; copy font id to d7
	cmpi.w	#FONT_ID_DISTORT,d7
	beq.s	.distort
.default	
	move.w	#$2700,sr		; disable interrupts	
	bsr.w	LoadFontTiles
	move.w	#$2000,sr		; re-enable interrupts
	bra.s	.exitloadfont
.distort	
	move.w	#$2700,sr		; disable interrupts	
	bsr.w	LoadFontTilesSlightDistort
	move.w	#$2000,sr		; re-enable interrupts	
.exitloadfont
	bra.w	ProcessScriptedEventQueueNextAction ; exit

ScriptedEventAddItem:
	move.w	(a6)+,d7 ; item to add
	cmpi.w	#$0000,(MEM_PLAYER_SPRITE) ; which player inventory to use?
	beq.s	.pczero
	lea	MEM_PLAYER2_ITEM_COUNT,a1
	bra.s	.calladditem
.pczero
	lea	MEM_PLAYER1_ITEM_COUNT,a1
.calladditem
	bsr.w	AddItem ; add item to inventory		
	bra.w	ProcessScriptedEventQueueNextAction ; exit
ScriptedEventRemoveItem:	
	move.w	(a6)+,d7 ; item to add
	cmpi.w	#$0000,(MEM_PLAYER_SPRITE) ; which player inventory to use?
	beq.s	.pczero
	lea	MEM_PLAYER2_ITEM_COUNT,a1
	bra.s	.callremoveitem
.pczero
	lea	MEM_PLAYER1_ITEM_COUNT,a1
.callremoveitem
	bsr.w	RemoveItem ; remove item from inventory
ProcessScriptedEventQueueNextAction:
	move.w	(a6)+,(MEM_SCRIPTED_EVENT_ACTION) ; save next action
	move.l	a6,(MEM_SCRIPTED_EVENT_ADDR) ; save address of next step	
ExitProcessScriptedEvent:
	rts
