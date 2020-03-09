SceneFCBFishing:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_FCBFISHING

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0002	; tileset count

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	FloorStoneTilesStart
	dc.l	FloorStoneTilesEnd

	; tileset 2
	dc.l	FrameWoodTilesStart
	dc.l	FrameWoodTilesEnd

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
	dc.w	$0002	; scenery count

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
