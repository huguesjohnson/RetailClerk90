SceneCavern:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_CAVERN

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$000B	; tileset count

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	FloorCarpetBlacklightTilesStart
	dc.l	FloorCarpetBlacklightTilesEnd

	; tileset 2
	dc.l	FrameRectTilesStart
	dc.l	FrameRectTilesEnd

	; tileset 3
	dc.l	GlassTilesStart
	dc.l	GlassTilesEnd

	; tileset 4 - for entryway
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 5
	dc.l	CavernSignTilesStart
	dc.l	CavernSignTilesEnd

	; tileset 6
	dc.l	CavernArcadeBase00TilesStart
	dc.l	CavernArcadeBase00TilesEnd

	; tileset 7
	dc.l	CavernArcadeBase01TilesStart
	dc.l	CavernArcadeBase01TilesEnd

	; tileset 8
	dc.l	CavernArcadeBase02TilesStart
	dc.l	CavernArcadeBase02TilesEnd

	; tileset 9
	dc.l	CavernArcadeTop00TilesStart
	dc.l	CavernArcadeTop00TilesEnd

	; tileset A
	dc.l	CavernArcadeTop01TilesStart
	dc.l	CavernArcadeTop01TilesEnd

	; tileset B
	dc.l	CavernArcadeTop02TilesStart
	dc.l	CavernArcadeTop02TilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteCavern00	; first palette
	dc.l	PaletteCavern01	; second palette
	dc.l	PaletteCavern02	; third palette
	dc.l	PalettePeople	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$003B	; scenery count

	; floor
	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001	; base pattern
	dc.w	$0006	; repeat 7 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; north wall
	dc.l	PatternFrameTop
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; right wall
	dc.l	PatternFrameSideClosedRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00800000+$004E0000	; initial drawing location

	; left wall
	dc.l	PatternFrameSideClosedLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00800000	; initial drawing location

	; store front
	dc.l	PatternStoreFront
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0C000000	; initial drawing location

	; sign
	dc.l	PatternCavernSign	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000110101
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0C000000+$001A0000	; initial drawing location

	; arcade cabinets

	; 24x24 bases

	; pattern 0 - palette 0

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001010001
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0A000000+$00020000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001010001
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0A000000+$00080000	; initial drawing location

	; pattern 0 - palette 1

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001010001
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$003C0000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001010001
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$00420000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001010001
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$00480000	; initial drawing location

	; pattern 0 - palette 2

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001010001
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$00160000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001010001
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$001C0000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001010001
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$00220000	; initial drawing location

	; pattern 1 - palette 0

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001011010
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$06000000+$00360000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001011010
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$06000000+$003C0000	; initial drawing location

	; pattern 1 - palette 1

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001011010
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$00020000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001011010
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$00080000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001011010
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$000E0000	; initial drawing location

	; pattern 1 - palette 2

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011010
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$06000000+$000E0000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011010
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$06000000+$00140000	; initial drawing location

	; pattern 2 - palette 0

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001100011
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$00280000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001100011
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$002E0000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001100011
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$00340000	; initial drawing location

	; pattern 2 - palette 1

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001100011
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$06000000+$00220000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001100011
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$06000000+$00280000	; initial drawing location

	; pattern 2 - palette 2

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001100011
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0A000000+$00420000	; initial drawing location

	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001100011
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0A000000+$00480000	; initial drawing location

	; arcade cabinets - top

	; pattern 0 - palette 0 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000001101100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$08800000+$00020000	; initial drawing location

	; pattern 0 - palette 0 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000001110010
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09800000+$00020000	; initial drawing location

	; pattern 0 - palette 0 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000001101100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$08800000+$00080000	; initial drawing location

	; pattern 0 - palette 0 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001110010
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09800000+$00080000	; initial drawing location

	; pattern 0 - palette 1 - low
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001101100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$003C0000	; initial drawing location

	; pattern 0 - palette 1 - low
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001101100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00420000	; initial drawing location

	; pattern 0 - palette 1 - low
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001101100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00480000	; initial drawing location

	; pattern 0 - palette 2 - low
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001101100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00160000	; initial drawing location

	; pattern 0 - palette 2 - low
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001101100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$001C0000	; initial drawing location

	; pattern 0 - palette 2 - low
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001101100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00220000	; initial drawing location

	; pattern 1 - palette 0 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000001110101
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04800000+$00360000	; initial drawing location

	; pattern 1 - palette 0 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001111011
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05800000+$00360000	; initial drawing location

	; pattern 1 - palette 0 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000001110101
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04800000+$003C0000	; initial drawing location

	; pattern 1 - palette 0 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001111011
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05800000+$003C0000	; initial drawing location

	; pattern 1 - palette 1 - low
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001110101
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00020000	; initial drawing location

	; pattern 1 - palette 1 - low
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001110101
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00080000	; initial drawing location

	; pattern 1 - palette 1 - low
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001110101
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$000E0000	; initial drawing location

	; pattern 1 - palette 2 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001110101
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04800000+$000E0000	; initial drawing location

	; pattern 1 - palette 2 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001111011
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05800000+$000E0000	; initial drawing location

	; pattern 1 - palette 2 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001110101
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04800000+$00140000	; initial drawing location

	; pattern 1 - palette 2 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001111011
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05800000+$00140000	; initial drawing location

	; pattern 2 - palette 0 - low
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001111110
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00280000	; initial drawing location

	; pattern 2 - palette 0 - low
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001111110
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$002E0000	; initial drawing location

	; pattern 2 - palette 0 - low
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001111110
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00340000	; initial drawing location

	; pattern 2 - palette 1 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001111110
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04800000+$00220000	; initial drawing location

	; pattern 2 - palette 1 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000010000100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05800000+$00220000	; initial drawing location

	; pattern 2 - palette 1 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001111110
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04800000+$00280000	; initial drawing location

	; pattern 2 - palette 1 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000010000100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05800000+$00280000	; initial drawing location

	; pattern 2 - palette 2 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001111110
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$08800000+$00420000	; initial drawing location

	; pattern 2 - palette 2 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000010000100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09800000+$00420000	; initial drawing location

	; pattern 2 - palette 2 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001111110
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$08800000+$00480000	; initial drawing location

	; pattern 2 - palette 2 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000010000100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09800000+$00480000	; initial drawing location


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
	dc.w	OBJ_SCENE_CAVERN_ARCADE0
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0110000010000111
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000100001000

	dc.w	OBJ_SCENE_CAVERN_ARCADE1
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0110000110001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000100001000

	dc.w	OBJ_SCENE_CAVERN_ARCADE2
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0110000010110111
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000011001000

	dc.w	OBJ_SCENE_CAVERN_ARCADE3
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0110000100000111
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000011001000

	dc.w	OBJ_SCENE_CAVERN_ARCADE4
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0110000101010111
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000011001000

	dc.w	OBJ_SCENE_CAVERN_ARCADE5
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1001000010001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000010001000

	dc.w	OBJ_SCENE_CAVERN_ARCADE6
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1001000011011000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000010001000

	dc.w	OBJ_SCENE_CAVERN_ARCADE7
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1001000100100000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000010001000

	dc.w	OBJ_SCENE_CAVERN_ARCADE8
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1001000101110000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000010001000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.l	CavernCollisionStart

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_EEHALL	; south exit
	dc.w	$FFFF	; north exit
	dc.w	$FFFF	; west exit
	dc.w	$FFFF	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0003	; four npc slots

	dc.w	$00CC	; starting x location of npc0
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
