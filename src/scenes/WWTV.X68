SceneWWTV:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_WWTV

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0005	; tileset count

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	FloorTileSmallTilesStart
	dc.l	FloorTileSmallTilesEnd

	; tileset 2
	dc.l	FrameRectTilesStart
	dc.l	FrameRectTilesEnd

	; tileset 3
	dc.l	TVLargeHighTilesStart
	dc.l	TVLargeHighTilesEnd

	; tileset 4
	dc.l	TVLargeLowTilesStart
	dc.l	TVLargeLowTilesEnd

	; tileset 5
	dc.l	WWTVWallTilesStart
	dc.l	WWTVWallTilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteWWFloorWall	; first palette
	dc.l	PaletteWWTV00	; second palette
	dc.l	PaletteWWTV01	; third palette
	dc.l	PalettePeople	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000A	; scenery count

	; floor
	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001	; base pattern
	dc.w	$0006	; repeat 7 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; shelves
	dc.l	PatternShelves24x64
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000110111	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A+$00800000	; initial drawing location

	; north wall
	dc.l	PatternFrameTopLong	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000010001	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; large tvs
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000100101	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A+$000E0000+$04000000	; initial drawing location

	dc.l	Pattern24x32	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101011	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A+$000E0000+$05000000	; initial drawing location

	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000100101	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A+$001E0000+$04000000	; initial drawing location

	dc.l	Pattern24x32	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101011	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A+$001E0000+$05000000	; initial drawing location

	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000100101	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A+$002C0000+$04000000	; initial drawing location

	dc.l	Pattern24x32	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101011	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A+$002C0000+$05000000	; initial drawing location

	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000100101	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A+$003C0000+$04000000	; initial drawing location

	dc.l	Pattern24x32	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101011	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A+$003C0000+$05000000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; text count

;	dc.l	LegalScreenLine00	; location of string to display
;	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
;	dc.l	VDP_VRAM_WRITE_A+$03800000	; initial drawing location

	;---------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

	;---------------------------------------------------------------------------
	; word0=Object ID (0-65535)
	; word1[0-8]=x0 (0-511)
	; word1[9-15]=width (0-127)
	; word2[0-8]=y0 (0-512)
	; word2[9-15]=height (0-127)
	;---------------------------------------------------------------------------
	dc.w	OBJ_SCENE_WWTV_LARGETV
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011001010110110
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011010000

	dc.w	OBJ_SCENE_WWTV_LARGETV
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011001011110110
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011010000

	dc.w	OBJ_SCENE_WWTV_LARGETV
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011001100101110
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011010000

	dc.w	OBJ_SCENE_WWTV_LARGETV
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011001101101110
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011010000

	dc.w	OBJ_SCENE_WWTV_TVWALL
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1100100010001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000010001000

	dc.w	OBJ_SCENE_WWTV_TVWALL
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1100100011101100
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000010001000

	dc.w	OBJ_SCENE_WWTV_TVWALL
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1111111110000110
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000010001000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.l	WWTVCollisionStart

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_WWCHECKOUT	; south exit
	dc.w	$FFFF	; north exit
	dc.w	SCENE_ID_WWAUDIO	; west exit
	dc.w	SCENE_ID_WWAPPLIANCES	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0003	; four npc slots

	dc.w	$00F0	; starting x location of npc0
	dc.w	$00F0	; starting y location of npc0
	dc.w	DIRECTION_DOWN	; starting direction of npc0
	dc.w	$FFFF	; movement frequency of npc0
	dc.l	NullMovementStart	; location of movement pattern for npc0
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	dc.w	$0000	; starting x location of npc1
	dc.w	$0000	; starting y location of npc1
	dc.w	DIRECTION_DOWN	; starting direction of npc1
	dc.w	$FFFF	; movement frequency of npc1
	dc.l	NullMovementStart	; location of movement pattern for npc1
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	dc.w	$0000	; starting x location of npc3
	dc.w	$0000	; starting y location of npc3
	dc.w	DIRECTION_DOWN	; starting direction of npc3
	dc.w	$FFFF	; movement frequency of npc3
	dc.l	NullMovementStart	; location of movement pattern for npc3
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	dc.w	$0000	; starting x location of npc4
	dc.w	$0000	; starting y location of npc4
	dc.w	DIRECTION_DOWN	; starting direction of npc4
	dc.w	$FFFF	; movement frequency of npc4
	dc.l	NullMovementStart	; location of movement pattern for npc4
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_Mall	; location of background music
