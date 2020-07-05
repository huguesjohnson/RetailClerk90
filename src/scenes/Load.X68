SceneLoad:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_LOAD

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0001	; two tilesets

	; tileset 0
	dc.l	TransparentTileStart	; start of scene tiles
	dc.l	TransparentTileEnd	; end of scene tiles

	; tileset 1
	dc.l	TitleLogoTilesStart	; start of logo tiles
	dc.l	TitleLogoTilesEnd	; end of logo tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteBlack	; first palette
	dc.l	PaletteText01	; third palette
	dc.l	PaletteText00	; third palette
	dc.l	PaletteTitle03	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0001	; scenery count

	; title - 90
	dc.l	Pattern192x16	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0110000000000001	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00100000	; initial drawing location

	; frame around load menu
	dc.l	PatternStatusSave	; location of pattern to load
	; pccvhnnnnnnnnnnn
	; 0000000000000000	
	dc.w	DIALOG_BASE_TILE_LOW+%1100000000000000	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$04000000+$00100000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$0002	; text count

	; caption for save
	dc.l	LoadScreenCaption	; location of string to display
	dc.w	DIALOG_BASE_TILE_LOW+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_B+$04800000+$00120000	; initial drawing location

	; help text

	dc.l	LoadScreenHelp0	; location of string to display
	dc.w	DIALOG_BASE_TILE_LOW+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_B+$08000000+$00100000	; initial drawing location

	dc.l	LoadScreenHelp1	; location of string to display
	dc.w	DIALOG_BASE_TILE_LOW+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_B+$09000000+$00100000	; initial drawing location

	;---------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.l	$00000000	; no collision data
	
	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	$0000	; north exit
	dc.w	$0000	; south exit
	dc.w	$0000	; east exit
	dc.w	$0000	; west exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0000	; one npc slot, which is just a placeholder

	dc.w	$0000	; starting x location of npc
	dc.w	$0000	; starting y location of npc
	dc.w	DIRECTION_LEFT	; starting direction of npc
	dc.w	$FFFF	; movement frequency of npc
	dc.l	NullMovementStart	; location of movement pattern for npc
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_Title	; location of background music

