SceneSHall:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_SHALL

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0005	; tileset count

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
	dc.l	SHallPlantTilesStart
	dc.l	SHallPlantTilesEnd

	; tileset 4
	dc.l	SHallPhoneHighTilesStart
	dc.l	SHallPhoneHighTilesEnd

	; tileset 5
	dc.l	SHallPhoneLowTilesStart
	dc.l	SHallPhoneLowTilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PalettePogoDawg00	; first palette
	dc.l	PaletteNShack00	; second palette
	dc.l	PaletteSHall	; third palette
	dc.l	PalettePeople	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000A	; scenery count

	; background
	dc.l	PatternTileFloor
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000000001	; base pattern
	dc.w	$000D	; repeat 14 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; plant - left side
	dc.l	PatternSHallPlant	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000011001		; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0C800000+$00020000	; initial drawing location

	; plant - right side
	dc.l	PatternSHallPlant	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000011001		; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0C800000+$00380000	; initial drawing location

	; left entrance - top
	dc.l	PatternFrameSideLeftOpenTopExterior
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; left entrance - bottom
	dc.l	PatternFrameSideLeftOpenBottomExterior
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09000000	; initial drawing location

	; right entrance - top
	dc.l	PatternFrameSideRightOpenTopExterior
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$004E0000	; initial drawing location

	; right entrance - bottom
	dc.l	PatternFrameSideRightOpenBottomExterior
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09000000+$004E0000	; initial drawing location

	; phone high
	dc.l	Pattern24x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000101111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04000000+$00200000	; initial drawing location

	; phone low
	dc.l	Pattern24x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000110101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05000000+$00200000	; initial drawing location

	; phone high
	dc.l	Pattern24x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000101111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04000000+$002A0000	; initial drawing location

	; phone low
	dc.l	Pattern24x32
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000110101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05000000+$002A0000	; initial drawing location

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
	dc.w	OBJ_SCENE_SHALL_PHONE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011000100000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0110000011000000

	dc.w	OBJ_SCENE_SHALL_PHONE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011000100101010
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0110000011000000

	dc.w	OBJ_SCENE_PLANT
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1011000010001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000101001010

	dc.w	OBJ_SCENE_PLANT
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1011000101100000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000101001010

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
	dc.l	SHallCollisionStart

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_PARKINGLOT	; south exit
	dc.w	SCENE_ID_SOUTH_CENTER	; north exit
	dc.w	SCENE_ID_POGODAWG	; west exit
	dc.w	SCENE_ID_NSHACK	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0003	; four npc slots

	; by the exit
	dc.w	$0128	; starting x location of npc1
	dc.w	$0128	; starting y location of npc1
	dc.w	DIRECTION_DOWN	; starting direction of npc1
	dc.w	$FFFF	; movement frequency of npc1
	dc.l	NullMovementStart	; location of movement pattern for npc1
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	; by the phone booth
	dc.w	$0104	; starting x location of npc0
	dc.w	$00E0	; starting y location of npc0
	dc.w	DIRECTION_UP	; starting direction of npc0
	dc.w	$FFFF	; movement frequency of npc0
	dc.l	NullMovementStart	; location of movement pattern for npc0
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
