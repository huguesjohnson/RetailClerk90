SceneParkingLot:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_PARKINGLOT

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0007	; tileset count

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	FloorPavementTilesStart
	dc.l	FloorPavementTilesEnd

	; tileset 2
	dc.l	FloorTileBasicTilesStart
	dc.l	FloorTileBasicTilesEnd

	; tileset 3
	dc.l	ParkingLotWallTilesStart
	dc.l	ParkingLotWallTilesEnd

	; tileset 4
	dc.l	ParkingLotSignTilesStart
	dc.l	ParkingLotSignTilesEnd

	; tileset 5
	dc.l	ParkingLotGrassLeftTilesStart
	dc.l	ParkingLotGrassLeftTilesEnd

	; tileset 6
	dc.l	ParkingLotGrassRightTilesStart
	dc.l	ParkingLotGrassRightTilesEnd

	; tileset 7
	dc.l	ParkingLotStripeTilesStart
	dc.l	ParkingLotStripeTilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteParkingLot00	; first palette
	dc.l	PaletteParkingLot01	; second palette
	dc.l	PaletteParkingLot02	; third palette
	dc.l	PalettePeople	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0012	; scenery count

	; north mall floor
	dc.l	PatternTileFloor	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000010001	; base pattern
	dc.w	$0001	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; pavement
	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000000001	; base pattern
	dc.w	$000B	; repeat 12 times
	dc.l	VDP_VRAM_WRITE_B+$02000000	; initial drawing location

	; mall exterior - sign
	dc.l	PatternParkingLotSign	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000100000	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_A+$00180000	; initial drawing location

	; mall exterior - left side
	dc.l	PatternParkingLotWall	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010101	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; mall exterior - right side
	dc.l	PatternParkingLotWall	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010101	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00380000	; initial drawing location

	; left edge
	dc.l	PatternParkingLotGrassLeft	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100100	; base pattern
	dc.w	$0002	; repeat 2 times
	dc.l	VDP_VRAM_WRITE_B+$02000000	; initial drawing location

	; right edge
	dc.l	PatternParkingLotGrassRight	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000110000	; base pattern
	dc.w	$0002	; repeat 2 times
	dc.l	VDP_VRAM_WRITE_B+$004C0000+$02000000	; initial drawing location

	; parking stripes
	dc.l	PatternParkingLotStripe	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000111100	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00040000+$02000000	; initial drawing location

	dc.l	PatternParkingLotStripe	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000111100	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00040000+$04000000	; initial drawing location

	dc.l	PatternParkingLotStripe	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000111100	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00040000+$06000000	; initial drawing location

	dc.l	PatternParkingLotStripe	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000111100	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00040000+$08000000	; initial drawing location

	dc.l	PatternParkingLotStripe	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000111100	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00040000+$0A000000	; initial drawing location

	dc.l	PatternParkingLotStripe	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000111100	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00040000+$0C000000	; initial drawing location

	dc.l	PatternParkingLotStripe	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000111100	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00380000+$02000000	; initial drawing location

	dc.l	PatternParkingLotStripe	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000111100	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00380000+$04000000	; initial drawing location

	dc.l	PatternParkingLotStripe	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000111100	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00380000+$06000000	; initial drawing location

	dc.l	PatternParkingLotStripe	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000111100	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00380000+$08000000	; initial drawing location

	dc.l	PatternParkingLotStripe	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000111100	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00380000+$0A000000	; initial drawing location

	dc.l	PatternParkingLotStripe	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000111100	; base pattern
	dc.w	$0000	; repeat 0 times
	dc.l	VDP_VRAM_WRITE_B+$00380000+$0C000000	; initial drawing location

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
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000	
	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.l	ParkingLotCollisionStart

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; south exit
	dc.w	SCENE_ID_SHALL	; north exit
	dc.w	$FFFF	; west exit
	dc.w	$FFFF	; east exit

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
