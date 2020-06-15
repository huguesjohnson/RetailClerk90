;-------------------------------------------------------------------------------
; this is not a full scene definition
; it only contains the parts needed to draw the data screen
;-------------------------------------------------------------------------------
SceneMenuData:

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0002	; three tilesets

	; tileset 0
	dc.l	TransparentTileStart	; start of tiles
	dc.l	TransparentTileEnd	; end of tiles

	; tileset 1
	dc.l	MenuNavTilesStart	; start of tiles
	dc.l	MenuNavTilesEnd	; end of tiles

	; tileset 2
	dc.l	MenuNavSelectedTilesStart	; start of tiles
	dc.l	MenuNavSelectedTilesEnd	; end of tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteMenu00	; first palette
	dc.l	PaletteMenu01	; third palette
	dc.l	PaletteMenu02	; third palette
	dc.l	PaletteMenu03	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0005	; scenery count

	; navigation
	dc.l	PatternMenuNav	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000000001	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$00000000+$00000000	; initial drawing location

	dc.l	PatternMenuNav	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000000001	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$00000000+$00140000	; initial drawing location

	dc.l	PatternMenuNavSelected	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0110000000001001	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$00000000+$00280000	; initial drawing location

	dc.l	PatternMenuNav	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000000001	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$00000000+$003C0000	; initial drawing location

	; frame for save
	dc.l	PatternStatusSave	; location of pattern to load
	dc.w	DIALOG_BASE_TILE_LOW+%0010000000000000	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$02800000+$00100000	; initial drawing location

	; frame for load
	dc.l	PatternStatusSave	; location of pattern to load
	dc.w	DIALOG_BASE_TILE_LOW+%0010000000000000	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$07800000+$00100000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$0005	; text count

	; map
	dc.l	MenuScreenNavMap	; location of string to display
	dc.w	DIALOG_BASE_TILE_LOW+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_B+$00800000+$00060000	; initial drawing location

	; status
	dc.l	MenuScreenNavStatus	; location of string to display
	dc.w	DIALOG_BASE_TILE_LOW+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_B+$00800000+$00180000	; initial drawing location

	; data
	dc.l	MenuScreenNavData	; location of string to display
	dc.w	DIALOG_BASE_TILE_LOW+%0110000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_B+$00800000+$002C0000	; initial drawing location

	; help
	dc.l	MenuScreenNavHelp	; location of string to display
	dc.w	DIALOG_BASE_TILE_LOW+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_B+$00800000+$00400000	; initial drawing location

	; save
	dc.l	StatusScreenSave	; location of string to display
	dc.w	DIALOG_BASE_TILE_LOW+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_B+$03000000+$00120000	; initial drawing location

	; load
	dc.l	StatusScreenLoad	; location of string to display
	dc.w	DIALOG_BASE_TILE_LOW+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_B+$08000000+$00120000	; initial drawing location

