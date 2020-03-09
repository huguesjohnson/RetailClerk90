SceneTBooks:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_TBOOKS

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0002	; tileset count

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	FloorWoodVertTilesStart
	dc.l	FloorWoodVertTilesEnd

	; tileset 2
	dc.l	FrameRoundTilesStart
	dc.l	FrameRoundTilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteTBooks00	; first palette
	dc.l	PaletteTBooks01	; second palette
	dc.l	PaletteTBooks02	; third palette
	dc.l	PalettePeople	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0005	; scenery count

	; background
	dc.l	PatternWoodFloorV
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001	; base pattern
	dc.w	$000D	; repeat 14 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; left wall
	dc.l	PatternFrameSideClosedLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000001001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000	; initial drawing location

	; right side
	dc.l	PatternFrameSideClosedRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000001001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$004E0000	; initial drawing location

	; south wall
	dc.l	PatternFrameBottom
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000001001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; north wall - left side
	dc.l	PatternFrameTopOpenLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000001001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; north wall - right side
	dc.l	PatternFrameTopOpenRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000001001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00360000	; initial drawing location

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
	dc.l	TBooksCollisionStart

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; south exit
	dc.w	SCENE_ID_WWHALL	; north exit
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
