ProcessStatusScreen:
;-------------------------------------------------------------------------------
; this is called ProcessStatusScreen because in RC89 there was one status screen
; that name is a little confusing in RC90+ because it's really a menu screen
;
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
	cmpi.w	#MAX_MENU_PAGE,(MEM_MENU_SELECTION)	; test if this is in the navigation
	bgt.s	.Decrement	; <MAX_MENU_PAGE means navigation
	cmpi.w	#MENU_PAGE_HELP,(MEM_MENU_SCREEN_PAGE) ; test if this is the help page
	beq.w	ProcessStatusScreenTestDPadExit ; if not then exit
	cmpi.w	#MENU_PAGE_MAP,(MEM_MENU_SCREEN_PAGE) ; test if this is the map page
	bne.s	.FindMaxSelection ; not the map
	; test if fast travel is available
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	btst.l	#STATE_FLAG_FAST_TRAVEL_AVAILABLE,d7 ; test fast travel flag
	bne.s	.FindMaxSelection ; if so then continue
	bra.w	ProcessStatusScreenTestDPadExit ; if not then exit
.FindMaxSelection
	; find max selection number
	clr	d6	; done out of paranoia
	move.w	(MEM_MENU_SCREEN_PAGE),d6	; copy active page ID to d6
	mulu.w	#WORD_SIZE,d6	; multiply by LWORD_SIZE to get offset
	lea	MenuPageMaxNavItem,a6	; point a6 to the lookup table
	adda.l	d6,a6 ; move to offset
	move.w	(a6),(MEM_MENU_SELECTION) ; copy max menu selection from table
	bra.w	ProcessStatusScreenTestDPadExit ; done processing d-pad
.Decrement ; otherwise decrement the selection
	cmpi.w	#MAX_MENU_PAGE+$0001,(MEM_MENU_SELECTION)	; test if this is the first item
	bne.s	.2
	move.w	(MEM_MENU_SCREEN_PAGE),(MEM_MENU_SELECTION) ; select the page
	bra.w	ProcessStatusScreenTestDPadExit ; done processing d-pad
.2
	subq	#$01,(MEM_MENU_SELECTION)
	bra.w	ProcessStatusScreenTestDPadExit ; done processing d-pad
ProcessStatusScreenTestDPadTestDown:
	move.w	d6,d7 ; copy d6 to d7 since the value will be modified
	and.w	#BUTTON_DOWN,d7 ; test if the down button was pressed
	beq.s	ProcessStatusScreenTestDPadTestLeft ; down button is not pressed
	; if the selected item is <MAX_MENU_PAGE then move to the first menu item
	cmpi.w	#MAX_MENU_PAGE,(MEM_MENU_SELECTION)	; test if this is in the navigation
	bgt.s	.TestWraparound	; <MAX_MENU_PAGE means navigation
	cmpi.w	#MENU_PAGE_HELP,(MEM_MENU_SCREEN_PAGE) ; test if this is the help page
	beq.w	ProcessStatusScreenTestDPadExit ; if so then exit
	cmpi.w	#MENU_PAGE_MAP,(MEM_MENU_SCREEN_PAGE) ; test if this is the map page
	bne.s	.1 ; not the map
	; test if fast travel is available
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	btst.l	#STATE_FLAG_FAST_TRAVEL_AVAILABLE,d7 ; test fast travel flag
	beq.w	ProcessStatusScreenTestDPadExit ; if not then exit
.1
	move.w	#MAX_MENU_PAGE+$0001,(MEM_MENU_SELECTION)
	bra.w	ProcessStatusScreenTestDPadExit ; done processing d-pad
.TestWraparound
	; if the selected item is the max menu item then wrap to the navigation
	; find max selection number for this page
	clr	d6	; done out of paranoia
	move.w	(MEM_MENU_SCREEN_PAGE),d6 ; copy active page ID to d6
	mulu.w	#WORD_SIZE,d6	; multiply by LWORD_SIZE to get offset
	lea	MenuPageMaxNavItem,a6	; point a6 to the lookup table
	adda.l	d6,a6 ; move to offset
	move.w	(a6),d7	; copy max page to d7
	move.w	(MEM_MENU_SELECTION),d6
	cmp.w	d6,d7
	bgt.s	.Increment ; branch if at the last item in the page
	move.w	(MEM_MENU_SCREEN_PAGE),(MEM_MENU_SELECTION) ; select the page
	bra.w	ProcessStatusScreenTestDPadExit ; done processing d-pad
.Increment ; otherwise increment the selection
	addq	#$01,(MEM_MENU_SELECTION)
	bra.w	ProcessStatusScreenTestDPadExit ; done processing d-pad
ProcessStatusScreenTestDPadTestLeft:
	move.w	d6,d7 ; copy d6 to d7 since the value will be modified
	and.w	#BUTTON_LEFT,d7 ; test if the left button was pressed
	beq.s	ProcessStatusScreenTestDPadTestRight ; left button is not pressed
	tst.w	(MEM_MENU_SELECTION) ; test if the menu selection is zero
	bne.s	.1	; zero means the first nav item is selected
	; if MEM_MENU_SELECTION is zero then roll it over to MAX_MENU_PAGE
	move.w	#MAX_MENU_PAGE,(MEM_MENU_SELECTION)
	bra.w	ProcessStatusScreenTestDPadExit ; done processing d-pad
.1 ; otherwise decrement the selection
	cmpi.w	#MAX_MENU_PAGE+$0001,(MEM_MENU_SELECTION)
	bne.s	.2
	; roll over to the last item
	; find max selection number
	clr	d6	; done out of paranoia
	move.w	(MEM_MENU_SCREEN_PAGE),d6	; copy active page ID to d6
	mulu.w	#WORD_SIZE,d6	; multiply by LWORD_SIZE to get offset
	lea	MenuPageMaxNavItem,a6	; point a6 to the lookup table
	adda.l	d6,a6 ; move to offset
	move.w	(a6),(MEM_MENU_SELECTION) ; copy max menu selection from table
	bra.w	ProcessStatusScreenTestDPadExit ; done processing d-pad
.2
	subq	#$01,(MEM_MENU_SELECTION)
	bra.w	ProcessStatusScreenTestDPadExit ; done processing d-pad
ProcessStatusScreenTestDPadTestRight:
	move.w	d6,d7 ; copy d6 to d7 since the value will be modified
	and.w	#BUTTON_RIGHT,d7 ; test if the right button was pressed
	; this should never fail but I make a lot of mistakes so it's possible
	beq.s	ProcessStatusScreenTestAC ; right button is not pressed
	cmpi.w	#MAX_MENU_PAGE,(MEM_MENU_SELECTION) ; test if the menu selection is the last
	bne.s	.1	; three means the last nav item is selected
	; if MEM_MENU_SELECTION is three then roll it over to zero
	move.w	#MENU_PAGE_MAP,(MEM_MENU_SELECTION)
	bra.w	ProcessStatusScreenTestDPadExit ; done processing d-pad
.1 ; otherwise increment the selection
	; test if at the last item in the page
	move.w	(MEM_MENU_SCREEN_PAGE),d6 ; copy active page ID to d6
	mulu.w	#WORD_SIZE,d6	; multiply by LWORD_SIZE to get offset
	lea	MenuPageMaxNavItem,a6	; point a6 to the lookup table
	adda.l	d6,a6 ; move to offset
	move.w	(a6),d7	; copy max page to d7
	move.w	(MEM_MENU_SELECTION),d6
	cmp.w	d6,d7
	bgt.s	.2 ; branch if at the last item in the page
	move.w	#MAX_MENU_PAGE+$0001,(MEM_MENU_SELECTION)
	bra.w	ProcessStatusScreenTestDPadExit ; done processing d-pad
.2
	addq	#$01,(MEM_MENU_SELECTION)
	bra.w	ProcessStatusScreenTestDPadExit ; done processing d-pad
ProcessStatusScreenTestDPadExit:
	bsr.w	ProcessStatusScreenUpdateSelectorXY ; update the selector position
	bra.w	ExitProcessStatusScreen	; exit

;-------------------------------------------------------------------------------
; test if A or C was pressed
;-------------------------------------------------------------------------------
ProcessStatusScreenTestAC:
ProcessStatusScreenTestACButtonPressed:	; test if the player pressed A
	cmpi.w	#BUTTON_A,d6	; test if the A button was pressed
	beq.s	ProcessStatusScreenACButtonPressed	; A button is pressed
	cmpi.w	#BUTTON_C,d6	; test if the C button was pressed
	bne.w	ExitProcessStatusScreen	; C button is not pressed
ProcessStatusScreenACButtonPressed:
	move.w	(MEM_MENU_SELECTION),d6	; copy menu selection to d6
	; if menu selection = the current page then do nothing	
	cmp.w	(MEM_MENU_SCREEN_PAGE),d6
	beq.w	ExitProcessStatusScreen	
	; test if changing pages
	cmpi.w	#MENU_PAGE_MAP,(MEM_MENU_SELECTION)
	bne.s	.1
	move.w	d6,(MEM_MENU_SCREEN_PAGE)
	; test if fast travel is available
	move.l	(MEM_GAME_STATE),d7	; copy game state to d7
	btst.l	#STATE_FLAG_FAST_TRAVEL_AVAILABLE,d7 ; test fast travel flag
	beq.s	.NoFastTravel
	lea	SceneMenuMap,a6	; address of the scene for the map screen
	bra.s	.DrawMap
.NoFastTravel
	lea	SceneMenuMapNoTravel,a6	; address of the scene for the map screen
.DrawMap
	adda.l	#$2,a6	; skip scene id before branching to DrawScene
	bsr.w	DrawScene	; branch to subroutine to draw the scene
	bsr.w	BuildStatusScreen	; build the status screen
;	bsr.w	FadeIn	; fade in the status screen
	bra.w	ExitProcessStatusScreen	
.1
	cmpi.w	#MENU_PAGE_STATUS,(MEM_MENU_SELECTION)
	bne.s	.2
	move.w	d6,(MEM_MENU_SCREEN_PAGE)
	lea	SceneMenuStatus,a6	; address of the scene for the status screen
	adda.l	#$2,a6	; skip scene id before branching to DrawScene
	bsr.w	DrawScene	; branch to subroutine to draw the scene
	bsr.w	BuildStatusScreen	; build the status screen
;	bsr.w	FadeIn	; fade in the status screen
	bra.w	ExitProcessStatusScreen	
.2
	cmpi.w	#MENU_PAGE_DATA,(MEM_MENU_SELECTION)
	bne.s	.3
	move.w	d6,(MEM_MENU_SCREEN_PAGE)
	lea	SceneMenuData,a6	; address of the scene for the status screen
	adda.l	#$2,a6	; skip scene id before branching to DrawScene
	bsr.w	DrawScene	; branch to subroutine to draw the scene
	bsr.w	BuildStatusScreen	; build the status screen
;	bsr.w	FadeIn	; fade in the status screen
	bra.w	ExitProcessStatusScreen	
.3
	cmpi.w	#MENU_PAGE_HELP,(MEM_MENU_SELECTION)
	bne.s	.4
	move.w	d6,(MEM_MENU_SCREEN_PAGE)
	lea	SceneMenuHelp,a6	; address of the scene for the status screen
	adda.l	#$2,a6	; skip scene id before branching to DrawScene
	bsr.w	DrawScene	; branch to subroutine to draw the scene
	bsr.w	BuildStatusScreen	; build the status screen
;	bsr.w	FadeIn	; fade in the status screen
	bra.w	ExitProcessStatusScreen	
.4
	;---------------------------------------------------------------------------
	; otherwise button was pressed somewhere outside of the navigation
	;---------------------------------------------------------------------------
	cmpi.w	#MENU_PAGE_HELP,(MEM_MENU_SCREEN_PAGE)
	beq.w	ProcessStatusScreenHelp
	cmpi.w	#MENU_PAGE_DATA,(MEM_MENU_SCREEN_PAGE)
	beq.w	ProcessStatusScreenData
	cmpi.w	#MENU_PAGE_STATUS,(MEM_MENU_SCREEN_PAGE)
	beq.w	ProcessStatusScreenStatus
ProcessStatusScreenMap:
	move.w	#$2700,sr ; disable interrupts
	move.l	(MEM_GAME_STATE),d7 ; copy current game state to d7
	bclr.l	#STATE_FLAG_STATUS_SCREEN,d7 ; update game state
	move.l	d7,(MEM_GAME_STATE) ; save updated game state
	;---------------------------------------------------------------------------
	; lookup which scene to fast travel to
	;---------------------------------------------------------------------------
	clr.l	d7 ; just being paranoid and clearing high word before mulu
	move.w	(MEM_MENU_SELECTION),d7 ; copy scene id to d7
	sub.w	#MAX_MENU_PAGE+$0001,d7 ; adjust for navigation menu
	mulu.w	#WORD_SIZE,d7 ; multiply by 2 to get offset in scene id table
	lea	FastTravelSceneIDTable,a6	; point a6 to the scene definition table
	adda.l	d7,a6 ; add offset
	clr.l	d7 ; just being paranoid and clearing high word before mulu
	move.w	(a6),d7 ; copy scene id to d7
	;---------------------------------------------------------------------------
	; load the scene
	;---------------------------------------------------------------------------
	mulu.w	#LWORD_SIZE,d7 ; multiply by 4 to get offset in scene table
	lea	SceneDefinitionTable,a6	; point a6 to the scene definition table
	adda.l	d7,a6 ; add offset
	move.l	(a6),a6	; have a6 point to the value at a6
	move.w	#$2000,sr ; re-enable interrupts
	bsr.w	LoadScene ; branch to LoadScene subroutine
	;---------------------------------------------------------------------------
	; move sprite to the right location in the scene
	;---------------------------------------------------------------------------
	move.w	(MEM_MENU_SELECTION),d7 ; copy scene id to d7
	sub.w	#MAX_MENU_PAGE+$0001,d7 ; adjust for navigation menu
	mulu.w	#LWORD_SIZE,d7 ; multiply by 2 to get offset in FastTravelSpriteXY table
	lea	FastTravelSpriteXY,a6	; point a6 to the scene FastTravelSpriteXY table
	adda.l	d7,a6 ; add offset	
	move.w	(a6)+,(MEM_PLAYER_SPRITE_X)	; starting x location
	move.w	(a6),(MEM_PLAYER_SPRITE_Y)	; starting y location
	move.w	#SPRITE_PLAYER_PATTERN,(MEM_PLAYER_SPRITE_PATTERN_INDEX) ; pattern
	move.w	#DIRECTION_DOWN,(MEM_PLAYER_SPRITE_DIRECTION)	; direction
	move.w	#$0000,(MEM_PLAYER_SPRITE_FRAME)	; frame
	;---------------------------------------------------------------------------
	; fix sprites and fade in
	;---------------------------------------------------------------------------
	bsr.w	LoadPlayerSprite ; load the player sprite
	bsr.w	FixSprites ; move player sprite and reset sprite links
	bsr.w	FadeIn ; fade in to the new scene
	;---------------------------------------------------------------------------
	; force enter scene action
	;---------------------------------------------------------------------------
	move.l	(MEM_GAME_STATE),d7 ; copy game state to d7
	bset.l	#STATE_FLAG_ACTION,d7 ; set the action flag
	move.l	d7,(MEM_GAME_STATE) ; save it back
	move.w	#ACTION_ENTER_SCENE,(MEM_ACTION_ID) ; set the action id
	move.w	#$FFFF,(MEM_ACTION_TARGET_NPCID)
	bra.w	ExitProcessStatusScreen
ProcessStatusScreenStatus:
	move.w	#$2700,sr ; disable interrupts
	;---------------------------------------------------------------------------
	; clear old text
	;---------------------------------------------------------------------------
	move.l	#STATUS_SCREEN_INVENTORY_DESCRIPTION_VDP,d7
	move.l	#STATUS_SCREEN_INVENTORY_DESCRIPTION_VDP,(MEM_DIALOG_VDP)
	move.w	#STATUS_SCREEN_INVENTORY_DESCRIPTION_ROWS,d4
ClearItemDescriptionRowLoop:
	move.w	#STATUS_SCREEN_INVENTORY_DESCRIPTION_COLS,d5
ClearItemDescriptionColLoop:
	move.w	#FONT_BASE_TILE_LOW+%0110000000000000,d6 ; base tile
	move.l	(MEM_DIALOG_VDP),(VDP_CONTROL) ; set VDP address
	move.w  d6,(VDP_DATA) ; copy the character to VDP
	; draw the next character
	add.l	#$00020000,(MEM_DIALOG_VDP)	; move to the next column
	dbf	d5,ClearItemDescriptionColLoop
	add.l	#$00800000,d7	; move down one row
	move.l	d7,(MEM_DIALOG_VDP)	; set new VDP write
	dbf	d4,ClearItemDescriptionRowLoop
	;---------------------------------------------------------------------------
	; lookup the description
	;---------------------------------------------------------------------------
	clr	d7
	move.w	(MEM_MENU_SELECTION),d7 ; copy selected item to d7
	; lookup description of selected item
	subq.w	#MAX_MENU_PAGE+$0001,d7 ; subtract 4 to get item slot
	mulu.w	#WORD_SIZE,d7	; items are 1 word
	cmpi.w	#$0000,(MEM_PLAYER_SPRITE)
	beq.s	.1
	lea	MEM_PLAYER2_ITEMS,a6 ; point a6 to player items
	bra.s	.2
.1
	lea	MEM_PLAYER1_ITEMS,a6 ; point a6 to player items
.2
	adda.l	d7,a6	; move to offset
	move.w	(a6),d7	; copy item number to d6
	and.w	#$0FFF,d7	; clear out item mask
	mulu.w	#LWORD_SIZE,d7	; addresses are 1 lword
	lea	ItemDescriptionTableStart,a6	; point a6 to the lookup table
	adda.l	d7,a6	; move to offset
	move.l	(a6),a0	; point a0 to the first character
	move.l	#STATUS_SCREEN_INVENTORY_DESCRIPTION_VDP,d7
	move.l	#STATUS_SCREEN_INVENTORY_DESCRIPTION_VDP,(MEM_DIALOG_VDP)
	;---------------------------------------------------------------------------
	; draw the text
	;---------------------------------------------------------------------------
BuildItemDescriptionTextLoop:
	clr	d6	; lazy way to prevent various bugs
	move.b	(a0)+,d6	; copy current character to d6
	cmpi.b	#ETX,d6	; is this the end of the text?
	beq.s	ExitProcessStatusScreenStatus	; end of text, move on
	cmpi.b	#LF,d6	; is this a line feed character?
	bne.s	.1	; not a line feed character
	add.l	#$00800000,d7	; move down one row
	move.l	d7,(MEM_DIALOG_VDP)	; set new VDP write
	bra.w	BuildItemDescriptionTextLoop ; loop
.1
	; update d6 to point to the tile ID
	sub.w	#$20,d6	; subtract 32 to get the character index
	add.w	#FONT_BASE_TILE_LOW+%0110000000000000,d6	; add the base tile
	move.l	(MEM_DIALOG_VDP),(VDP_CONTROL)	; set VDP address
	move.w  d6,(VDP_DATA)	; copy the character to VDP
	; draw the next character
	add.l	#$00020000,(MEM_DIALOG_VDP)	; move to the next column
	bra.w	BuildItemDescriptionTextLoop ; loop until ETX
ExitProcessStatusScreenStatus:
	move.w	#$2000,sr ; re-enable interrupts
	bra.w	ExitProcessStatusScreen
ProcessStatusScreenData:
	move.w	(MEM_MENU_SELECTION),d7 ; copy selected item to d7
	; lookup description of selected item
	subq.w	#MAX_MENU_PAGE+$0001,d7 ; subtract 4 to account for navigation
	cmpi.w	#MENU_PAGE_HELP,d7	; test if this is in the navigation
	bgt.s	ProcessStatusScreenDataLoad	; <4 means load menu
ProcessStatusScreenDataSave:
	; d7 should have the right save slot here
	bsr.w	SaveGame	; save game
	;---------------------------------------------------------------------------
	; redraw the save/load title text
	;---------------------------------------------------------------------------
	move.l	#STATUS_SCREEN_SAVE0_VDP,d0
	bsr.w	DrawSaveTitles
	move.l	#STATUS_SCREEN_LOAD0_VDP,d0
	bsr.w	DrawSaveTitles
	bra.w	ExitProcessStatusScreen
ProcessStatusScreenDataLoad:
	subq.w	#MAX_MENU_PAGE+$0001,d7 ; subtract 4 to get load slot
	bsr.w	SaveGameLookup	; get save title into d6
	cmpi.w	#MAX_OBJECTIVE,d6 ; is this > MAX_OBJECTIVE?
	bgt.w	ExitProcessStatusScreen ; if so exit
	move.w	(MEM_MENU_SELECTION),d7 ; copy selected item to d7
	; lookup description of selected item
	subq.w	#$0008,d7 ; subtract 8 to get index
	bsr.w	LoadGame ;	load the game from SRAM
	bsr.w	ReloadCurrentScene ; reload current scene (needed to fix sprites)
	bra.w	MainGameLoop ;	return to start of game loop
	bra.w	ExitProcessStatusScreen
ProcessStatusScreenHelp:
	;---------------------------------------------------------------------------
	; nothing to do here yet
	;---------------------------------------------------------------------------
	bra.w	ExitProcessStatusScreen
ExitProcessStatusScreen:
	move.w	#$0000,(MEM_CONTROL_PRESSED)	; clear pressed buttons
	rts

ProcessStatusScreenUpdateSelectorXY:
	clr	d6	; done out of paranoia
	move.w	(MEM_MENU_SELECTION),d6	; copy menu selection to d6
	cmpi.w	#MAX_MENU_PAGE,d6	; test if this is in the navigation
	bgt.s	.1	; <4 means navigation
	lea	MenuNavigationTable,a6	; point a6 to the lookup table for the menu
	bra.s	ProcessStatusScreenUpdateSelectorXYUpdateVDP
.1 ; navigating the page-specific menus
	subq	#MAX_MENU_PAGE+$0001,d6
	; no menu to navigate on the help page
	;cmpi.w	#MENU_PAGE_HELP,(MEM_MENU_SCREEN_PAGE)
	;bne.s	.2
	;lea	MenuNavigationTable,a6	; point a6 to the lookup table for the menu
	;bra.s	ProcessStatusScreenUpdateSelectorXYUpdateVDP
;.2
	cmpi.w	#MENU_PAGE_DATA,(MEM_MENU_SCREEN_PAGE)
	bne.s	.3
	lea	DataNavigationTable,a6	; point a6 to the lookup table for the data menu
	bra.s	ProcessStatusScreenUpdateSelectorXYUpdateVDP
.3	
	cmpi.w	#MENU_PAGE_STATUS,(MEM_MENU_SCREEN_PAGE)
	bne.s	.4
	; TODO - UPDATE TO CORRECT TABLE
	lea	StatusNavigationTable,a6	; point a6 to the lookup table for the menu
	bra.s	ProcessStatusScreenUpdateSelectorXYUpdateVDP
.4
	; if we passed through everything then we must be on the map page
	lea	MapNavigationTable,a6	; point a6 to the lookup table for the menu
ProcessStatusScreenUpdateSelectorXYUpdateVDP:
	;---------------------------------------------------------------------------
	; move the selector to the right position in the navigation menu
	;---------------------------------------------------------------------------
	mulu.w	#LWORD_SIZE,d6	; multiply by LWORD_SIZE to get offset
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

