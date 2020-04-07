SceneCPlanet:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_CPLANET

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$000D	; tileset count

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	FloorTileBasicTilesStart
	dc.l	FloorTileBasicTilesEnd

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
	dc.l	CPlanetSignTilesStart
	dc.l	CPlanetSignTilesEnd

	; tileset 6
	dc.l	CPlanetPoster00TilesStart
	dc.l	CPlanetPoster00TilesEnd

	; tileset 7
	dc.l	CPlanetPoster01TilesStart
	dc.l	CPlanetPoster01TilesEnd

	; tileset 8
	dc.l	CPlanetPoster02TilesStart
	dc.l	CPlanetPoster02TilesEnd

	; tileset 9
	dc.l	CPlanetPoster03TilesStart
	dc.l	CPlanetPoster03TilesEnd

	; tileset A
	dc.l	CounterTopTilesStart
	dc.l	CounterTopTilesEnd

	; tileset B
	dc.l	CPlanetTapesTilesStart
	dc.l	CPlanetTapesTilesEnd

	; tileset C
	dc.l	CPlanetCDsLowTilesStart
	dc.l	CPlanetCDsLowTilesEnd

	; tileset D
	dc.l	CPlanetCDsHighTilesStart
	dc.l	CPlanetCDsHighTilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteCPlanet00	; first palette
	dc.l	PaletteCPlanet01	; second palette
	dc.l	PaletteCPlanet02	; third palette
	dc.l	PalettePeople	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0011	; scenery count


	; background
	dc.l	PatternTileFloor
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001	; base pattern
	dc.w	$000D	; repeat 14 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; top shelf
	dc.l	PatternShelvesH	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001100000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00800000	; initial drawing location

	; middle shelf
	dc.l	PatternShelvesM	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001100000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$01000000+$00020000	; initial drawing location

	; low shelf
	dc.l	PatternShelvesL	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001100000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$01800000	; initial drawing location

	; north wall
	dc.l	PatternFrameTop
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; right wall
	dc.l	PatternFrameSideClosedRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00800000+$004E0000	; initial drawing location

	; left wall
	dc.l	PatternFrameSideClosedLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00800000	; initial drawing location

	; store front
	dc.l	PatternStoreFront
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0C000000	; initial drawing location

	; store front - sign
	dc.l	PatternCPlanetSign	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000101001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001A0000+$0C000000	; initial drawing location

	dc.l	Pattern16x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000111101	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$00040000+$0C800000	; initial drawing location

	dc.l	Pattern16x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000001000011	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$00120000+$0C800000	; initial drawing location

	dc.l	Pattern16x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000001001001	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$003a0000+$0C800000	; initial drawing location

	dc.l	Pattern16x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000001001111	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$00460000+$0C800000	; initial drawing location

	; counter
	dc.l	PatternCounterLow24x136	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001010101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$03800000+$00420000	; initial drawing location

	; cd racks
	dc.l	PatternCPlanetCDsLow	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001100011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$08000000+$00080000	; initial drawing location

	dc.l	PatternCPlanetCDsHigh	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001110111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07800000+$00080000	; initial drawing location

	dc.l	PatternCPlanetCDsLow	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001100011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$04000000+$00080000	; initial drawing location

	dc.l	PatternCPlanetCDsHigh	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001110111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$03800000+$00080000	; initial drawing location

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
	dc.w	OBJ_SCENE_CPLANET_TAPES
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1111111010001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000010001000

	dc.w	OBJ_SCENE_CPLANET_TAPES
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1111111100000111
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000010001000

	dc.w	OBJ_SCENE_CPLANET_TAPES
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1111111110000110
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000010001000

	dc.w	OBJ_SCENE_CPLANET_CDS
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1101001010100000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000010111000

	dc.w	OBJ_SCENE_CPLANET_CDS
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1101001100001001
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000010111000

	dc.w	OBJ_SCENE_CPLANET_CDS
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1101001010100000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000011111000

	dc.w	OBJ_SCENE_CPLANET_CDS
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1101001100001001
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000011111000

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
	dc.l	CPlanetCollisionStart

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_WEHALL	; south exit
	dc.w	$FFFF	; north exit
	dc.w	$FFFF	; west exit
	dc.w	$FFFF	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0003	; four npc slots

	dc.w	$01A0	; starting x location of npc0
	dc.w	$0112	; starting y location of npc0
	dc.w	DIRECTION_LEFT	; starting direction of npc0
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
