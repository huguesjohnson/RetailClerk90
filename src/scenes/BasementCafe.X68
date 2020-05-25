SceneBasementCafe:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_BASEMENTCAFE

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0006	; tileset count

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	FloorPavementTilesStart
	dc.l	FloorPavementTilesEnd

	; tileset 2
	dc.l	FrameRectTilesStart
	dc.l	FrameRectTilesEnd

	; tileset 3
	dc.l	BasementFloorLightTilesStart
	dc.l	BasementFloorLightTilesEnd

	; tileset 4
	dc.l	BasementCafeRackTilesStart
	dc.l	BasementCafeRackTilesEnd

	; tileset 5
	dc.l	BasementCafeTableTilesStart
	dc.l	BasementCafeTableTilesEnd

	; tileset 6
	dc.l	BasementCrate32x32TilesStart
	dc.l	BasementCrate32x32TilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteBasementFloor	; first palette
	dc.l	PaletteBasementWall	; second palette
	dc.l	PaletteBasementCafe	; third palette
	dc.l	PalettePeople	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0015	; scenery count

	; floor
	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001	; base pattern
	dc.w	$0006	; repeat 7 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; left entrance - top
	dc.l	PatternFrameSideLeftOpenTop
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000	; initial drawing location

	; left entrance - bottom
	dc.l	PatternFrameSideLeftOpenBottom
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09000000	; initial drawing location

	; right entrance - top
	dc.l	PatternFrameSideRightOpenTop
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$004E0000	; initial drawing location

	; right entrance - bottom
	dc.l	PatternFrameSideRightOpenBottom
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09000000+$004E0000	; initial drawing location

	; north wall - left side
	dc.l	PatternFrameTopOpenLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; north wall - right side
	dc.l	PatternFrameTopOpenRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00360000	; initial drawing location

	; south wall - left side
	dc.l	PatternFrameBottomOpenLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; south wall - right side
	dc.l	PatternFrameBottomOpenRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000+$00360000	; initial drawing location

	; lighting
	dc.l	Pattern48x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00160000+$02000000	; initial drawing location

	dc.l	Pattern48x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$002E0000+$02000000	; initial drawing location

	dc.l	Pattern48x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00160000+$06000000	; initial drawing location

	dc.l	Pattern48x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$002E0000+$06000000	; initial drawing location

	dc.l	Pattern48x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00160000+$0A000000	; initial drawing location

	dc.l	Pattern48x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$002E0000+$0A000000	; initial drawing location

	; racks
	dc.l	Pattern32x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000111101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00020000+$00800000	; initial drawing location

	dc.l	Pattern32x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000111101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$000A0000+$00800000	; initial drawing location

	dc.l	Pattern32x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000111101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00120000+$00800000	; initial drawing location

	; table
	dc.l	Pattern88x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001001101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$001C0000+$05800000	; initial drawing location

	; crates
	dc.l	Pattern32x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001111001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00360000+$00800000	; initial drawing location

	dc.l	Pattern32x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001111001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$003E0000+$00800000	; initial drawing location

	dc.l	Pattern32x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001111001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00460000+$00800000	; initial drawing location

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
	dc.w	OBJ_SCENE_BASEMENT_CAFE_RACK
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1100000000001000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000000001000+%0000000010000000

	dc.w	OBJ_SCENE_BASEMENT_CAFE_TABLE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1011010001101110+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000001011000+%0000000010000000

	dc.w	OBJ_SCENE_BASEMENT_CRATE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1100010011010110+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000000001000+%0000000010000000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000+%0000000010000000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000+%0000000010000000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000+%0000000010000000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000+%0000000010000000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000+%0000000010000000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000+%0000000010000000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000+%0000000010000000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.l	BasementCafeCollisionStart

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_BASEMENTWDORM	; south exit
	dc.w	SCENE_ID_BASEMENTOFFICE	; north exit
	dc.w	$FFFF	; west exit
	dc.w	SCENE_ID_BASEMENTMDORM	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0003	; four npc slots

	dc.w	$0060+$0080	; starting x location of npc0
	dc.w	$0054+$0080	; starting y location of npc0
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

