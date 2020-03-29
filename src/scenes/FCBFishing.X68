SceneFCBFishing:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_FCBFISHING

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0007	; tileset count

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	FloorStoneTilesStart
	dc.l	FloorStoneTilesEnd

	; tileset 2
	dc.l	FrameWoodTilesStart
	dc.l	FrameWoodTilesEnd

	; tileset 3
	dc.l	FCBPondLowerLeftTilesStart
	dc.l	FCBPondLowerLeftTilesEnd

	; tileset 4
	dc.l	FCBPathTilesStart
	dc.l	FCBPathTilesEnd

	; tileset 5
	dc.l	FCBFishingPolesHighTilesStart
	dc.l	FCBFishingPolesHighTilesEnd

	; tileset 6
	dc.l	FCBFishingPolesATilesStart
	dc.l	FCBFishingPolesATilesEnd

	; tileset 7
	dc.l	FCBFishingPolesBTilesStart
	dc.l	FCBFishingPolesBTilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteFCBFloorWall	; first palette
	dc.l	PaletteFCBFishing00	; second palette
	dc.l	PaletteFCBFishing01	; third palette
	dc.l	PalettePeople	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000C	; scenery count

	; stone floor
	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001	; base pattern
	dc.w	$0006	; repeat 7 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; left wall
	dc.l	PatternFrameSideLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; south wall
	dc.l	PatternFrameBottomLongRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; wood path - east-west
	dc.l	PatternFCBFloorH	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001001010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$09800000+$00100000	; initial drawing location

	; wood path - north-south
	dc.l	PatternFCBFloorVSouth	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001001010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00100000	; initial drawing location

	dc.l	PatternFCBFloorVSouth	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001001010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00480000	; initial drawing location

	; pond
	dc.l	PatternFCBPondLowerLeft	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100101	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_B+$00300000	; initial drawing location

	; fishing poles
	dc.l	PatternFCBFishingPolesHigh	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001011010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001A0000+$06000000	; initial drawing location

	dc.l	PatternFCBFishingPolesA	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001100001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001A0000+$07000000	; initial drawing location

	dc.l	PatternFCBFishingPolesHigh	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001011010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00360000+$06000000	; initial drawing location

	dc.l	PatternFCBFishingPolesB	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001101110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00360000+$07000000	; initial drawing location

	dc.l	PatternFCBFishingPolesHigh	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001011010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001A0000+$02000000	; initial drawing location

	dc.l	PatternFCBFishingPolesB	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001101110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001A0000+$03000000	; initial drawing location

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
	dc.w	OBJ_SCENE_FCB_FISHINGPOLES
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1010000011100111
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100100011100100

	dc.w	OBJ_SCENE_FCB_FISHINGPOLES
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1010000011100111
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100100010100100

	dc.w	OBJ_SCENE_FCB_FISHINGPOLES
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1010011101010100
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100100011100100

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
	dc.l	FCBFishingCollisionStart

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; south exit
	dc.w	SCENE_ID_FCBCAMPING	; north exit
	dc.w	$FFFF	; west exit
	dc.w	SCENE_ID_FCBCHECKOUT	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0003	; four npc slots

	dc.w	$00F0	; starting x location of npc0
	dc.w	$0110	; starting y location of npc0
	dc.w	DIRECTION_DOWN	; starting direction of npc0
	dc.w	$FFFF	; movement frequency of npc0
	dc.l	NullMovementStart	; location of movement pattern for npc1
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
