ScenePogoDawg:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_POGODAWG

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0007	; tileset count

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	FloorTile4ColorTilesStart
	dc.l	FloorTile4ColorTilesEnd

	; tileset 2
	dc.l	FrameRectTilesStart
	dc.l	FrameRectTilesEnd

	; tileset 3
	dc.l	CounterTopTilesStart
	dc.l	CounterTopTilesEnd

	; tileset 4
	dc.l	CounterTopSouthCornersTilesStart
	dc.l	CounterTopSouthCornersTilesEnd

	; tileset 5
	dc.l	PogoDawgTableTilesStart
	dc.l	PogoDawgTableTilesEnd

	; tileset 6
	dc.l	PogoDawgSeatTilesStart
	dc.l	PogoDawgSeatTilesEnd

	; tileset 7
	dc.l	PogoDawgTrashTilesStart
	dc.l	PogoDawgTrashTilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PalettePogoDawg00	; first palette
	dc.l	PalettePogoDawg01	; second palette
	dc.l	PalettePogoDawg02	; third palette
	dc.l	PalettePeople	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0012	; scenery count

	; floor
	dc.l	PatternTileFloorSimple
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001	; base pattern
	dc.w	$000D	; repeat 14 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; left entrance - top
	dc.l	PatternFrameSideLeftOpenTop
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000	; initial drawing location

	; left entrance - bottom
	dc.l	PatternFrameSideLeftOpenBottom
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09000000	; initial drawing location

	; right entrance - top
	dc.l	PatternFrameSideRightOpenTop
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$004E0000	; initial drawing location

	; right entrance - bottom
	dc.l	PatternFrameSideRightOpenBottom
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09000000+$004E0000	; initial drawing location

	; north wall
	dc.l	PatternFrameTop
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; south wall 
	dc.l	PatternFrameBottom
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; main counter
	dc.l	PatternCounterLow24x8
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000010111	; base pattern
	dc.w	$0017	; repeat 24 times
	dc.l	VDP_VRAM_WRITE_B+$000A0000+$00800000	; initial drawing location

	; south counter
	dc.l	PatternCounterLow272x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000010111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$000A0000+$0C800000	; initial drawing location

	; counter seating
	dc.l	Pattern16x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00180000+$0B800000	; initial drawing location

	dc.l	Pattern16x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00240000+$0B800000	; initial drawing location

	dc.l	Pattern16x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00300000+$0B800000	; initial drawing location

	dc.l	Pattern16x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$003C0000+$0B800000	; initial drawing location

	dc.l	Pattern16x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00480000+$0B800000	; initial drawing location

	; tables
	dc.l	PatternPogoDawgTable
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$001A0000+$00800000	; initial drawing location

	dc.l	PatternPogoDawgTable
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$002C0000+$00800000	; initial drawing location

	dc.l	PatternPogoDawgTable
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$003E0000+$00800000	; initial drawing location

	; trash on tables & counter
	dc.l	Pattern16x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000110010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001E0000+$0C800000	; initial drawing location

	dc.l	Pattern16x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000110010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00420000+$00800000	; initial drawing location

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
	dc.w	OBJ_SCENE_POGODAWG_TABLE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0101000011101000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000010001000

	dc.w	OBJ_SCENE_POGODAWG_TABLE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0101000100110000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000010001000

	dc.w	OBJ_SCENE_POGODAWG_TABLE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0101000101111000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0100000010001000

	dc.w	OBJ_SCENE_POGODAWG_TRASH
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011010011110000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000101001000

	dc.w	OBJ_NPC_GRIFFY
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011000010101010
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011100010110000

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
	dc.l	PogoDawgCollisionStart

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; south exit
	dc.w	$FFFF	; north exit
	dc.w	$FFFF	; west exit
	dc.w	SCENE_ID_SHALL	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0003	; four npc slots

	dc.w	$0098	; starting x location of npc0
	dc.w	$00B0	; starting y location of npc0
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
