SceneWEHall:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_WEHALL

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0011	; tileset count

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	FloorTileDiamondTilesStart
	dc.l	FloorTileDiamondTilesEnd

	; tileset 2
	dc.l	FloorTileDiamondAccentTilesStart
	dc.l	FloorTileDiamondAccentTilesEnd

	; tileset 3
	dc.l	FloorTileDiamondBrokenTilesStart
	dc.l	FloorTileDiamondBrokenTilesEnd

	; tileset 4
	dc.l	FloorTileSquareTilesStart
	dc.l	FloorTileSquareTilesEnd

	; tileset 5
	dc.l	FloorTileSquareBrokenTilesStart
	dc.l	FloorTileSquareBrokenTilesEnd

	; tileset 6
	dc.l	FrameRectTilesStart
	dc.l	FrameRectTilesEnd

	; tileset 7
	dc.l	GlassTilesStart
	dc.l	GlassTilesEnd

	; tileset 8 - for entryway
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 9
	dc.l	FloorTileBasicTilesStart
	dc.l	FloorTileBasicTilesEnd

	; tileset A
	dc.l	FloorCarpetTilesStart
	dc.l	FloorCarpetTilesEnd

	; tileset B
	dc.l	CPlanetSignTilesStart
	dc.l	CPlanetSignTilesEnd

	; tileset C
	dc.l	CPlanetPoster00TilesStart
	dc.l	CPlanetPoster00TilesEnd

	; tileset D
	dc.l	CPlanetPoster01TilesStart
	dc.l	CPlanetPoster01TilesEnd

	; tileset E
	dc.l	CPlanetPoster02TilesStart
	dc.l	CPlanetPoster02TilesEnd

	; tileset F
	dc.l	CPlanetPoster03TilesStart
	dc.l	CPlanetPoster03TilesEnd

	; tileset 10
	dc.l	BenchTilesStart
	dc.l	BenchTilesEnd

	; tileset 11
	dc.l	FloorCarpet70sTilesStart
	dc.l	FloorCarpet70sTilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteCPlanet00	; first palette
	dc.l	PaletteCNow00	; second palette
	dc.l	PaletteWEHall	; third palette
	dc.l	PalettePeople	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0016	; scenery count

	; main floor
	dc.l	PatternHallFloor	; location of first pattern to load
	;       %pccvhnnnnnnnnnnn
	dc.w	%0100000000000001
	dc.w	$0001	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_B+$03000000	; initial drawing location

	; carpet
	dc.l	PatternTackyFloor	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001100110	; base pattern
	dc.w	$0001	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$05000000+$000C0000	; initial drawing location

	; south floor
	dc.l	PatternFloor	; location of first pattern to load
	;       %pccvhnnnnnnnnnnn
	dc.w	%0010000000101110
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$0D800000	; initial drawing location

	; north floor
	dc.l	PatternTileFloor	; location of first pattern to load
	;       %pccvhnnnnnnnnnnn
	dc.w	%0000000000101010
	dc.w	$0001	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; top border
	dc.l	PatternHallFloorBorder	; location of pattern to load
	;       %pccvhnnnnnnnnnnn
	dc.w	%0100000000000100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$02000000	; initial drawing location

	; bottom border
	dc.l	PatternHallFloorBorder	; location of pattern to load
	;       %pccvhnnnnnnnnnnn
	dc.w	%0100000000000100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$0C800000	; initial drawing location

	; south wall - left side
	dc.l	PatternFrameBottomOpenLeftExterior
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000000110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; south wall - right side
	dc.l	PatternFrameBottomOpenRightExterior
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000000110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000+$00360000	; initial drawing location

	; north frame - high
	dc.l	PatternStoreFrontExteriorHigh	; location of first pattern to load
	;       %pccvhnnnnnnnnnnn
	dc.w	%1000000000000110
	dc.w	$0000	; no repeat times
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; north frame - low
	dc.l	PatternStoreFrontExteriorLow	; location of first pattern to load
	;       %pccvhnnnnnnnnnnn
	dc.w	%0000000000000110
	dc.w	$0000	; no repeat times
	dc.l	VDP_VRAM_WRITE_A+$00800000	; initial drawing location

	; store front - sign
	dc.l	PatternCPlanetSign	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000110010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001A0000	; initial drawing location

	dc.l	Pattern16x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001000110	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$00040000+$00800000	; initial drawing location

	dc.l	Pattern16x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001001100	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$00120000+$00800000	; initial drawing location

	dc.l	Pattern16x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001010010	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$003a0000+$00800000	; initial drawing location

	dc.l	Pattern16x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001011000	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$00460000+$00800000	; initial drawing location

	dc.l	Pattern32x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011110	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$04800000+$00100000	; initial drawing location

	dc.l	Pattern32x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011110	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$04800000+$01E0000	; initial drawing location

	dc.l	Pattern32x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011110	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$04800000+$002C0000	; initial drawing location

	dc.l	Pattern32x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011110	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$04800000+$003A0000	; initial drawing location

	dc.l	Pattern32x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011110	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$08000000+$00100000	; initial drawing location

	dc.l	Pattern32x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011110	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$08000000+$01E0000	; initial drawing location

	dc.l	Pattern32x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011110	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$08000000+$002C0000	; initial drawing location

	dc.l	Pattern32x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011110	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$08000000+$003A0000	; initial drawing location


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
	dc.w	%0100000011000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000011001000

	dc.w	OBJ_SCENE_BENCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100000011111000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000011001000

	dc.w	OBJ_SCENE_BENCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100000100110000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000011001000

	dc.w	OBJ_SCENE_BENCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100000101101000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000011001000

	dc.w	OBJ_SCENE_BENCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100000011000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000100000000

	dc.w	OBJ_SCENE_BENCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100000011111000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000100000000

	dc.w	OBJ_SCENE_BENCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100000100110000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000100000000

	dc.w	OBJ_SCENE_BENCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100000101101000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000100000000

	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.l	WEHallCollisionStart

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_CNOW	; south exit
	dc.w	SCENE_ID_CPLANET	; north exit
	dc.w	SCENE_ID_WWHALL	; west exit
	dc.w	SCENE_ID_CENTER	; east exit

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
