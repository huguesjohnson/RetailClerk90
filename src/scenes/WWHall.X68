; generated by build tools

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_WWHALL

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0008 ; tileset count - 1

	; tileset 0 - tiles start at [0] - tileset length [1]
	dc.l	TransparentTileTilesStart
	dc.l	TransparentTileTilesEnd

	; tileset 1 - tiles start at [1] - tileset length [4]
	dc.l	FloorVBTilesStart
	dc.l	FloorVBTilesEnd

	; tileset 2 - tiles start at [5] - tileset length [4]
	dc.l	FloorTBooksTilesStart
	dc.l	FloorTBooksTilesEnd

	; tileset 3 - tiles start at [9] - tileset length [4]
	dc.l	FloorWestHallTilesStart
	dc.l	FloorWestHallTilesEnd

	; tileset 4 - tiles start at [D] - tileset length [4]
	dc.l	FloorHallTrimTilesStart
	dc.l	FloorHallTrimTilesEnd

	; tileset 5 - tiles start at [11] - tileset length [4D]
	dc.l	FrameTilesStart
	dc.l	FrameTilesEnd

	; tileset 6 - tiles start at [5E] - tileset length [6]
	dc.l	TrashCan16x24TilesStart
	dc.l	TrashCan16x24TilesEnd

	; tileset 7 - tiles start at [64] - tileset length [8]
	dc.l	Bench32x16TilesStart
	dc.l	Bench32x16TilesEnd

	; tileset 8 - tiles start at [6C] - tileset length [C]
	dc.l	VBSign48x16TilesStart
	dc.l	VBSign48x16TilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteVB00
	dc.l	PaletteTBooks00
	dc.l	PaletteWWHall
	dc.l	PalettePeople

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000E ; scenery count - 1

	; north floor
	dc.l	Pattern16x16x304
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001 ; vdp pattern
	dc.w	$0001 ; repeat=1
	dc.l	VDP_VRAM_WRITE_B+$00020000+$00800000 ; initial drawing location

	; south floor
	dc.l	Pattern16x16x304
	;		%pccvhnnnnnnnnnnn
	dc.w	%0010000000000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_B+$00020000+$0D000000 ; initial drawing location

	; main floor
	dc.l	Pattern16x16x304
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000000001001 ; vdp pattern
	dc.w	$0008 ; repeat=8
	dc.l	VDP_VRAM_WRITE_B+$00020000+$03800000 ; initial drawing location

	; main floor - north trim
	dc.l	Pattern16x16x304
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000000001101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_B+$00020000+$02800000 ; initial drawing location

	; main floor - south trim
	dc.l	Pattern16x16x304
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000000001101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_B+$00020000+$0C800000 ; initial drawing location

	; south wall
	dc.l	PatternFrameNorthOpen
	;		%pccvhnnnnnnnnnnn
	dc.w	%0010000000010001 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00020000+$0D000000 ; initial drawing location

	; north wall
	dc.l	PatternFrameNorthEntrance
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010001 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00020000+$00800000 ; initial drawing location

	; sign above video buffet
	dc.l	Pattern48x16
	;		%pccvhnnnnnnnnnnn
	dc.w	%1000000001101100 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00220000+$00800000 ; initial drawing location

	; trash can - west
	dc.l	Pattern16x24
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011110 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00100000+$06800000 ; initial drawing location

	; trash can - east
	dc.l	Pattern16x24
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011110 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$003C0000+$06800000 ; initial drawing location

	; bench segment
	dc.l	Pattern32x16
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000001100100 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00140000+$07000000 ; initial drawing location

	; bench segment
	dc.l	Pattern32x16
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000001100100 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$001C0000+$07000000 ; initial drawing location

	; bench segment
	dc.l	Pattern32x16
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000001100100 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00240000+$07000000 ; initial drawing location

	; bench segment
	dc.l	Pattern32x16
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000001100100 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$002C0000+$07000000 ; initial drawing location

	; bench segment
	dc.l	Pattern32x16
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000001100100 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00340000+$07000000 ; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$FFFF ; no text

	;---------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1 ; object count

	;---------------------------------------------------------------------------
	; word0=Object ID (0-65535)
	; word1[0-8]=x0 (0-511)
	; word1[9-15]=width (0-127)
	; word2[0-8]=y0 (0-512)
	; word2[9-15]=height (0-127)
	;---------------------------------------------------------------------------

	dc.w	OBJ_SCENE_TRASHCAN
	;		%wwwwwwwxxxxxxxxx
	dc.w	%0010000010111110
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011101000

	dc.w	OBJ_SCENE_TRASHCAN
	;		%wwwwwwwxxxxxxxxx
	dc.w	%0010000101110010
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011101000

	dc.w	OBJ_SCENE_BENCH
	;		%wwwwwwwxxxxxxxxx
	dc.w	%1010000011010000
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0010000011110000

	dc.w	OBJ_SCENE_BENCH
	;		%wwwwwwwxxxxxxxxx
	dc.w	%1010000100100000
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0010000011110000

	dc.w	OBJ_NOTHING
	;		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	dc.w	OBJ_NOTHING
	;		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	dc.w	OBJ_NOTHING
	;		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	dc.w	OBJ_NOTHING
	;		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	dc.w	OBJ_NOTHING
	;		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	dc.w	OBJ_NOTHING
	;		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.l	WWHallCollisionStart ; location of collision data

	;---------------------------------------------------------------------------
	; exits: 0=south,1=north,2=west,3=east
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_TBOOKS
	dc.w	SCENE_ID_VB
	dc.w	SCENE_ID_FCBCHECKOUT
	dc.w	SCENE_ID_WEHALL

	;---------------------------------------------------------------------------
	; npc locations
	;---------------------------------------------------------------------------
	dc.w	$0003 ; npc count - 1

	dc.w	$00F6 ; starting x location of npc0
	dc.w	$00C4 ; starting y location of npc0
	dc.w	DIRECTION_DOWN ; starting direction of npc0
	dc.w	$FFFF ; movement frequency of npc0
	dc.l	NullMovementStart ; location of movement pattern for npc0
	dc.w	(NullMovementEnd-NullMovementStart-1) ; movement pattern length

	dc.w	$0000 ; starting x location of npc1
	dc.w	$0000 ; starting y location of npc1
	dc.w	DIRECTION_DOWN ; starting direction of npc1
	dc.w	$FFFF ; movement frequency of npc1
	dc.l	NullMovementStart ; location of movement pattern for npc1
	dc.w	(NullMovementEnd-NullMovementStart-1) ; movement pattern length

	dc.w	$0000 ; starting x location of npc2
	dc.w	$0000 ; starting y location of npc2
	dc.w	DIRECTION_DOWN ; starting direction of npc2
	dc.w	$FFFF ; movement frequency of npc2
	dc.l	NullMovementStart ; location of movement pattern for npc2
	dc.w	(NullMovementEnd-NullMovementStart-1) ; movement pattern length

	dc.w	$0000 ; starting x location of npc3
	dc.w	$0000 ; starting y location of npc3
	dc.w	DIRECTION_DOWN ; starting direction of npc3
	dc.w	$FFFF ; movement frequency of npc3
	dc.l	NullMovementStart ; location of movement pattern for npc3
	dc.w	(NullMovementEnd-NullMovementStart-1) ; movement pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_Mall ; location of background music
