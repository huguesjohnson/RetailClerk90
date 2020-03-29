SceneDenimCountry:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_DENIMCOUNTRY

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0006	; tileset count

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	FloorWoodVertTilesStart
	dc.l	FloorWoodVertTilesEnd

	; tileset 2
	dc.l	FrameRectTilesStart
	dc.l	FrameRectTilesEnd

	; tileset 3
	dc.l	CounterTopTilesStart
	dc.l	CounterTopTilesEnd

	; tileset 4
	dc.l	CounterShelvesTilesStart
	dc.l	CounterShelvesTilesEnd

	; tileset 5
	dc.l	DenimCountryTableHighTilesStart
	dc.l	DenimCountryTableHighTilesEnd

	; tileset 6
	dc.l	DenimCountryTableLowTilesStart
	dc.l	DenimCountryTableLowTilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteDenimCountry00	; first palette
	dc.l	PaletteDenimCountry01	; second palette
	dc.l	PaletteDenimCountry02	; third palette
	dc.l	PalettePeople	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0011	; scenery count

	; background
	dc.l	PatternWoodFloorV
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001	; base pattern
	dc.w	$000D	; repeat 14 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; left entrance - top
	dc.l	PatternFrameSideLeftOpenTop
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000001001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000	; initial drawing location

	; left entrance - bottom
	dc.l	PatternFrameSideLeftOpenBottom
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000001001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09000000	; initial drawing location

	; right side
	dc.l	PatternFrameSideClosedRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000001001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$004E0000	; initial drawing location

	; south wall
	dc.l	PatternFrameBottom
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000001001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; north wall - left side
	dc.l	PatternFrameTopOpenLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000001001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; north wall - right side
	dc.l	PatternFrameTopOpenRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000001001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00360000	; initial drawing location

	; shelves under counter
	dc.l	Pattern3Tile72x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00080000+$04000000	; initial drawing location

	dc.l	Pattern3Tile72x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00080000+$04800000	; initial drawing location

	; counter side
	dc.l	PatternCounterSide24x64OpenLowerLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000011101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00140000+$00800000	; initial drawing location

	; counter high
	dc.l	PatternCounterHigh48x8OpenLowerRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000011101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00080000+$02800000	; initial drawing location

	; counter low
	dc.l	PatternCounterLow48x24OpenTopRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000011101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00080000+$03000000	; initial drawing location

	; tables
	dc.l	PatternDenimCountryTableHigh
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000101011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00360000+$02800000	; initial drawing location

	dc.l	PatternDenimCountryTableLow
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000110100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00360000+$03000000	; initial drawing location

	dc.l	PatternDenimCountryTableHigh
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000101011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00360000+$06800000	; initial drawing location

	dc.l	PatternDenimCountryTableLow
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000110100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00360000+$07000000	; initial drawing location

	dc.l	PatternDenimCountryTableHigh
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000101011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00080000+$06800000	; initial drawing location

	dc.l	PatternDenimCountryTableLow
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000110100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00080000+$07000000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; text count

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
	dc.w	OBJ_SCENE_DC_MERCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1000111010100000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000011101000

	dc.w	OBJ_SCENE_DC_MERCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1000111101011000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000010101000

	dc.w	OBJ_SCENE_DC_MERCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1000111101011000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000011101000

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
	dc.l	DenimCountryCollisionStart

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; south exit
	dc.w	SCENE_ID_EWHALL	; north exit
	dc.w	SCENE_ID_SOUTH_CENTER	; west exit
	dc.w	$FFFF	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0003	; four npc slots

	dc.w	$00C0	; starting x location of npc0
	dc.w	$0090	; starting y location of npc0
	dc.w	DIRECTION_DOWN	; starting direction of npc0
	dc.w	$FFFF	; movement frequency of npc0
	dc.l	NullMovementStart	; location of movement pattern for npc0
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	dc.w	$0100	; starting x location of npc1
	dc.w	$0100	; starting y location of npc1
	dc.w	DIRECTION_DOWN	; starting direction of npc1
	dc.w	$FFFF	; movement frequency of npc1
	dc.l	NullMovementStart	; location of movement pattern for npc1
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	dc.w	$0120	; starting x location of npc3
	dc.w	$0100	; starting y location of npc3
	dc.w	DIRECTION_DOWN	; starting direction of npc3
	dc.w	$FFFF	; movement frequency of npc3
	dc.l	NullMovementStart	; location of movement pattern for npc3
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	dc.w	$0140	; starting x location of npc4
	dc.w	$0100	; starting y location of npc4
	dc.w	DIRECTION_DOWN	; starting direction of npc4
	dc.w	$FFFF	; movement frequency of npc4
	dc.l	NullMovementStart	; location of movement pattern for npc4
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_Mall	; location of background music

