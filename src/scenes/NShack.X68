SceneNShack:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_NSHACK

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0008	; tileset count

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	FloorTile2ColorTilesStart
	dc.l	FloorTile2ColorTilesEnd

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
	dc.l	NShackBarrelHighTilesStart
	dc.l	NShackBarrelHighTilesEnd

	; tileset 6
	dc.l	NShackBarrelLowTilesStart
	dc.l	NShackBarrelLowTilesEnd

	; tileset 7
	dc.l	NShackCaseHighTilesStart
	dc.l	NShackCaseHighTilesEnd

	; tileset 8
	dc.l	NShackCaseLowTilesStart
	dc.l	NShackCaseLowTilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteNShack00	; first palette
	dc.l	PaletteNShack01	; second palette
	dc.l	PaletteNShack02	; third palette
	dc.l	PalettePeople	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0014	; scenery count

	; floor
	dc.l	PatternTileFloorSimple
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001	; base pattern
	dc.w	$000D	; repeat 14 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; left entrance - top
	dc.l	PatternFrameSideLeftOpenTop
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000	; initial drawing location

	; left entrance - bottom
	dc.l	PatternFrameSideLeftOpenBottom
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09000000	; initial drawing location

	; right wall
	dc.l	PatternFrameSideClosedRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$004E0000	; initial drawing location

	; north wall 
	dc.l	PatternFrameTop
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; south wall 
	dc.l	PatternFrameBottom
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; shelves under counter
	dc.l	Pattern3Tile80x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000100010	; base pattern
	dc.w	$0001	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$001E0000+$04000000	; initial drawing location

	; counter
	dc.l	PatternCounterHigh80x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000010111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001E0000+$02800000	; initial drawing location

	dc.l	PatternCounterLow80x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000010111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001E0000+$03800000	; initial drawing location

	; barrels
	dc.l	Pattern32x8
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000100101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00320000+$07000000	; initial drawing location

	dc.l	Pattern32x24
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000101001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00320000+$07800000	; initial drawing location

	dc.l	Pattern32x8
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000100101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00400000+$07000000	; initial drawing location

	dc.l	Pattern32x24
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000101001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00400000+$07800000	; initial drawing location

	dc.l	Pattern32x8
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000100101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00160000+$07000000	; initial drawing location

	dc.l	Pattern32x24
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000101001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00160000+$07800000	; initial drawing location

	dc.l	Pattern32x8
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000100101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00080000+$07000000	; initial drawing location

	dc.l	Pattern32x24
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000101001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00080000+$07800000	; initial drawing location

	; display cases
	dc.l	PatternNShackCaseHigh
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000110101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00020000+$02000000	; initial drawing location

	dc.l	PatternNShackCaseLow
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000111110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00020000+$02800000	; initial drawing location

	dc.l	PatternNShackCaseHigh
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000110101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00320000+$02000000	; initial drawing location

	dc.l	PatternNShackCaseLow
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000111110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00320000+$02800000	; initial drawing location

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
	dc.w	OBJ_SCENE_NSHACK_CASE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1110000010001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100100010100100

	dc.w	OBJ_SCENE_NSHACK_CASE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1110000101001010
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100100010100100

	dc.w	OBJ_SCENE_NSHACK_BARREL
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011000010100000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011110000

	dc.w	OBJ_SCENE_NSHACK_BARREL
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011000011011000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011110000

	dc.w	OBJ_SCENE_NSHACK_BARREL
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011000101001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011110000

	dc.w	OBJ_SCENE_NSHACK_BARREL
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011000110000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011110000

	dc.w	OBJ_NPC_JEN
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011000100010100
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100100010100100

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
	dc.l	NShackCollisionStart

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; south exit
	dc.w	SCENE_ID_BASEMENTWDORM	; north exit
	dc.w	SCENE_ID_SHALL	; west exit
	dc.w	$FFFF	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0003	; four npc slots

	dc.w	$0118	; starting x location of npc0
	dc.w	$0098	; starting y location of npc0
	dc.w	DIRECTION_DOWN	; starting direction of npc0
	dc.w	$0000	; movement frequency of npc0
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
