SceneEWHall:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_EWHALL

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0009	; tileset count

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	FloorWoodDiagTilesStart
	dc.l	FloorWoodDiagTilesEnd

	; tileset 2
	dc.l	FloorWoodHorTilesStart
	dc.l	FloorWoodHorTilesEnd

	; tileset 3
	dc.l	FrameRectTilesStart
	dc.l	FrameRectTilesEnd

	; tileset 4
	dc.l	GlassTilesStart
	dc.l	GlassTilesEnd

	; tileset 5 - for entryway
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 6
	dc.l	FloorTile4ColorTilesStart
	dc.l	FloorTile4ColorTilesEnd

	; tileset 7
	dc.l	FloorWoodVertTilesStart
	dc.l	FloorWoodVertTilesEnd

	; tileset 8
	dc.l	EWHallTreeHighTilesStart
	dc.l	EWHallTreeHighTilesEnd

	; tileset 9
	dc.l	EWHallTreeLowTilesStart
	dc.l	EWHallTreeLowTilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteCheckers00	; first palette
	dc.l	PaletteDenimCountry00	; second palette
	dc.l	PaletteEWHall	; third palette
	dc.l	PalettePeople	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000C	; scenery count

	; main floor
	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000000001	; base pattern
	dc.w	$0004	; repeat 5 times
	dc.l	VDP_VRAM_WRITE_B+$03000000	; initial drawing location

	; south floor
	dc.l	PatternWoodFloorV	; location of first pattern to load
	;       %pccvhnnnnnnnnnnn
	dc.w	%0010000000111111
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$0D800000	; initial drawing location

	; north floor
	dc.l	PatternTileFloorSimple	; location of first pattern to load
	;       %pccvhnnnnnnnnnnn
	dc.w	%0000000000111101
	dc.w	$0001	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; top border
	dc.l	PatternWoodFloorH	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$02000000	; initial drawing location

	; bottom border
	dc.l	PatternWoodFloorH	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$0C800000	; initial drawing location

	; south wall - left side
	dc.l	PatternFrameBottomOpenLeftExterior
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000011001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; south wall - right side
	dc.l	PatternFrameBottomOpenRightExterior
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000011001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000+$00360000	; initial drawing location

	; north frame - high
	dc.l	PatternStoreFrontExteriorHigh	; location of first pattern to load
	;       %pccvhnnnnnnnnnnn
	dc.w	%1000000000011001
	dc.w	$0000	; no repeat times
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; north frame - low
	dc.l	PatternStoreFrontExteriorLow	; location of first pattern to load
	;       %pccvhnnnnnnnnnnn
	dc.w	%0000000000011001
	dc.w	$0000	; no repeat times
	dc.l	VDP_VRAM_WRITE_A+$00800000	; initial drawing location

	; trees
	dc.l	Pattern32x40	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001000111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05000000+$00100000	; initial drawing location

	dc.l	Pattern32x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07800000+$00100000	; initial drawing location

	dc.l	Pattern32x40	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001000111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05000000+$00380000	; initial drawing location

	dc.l	Pattern32x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07800000+$00380000	; initial drawing location

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
	dc.w	OBJ_SCENE_EWHALL_TREE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100000011000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011110100

	dc.w	OBJ_SCENE_EWHALL_TREE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100000101100000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011110100

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
	dc.l	EWHallCollisionStart

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_DENIMCOUNTRY	; south exit
	dc.w	SCENE_ID_CHECKERS	; north exit
	dc.w	SCENE_ID_CENTER	; west exit
	dc.w	SCENE_ID_EEHALL	; east exit

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

