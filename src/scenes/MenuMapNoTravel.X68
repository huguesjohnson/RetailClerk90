;-------------------------------------------------------------------------------
; this is not a full scene definition
; it only contains the parts needed to draw the map screen
;-------------------------------------------------------------------------------
SceneMenuMapNoTravel:

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0004	; four tilesets

	; tileset 0
	dc.l	TransparentTileStart	; start of tiles
	dc.l	TransparentTileEnd	; end of tiles

	; tileset 1
	dc.l	MenuNavTilesStart	; start of tiles
	dc.l	MenuNavTilesEnd	; end of tiles

	; tileset 2
	dc.l	MenuNavSelectedTilesStart	; start of tiles
	dc.l	MenuNavSelectedTilesEnd	; end of tiles

	; tileset 3
	dc.l	MenuMapIconsTilesStart	; start of tiles
	dc.l	MenuMapIconsTilesEnd	; end of tiles

	; tileset 4
	dc.l	MenuMapTilesStart	; start of tiles
	dc.l	MenuMapTilesEnd	; end of tiles

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
	dc.w	$0007	; scenery count

	; navigation
	dc.l	PatternMenuNavSelected	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0110000000001001	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$00000000+$00000000	; initial drawing location

	dc.l	PatternMenuNav	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000000001	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$00000000+$00140000	; initial drawing location

	dc.l	PatternMenuNav	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000000001	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$00000000+$00280000	; initial drawing location

	dc.l	PatternMenuNav	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000000001	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$00000000+$003C0000	; initial drawing location

	; map icons

	dc.l	Pattern8x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000001111	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$00020000+$09800000	; initial drawing location

	dc.l	Pattern8x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010000	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$00020000+$0A000000	; initial drawing location

	dc.l	Pattern8x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010001	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$00020000+$0A800000	; initial drawing location

	; map
	dc.l	PatternMenuMap	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010010	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$00000000+$01800000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$0007	; text count

	; map
	dc.l	MenuScreenNavMap	; location of string to display
	dc.w	DIALOG_BASE_TILE_LOW+%0110000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_B+$00800000+$00060000	; initial drawing location

	; status
	dc.l	MenuScreenNavStatus	; location of string to display
	dc.w	DIALOG_BASE_TILE_LOW+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_B+$00800000+$00180000	; initial drawing location

	; data
	dc.l	MenuScreenNavData	; location of string to display
	dc.w	DIALOG_BASE_TILE_LOW+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_B+$00800000+$002C0000	; initial drawing location

	; help
	dc.l	MenuScreenNavHelp	; location of string to display
	dc.w	DIALOG_BASE_TILE_LOW+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_B+$00800000+$00400000	; initial drawing location

	; mall legend

	dc.l	StatusScreenMapLegend	; location of string to display
	dc.w	DIALOG_BASE_TILE_LOW+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_B+$00020000+$09000000	; initial drawing location

	dc.l	StatusScreenMapYouAreHere	; location of string to display
	dc.w	DIALOG_BASE_TILE_LOW+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_B+$00040000+$09800000	; initial drawing location

	dc.l	StatusScreenMapOptionalEvent	; location of string to display
	dc.w	DIALOG_BASE_TILE_LOW+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_B+$00040000+$0A000000	; initial drawing location

	dc.l	StatusScreenMapStoryEvent	; location of string to display
	dc.w	DIALOG_BASE_TILE_LOW+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_B+$00040000+$0A800000	; initial drawing location




