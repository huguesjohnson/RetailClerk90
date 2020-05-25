ProcessStatusScreen:
;-------------------------------------------------------------------------------
; a couple notes about handling multiple buttons pressed in the same frame...
; (mostly for myself as I will forget why I did things this way)
; tl;dr - if multiple buttons are pressed in the same frame one of them "wins"
;
; If the B button is pressed then no other buttons are processed
; This is because cancelling the screen overrides anything else
;
; The d-pad is processed before the A and C buttons
; If the d-pad is pressed the A and C buttons are skipped in that frame
; This is to avoid activating an unintented menu selection 
; The d-pad order of precidence is Up->Down->Left->Right for no reason
;
; A and C have the same function
; If both are pressed in the same frame it's treated like one button press
;-------------------------------------------------------------------------------
	clr.w	d6	; lazy workaround to prevent some bugs
	move.b	(MEM_CONTROL_PRESSED),d6 ; copy pressed buttons to d6
	; if no buttons have been pressed then there's no action to take
	beq.w	ExitProcessStatusScreen ; exit
;-------------------------------------------------------------------------------
; test for B button (cancelling the menu screen)
;-------------------------------------------------------------------------------
	move.w	d6,d7 ; copy d6 to d7 since the value will be modified
	and.w	#BUTTON_B,d7 ; test if the B button was pressed
	beq.s	ProcessStatusScreenTestDPad ; B button is not pressed
CancelStatusScreen:
	move.l	(MEM_GAME_STATE),d7 ; copy current game state to d7
	bclr.l	#STATE_FLAG_STATUS_SCREEN,d7 ; update game state
	move.l	d7,(MEM_GAME_STATE) ; save updated game state
	bsr.w	ReloadCurrentScene ; reload the current scene
	bra.w	ExitProcessStatusScreen ; exit
;-------------------------------------------------------------------------------
; test if a direction was pressed
;-------------------------------------------------------------------------------
ProcessStatusScreenTestDPad:
	move.w	d6,d7 ; copy d6 to d7 since the value will be modified
	and.w	#DPAD_PRESSED,d7 ; test if any d-pad button was pressed
	beq.w	ProcessStatusScreenTestAC ; no d-pad buttons are not pressed
ProcessStatusScreenTestDPadTestUp:
	move.w	d6,d7 ; copy d6 to d7 since the value will be modified
	and.w	#BUTTON_UP,d7 ; test if the up button was pressed
	beq.s	ProcessStatusScreenTestDPadTestDown ; up button is not pressed
	; if the selected item is <4 then move to the last menu item
	cmpi.w	#$0003,(MEM_MENU_SELECTION)	; test if this is in the navigation
	bgt.w	ExitProcessStatusScreenUpdateSelectorXY ;.1	; <4 means navigation
	; find max selection number
	clr	d6	; done out of paranoia
	move.w	(MEM_MENU_SCREEN_PAGE),d6	; copy active page ID to d6
	mulu.w	#WORD_SIZE,d6	; multiply by LWORD_SIZE to get offset
	lea	MenuPageMaxNavItem,a6	; point a6 to the lookup table
	adda.l	d6,a6 ; move to offset
	move.w	(a6),(MEM_MENU_SELECTION) ; copy max menu selection from table
	bra.w	ProcessStatusScreenTestDPadExit ; done processing d-pad
.1 ; otherwise increment the selection
	addq	#$01,(MEM_MENU_SELECTION)
	bra.w	ProcessStatusScreenTestDPadExit ; done processing d-pad
ProcessStatusScreenTestDPadTestDown:
	move.w	d6,d7 ; copy d6 to d7 since the value will be modified
	and.w	#BUTTON_DOWN,d7 ; test if the down button was pressed
	beq.s	ProcessStatusScreenTestDPadTestLeft ; down button is not pressed
	; if the selected item is the max menu item then wrap to the navigation
	; find max selection number for this page
	clr	d6	; done out of paranoia
	move.w	(MEM_MENU_SCREEN_PAGE),d6 ; copy active page ID to d6
	mulu.w	#WORD_SIZE,d6	; multiply by LWORD_SIZE to get offset
	lea	MenuPageMaxNavItem,a6	; point a6 to the lookup table
	adda.l	d6,a6 ; move to offset
	move.w	(a6),d7	; copy max page to d7
	cmp.w	(MEM_MENU_SELECTION),d7
	blt.s	.1 ; branch if below the max items per page
	move.w	(MEM_MENU_SCREEN_PAGE),(MEM_MENU_SELECTION) ; select the page
	bra.w	ProcessStatusScreenTestDPadExit ; done processing d-pad
.1 ; otherwise decrement the selection
	subq	#$01,(MEM_MENU_SELECTION)
	bra.w	ProcessStatusScreenTestDPadExit ; done processing d-pad

ProcessStatusScreenTestDPadTestLeft:
	move.w	d6,d7 ; copy d6 to d7 since the value will be modified
	and.w	#BUTTON_LEFT,d7 ; test if the left button was pressed
	beq.s	ProcessStatusScreenTestDPadTestRight ; left button is not pressed
	tst.w	(MEM_MENU_SELECTION) ; test if the menu selection is zero
	bne.s	.1	; zero means the first nav item is selected
	; if MEM_MENU_SELECTION is zero then roll it over to 3
	move.w	#$0003,(MEM_MENU_SELECTION)
	bra.w	ProcessStatusScreenTestDPadExit ; done processing d-pad
.1 ; otherwise decrement the selection
	subq	#$01,(MEM_MENU_SELECTION)
	bra.w	ProcessStatusScreenTestDPadExit ; done processing d-pad
ProcessStatusScreenTestDPadTestRight:
	move.w	d6,d7 ; copy d6 to d7 since the value will be modified
	and.w	#BUTTON_RIGHT,d7 ; test if the right button was pressed
	; this should never fail but I make a lot of mistakes so it's possible
	beq.s	ProcessStatusScreenTestAC ; right button is not pressed
	cmpi.w	#$0003,(MEM_MENU_SELECTION) ; test if the menu selection is three
	bne.s	.1	; three means the last nav item is selected
	; if MEM_MENU_SELECTION is three then roll it over to zero
	move.w	#$0000,(MEM_MENU_SELECTION)
	bra.w	ProcessStatusScreenTestDPadExit ; done processing d-pad
.1 ; otherwise increment the selection
	addq	#$01,(MEM_MENU_SELECTION)
	bra.w	ProcessStatusScreenTestDPadExit ; done processing d-pad
ProcessStatusScreenTestDPadExit:
	bsr.w	ProcessStatusScreenUpdateSelectorXY ; update the selector position
	bra.w	ExitProcessStatusScreen	; exit

ProcessStatusScreenTestAC:

; TO DO - this is the "last" part of this to work on

;ProcessStatusScreenTestACButtonPressed:	; test if the player pressed A
;	cmpi.w	#BUTTON_A,d6	; test if the A button was pressed
;	beq.s	ProcessStatusScreenACButtonPressed	; A button is pressed
;	cmpi.w	#BUTTON_C,d6	; test if the C button was pressed
;	bne.w	ProcessStatusScreenTestBButtonPressed	; C button is not pressed
;ProcessStatusScreenACButtonPressed:
;	; setup dialog
;	bsr.w	SetDialogOpening	; setup dialog
;	; fixing similar bug to one in DefaultExitSceneNoKey
;	move.w	#$FFFF,(MEM_ACTION_TARGET_NPCID)
;	; set flag to not hide the selector after closing
;	move.l	(MEM_DIALOG_FLAGS),d7	; copy current dialog state to d7
;	bset.l	#DIALOG_FLAG_OPTION_PERSIST_SELECTOR,d7	; set option
;	move.l	d7,(MEM_DIALOG_FLAGS)	; save changes made to the dialog options
;	move.w	(MEM_MENU_SELECTION),d6	; copy menu selection to d6
;	; test if the selector is on the save or item menu
;	cmpi.w	#$0004,d6	; 0-3 are save, 4-7 are items
;	blt.s	ProcessStatusScreenACButtonPressedSave	; branch to save logic
;ProcessStatusScreenACButtonPressedItem:
;	; lookup description of selected item
;	subq.w	#$0004,d6	; subtract 4 to get item slot
;	mulu.w	#WORD_SIZE,d6	; items are 1 word
;	lea	MEM_PLAYER_ITEMS,a6	; point a6 to player items
;	adda.l	d6,a6	; move to offset
;	move.w	(a6),d6	; copy item number to d6
;	and.w	#$0FFF,d6	; clear out item mask
;	mulu.w	#LWORD_SIZE,d6	; addresses are 1 lword
;	lea	ItemDescriptionTable,a6	; point a6 to the lookup table
;	adda.l	d6,a6	; move to offset
;	move.l	(a6),(MEM_DIALOG_TEXT)	; copy value at a6 to MEM_DIALOG_TEXT
;	bra.w	ExitProcessStatusScreen	; exit
;ProcessStatusScreenACButtonPressedSave:
;	bsr.w	SaveGame	; save game
;	; update the text
;	move.w	(MEM_OBJECTIVE),d6	; objective is used for title lookup
;	mulu.w	#LWORD_SIZE,d6	; multiply by LWORD_SIZE to get offset
;	lea	SaveGameTitles,a5	; point a5 to the lookup table
;	adda.l	d6,a5	; move to offset
;	move.l	(a5),a0	; point a0 to the first character
;	move.l	#STATUS_SCREEN_SAVE0_VDP,d7	; point d7 to first line
;	clr	d6	; lazy way to prevent various bugs
;	move.w	#$0080,d6	; using d6 to compute row
;	mulu.w	(MEM_MENU_SELECTION),d6	; multiply by current save slot
;	swap	d6	; move to high word
;	add.l	d6,d7	; add offset to d7
;	move.l	d7,(MEM_DIALOG_VDP)
;UpdateSaveTitleLoop:
;	clr	d6	; lazy way to prevent various bugs
;	move.b	(a0)+,d6	; copy current character to d6
;	cmpi.b	#ETX,d6	; is this the end of the text?
;	beq.s	ExitSaveTitleLoopExit	; end of text, move on
;	; update d6 to point to the tile ID
;	sub.w	#$20,d6	; subtract 32 to get the character index
;	add.w	#DIALOG_BASE_TILE_LOW,d6	; add the base tile
;	move.l	(MEM_DIALOG_VDP),(VDP_CONTROL)	; set VDP address
;	move.w  d6,(VDP_DATA)	; copy the character to VDP
;	; draw the next character
;	add.l	#$00020000,(MEM_DIALOG_VDP)	; move to the next column
;	bra.w	UpdateSaveTitleLoop ; loop until ETX
;ExitSaveTitleLoopExit:
;	; show a saved message
;	lea	StatusScreenSaveDialog,a6	; point a6 to the dialog text
;	move.l	a6,(MEM_DIALOG_TEXT)	; copy value at a6 to MEM_DIALOG_TEXT
;	bra.w	ExitProcessStatusScreen	; exit
;ProcessStatusScreenTestBButtonPressed:	; test if the player pressed B
;	cmpi.w	#BUTTON_B,d6	; test if the B button was pressed
;	bne.w	ProcessStatusScreenTestDPad	; B button is not pressed
;CancelStatusScreen:
;	move.l	(MEM_GAME_STATE),d7	; copy current game state to d7
;	bclr.l	#STATE_FLAG_STATUS_SCREEN,d7	; update game state
;	move.l	d7,(MEM_GAME_STATE)	; save updated game state
;	bsr.w	ReloadCurrentScene	; reload the current scene
;	bra.w	ExitProcessStatusScreen	; exit
;ProcessStatusScreenTestDPad:
;	cmpi.w	#$0000,(MEM_PLAYER_ITEM_COUNT)	; is item count 0?
;	ble.w	ProcessStatusScreenTestButtonPressUp	; branch if no items 
;ProcessStatusScreenTestButtonPressLR:	; L/R toggles between menus
;	cmpi.w	#BUTTON_LEFT,d6	; is the left button pressed?
;	beq.s	ProcessStatusScreenTestButtonPressLRTestMenu	; left pressed
;	cmpi.w	#BUTTON_RIGHT,d6	; is the right button pressed?
;	bne.s	ProcessStatusScreenTestButtonPressUp	; right not pressed
;ProcessStatusScreenTestButtonPressLRTestMenu:
;	; test if on the item menu or inventory menu
;	cmpi.w	#$0004,(MEM_MENU_SELECTION)	; test whether in item or save column
;	blt.s	ProcessStatusScreenTestButtonPressLRSaveMenu
;	; on the item menu
;	subq	#$0004,(MEM_MENU_SELECTION)	; subtract 4 to move to save menu
;	bra.w	ProcessStatusScreenUpdateSelector
;ProcessStatusScreenTestButtonPressLRSaveMenu:
;	move.w	(MEM_PLAYER_ITEM_COUNT),d6	; copy item count to d6
;	cmp.w	(MEM_MENU_SELECTION),d6	; compare item count to menu selection
;	bgt.s	.1
;	move.w	#$0004,(MEM_MENU_SELECTION)
;	bra.s	.2
;.1
;	addq	#$0004,(MEM_MENU_SELECTION)
;.2
;	bra.s	ProcessStatusScreenUpdateSelector
;ProcessStatusScreenTestButtonPressUp:	; up
;	;---------------------------------------------------------------------------
;	; to do - once save is implemented update this 
;	; -left/right should move between inventory & save
;	; -track which column the selector is in
;	;---------------------------------------------------------------------------
;	; test if the up button is pressed
;	cmpi.w	#BUTTON_UP,d6	; is the up button pressed?
;	bne.s	ProcessStatusScreenTestButtonPressDown	; up not pressed
;	; decrement MEM_MENU_SELECTION
;	cmpi.w	#$0000,(MEM_MENU_SELECTION)	; is the menu selection 0?
;	beq.s	ProcessStatusScreenTestButtonPressUpZero	; branch if zero
;	cmpi.w	#$0004,(MEM_MENU_SELECTION)	; is the menu selection 4?
;	beq.s	ProcessStatusScreenTestButtonPressUpFour	; branch if >=four
;	; otherwise, decrement
;	subq.w	#$0001,(MEM_MENU_SELECTION)	; decrement
;	bra.s	ProcessStatusScreenUpdateSelector
;ProcessStatusScreenTestButtonPressUpZero:
;	move.w	#$0003,(MEM_MENU_SELECTION)	; wrap around to end of the list
;	bra.s	ProcessStatusScreenUpdateSelector
;ProcessStatusScreenTestButtonPressUpFour:
;	move.w	(MEM_PLAYER_ITEM_COUNT),d6	; copy item count to d6
;	addq	#$0003,d6	; add 3 to get higest menu item that should appear
;	move.w	d6,(MEM_MENU_SELECTION)	; wrap around to end of the list
;	bra.s	ProcessStatusScreenUpdateSelector
;ProcessStatusScreenTestButtonPressDown:
;	cmpi.w	#BUTTON_DOWN,d6	; is the down button pressed?
;	bne.s	ExitProcessStatusScreen	; down not pressed
;	; increment MEM_MENU_SELECTION
;	cmpi.w	#$0003,(MEM_MENU_SELECTION)	; is the menu selection 3?
;	beq.s	ProcessStatusScreenTestButtonPressDownThree	; branch if 3
;	; determine if the last item is selected
;	move.w	(MEM_PLAYER_ITEM_COUNT),d6	; copy item count to d6
;	addq	#$0003,d6	; add 3 to get higest menu item that should appear
;	cmp.w	(MEM_MENU_SELECTION),d6	; is the last item selected?
;	beq.s	ProcessStatusScreenTestButtonPressDownLastItem	; branch if last
;	addq.w	#$0001,(MEM_MENU_SELECTION)	; increment
;	bra.s	ProcessStatusScreenUpdateSelector
;ProcessStatusScreenTestButtonPressDownThree:
;	move.w	#$0000,(MEM_MENU_SELECTION)	; wrap around to end of the list
;	bra.s	ProcessStatusScreenUpdateSelector
;ProcessStatusScreenTestButtonPressDownLastItem:
;	move.w	#$0004,(MEM_MENU_SELECTION)	; wrap around to end of the list
;ProcessStatusScreenUpdateSelector:
;	bsr.w	ProcessStatusScreenUpdateSelectorXY	; update selector position
ExitProcessStatusScreen:
	move.w	#$0000,(MEM_CONTROL_PRESSED)	; clear pressed buttons
	rts

ProcessStatusScreenUpdateSelectorXY:
	move.w	(MEM_MENU_SELECTION),d4	; copy menu selection to d4
	cmpi.w	#$0003,d4	; test if this is in the navigation
	bgt.w	ExitProcessStatusScreenUpdateSelectorXY ;.1	; <4 means navigation
	;---------------------------------------------------------------------------
	; move the selector to the right position in the navigation menu
	;---------------------------------------------------------------------------
	clr	d6	; done out of paranoia
	move.w	(MEM_MENU_SELECTION),d6	; copy active scene ID to d6
	mulu.w	#LWORD_SIZE,d6	; multiply by LWORD_SIZE to get offset
	lea	MenuNavigationTable,a6	; point a6 to the lookup table
	adda.l	d6,a6	; move to offset
	;---------------------------------------------------------------------------
	; update y
	;---------------------------------------------------------------------------
	move.l	#VDP_VRAM_WRITE_SPRITE,d6	; add to sprite table address
	move.l	d6,(VDP_CONTROL)	; set write location in VDP
	move.w	(a6)+,(VDP_DATA)	; copy the new y-coordinate
	;---------------------------------------------------------------------------
	; update x
	;---------------------------------------------------------------------------
	add.l	#$00060000,d6	; move to x-coordinate
	move.l	d6,(VDP_CONTROL)	; set write location in VDP
	move.w	(a6),(VDP_DATA)	; copy the new x-coordinate
	bra.w	ExitProcessStatusScreenUpdateSelectorXY
	nop
;	subq.w	#$0004,d4	; subtract 4 from d6
;	move.w	#$0090,d5	; set x position
;	bra.s	.2	; move to set y position and update VDP
;.1
;	move.w	#$0100,d5	; set x position
;.2
;	mulu.w	#$0008,d4	; multiply by 16 to get y index
;	add.w	#$0130,d4	; add offset of first item
;	;---------------------------------------------------------------------------
;	; update y
;	;---------------------------------------------------------------------------
;	move.l	#VDP_VRAM_WRITE_SPRITE,d6	; add to sprite table address
;	move.l	d6,(VDP_CONTROL)	; set write location in VDP
;	move.w	d4,(VDP_DATA)	; copy the new y-coordinate
;	;---------------------------------------------------------------------------
;	; update x
;	;---------------------------------------------------------------------------
;	add.l	#$00060000,d6	; move to x-coordinate
;	move.l	d6,(VDP_CONTROL)	; set write location in VDP
;	move.w	d5,(VDP_DATA)	; copy the new x-coordinate
ExitProcessStatusScreenUpdateSelectorXY:
	rts

