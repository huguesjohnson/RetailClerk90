; generated by build tools

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_BASEMENTMDORM

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

	; tileset 3 - tiles start at [52] - tileset length [8]
	dc.l	CavernBackroomStairsTilesStart
	dc.l	CavernBackroomStairsTilesEnd

	; tileset 4 - tiles start at [5A] - tileset length [19]
	dc.l	BasementBunk40x40TilesStart
	dc.l	BasementBunk40x40TilesEnd

	; tileset 5 - tiles start at [73] - tileset length [18]
	dc.l	BasementPingPongTable32x48TilesStart
	dc.l	BasementPingPongTable32x48TilesEnd

	; tileset 6 - tiles start at [8B] - tileset length [F]
	dc.l	BasementCouchLeft24x40TilesStart
	dc.l	BasementCouchLeft24x40TilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteBasementFloor
	dc.l	PaletteBasementWall
	dc.l	PaletteBasementMDorm
	dc.l	PalettePeople

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000E ; scenery count - 1

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
	dc.l	PatternFrameEastClosed
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$004A0000+$02800000 ; initial drawing location

	; south wall
	dc.l	PatternFrameSouthClosed
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00020000+$0D000000 ; initial drawing location

	; north wall
	dc.l	PatternFrameNorthClosed
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000101 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_B+$00020000+$00800000 ; initial drawing location

	; stairs
	dc.l	PatternCavernBackroomStairs
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000001010010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_B+$003C0000+$00800000 ; initial drawing location

	; bunk - west
	dc.l	Pattern40x40
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_B+$00080000+$01000000 ; initial drawing location

	; bunk - center
	dc.l	Pattern40x40
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_B+$00140000+$01000000 ; initial drawing location

	; bunk - center
	dc.l	Pattern40x40
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_B+$00200000+$01000000 ; initial drawing location

	; bunk - east
	dc.l	Pattern40x40
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011010 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_B+$002C0000+$01000000 ; initial drawing location

	; ping pong table - west
	dc.l	Pattern32x48
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000001110011 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$001A0000+$06800000 ; initial drawing location

	; ping pong table - east
	dc.l	Pattern32x48
	;		%pccvhnnnnnnnnnnn
	dc.w	%0100000001110011 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$002C0000+$06800000 ; initial drawing location

	; couch - north
	dc.l	Pattern24x40
	;		%pccvhnnnnnnnnnnn
	dc.w	%0010000010001011 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00440000+$05000000 ; initial drawing location

	; couch - center
	dc.l	Pattern24x40
	;		%pccvhnnnnnnnnnnn
	dc.w	%0010000010001011 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00440000+$07800000 ; initial drawing location

	; couch - south
	dc.l	Pattern24x40
	;		%pccvhnnnnnnnnnnn
	dc.w	%0010000010001011 ; vdp pattern
	dc.w	$0000 ; repeat=0
	dc.l	VDP_VRAM_WRITE_A+$00440000+$0A000000 ; initial drawing location

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

	dc.w	OBJ_SCENE_BASEMENT_BED
	;		%wwwwwwwxxxxxxxxx
	dc.w	%1100000010100000
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0100000010010000

	dc.w	OBJ_SCENE_BASEMENT_BED
	;		%wwwwwwwxxxxxxxxx
	dc.w	%1100000100000000
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0100000010010000

	dc.w	OBJ_SCENE_BASEMENT_LADDER
	;		%wwwwwwwxxxxxxxxx
	dc.w	%0110110101110000
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0100100010001000

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

	dc.w	OBJ_NOTHING
	;		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	;		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.l	BasementMDormCollisionStart ; location of collision data

	;---------------------------------------------------------------------------
	; exits: 0=south,1=north,2=west,3=east
	;---------------------------------------------------------------------------
	dc.w	$FFFF
	dc.w	SCENE_ID_CAVERN_BACKROOM
	dc.w	SCENE_ID_BASEMENTCAFE
	dc.w	$FFFF

	;---------------------------------------------------------------------------
	; npc locations
	;---------------------------------------------------------------------------
	dc.w	$0003 ; npc count - 1

	dc.w	$00A0 ; starting x location of npc0
	dc.w	$00B8 ; starting y location of npc0
	dc.w	DIRECTION_DOWN ; starting direction of npc0
	dc.w	$FFFF ; movement frequency of npc0
	dc.l	NullMovementStart ; location of movement pattern for npc0
	dc.w	(NullMovementEnd-NullMovementStart-1) ; movement pattern length

	dc.w	$010C ; starting x location of npc1
	dc.w	$0088 ; starting y location of npc1
	dc.w	DIRECTION_RIGHT ; starting direction of npc1
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
