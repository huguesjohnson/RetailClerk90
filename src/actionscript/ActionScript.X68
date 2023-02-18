;*******************************************************************************
; used for lookup table conditions that are unreachable
;*******************************************************************************
ActionScriptNullEvent:
	rts

;*******************************************************************************
; used for lookup table conditions that only ever show default look text
;*******************************************************************************
ActionScriptDefaultInteract:
	bsr.w	ShowDefaultText
	rts

;*******************************************************************************
; default exit scene handler
;*******************************************************************************
DefaultExitScene:
	; trying to prevent NPC sprites from changing direction
	move.w	#$FFFF,(MEM_ACTION_TARGET_NPCID)
	; determine which exit is being used based on sprite direction
	move.w	(MEM_PLAYER_SPRITE_DIRECTION),d6	; copy player direction to d6
	mulu.w	#$2,d6	; multiply by 2 to get offset
	lea	MEM_ACTIVE_SCENE_EXIT_S,a6	; point a6 to the first exit
	adda.l	d6,a6	; add offset
	move.w	(a6),d6	; copy location to d6
	; this check shouldn't be needed unless I made a catastrophic error
	cmpi.w	#$FFFF,d6	; is this a valid exit?
	beq.w	ExitDefaultExit	; if not a valid exit then exit subroutine
DefaultExitSceneLoadNewScene:
	mulu.w	#$4,d6	; multiply by 4 to get offset
	lea	SceneDefinitionTable,a6	; point a6 to the scene definition table
	adda.l	d6,a6	; add offset
	move.l	(a6),a6	; have a6 point to the value at a6
	bsr.w	LoadScene	; branch to LoadScene subroutine
	bsr.w	LoadPlayerSprite	; load the player sprite
	; move player to the correct position
	move.w	(MEM_PLAYER_SPRITE_DIRECTION),d6	; copy player direction to d6
	;---------------------------------------------------------------------------
	; adjust player sprite x/y
	;---------------------------------------------------------------------------
DefaultExitSceneTestDown:
	cmpi.w	#DIRECTION_DOWN,d6	; test for down
	bne.s	DefaultExitSceneTestUp	; direction is not down, test for up
	move.w	#SCENE_ENTER_TOP,(MEM_PLAYER_SPRITE_Y)	; update y location
	bra.w	DefaultExitSceneFixSprites	; exit
DefaultExitSceneTestUp:
	cmpi.w	#DIRECTION_UP,d6	; test for up
	bne.s	DefaultExitSceneTestLeft	; direction is not up, test for left
	move.w	#SCENE_ENTER_BOTTOM,(MEM_PLAYER_SPRITE_Y)	; update y location
	bra.s	DefaultExitSceneFixSprites	; exit
DefaultExitSceneTestLeft:
	cmpi.w	#DIRECTION_LEFT,d6	; test for left
	bne.s	DefaultExitSceneTestRight	; direction is not left, test for right
	move.w	#SCENE_ENTER_RIGHT,(MEM_PLAYER_SPRITE_X)	; update x location
	bra.s	DefaultExitSceneFixSprites	; exit
DefaultExitSceneTestRight:
	cmpi.w	#DIRECTION_RIGHT,d6	; test for right
	bne.s	DefaultExitSceneFixSprites	; should be unreachable
	move.w	#SCENE_ENTER_LEFT,(MEM_PLAYER_SPRITE_X)	; update x location
DefaultExitSceneFixSprites:
	bsr.w	FixSprites ; fix all the sprites
ExitDefaultExit:
	bsr.w	FadeIn ; fade in now that everything is loaded
	rts

;*******************************************************************************
; default enter scene handler
;*******************************************************************************
DefaultEnterScene:
	rts

;*******************************************************************************
; end the game
;*******************************************************************************
EndGame:
;	; set the end game flag
;	move.l	(MEM_GAME_STATE),d7	; copy game state
;	and.l	#$0000,d7	; clear all other flags
;	bset.l	#STATE_FLAG_END_SCREEN,d7 ; set end screen state flag	
;	move.l	d7,(MEM_GAME_STATE)	; save updated game state
;	;---------------------------------------------------------------------------
;	; determine which ending to load
;	;---------------------------------------------------------------------------
;	move.l	(MEM_DAY_EVENT_FLAGS),d7	; copy day event flags to d7
;	btst.l	#EVENT_FLAG_DAY07_PERFECT_ENDING,d7	; perfect ending achieved?
;	beq.s	.1	; perfect ending not achieved
;	lea	SceneEndingPerfect0,a6	; last screen of perfect ending
;	bra.s	EndGameLoadScene	; load the scene
;.1
;	btst.l	#EVENT_FLAG_DAY07_GOOD_ENDING,d7	; good ending achieved?
;	beq.s	EndGameBadEnding	; good ending not achieved
;	lea	SceneEndingGood3,a6	; last screen of good ending
;	bra.s	EndGameLoadScene	; load the scene
;EndGameBadEnding:
;	lea	SceneEndingBad3,a6	; last screen of bad ending
;EndGameLoadScene:
;	jsr	LoadScene	; branch to LoadScene subroutine
;	bsr.w	FadeIn	; fade in
	rts

;*******************************************************************************
; default text for look events
;*******************************************************************************
	include	'sub_ShowDefaultText.X68'

;*******************************************************************************
; day specific events
;*******************************************************************************
	include	'actionscript/ActionScriptAllDay.X68'
	include	'actionscript/ActionScriptDay00.X68'


