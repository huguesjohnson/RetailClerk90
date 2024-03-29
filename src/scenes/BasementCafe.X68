; generated by build tools

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_BASEMENTCAFE

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0006 ; tileset count - 1

	; tileset 0 - tiles start at [0] - tileset length [1]
	dc.l	TransparentTileTilesStart
	dc.l	TransparentTileTilesEnd

	; tileset 1 - tiles start at [1] - tileset length [4]
	dc.l	FloorBasementTilesStart
	dc.l	FloorBasementTilesEnd

	; tileset 2 - tiles start at [5] - tileset length [4D]
	dc.l	FrameTilesStart
	dc.l	FrameTilesEnd

	; tileset 3 - tiles start at [52] - tileset length [A]
	dc.l	BasementCafeTableTilesStart
	dc.l	BasementCafeTableTilesEnd

	; tileset 4 - tiles start at [5C] - tileset length [10]
	dc.l	BasementCafeShelvesEmpty32x32TilesStart
	dc.l	BasementCafeShelvesEmpty32x32TilesEnd

	; tileset 5 - tiles start at [6C] - tileset length [10]
	dc.l	BasementCafeShelvesFull32x32TilesStart
	dc.l	BasementCafeShelvesFull32x32TilesEnd

	; tileset 6 - tiles start at [7C] - tileset length [4]
	dc.l	BasementCrate16x16TilesStart
	dc.l	BasementCrate16x16TilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteBasementFloor
	dc.l	PaletteBasementWall
	dc.l	PaletteBasementCafe
	dc.l	PalettePeople

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000F ; scenery count - 1

	; floor
	dc.l	Pattern16x16x304
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001 ; vdp pattern
	dc.w	$000C ; repeat=12
	dc.l	VDP_VRAM_WRITE_B+$00020000+$00800000 ; initial drawing location

	; west wall
	dc.l	PatternFrameWestOpen
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00020000+$02800000 ; initial drawing location

	; east wall
	dc.l	PatternFrameEastOpen
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$004A0000+$02800000 ; initial drawing location

	; south wall
	dc.l	PatternFrameSouthOpen
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00020000+$0D000000 ; initial drawing location

	; north wall - west
	dc.l	PatternFrameNorthOpenWestSide
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_B+$00020000+$00800000 ; initial drawing location

	; north wall - east
	dc.l	PatternFrameNorthOpenEastSide
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_B+$002E0000+$00800000 ; initial drawing location

	; table
	dc.l	PatternBasementCafeTable
	;		%pccvhnnnnnnnnnnn
	dc.w	%0010000001010010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$001E0000+$05800000 ; initial drawing location

	; empty shelves
	dc.l	Pattern32x32
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011100 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00060000+$01000000 ; initial drawing location

	; full shelves
	dc.l	Pattern32x32
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000001101100 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$000E0000+$01000000 ; initial drawing location

	; empty shelves
	dc.l	Pattern32x32
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011100 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00160000+$01000000 ; initial drawing location

	; empty shelves
	dc.l	Pattern32x32
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011100 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00320000+$01000000 ; initial drawing location

	; empty shelves
	dc.l	Pattern32x32
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011100 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$003A0000+$01000000 ; initial drawing location

	; full shelves
	dc.l	Pattern32x32
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000001101100 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00420000+$01000000 ; initial drawing location

	; crate
	dc.l	Pattern16x16
	;		%pccvhnnnnnnnnnnn
	dc.w	%0010000001111100 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00180000+$06000000 ; initial drawing location

	; crate
	dc.l	Pattern16x16
	;		%pccvhnnnnnnnnnnn
	dc.w	%0010000001111100 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00340000+$06000000 ; initial drawing location

	; crate
	dc.l	Pattern16x16
	;		%pccvhnnnnnnnnnnn
	dc.w	%0010000001111100 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00200000+$07000000 ; initial drawing location

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

	dc.w	OBJ_SCENE_BASEMENT_CAFE_RACK
	;		%wwwwwwwxxxxxxxxx
	dc.w	%1100000010011010
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0011000010010000

	dc.w	OBJ_SCENE_BASEMENT_CAFE_RACK
	;		%wwwwwwwxxxxxxxxx
	dc.w	%1100000100111100
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0011000010010000

	dc.w	OBJ_SCENE_BASEMENT_CAFE_TABLE
	;		%wwwwwwwxxxxxxxxx
	dc.w	%1010000011111000
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0010000011011000

	dc.w	OBJ_SCENE_BASEMENT_CRATE
	;		%wwwwwwwxxxxxxxxx
	dc.w	%0010000001101100
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0001100001101100

	dc.w	OBJ_SCENE_BASEMENT_CRATE
	;		%wwwwwwwxxxxxxxxx
	dc.w	%0010000100000000
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0001100011110000

	dc.w	OBJ_SCENE_BASEMENT_CRATE
	;		%wwwwwwwxxxxxxxxx
	dc.w	%0010000101010000
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0001100011110000

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
	dc.l	BasementCafeCollisionStart ; location of collision data

	;---------------------------------------------------------------------------
	; exits: 0=south,1=north,2=west,3=east
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_BASEMENTWDORM
	dc.w	SCENE_ID_BASEMENTOFFICE
	dc.w	$FFFF
	dc.w	SCENE_ID_BASEMENTMDORM

	;---------------------------------------------------------------------------
	; npc locations
	;---------------------------------------------------------------------------
	dc.w	$0003 ; npc count - 1

	dc.w	$0060 ; starting x location of npc0
	dc.w	$0054 ; starting y location of npc0
	dc.w	DIRECTION_RIGHT ; starting direction of npc0
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
