SceneCheckers:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_CHECKERS

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0010	; tileset count

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	FloorTile4ColorTilesStart
	dc.l	FloorTile4ColorTilesEnd

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
	dc.l	CounterTopTilesStart
	dc.l	CounterTopTilesEnd

	; tileset 6
	dc.l	CounterShelvesTilesStart
	dc.l	CounterShelvesTilesEnd

	; tileset 7
	dc.l	CheckersShelfHTilesStart
	dc.l	CheckersShelfHTilesEnd

	; tileset 8
	dc.l	CheckersShelfMTilesStart
	dc.l	CheckersShelfMTilesEnd

	; tileset 9
	dc.l	CheckersShelfLTilesStart
	dc.l	CheckersShelfLTilesEnd

	; tileset A
	dc.l	MannequinMale00TilesStart
	dc.l	MannequinMale00TilesEnd

	; tileset B
	dc.l	MannequinMale01TilesStart
	dc.l	MannequinMale01TilesEnd

	; tileset C
	dc.l	MannequinMale02TilesStart
	dc.l	MannequinMale02TilesEnd

	; tileset D
	dc.l	MannequinMale03TilesStart
	dc.l	MannequinMale03TilesEnd

	; tileset E
	dc.l	MannequinMale04TilesStart
	dc.l	MannequinMale04TilesEnd

	; tileset F
	dc.l	MannequinMale05TilesStart
	dc.l	MannequinMale05TilesEnd

	; tileset 10
	dc.l	MannequinStandWideTilesStart
	dc.l	MannequinStandWideTilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteCheckers00	; first palette
	dc.l	PaletteCheckers01	; second palette
	dc.l	PaletteCheckers02	; third palette
	dc.l	PalettePeople	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0018	; scenery count

	; floor
	dc.l	PatternTileFloorSimple
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001	; base pattern
	dc.w	$000D	; repeat 14 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location


	; top shelf
	dc.l	PatternShelvesH	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000110101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00800000	; initial drawing location

	; middle shelf
	dc.l	PatternShelvesH	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$01000000	; initial drawing location

	; low shelf
	dc.l	PatternShelvesH	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$01800000	; initial drawing location

	; north wall
	dc.l	PatternFrameTop
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; right wall
	dc.l	PatternFrameSideClosedRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00800000+$004E0000	; initial drawing location

	; left wall
	dc.l	PatternFrameSideClosedLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00800000	; initial drawing location

	; store front
	dc.l	PatternStoreFront
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0C000000	; initial drawing location

	; shelves under counter
	dc.l	Pattern3Tile112x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000110010	; base pattern
	dc.w	$0001	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$001A0000+$04800000	; initial drawing location

	; counter
	dc.l	PatternCounterHigh112x8Closed	; location of pattern
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000100111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001A0000+$03000000	; initial drawing location

	dc.l	PatternCounterLow112x24Closed	; location of pattern
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001A0000+$03800000	; initial drawing location

	; mannequin stands
	dc.l	PatternMannequinStandWide	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001101110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00080000+$07800000	; initial drawing location

	dc.l	PatternMannequinStandWide	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001101110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00380000+$07800000	; initial drawing location

	; left stand - left mannequin
	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000111110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$000A0000+$06800000	; initial drawing location

	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001000010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$000A0000+$07800000	; initial drawing location

	; left stand - center mannequin
	dc.l	Pattern16x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001000110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$000E0000+$07000000	; initial drawing location

	dc.l	Pattern16x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001001000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$000E0000+$07800000	; initial drawing location

	; left stand - right mannequin
	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000111110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00120000+$06800000	; initial drawing location

	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001000010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00120000+$07800000	; initial drawing location

	; right stand - left mannequin
	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001001110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$003A0000+$06800000	; initial drawing location

	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001010010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$003A0000+$07800000	; initial drawing location

	; right stand - center mannequin
	dc.l	Pattern16x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001010110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$003E0000+$07000000	; initial drawing location

	dc.l	Pattern16x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$003E0000+$07800000	; initial drawing location

	; right stand - right mannequin
	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001011110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00420000+$06800000	; initial drawing location

	dc.l	Pattern16x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001100010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00420000+$07800000	; initial drawing location

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
	dc.w	OBJ_SCENE_MANNEQUIN
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0010000010100100
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000011101000

	dc.w	OBJ_SCENE_MANNEQUIN
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0010000010111000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000011110000

	dc.w	OBJ_SCENE_MANNEQUIN
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0010000011001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000011101000

	dc.w	OBJ_SCENE_MANNEQUIN
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000111101101000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000011101000

	dc.w	OBJ_SCENE_MANNEQUIN
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0010110101110000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000011110000

	dc.w	OBJ_SCENE_MANNEQUIN
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0010000110001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000011101000

	dc.w	OBJ_SCENE_CHECKERS_CLOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1100100010001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000010001000

	dc.w	OBJ_SCENE_CHECKERS_CLOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1100100011101100
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000010001000

	dc.w	OBJ_SCENE_CHECKERS_CLOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1111111110000110
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000010001000

	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.l	CheckersCollisionStart

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_EWHALL	; south exit
	dc.w	$FFFF	; north exit
	dc.w	$FFFF	; west exit
	dc.w	$FFFF	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0003	; four npc slots

	dc.w	$012A	; starting x location of npc0
	dc.w	$0098	; starting y location of npc0
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
