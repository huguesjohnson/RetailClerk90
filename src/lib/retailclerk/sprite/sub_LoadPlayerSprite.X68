;-------------------------------------------------------------------------------
; also loads sprite zero
; d0, a0, and a6 are modified
;-------------------------------------------------------------------------------
LoadPlayerSprite:
	bsr.w	WaitVBlank	; wait for vblank to complete
	move.w	#$2700,sr		; disable interrupts
	lea     SpriteZeroDefinition,a0	; store address of sprite definition
	moveq	#$03,d0	; 1 sprite = 2 longs
	move.l	#VDP_VRAM_WRITE_SPRITE,(VDP_CONTROL) ; set write location
LoadPlayerSpriteLoop:
	move.l  (a0)+,(VDP_DATA)
	dbra    d0,LoadPlayerSpriteLoop
	; call to StopSprite is to fix an issue where wrong tiles display
	lea (MEM_PLAYER_SPRITE_ID),a6	; setup call to StopSprite
	bsr.w	StopSprite	; reset the sprite frame
ExitLoadPlayerSprite:
	move.w	#$2000,sr		; re-enable interrupts
	rts
