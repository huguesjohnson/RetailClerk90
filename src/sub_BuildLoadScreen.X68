BuildLoadScreen:
	move.w	#$2700,sr ; disable interrupts
	move.l	#LOAD_SCREEN_SLOT0_VDP,d0
	bsr.w	DrawSaveTitles
ExitBuildLoadScreen:
	move.w	#$2000,sr	; re-enable interrupts
	rts

