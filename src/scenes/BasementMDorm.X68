SceneBasementMDorm:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_BASEMENTMDORM

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0007	; tileset count

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	FloorPavementTilesStart
	dc.l	FloorPavementTilesEnd

	; tileset 2
	dc.l	FrameRectTilesStart
	dc.l	FrameRectTilesEnd

	; tileset 3
	dc.l	BasementFloorLightTilesStart
	dc.l	BasementFloorLightTilesEnd

	; tileset 4
	dc.l	BasementBedTilesStart
	dc.l	BasementBedTilesEnd

	; tileset 5
	dc.l	BasementLadderTilesStart
	dc.l	BasementLadderTilesEnd

	; tileset 6
	dc.l	BasementCrate16x16TilesStart
	dc.l	BasementCrate16x16TilesEnd

	; tileset 7
	dc.l	BasementCrate32x32TilesStart
	dc.l	BasementCrate32x32TilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteBasementFloor	; first palette
	dc.l	PaletteBasementWall	; second palette
	dc.l	PaletteBasementMDorm	; third palette
	dc.l	PalettePeople	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0016	; scenery count

	; floor
	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001	; base pattern
	dc.w	$0006	; repeat 7 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; left entrance - top
	dc.l	PatternFrameSideLeftOpenTop
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000	; initial drawing location

	; left entrance - bottom
	dc.l	PatternFrameSideLeftOpenBottom
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09000000	; initial drawing location

	; right wall
	dc.l	PatternFrameSideClosedRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$004E0000	; initial drawing location

	; north wall
	dc.l	PatternFrameTop
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; south wall
	dc.l	PatternFrameBottom
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; lighting
	dc.l	Pattern48x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00160000+$02000000	; initial drawing location

	dc.l	Pattern48x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$002E0000+$02000000	; initial drawing location

	dc.l	Pattern48x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00160000+$06000000	; initial drawing location

	dc.l	Pattern48x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$002E0000+$06000000	; initial drawing location

	dc.l	Pattern48x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00160000+$0A000000	; initial drawing location

	dc.l	Pattern48x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$002E0000+$0A000000	; initial drawing location

	; stairs
	dc.l	PatternBasementLadder
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001011001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00480000+$00800000	; initial drawing location

	; crates
	dc.l	Pattern32x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001110011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001E0000+$00800000	; initial drawing location

	dc.l	Pattern32x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001110011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00280000+$00800000	; initial drawing location

	dc.l	Pattern16x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001101111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00440000+$00800000	; initial drawing location

	dc.l	Pattern16x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001101111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00440000+$01800000	; initial drawing location

	dc.l	Pattern16x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001101111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00440000+$02800000	; initial drawing location

	dc.l	Pattern16x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001101111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00440000+$03800000	; initial drawing location

	; beds
	dc.l	PatternBasementBed
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000111101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$003C0000+$00800000	; initial drawing location

	dc.l	PatternBasementBed
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000111101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00020000+$00800000	; initial drawing location

	dc.l	PatternBasementBed
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000111101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00100000+$00800000	; initial drawing location

	dc.l	PatternBasementBed
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000111101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00020000+$0A000000	; initial drawing location

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
	dc.w	OBJ_SCENE_BASEMENT_BED
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100111000000000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0110000000001000+%0000000010000000

	dc.w	OBJ_SCENE_BASEMENT_BED
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100111000110000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0110000000001000+%0000000010000000

	dc.w	OBJ_SCENE_BASEMENT_BED
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100111011110000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0110000000001000+%0000000010000000

	dc.w	OBJ_SCENE_BASEMENT_LADDER
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0010111100100000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0110010000001000+%0000000010000000

	dc.w	OBJ_SCENE_BASEMENT_CRATE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0111111001110110+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000000001000+%0000000010000000

	dc.w	OBJ_SCENE_BASEMENT_CRATE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011111100001110+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%1000000000001000+%0000000010000000

	dc.w	OBJ_SCENE_BASEMENT_BED
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100111000000000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0110000010100000+%0000000010000000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000+%0000000010000000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000+%0000000010000000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000+%0000000010000000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.l	BasementMDormCollisionStart

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; south exit
	dc.w	$FFFF	; north exit
	dc.w	SCENE_ID_BASEMENTCAFE	; west exit
	dc.w	$FFFF	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0003	; four npc slots

	dc.w	$0000	; starting x location of npc0
	dc.w	$0000	; starting y location of npc0
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

