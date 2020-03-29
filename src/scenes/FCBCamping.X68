SceneFCBCamping:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_FCBCAMPING

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0008	; tileset count

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
	dc.l	FCBPondTopLeftTilesStart
	dc.l	FCBPondTopLeftTilesEnd

	; tileset 4
	dc.l	FCBPathTilesStart
	dc.l	FCBPathTilesEnd

	; tileset 5
	dc.l	FCBCampingCampsiteTilesStart
	dc.l	FCBCampingCampsiteTilesEnd

	; tileset 6
	dc.l	FCBTentLargeTilesStart
	dc.l	FCBTentLargeTilesEnd

	; tileset 7
	dc.l	FCBTentTallTilesStart
	dc.l	FCBTentTallTilesEnd

	; tileset 8
	dc.l	FCBTentMidTilesStart
	dc.l	FCBTentMidTilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteFCBFloorWall	; first palette
	dc.l	PaletteFCBCamping00	; second palette
	dc.l	PaletteFCBCamping01	; third palette
	dc.l	PalettePeople	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000A	; scenery count

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
	dc.l	VDP_VRAM_WRITE_A;+$00800000	; initial drawing location

	; north wall
	dc.l	PatternFrameTopLongRight	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000010001	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; wood path - east-west
	dc.l	PatternFCBFloorH	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001001010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$09000000+$00100000	; initial drawing location

	; wood path - north-south
	dc.l	PatternFCBFloorVNorth	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001001010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$0B000000+$00100000	; initial drawing location

	dc.l	PatternFCBFloorVNorth	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001001010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$0B000000+$00480000	; initial drawing location

	; pond
	dc.l	PatternFCBPondTopLeft	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100101	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_B+$00300000+$0B800000	; initial drawing location

	; campsite
	dc.l	PatternFCBCampingCampsite ; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001011010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04800000+$001A0000	; initial drawing location

	; tents
	dc.l	PatternFCBTentLarge ; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001101111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$001C0000	; initial drawing location

	dc.l	PatternFCBTentTall ; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000010100110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00060000	; initial drawing location

	dc.l	PatternFCBTentMid ; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000011000110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$01800000+$003C0000	; initial drawing location

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
	dc.w	%0001111011101000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0111000011001000

	dc.w	OBJ_SCENE_BENCH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0001111101001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0111000011001000

	dc.w	OBJ_SCENE_FCB_FIREPIT
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011111100010000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011011000

	dc.w	OBJ_SCENE_FCB_TENT
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1011000011110110
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000010001000

	dc.w	OBJ_SCENE_FCB_TENT
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0110111010011000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000010001000

	dc.w	OBJ_SCENE_FCB_TENT
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0110111101110000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000010011000

;	dc.w	OBJ_SCENE_FCB_TENT
;	; 		%wwwwwwwxxxxxxxxx
;	dc.w	%0110111010011000
;	; 		%hhhhhhhyyyyyyyyy
;	dc.w	%0011000011011000

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

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.l	FCBCampingCollisionStart

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_FCBFISHING	; south exit
	dc.w	$FFFF	; north exit
	dc.w	$FFFF	; west exit
	dc.w	SCENE_ID_FCBFIREARMS	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0003	; four npc slots

	dc.w	$00FA	; starting x location of npc0
	dc.w	$00D8	; starting y location of npc0
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
