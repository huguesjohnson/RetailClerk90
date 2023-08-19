;*******************************************************************************
; show a regular dialog
;*******************************************************************************
ShowDialog:
	move.l	a6,MEM_DIALOG_TEXT ; copy address to MEM_DIALOG_TEXT	
	move.l	(MEM_DIALOG_FLAGS),d7 ; copy dialog flags to d7
	bclr.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d7 ; set text choice flag
	bset.l	#DIALOG_FLAG_TEXT_OPENING,d7 ; change state to opening
	bset.l	#DIALOG_FLAG_STYLE_TITLED,d7 ; set the titled flag
	move.l	d7,(MEM_DIALOG_FLAGS) ; save updated dialog flags
	; set dialog flags to display the dialog
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bset.l	#STATE_FLAG_DIALOG,d7	; set the dialog bit
	move.l	d7,(MEM_GAME_STATE) ; copy game state back to d7
	rts

;*******************************************************************************
; show a 2 choice dialog
;*******************************************************************************	
Show2ChoiceDialog:
	move.l	a6,MEM_DIALOG_TEXT ; copy address to MEM_DIALOG_TEXT	
	move.l	(MEM_DIALOG_FLAGS),d7 ; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_2CHOICE,d7 ; set text choice flag
	bset.l	#DIALOG_FLAG_TEXT_OPENING,d7 ; change state to opening
	bset.l	#DIALOG_FLAG_STYLE_TITLED,d7 ; set the titled flag
	move.l	d7,(MEM_DIALOG_FLAGS) ; save updated dialog flags
	; set dialog flags to display the dialog
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bset.l	#STATE_FLAG_DIALOG,d7	; set the dialog bit
	move.l	d7,(MEM_GAME_STATE) ; copy game state back to d7
	rts
	
;*******************************************************************************
; show a 4 choice dialog
;*******************************************************************************	
Show4ChoiceDialog:
	move.l	a6,MEM_DIALOG_TEXT ; copy address to MEM_DIALOG_TEXT	
	move.l	(MEM_DIALOG_FLAGS),d7 ; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TEXT_4CHOICE,d7 ; set text choice flag
	bset.l	#DIALOG_FLAG_TEXT_OPENING,d7 ; change state to opening
	bset.l	#DIALOG_FLAG_STYLE_TITLED,d7 ; set the titled flag
	move.l	d7,(MEM_DIALOG_FLAGS) ; save updated dialog flags
	; set dialog flags to display the dialog
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bset.l	#STATE_FLAG_DIALOG,d7	; set the dialog bit
	move.l	d7,(MEM_GAME_STATE) ; copy game state back to d7
	rts	
