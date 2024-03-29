; generated by build tools

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_SVIDEO

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0007 ; tileset count - 1

	; tileset 0 - tiles start at [0] - tileset length [1]
	dc.l	TransparentTileTilesStart
	dc.l	TransparentTileTilesEnd

	; tileset 1 - tiles start at [1] - tileset length [4]
	dc.l	FloorSVideoTilesStart
	dc.l	FloorSVideoTilesEnd

	; tileset 2 - tiles start at [5] - tileset length [4D]
	dc.l	FrameTilesStart
	dc.l	FrameTilesEnd

	; tileset 3 - tiles start at [52] - tileset length [30]
	dc.l	CounterTilesStart
	dc.l	CounterTilesEnd

	; tileset 4 - tiles start at [82] - tileset length [3]
	dc.l	SVideoRackHigh24x8TilesStart
	dc.l	SVideoRackHigh24x8TilesEnd

	; tileset 5 - tiles start at [85] - tileset length [9]
	dc.l	SVideoRackLow24x24TilesStart
	dc.l	SVideoRackLow24x24TilesEnd

	; tileset 6 - tiles start at [8E] - tileset length [4]
	dc.l	SVideoBox16x16TilesStart
	dc.l	SVideoBox16x16TilesEnd

	; tileset 7 - tiles start at [92] - tileset length [6]
	dc.l	SVideoBox16x24TilesStart
	dc.l	SVideoBox16x24TilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteSVideo00
	dc.l	PaletteSVideo01
	dc.l	PaletteSVideo02
	dc.l	PalettePeople

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0034 ; scenery count - 1

	; floor
	dc.l	Pattern16x16x304
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001 ; vdp pattern
	dc.w	$000C ; repeat=12
	dc.l	VDP_VRAM_WRITE_B+$00020000+$00800000 ; initial drawing location

	; south wall
	dc.l	PatternFrameSouthClosedWestOpen
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00020000+$0D000000 ; initial drawing location

	; north wall
	dc.l	PatternFrameNorthClosedWestOpen
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_B+$00020000+$00800000 ; initial drawing location

	; east wall
	dc.l	PatternFrameEastClosed
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$004A0000+$02800000 ; initial drawing location

	; counter
	dc.l	PatternSVideoCounter
	;		%pccvhnnnnnnnnnnn
	dc.w	%0010000001010010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00400000+$02000000 ; initial drawing location

	; rack - high
	dc.l	Pattern24x8
	;		%pccvhnnnnnnnnnnn
	dc.w	%1100000010000010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$000A0000+$01000000 ; initial drawing location

	; rack - low
	dc.l	Pattern24x24
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000010000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$000A0000+$01800000 ; initial drawing location

	; rack - high
	dc.l	Pattern24x8
	;		%pccvhnnnnnnnnnnn
	dc.w	%1100000010000010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00120000+$01000000 ; initial drawing location

	; rack - low
	dc.l	Pattern24x24
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000010000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00120000+$01800000 ; initial drawing location

	; rack - high
	dc.l	Pattern24x8
	;		%pccvhnnnnnnnnnnn
	dc.w	%1100000010000010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$001A0000+$01000000 ; initial drawing location

	; rack - low
	dc.l	Pattern24x24
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000010000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$001A0000+$01800000 ; initial drawing location

	; rack - high
	dc.l	Pattern24x8
	;		%pccvhnnnnnnnnnnn
	dc.w	%1100000010000010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00220000+$01000000 ; initial drawing location

	; rack - low
	dc.l	Pattern24x24
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000010000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00220000+$01800000 ; initial drawing location

	; rack - high
	dc.l	Pattern24x8
	;		%pccvhnnnnnnnnnnn
	dc.w	%1100000010000010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$002A0000+$01000000 ; initial drawing location

	; rack - low
	dc.l	Pattern24x24
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000010000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$002A0000+$01800000 ; initial drawing location

	; rack - high
	dc.l	Pattern24x8
	;		%pccvhnnnnnnnnnnn
	dc.w	%1100000010000010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00320000+$01000000 ; initial drawing location

	; rack - low
	dc.l	Pattern24x24
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000010000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00320000+$01800000 ; initial drawing location

	; rack - high
	dc.l	Pattern24x8
	;		%pccvhnnnnnnnnnnn
	dc.w	%1010000010000010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$000A0000+$04000000 ; initial drawing location

	; rack - low
	dc.l	Pattern24x24
	;		%pccvhnnnnnnnnnnn
	dc.w	%0010000010000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$000A0000+$04800000 ; initial drawing location

	; rack - high
	dc.l	Pattern24x8
	;		%pccvhnnnnnnnnnnn
	dc.w	%1010000010000010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00120000+$04000000 ; initial drawing location

	; rack - low
	dc.l	Pattern24x24
	;		%pccvhnnnnnnnnnnn
	dc.w	%0010000010000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00120000+$04800000 ; initial drawing location

	; rack - high
	dc.l	Pattern24x8
	;		%pccvhnnnnnnnnnnn
	dc.w	%1010000010000010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$001A0000+$04000000 ; initial drawing location

	; rack - low
	dc.l	Pattern24x24
	;		%pccvhnnnnnnnnnnn
	dc.w	%0010000010000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$001A0000+$04800000 ; initial drawing location

	; rack - high
	dc.l	Pattern24x8
	;		%pccvhnnnnnnnnnnn
	dc.w	%1010000010000010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00220000+$04000000 ; initial drawing location

	; rack - low
	dc.l	Pattern24x24
	;		%pccvhnnnnnnnnnnn
	dc.w	%0010000010000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00220000+$04800000 ; initial drawing location

	; rack - high
	dc.l	Pattern24x8
	;		%pccvhnnnnnnnnnnn
	dc.w	%1010000010000010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$002A0000+$04000000 ; initial drawing location

	; rack - low
	dc.l	Pattern24x24
	;		%pccvhnnnnnnnnnnn
	dc.w	%0010000010000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$002A0000+$04800000 ; initial drawing location

	; rack - high
	dc.l	Pattern24x8
	;		%pccvhnnnnnnnnnnn
	dc.w	%1010000010000010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00320000+$04000000 ; initial drawing location

	; rack - low
	dc.l	Pattern24x24
	;		%pccvhnnnnnnnnnnn
	dc.w	%0010000010000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00320000+$04800000 ; initial drawing location

	; rack - high
	dc.l	Pattern24x8
	;		%pccvhnnnnnnnnnnn
	dc.w	%1100000010000010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$000A0000+$07000000 ; initial drawing location

	; rack - low
	dc.l	Pattern24x24
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000010000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$000A0000+$07800000 ; initial drawing location

	; rack - high
	dc.l	Pattern24x8
	;		%pccvhnnnnnnnnnnn
	dc.w	%1100000010000010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00120000+$07000000 ; initial drawing location

	; rack - low
	dc.l	Pattern24x24
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000010000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00120000+$07800000 ; initial drawing location

	; rack - high
	dc.l	Pattern24x8
	;		%pccvhnnnnnnnnnnn
	dc.w	%1100000010000010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$001A0000+$07000000 ; initial drawing location

	; rack - low
	dc.l	Pattern24x24
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000010000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$001A0000+$07800000 ; initial drawing location

	; rack - high
	dc.l	Pattern24x8
	;		%pccvhnnnnnnnnnnn
	dc.w	%1100000010000010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00220000+$07000000 ; initial drawing location

	; rack - low
	dc.l	Pattern24x24
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000010000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00220000+$07800000 ; initial drawing location

	; rack - high
	dc.l	Pattern24x8
	;		%pccvhnnnnnnnnnnn
	dc.w	%1100000010000010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$002A0000+$07000000 ; initial drawing location

	; rack - low
	dc.l	Pattern24x24
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000010000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$002A0000+$07800000 ; initial drawing location

	; rack - high
	dc.l	Pattern24x8
	;		%pccvhnnnnnnnnnnn
	dc.w	%1100000010000010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00320000+$07000000 ; initial drawing location

	; rack - low
	dc.l	Pattern24x24
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000010000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00320000+$07800000 ; initial drawing location

	; box
	dc.l	Pattern16x16
	;		%pccvhnnnnnnnnnnn
	dc.w	%0110000010001110 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_B+$000A0000+$0C000000 ; initial drawing location

	; box
	dc.l	Pattern16x16
	;		%pccvhnnnnnnnnnnn
	dc.w	%0110000010001110 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_B+$000E0000+$0C000000 ; initial drawing location

	; box
	dc.l	Pattern16x24
	;		%pccvhnnnnnnnnnnn
	dc.w	%1110000010010010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_B+$00120000+$0B800000 ; initial drawing location

	; box
	dc.l	Pattern16x16
	;		%pccvhnnnnnnnnnnn
	dc.w	%0110000010001110 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_B+$00160000+$0C000000 ; initial drawing location

	; box
	dc.l	Pattern16x16
	;		%pccvhnnnnnnnnnnn
	dc.w	%0110000010001110 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_B+$001A0000+$0C000000 ; initial drawing location

	; box
	dc.l	Pattern16x16
	;		%pccvhnnnnnnnnnnn
	dc.w	%0110000010001110 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_B+$001E0000+$0C000000 ; initial drawing location

	; box
	dc.l	Pattern16x24
	;		%pccvhnnnnnnnnnnn
	dc.w	%1110000010010010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_B+$00220000+$0B800000 ; initial drawing location

	; box
	dc.l	Pattern16x24
	;		%pccvhnnnnnnnnnnn
	dc.w	%1110000010010010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_B+$00260000+$0B800000 ; initial drawing location

	; box
	dc.l	Pattern16x16
	;		%pccvhnnnnnnnnnnn
	dc.w	%0110000010001110 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_B+$002A0000+$0C000000 ; initial drawing location

	; box
	dc.l	Pattern16x24
	;		%pccvhnnnnnnnnnnn
	dc.w	%1110000010010010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_B+$002E0000+$0B800000 ; initial drawing location

	; box
	dc.l	Pattern16x16
	;		%pccvhnnnnnnnnnnn
	dc.w	%0110000010001110 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_B+$00320000+$0C000000 ; initial drawing location

	; box
	dc.l	Pattern16x16
	;		%pccvhnnnnnnnnnnn
	dc.w	%0110000010001110 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_B+$00360000+$0C000000 ; initial drawing location

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

	dc.w	OBJ_SCENE_SVIDEO_VIDEORACK
	;		%wwwwwwwxxxxxxxxx
	dc.w	%1011010010101000
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0001110010011010

	dc.w	OBJ_SCENE_SVIDEO_VIDEORACK
	;		%wwwwwwwxxxxxxxxx
	dc.w	%1011010100001000
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0001110010011010

	dc.w	OBJ_SCENE_SVIDEO_VIDEORACK
	;		%wwwwwwwxxxxxxxxx
	dc.w	%1011010010101000
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0001110011001010

	dc.w	OBJ_SCENE_SVIDEO_VIDEORACK
	;		%wwwwwwwxxxxxxxxx
	dc.w	%1011010100001000
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0001110011001010

	dc.w	OBJ_SCENE_SVIDEO_VIDEORACK
	;		%wwwwwwwxxxxxxxxx
	dc.w	%1011010010101000
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0001110011111010

	dc.w	OBJ_SCENE_SVIDEO_VIDEORACK
	;		%wwwwwwwxxxxxxxxx
	dc.w	%1011010100001000
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0001110011111010

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
	dc.l	SVideoCollisionStart ; location of collision data

	;---------------------------------------------------------------------------
	; exits: 0=south,1=north,2=west,3=east
	;---------------------------------------------------------------------------
	dc.w	$FFFF
	dc.w	$FFFF
	dc.w	SCENE_ID_EEHALL
	dc.w	$FFFF

	;---------------------------------------------------------------------------
	; npc locations
	;---------------------------------------------------------------------------
	dc.w	$0003 ; npc count - 1

	dc.w	$0140 ; starting x location of npc0
	dc.w	$0104 ; starting y location of npc0
	dc.w	DIRECTION_LEFT ; starting direction of npc0
	dc.w	$FFFF ; movement frequency of npc0
	dc.l	NullMovementStart ; location of movement pattern for npc0
	dc.w	(NullMovementEnd-NullMovementStart-1) ; movement pattern length

	dc.w	$00AE ; starting x location of npc1
	dc.w	$0104 ; starting y location of npc1
	dc.w	DIRECTION_UP ; starting direction of npc1
	dc.w	$FFFF ; movement frequency of npc1
	dc.l	NullMovementStart ; location of movement pattern for npc1
	dc.w	(NullMovementEnd-NullMovementStart-1) ; movement pattern length

	dc.w	$0060 ; starting x location of npc2
	dc.w	$0104 ; starting y location of npc2
	dc.w	DIRECTION_DOWN ; starting direction of npc2
	dc.w	$FFFF ; movement frequency of npc2
	dc.l	NullMovementStart ; location of movement pattern for npc2
	dc.w	(NullMovementEnd-NullMovementStart-1) ; movement pattern length

	dc.w	$0060 ; starting x location of npc3
	dc.w	$0104 ; starting y location of npc3
	dc.w	DIRECTION_DOWN ; starting direction of npc3
	dc.w	$FFFF ; movement frequency of npc3
	dc.l	NullMovementStart ; location of movement pattern for npc3
	dc.w	(NullMovementEnd-NullMovementStart-1) ; movement pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_Mall ; location of background music
