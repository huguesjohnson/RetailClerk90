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
	bsr.w	FixSprites
	bra.w	ProcessScriptedEventQueueNextAction ; exit
ScriptedEventSetPlayerSpriteY:
	move.w	(a6)+,(MEM_PLAYER_SPRITE_Y)	; update sprite
	bsr.w	FixSprites
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
ScriptedEventFadeIn:	
	bsr.w	FadeIn	; fade in to the new scene
	bra.w	ProcessScriptedEventQueueNextAction ; exit
ScriptedEventTimer:
	move.w	(a6)+,d7	; copy timer to d7
	move.w	(a6)+,(MEM_SCRIPTED_EVENT_ACTION) ; save next action
	move.l	a6,(MEM_SCRIPTED_EVENT_ADDR) ; save address of next step
ScriptedEventTimerLoop:
	jsr	WaitVBlank	; wait for vblank
	move.b	(MEM_CONTROL_PRESSED),d6 ; copy pressed buttons to d6
	andi.b	#BUTTON_START,d6 ; test if the start button was pressed
	bne.s	.exitScriptedEventTimerLoop	; exit loop if start is pressed	
	dbf	d7,ScriptedEventTimerLoop	; loop
.exitScriptedEventTimerLoop
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
	bra.w	ProcessScriptedEventQueueNextAction ; exit
	
ScriptedEventUpdateSceneNPCs:
	clr.l	d7 ; just being paranoid and clearing high word before mulu
	move.w	(a6)+,d7 ; scene to update
	mulu.w	#LWORD_SIZE,d7 ; multiply by 2 to get offset 
	lea	MEM_NPC_LOCATIONS,a1 ; point to npc locations
	adda.l	d7,a1 ; add offset
	move.l	(a6)+,(a1) ; copy new npc value
	bra.w	ProcessScriptedEventQueueNextAction ; exit

ScriptedEventLoadPalette:
	;---------------------------------------------------------------------------
	; In theory loading a palette is very simple
	; I made it complicated to support dimming the palette when paused
	; Also for fade in/fade out but pausing is the real issue
	; A palette changed in the VDP will be un-changed when the game is paused
	; So the palette to load has to be written to both:
	; a) MEM_SCENE_PALETTE - where I keep a copy of the current palette
	; b) VDP_CRAM_WRITE - the address where palettes are actually written
	; 
	; OK, so if MEM_SCENE_PALETTE=$FFFF0210	(for example) then:
	; p0=FFFF0210, p1=FFFF0230, p2=FFFF0250, p3=FFFF0270
	; VDP_CRAM_WRITE offsets should also be 20 (32 / 16 words)
	;
	; what we are using
	; a0 = pointer to palette we are loading
	; a1 = pointer to MEM_SCENE_PALETTE
	; d0 = the palette slot being written to -> offset -> loop control
	; d1 = VDP write address
	;---------------------------------------------------------------------------
	clr.l	d0 ; high word needs to be clear 
	move.w	(a6)+,d0 ; which palette number to load (0-3)
	mulu.w	#$0020,d0 ; calculate offset
	movea.l	(a6)+,a0 ; start address of palette to load
	; setup pointer to MEM_SCENE_PALETTE
	lea	MEM_SCENE_PALETTE,a1 ; point a1 to scene palette address	
	adda.l d0,a1 ; add offset
	; setup loop control
	clr.l	d0 ; just being overly cautious
	move.w	#$000F,d0 ; 16 palette entries - 1
ScriptedEventLoadPaletteLoop:
	move.w	(a0)+,(a1)+ ; write the palette data to MEM_SCENE_PALETTE
	dbf	d0,ScriptedEventLoadPaletteLoop	; decrement value of d0 and loop if not 0
	; reload palettes into CRAM
	lea	(MEM_SCENE_PALETTE),a0	; point to scene palette
	moveq	#$0004,d0	; number of palettes to load
	move.l	#VDP_CRAM_WRITE,d1	; initial write address
	bsr.w	LoadPalettes	; branch to LoadPalettes subroutine
	bra.w	ProcessScriptedEventQueueNextAction ; exit
	
ScriptedEventSetStateFlag:
	move.l	(a6)+,d7 ; state flag to set
	move.l	(MEM_GAME_STATE),d6	; copy game state to d6
	bset.l	d7,d6 ; set flag
	move.l	d6,(MEM_GAME_STATE)	; save updated game state
	bra.w	ProcessScriptedEventQueueNextAction ; exit

ScriptedEventClearStateFlag:
	move.l	(a6)+,d7 ; state flag to clear
	move.l	(MEM_GAME_STATE),d6	; copy game state to d6
	bclr.l	d7,d6 ; clear flag
	move.l	d6,(MEM_GAME_STATE)	; save updated game state
;	bra.w	ProcessScriptedEventQueueNextAction ; exit
	
ProcessScriptedEventQueueNextAction:
	move.w	(a6)+,(MEM_SCRIPTED_EVENT_ACTION) ; save next action
	move.l	a6,(MEM_SCRIPTED_EVENT_ADDR) ; save address of next step	

ExitProcessScriptedEvent:
	rts
