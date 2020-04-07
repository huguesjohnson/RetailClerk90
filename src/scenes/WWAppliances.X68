SceneWWAppliances:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_WWAPPLIANCES

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0007	; tileset count

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	FloorTileSmallTilesStart
	dc.l	FloorTileSmallTilesEnd

	; tileset 2
	dc.l	FrameRectTilesStart
	dc.l	FrameRectTilesEnd

	; tileset 3
	dc.l	WWApplianceWallTilesStart
	dc.l	WWApplianceWallTilesEnd

	; tileset 4
	dc.l	WWApplianceFridgeHighTilesStart
	dc.l	WWApplianceFridgeHighTilesEnd

	; tileset 5
	dc.l	WWApplianceFridgeLowTilesStart
	dc.l	WWApplianceFridgeLowTilesEnd

	; tileset 6
	dc.l	WWApplianceFridgeGrayHighTilesStart
	dc.l	WWApplianceFridgeGrayHighTilesEnd

	; tileset 7
	dc.l	WWApplianceFridgeGrayLowTilesStart
	dc.l	WWApplianceFridgeGrayLowTilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteWWFloorWall	; first palette
	dc.l	PaletteWWAppliances00	; second palette
	dc.l	PaletteWWAppliances01	; third palette
	dc.l	PalettePeople	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0010	; scenery count

	; floor
	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001	; base pattern
	dc.w	$0006	; repeat 7 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; shelves
	dc.l	PatternShelves24x64
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100101	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A+$00800000	; initial drawing location

	; north wall
	dc.l	PatternFrameTopLongLeft	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000010001	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; right wall
	dc.l	PatternFrameSideClosedRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000+$004E0000	; initial drawing location

	; south wall
	dc.l	PatternFrameBottomClosedLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; fridges
	dc.l	Pattern24x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001001100	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A+$03000000+$00420000	; initial drawing location

	dc.l	Pattern24x24
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001010010	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A+$04000000+$00420000	; initial drawing location

	dc.l	Pattern24x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001001100	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A+$03000000+$00360000	; initial drawing location

	dc.l	Pattern24x24
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001010010	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A+$04000000+$00360000	; initial drawing location

	dc.l	Pattern24x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001001100	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A+$03000000+$002A0000	; initial drawing location

	dc.l	Pattern24x24
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001010010	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A+$04000000+$002A0000	; initial drawing location

	dc.l	Pattern24x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000111101	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A+$03000000+$001E0000	; initial drawing location

	dc.l	Pattern24x24
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001000011	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A+$04000000+$001E0000	; initial drawing location

	dc.l	Pattern24x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000111101	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A+$03000000+$00120000	; initial drawing location

	dc.l	Pattern24x24
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001000011	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A+$04000000+$00120000	; initial drawing location

	dc.l	Pattern24x16
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000111101	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A+$03000000+$00060000	; initial drawing location

	dc.l	Pattern24x24
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001000011	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A+$04000000+$00060000	; initial drawing location

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
	dc.w	OBJ_SCENE_WWAPPLIANCES_WALL
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1100100010001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000010001000

	dc.w	OBJ_SCENE_WWAPPLIANCES_WALL
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1100100011101100
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000010001000

	dc.w	OBJ_SCENE_WWAPPLIANCES_WALL
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1111111110000110
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000010001000

	dc.w	OBJ_SCENE_WWAPPLIANCES_FRIDGE
	; 		%wwwwwwwxxxxxxxxx %wwwwwwwxxxxxxxxx
	dc.w	%0011011000010000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy %hhhhhhhyyyyyyyyy
	dc.w	%0010000001000000+%0000000010000000

	dc.w	OBJ_SCENE_WWAPPLIANCES_FRIDGE
	; 		%wwwwwwwxxxxxxxxx %wwwwwwwxxxxxxxxx
	dc.w	%0011011001000000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy %hhhhhhhyyyyyyyyy
	dc.w	%0010000001000000+%0000000010000000

	dc.w	OBJ_SCENE_WWAPPLIANCES_FRIDGE
	; 		%wwwwwwwxxxxxxxxx %wwwwwwwxxxxxxxxx
	dc.w	%0011011001110000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy %hhhhhhhyyyyyyyyy
	dc.w	%0010000001000000+%0000000010000000

	dc.w	OBJ_SCENE_WWAPPLIANCES_FRIDGE
	; 		%wwwwwwwxxxxxxxxx %wwwwwwwxxxxxxxxx
	dc.w	%0011011010100000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy %hhhhhhhyyyyyyyyy
	dc.w	%0010000001000000+%0000000010000000

	dc.w	OBJ_SCENE_WWAPPLIANCES_FRIDGE
	; 		%wwwwwwwxxxxxxxxx %wwwwwwwxxxxxxxxx
	dc.w	%0011011011010000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy %hhhhhhhyyyyyyyyy
	dc.w	%0010000001000000+%0000000010000000

	dc.w	OBJ_SCENE_WWAPPLIANCES_FRIDGE
	; 		%wwwwwwwxxxxxxxxx %wwwwwwwxxxxxxxxx
	dc.w	%0011011100000000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy %hhhhhhhyyyyyyyyy
	dc.w	%0010000001000000+%0000000010000000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.l	WWAppliancesCollisionStart

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; south exit
	dc.w	$FFFF	; north exit
	dc.w	SCENE_ID_WWTV	; west exit
	dc.w	$FFFF	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0003	; four npc slots

	dc.w	$0080+$009E	; starting x location of npc0
	dc.w	$0080+$0054	; starting y location of npc0
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
