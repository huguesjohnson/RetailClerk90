SceneEEHall:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_EEHALL

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$000A	; tileset count

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
	dc.l	FloorCarpetBlacklightTilesStart
	dc.l	FloorCarpetBlacklightTilesEnd

	; tileset 7
	dc.l	FloorTileBasicTilesStart
	dc.l	FloorTileBasicTilesEnd

	; tileset 8
	dc.l	CavernSignTilesStart
	dc.l	CavernSignTilesEnd

	; tileset 9
	dc.l	EEHallPlantHighTilesStart
	dc.l	EEHallPlantHighTilesEnd

	; tileset A
	dc.l	EEHallPlantLowTilesStart
	dc.l	EEHallPlantLowTilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteCavern00	; first palette
	dc.l	PaletteTLodge00	; second palette
	dc.l	PaletteEEHall	; third palette
	dc.l	PalettePeople	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000B	; scenery count

	; main floor
	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000000001	; base pattern
	dc.w	$0004	; repeat 5 times
	dc.l	VDP_VRAM_WRITE_B+$03000000	; initial drawing location

	; south floor
	dc.l	PatternTileFloor	; location of first pattern to load
	;       %pccvhnnnnnnnnnnn
	dc.w	%0010000001001101
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$0D800000	; initial drawing location

	; north floor
	dc.l	Pattern32x32Tile	; location of first pattern to load
	;       %pccvhnnnnnnnnnnn
	dc.w	%0000000000111101
	dc.w	$0000	; no repeat
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

	; sign
	dc.l	PatternCavernSign	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000001010001
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001A0000	; initial drawing location

	; plant
	dc.l	PatternEEHallPlantLow	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001110101		; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07000000+$000C0000	; initial drawing location

	dc.l	PatternEEHallPlantHigh	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001101101		; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$06000000+$000C0000	; initial drawing location

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
	dc.w	OBJ_SCENE_BENCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1110010010110000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000100000000

	dc.w	OBJ_SCENE_BENCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1110010100100010
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000100000000

	dc.w	OBJ_SCENE_PLANT
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1110010010110000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000011100000

	dc.w	OBJ_SCENE_PLANT
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1110010100100010
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000011100000

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
	dc.l	EEHallCollisionStart

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_TLODGE	; south exit
	dc.w	SCENE_ID_CAVERN	; north exit
	dc.w	SCENE_ID_EWHALL	; west exit
	dc.w	SCENE_ID_SVIDEO	; east exit

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
