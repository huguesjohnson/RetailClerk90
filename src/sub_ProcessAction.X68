ProcessAction:
	; --------------------------------------------------------------------------
	; test if the action is the player exiting the scene, if so process it
	; --------------------------------------------------------------------------
	cmpi.w	#ACTION_EXIT_SCENE,(MEM_ACTION_ID)	; test if this is an exit action
	bne.s	ProcessActionResetDialog	; not an exit action, branch
	lea	SceneExitTable,a5	; point to scene exit table
	move.w	(MEM_ACTIVE_SCENE_ID),d7	; copy scene ID to d7
	mulu.w	#LWORD_SIZE,d7	; multiply by lword size to get offset
	adda.w	d7,a5	; move to offset location
	move.l	(a5),a6	; a5 has the address of the subroutine to jump to
	jsr	(a6)	; jump to location of code to process this event
	bra.w	ExitProcessAction	; exit
	; --------------------------------------------------------------------------
	; ACTION_RESPOND is the only other option at this point
	; --------------------------------------------------------------------------
ProcessActionResetDialog:
	bsr.w	ResetDialog	; reset the dialog
	; if the target is an NPC - the resulting dialog should be titled
	move.w	(MEM_ACTION_TARGET_OBJID),d7	; copy action target to d7
	andi.w	#OBJ_NPC_BASE,d7	; and against base npc ID
	beq.s	ProcessActionBuildActionTableOffset	; target is not an NPC
	; set the dialog titled flag
	move.l	(MEM_DIALOG_FLAGS),d7	; copy dialog flags to d7
	bset.l	#DIALOG_FLAG_STYLE_TITLED,d7	; set the titled flag
	move.l	d7,(MEM_DIALOG_FLAGS)	; save updated event flags for the day	
ProcessActionBuildActionTableOffset:
	bsr.w	BuildActionTableOffset	; build action table offset
	lea	ActionTable,a5	; point to action table
	adda.w	(MEM_ACTION_TABLE_OFFSET),a5	; move to offset location
	move.l	(a5),a6	; a5 has the address of the subroutine to jump to
	jsr	(a6)	; jump to location of code to process this event
	;---------------------------------------------------------------------------
	; returning from the action
	; if the dialog is now titled style then some extra setup is needed
	;---------------------------------------------------------------------------
	move.l	(MEM_DIALOG_FLAGS),d7	; copy flags to d7
	btst.l	#DIALOG_FLAG_STYLE_TITLED,d7	; test if flag is set
	beq.s	ExitProcessAction
	bset.l	#DIALOG_FLAG_TEXT_TITLE_DRAWING,d7	; change state to title drawing
	move.l	d7,(MEM_DIALOG_FLAGS)	; save updated flags
	bsr.w	ClearDialog	; clear the dialog
	move.l	#(VDP_VRAM_WRITE_A+DIALOG_TITLE_ROWCOL),(MEM_DIALOG_VDP)
	bsr.w	ProcessDialogLookupNPCName	; lookup the NPC name
ExitProcessAction:
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bclr.l	#STATE_FLAG_ACTION,d7 ; clear action flag
	move.l	d7,(MEM_GAME_STATE)	; save it back
	rts
