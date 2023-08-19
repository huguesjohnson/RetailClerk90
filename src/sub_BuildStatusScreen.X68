BuildStatusScreen:
	;---------------------------------------------------------------------------
	; load sprite zero
	;---------------------------------------------------------------------------
	bsr.w	LoadSpriteZeroTiles	; load the tiles
	move.w	#$2700,sr		; disable interrupts
	; reload the sprite definition
	lea     SpriteZeroLowDefinition,a0	; store address of sprite definition
	moveq	#$01,d0	; 1 sprite = 2 longs
	move.l	#VDP_VRAM_WRITE_SPRITE,(VDP_CONTROL) ; set write location
.Loop:
	move.l  (a0)+,(VDP_DATA)
	dbra    d0,.Loop
	;---------------------------------------------------------------------------
	; determine which screen to draw
	;---------------------------------------------------------------------------
	cmpi.w	#MENU_PAGE_HELP,(MEM_MENU_SCREEN_PAGE)
	beq.w	BuildStatusScreenHelp
	cmpi.w	#MENU_PAGE_DATA,(MEM_MENU_SCREEN_PAGE)
	beq.w	BuildStatusScreenData
	cmpi.w	#MENU_PAGE_STATUS,(MEM_MENU_SCREEN_PAGE)
	beq.w	BuildStatusScreenStatus
;---------------------------------------------------------------------------
; build the map screen
;---------------------------------------------------------------------------
BuildStatusScreenMap:
	move.w	#MENU_PAGE_MAP,(MEM_MENU_SCREEN_PAGE) ; in case I did something dumb
	move.w	#$0000,(MEM_MENU_SELECTION)	; first menu item is selected 
	;---------------------------------------------------------------------------
	; determine spot for "you are here" icon
	;---------------------------------------------------------------------------
	clr	d6	; done out of paranoia
	move.w	(MEM_ACTIVE_SCENE_ID),d6	; copy active scene ID to d6
	cmpi.w	#MAX_STORE_ID,d6	; check against my own stupidity
	bgt.w	ExitBuildStatusScreen ; exit if I did something really bad
	mulu.w	#LWORD_SIZE,d6	; multiply by LWORD_SIZE to get offset
	lea	MenuMapIconLocationTable,a6	; point a6 to the lookup table
	adda.l	d6,a6	; move to offset
	move.l	(a6),(VDP_CONTROL) ; set drawing location
	move.w  #STATUS_SCREEN_MAP_ICON_BASE_PATTERN,(VDP_DATA)	; copy pattern
	;---------------------------------------------------------------------------
	; event icons
	;---------------------------------------------------------------------------
	move.w	(MEM_STORY_EVENT1_SCENE_ID),d5 ; copy event scene id to d5
	move.w	#STATUS_SCREEN_MAP_ICON_STORY_EVENT_BASE_PATTERN,d4 ; icon to draw
	bsr.w	DrawEventIcon
	move.w	(MEM_STORY_EVENT2_SCENE_ID),d5 ; copy event scene id to d5
	bsr.w	DrawEventIcon
	move.w	(MEM_OPTIONAL_EVENT1_SCENE_ID),d5 ; copy event scene id to d5
	move.w	#STATUS_SCREEN_MAP_ICON_OPTIONAL_EVENT_PATTERN,d4 ; icon to draw
	bsr.w	DrawEventIcon
	move.w	(MEM_OPTIONAL_EVENT2_SCENE_ID),d5 ; copy event scene id to d5
	bsr.w	DrawEventIcon
	move.w	(MEM_OPTIONAL_EVENT3_SCENE_ID),d5 ; copy event scene id to d5
	bsr.w	DrawEventIcon
	bra.w	ExitBuildStatusScreen
DrawEventIcon:
	clr	d7 ; done out of paranoia
	move.w	d5,d7 ; copy event scene id to d7
	cmpi.w	#$FFFF,d7 ; is there a story event?
	beq.s	ExitDrawEventIcon
	cmpi.w	#MAX_STORE_ID,d7 ; check against my own stupidity
	bgt.s	ExitDrawEventIcon ; exit if I did something really bad
	mulu.w	#LWORD_SIZE,d7 ; multiply by LWORD_SIZE to get offset
	lea	MenuMapEventIconLocationTable,a6	; point a6 to the lookup table
	adda.l	d7,a6 ; move to offset
	move.l	(a6),d7 ; copy value at a6 to d7
	cmp.w	d5,d6 ; current scene id = event scene id?
	bne.s	.1 ; if not then business as usual
	; otherwise the icon needs to be moved to the right
	add.l	#$00020000,d7 ; move icon to the right
.1
	move.l	d7,(VDP_CONTROL) ; set drawing location
	move.w  d4,(VDP_DATA)	; copy pattern
ExitDrawEventIcon:
	rts
;---------------------------------------------------------------------------
; build the status screen
;---------------------------------------------------------------------------
BuildStatusScreenStatus:
	move.w	#MENU_PAGE_STATUS,(MEM_MENU_SELECTION) ; second menu item selected
	;---------------------------------------------------------------------------
	; draw the objective text
	;---------------------------------------------------------------------------
BuildStatusScreenObjectiveText:
	clr	d6	; done out of paranoia
	move.w	(MEM_OBJECTIVE),d6	; copy objective to d6
	cmpi.w	#MAX_OBJECTIVE,d6	; check against my own stupidity
	bgt.s	BuildStatusScreenInventory
	mulu.w	#LWORD_SIZE,d6	; multiply by LWORD_SIZE to get offset
	lea	StatusScreenObjectivesTableStart,a5	; point a5 to the lookup table
	adda.l	d6,a5	; move to offset
	move.l	(a5),a0	; point a0 to the first character
	move.l	#STATUS_SCREEN_OBJECTIVE_VDP,d7	; d7 is used in the loop for LF
	move.l	#STATUS_SCREEN_OBJECTIVE_VDP,(MEM_DIALOG_VDP)
BuildStatusScreenObjectiveTextLoop:
	clr	d6	; lazy way to prevent various bugs
	move.b	(a0)+,d6	; copy current character to d6
	cmpi.b	#ETX,d6	; is this the end of the text?
	beq.s	BuildStatusScreenInventory	; end of text, move on
	cmpi.b	#LF,d6	; is this a line feed character?
	bne.s	.1	; not a line feed character
	add.l	#$01000000,d7	; move down two rows
	move.l	d7,(MEM_DIALOG_VDP)	; set new VDP write
	bra.w	BuildStatusScreenObjectiveTextLoop
.1
	; update d6 to point to the tile ID
	sub.w	#$20,d6	; subtract 32 to get the character index
	; first line uses a different palette
	cmpi.l	#STATUS_SCREEN_OBJECTIVE_VDP,d7 ; first line?
	bne.s	.2 ; if not, palette 3
	; otherwise palette 2
	add.w	#FONT_BASE_TILE_LOW+%0100000000000000,d6	; add the base tile
	bra.s	.3
.2
	add.w	#FONT_BASE_TILE_LOW+%0110000000000000,d6	; add the base tile
.3
	move.l	(MEM_DIALOG_VDP),(VDP_CONTROL)	; set VDP address
	move.w  d6,(VDP_DATA)	; copy the character to VDP
	; draw the next character
	add.l	#$00020000,(MEM_DIALOG_VDP)	; move to the next column
	bra.w	BuildStatusScreenObjectiveTextLoop ; loop until ETX
BuildStatusScreenInventory:
	move.w	#MAX_ITEMS,d7	; use d7 to loop through items
	subq.w	#$1,d7	; loop counter needs to be one less than item count
BuildStatusScreenInventoryLoop:
	; next 3 operations are to determine the row for the text 
	move.w	#$0080,d6
	mulu.w	d7,d6
	swap d6
	add.l	#STATUS_SCREEN_INVENTORY_VDP,d6	; add base address
	move.l	d6,(MEM_DIALOG_VDP)	; save VDP write location
	; get the name of the next item
	clr	d6	; lazy way to prevent various bugs
	move.w	d7,d6
	mulu.w	#WORD_SIZE,d6
	; determine which set of inventory to show	
	cmpi.w	#PLAYER_SPRITE_ERYN,(MEM_PLAYER_SPRITE)
	beq.s	.1
	lea	MEM_PLAYER2_ITEMS,a6	; point a6 to player items
	bra.s	.2
.1
	lea	MEM_PLAYER1_ITEMS,a6	; point a6 to player items
.2
	adda.l	d6,a6	; move to offset
	move.w	(a6),d6	; copy item number to d6
	and.w	#$0FFF,d6	; clear out item mask
	mulu.w	#LWORD_SIZE,d6	; addresses are 1 lword
	lea	ItemNameTableStart,a6	; point a6 to the lookup table
	adda.l	d6,a6	; move to offset
	move.l	(a6),a0	; point a0 to the start of the next item name
	; menu character for next item
	clr	d6	; lazy way to prevent various bugs
	move.w	#FONT_BASE_TILE_LOW+%0110000001011011,d6
	move.l	(MEM_DIALOG_VDP),(VDP_CONTROL)	; set VDP address
	add.l	#$00020000,(MEM_DIALOG_VDP)	; move to the next column
	move.w  d6,(VDP_DATA)	; copy the character to VDP
BuildStatusScreenInventoryLoopNextChar:
	clr	d6	; lazy way to prevent various bugs
	move.b	(a0)+,d6	; copy the next character to d6
	cmpi.b	#ITEMNAMEEND,d6	; test if this is the end of the item name
	beq.s	BuildStatusScreenInventoryLoopDec	; branch if end of name
	sub.w	#$20,d6	; subtract 32 to get the character index
	add.w	#FONT_BASE_TILE_LOW+%0110000000000000,d6	; add base tile
	move.l	(MEM_DIALOG_VDP),(VDP_CONTROL)	; set VDP address
	move.w  d6,(VDP_DATA)	; copy the character to VDP
	add.l	#$00020000,(MEM_DIALOG_VDP)	; move to the next column
	bra.s	BuildStatusScreenInventoryLoopNextChar
BuildStatusScreenInventoryLoopDec:
	dbra	d7,BuildStatusScreenInventoryLoop	; decrement and branch
	bra.s	ExitBuildStatusScreen	; exit
;---------------------------------------------------------------------------
; build the data screen
;---------------------------------------------------------------------------
BuildStatusScreenData:
	move.w	#MENU_PAGE_DATA,(MEM_MENU_SELECTION) ; third menu item selected 
	;---------------------------------------------------------------------------
	; draw the save/load title text
	;---------------------------------------------------------------------------
	move.l	#STATUS_SCREEN_SAVE0_VDP,d0
	bsr.w	DrawSaveTitles
	move.l	#STATUS_SCREEN_LOAD0_VDP,d0
	bsr.w	DrawSaveTitles
	bra.w	ExitBuildStatusScreen
;---------------------------------------------------------------------------
; build the help screen
;---------------------------------------------------------------------------
BuildStatusScreenHelp:
	move.w	#MENU_PAGE_HELP,(MEM_MENU_SELECTION) ; fourth menu item selected
	bra.w	ExitBuildStatusScreen
ExitBuildStatusScreen:
	; move the selector to the right position
	clr	d6	; done out of paranoia
	move.w	(MEM_MENU_SCREEN_PAGE),d6	; copy active scene ID to d6
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
	; now exit
	move.w	#$2000,sr	; re-enable interrupts
	rts
