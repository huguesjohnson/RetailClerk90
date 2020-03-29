SceneTLodge:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_TLODGE

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$000B	; tileset count

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
	dc.l	CounterTopTilesStart
	dc.l	CounterTopTilesEnd

	; tileset 4
	dc.l	TLodgeLargeRackLeftTilesStart
	dc.l	TLodgeLargeRackLeftTilesEnd

	; tileset 5
	dc.l	TLodgeLargeRackRightTilesStart
	dc.l	TLodgeLargeRackRightTilesEnd

	; tileset 6
	dc.l	TLodgeSmallRackLeftHighTilesStart
	dc.l	TLodgeSmallRackLeftHighTilesEnd

	; tileset 7
	dc.l	TLodgeSmallRackLeftLowTilesStart
	dc.l	TLodgeSmallRackLeftLowTilesEnd

	; tileset 8
	dc.l	TLodgeSmallRackCenterHighTilesStart
	dc.l	TLodgeSmallRackCenterHighTilesEnd

	; tileset 9
	dc.l	TLodgeSmallRackCenterLowTilesStart
	dc.l	TLodgeSmallRackCenterLowTilesEnd

	; tileset A
	dc.l	TLodgeSmallRackRightHighTilesStart
	dc.l	TLodgeSmallRackRightHighTilesEnd

	; tileset B
	dc.l	TLodgeSmallRackRightLowTilesStart
	dc.l	TLodgeSmallRackRightLowTilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteTLodge00	; first palette
	dc.l	PaletteTLodge01	; second palette
	dc.l	PaletteTLodge02	; third palette
	dc.l	PalettePeople	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000E	; scenery count

	; background
	dc.l	PatternTileFloor
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001	; base pattern
	dc.w	$000D	; repeat 14 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; left wall
	dc.l	PatternFrameSideClosedLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000	; initial drawing location

	; right side
	dc.l	PatternFrameSideClosedRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$004E0000	; initial drawing location

	; counter
	dc.l	PatternCounterLow24x136	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000011001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$000A0000+$05000000	; initial drawing location

	; south wall
	dc.l	PatternFrameBottom
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; north wall - left side
	dc.l	PatternFrameTopOpenLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; north wall - right side
	dc.l	PatternFrameTopOpenRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00360000	; initial drawing location

	; large rack - left
	dc.l	PatternTLodgeLargeRackLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000100100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00020000+$00800000	; initial drawing location

	; large rack - right
	dc.l	PatternTLodgeLargeRackRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001011011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00360000+$00800000	; initial drawing location

	; small rack - left - high
	dc.l	PatternTLodgeSmallRackLeftHigh
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000010010111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00180000+$05000000	; initial drawing location

	; small rack - left - low
	dc.l	PatternTLodgeSmallRackLeftLow
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000010110000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00180000+$07800000	; initial drawing location

	; small rack - center - high
	dc.l	PatternTLodgeSmallRackCenterHigh
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000010111111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$002A0000+$05000000	; initial drawing location

	; small rack - center - low
	dc.l	PatternTLodgeSmallRackCenterLow
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000011000111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$002A0000+$07800000	; initial drawing location

	; small rack - right - high
	dc.l	PatternTLodgeSmallRackRightHigh
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000011010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$003C0000+$05000000	; initial drawing location

	; small rack - right - low
	dc.l	PatternTLodgeSmallRackRightLow
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000011011011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$003C0000+$07800000	; initial drawing location


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
	dc.w	OBJ_SCENE_TLODGE_DISKS
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1011100010001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000010001000

	dc.w	OBJ_SCENE_TLODGE_RADIOS
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1100000101010010
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000010001000

	dc.w	OBJ_SCENE_TLODGE_TVS
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100111011100000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100010011100110

	dc.w	OBJ_SCENE_TLODGE_CLOCKS
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100111100101000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100010011100110

	dc.w	OBJ_SCENE_TLODGE_VHS
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100111101110000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100010011100110

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

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.l	TLodgeCollisionStart

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; south exit
	dc.w	SCENE_ID_EEHALL	; north exit
	dc.w	$FFFF	; west exit
	dc.w	$FFFF	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0003	; four npc slots

	dc.w	$008C	; starting x location of npc0
	dc.w	$00F0	; starting y location of npc0
	dc.w	DIRECTION_RIGHT	; starting direction of npc0
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
