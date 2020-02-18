ShowDefaultText:
	move.w	(MEM_ACTION_TARGET_OBJID),d7	; move target object ID to d7
	move.w	(MEM_ACTION_TARGET_OBJID),d6	; move target object ID to d6
	andi.w	#$0FFF,d7	; clear the base value
	mulu.w	#$4,d7	; multiply by 4 to get the offset
	; determine whether this is an object or NPC
	andi.w	#OBJ_SCENE_BASE,d6	; and d6 against base object value
	beq.s	.1	; branch if zero (not an object)
	; object
	lea	DefaultObjectDescriptionTable,a6	; point to default object text table
	bra.s	.2
.1	; npc
	lea	CharacterInteractTextTableStart,a6	; point to text table
.2

	;---------------------------------------------------------------------------
	; setup the dialog
	;---------------------------------------------------------------------------


;	lea	NPCNameTable,a6	; point to default npc text table
	adda.l	d7,a6	; add offset

	lea DialogTextTest,a6

	move.l	a6,(MEM_DIALOG_TEXT)	; copy value at a6 to MEM_DIALOG_TEXT
	
	; set dialog flags to display the dialog
	move.l	(MEM_DIALOG_FLAGS),d7	; copy current dialog state to d7
	bset.l	#DIALOG_FLAG_TEXT_OPENING,d7	; change state to opening
	bset.l	#DIALOG_FLAG_STYLE_TITLED,d7	; set the titled flag
;	bset.l	#DIALOG_FLAG_STYLE_MENU,d7	; set style to overworld menu
;	bset.l	#DIALOG_FLAG_SELECTION_WAIT,d7	; set flag to wait for selection
	move.l	d7,(MEM_DIALOG_FLAGS)	; save changes made to the game state
	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
	bset.l	#STATE_FLAG_DIALOG,d7	; set the dialog bit
	move.l	d7,(MEM_GAME_STATE) ; copy game state back to d7



;	adda.l	d7,a6	; add offset
;	move.l	(a6),(MEM_DIALOG_TEXT)	; copy value at a6 to MEM_DIALOG_TEXT
	rts
