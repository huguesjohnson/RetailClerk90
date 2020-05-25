SceneCavernBackroom:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_CAVERN_BACKROOM

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$000D	; tileset count

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	FloorCarpetBlacklightTilesStart
	dc.l	FloorCarpetBlacklightTilesEnd

	; tileset 2
	dc.l	FrameRectTilesStart
	dc.l	FrameRectTilesEnd

	; tileset 3
	dc.l	GlassTilesStart
	dc.l	GlassTilesEnd

	; tileset 4 - for entryway
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 5
	dc.l	CavernSignTilesStart
	dc.l	CavernSignTilesEnd

	; tileset 6
	dc.l	CavernBackroomDeadArcadeBase00TilesStart
	dc.l	CavernBackroomDeadArcadeBase00TilesEnd

	; tileset 7
	dc.l	CavernBackroomDeadArcadeBase01TilesStart
	dc.l	CavernBackroomDeadArcadeBase01TilesEnd

	; tileset 8
	dc.l	CavernBackroomDeadArcadeBase02TilesStart
	dc.l	CavernBackroomDeadArcadeBase02TilesEnd

	; tileset 9
	dc.l	CavernBackroomDeadArcadeTop00TilesStart
	dc.l	CavernBackroomDeadArcadeTop00TilesEnd

	; tileset A
	dc.l	CavernBackroomDeadArcadeTop01TilesStart
	dc.l	CavernBackroomDeadArcadeTop01TilesEnd

	; tileset B
	dc.l	CavernBackroomDeadArcadeTop02TilesStart
	dc.l	CavernBackroomDeadArcadeTop02TilesEnd

	; tileset C
	dc.l	LadderTopTilesStart
	dc.l	LadderTopTilesEnd
	
	; tileset D
	dc.l	LadderTopFrameTilesStart
	dc.l	LadderTopFrameTilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteCavernBackroom00	; first palette
	dc.l	PaletteCavernBackroom01	; second palette
	dc.l	PaletteCavernBackroom02	; third palette
	dc.l	PalettePeople	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$001F	; scenery count

	; floor
	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001	; base pattern
	dc.w	$0006	; repeat 7 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; north wall
	dc.l	PatternFrameTop
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; right wall
	dc.l	PatternFrameSideClosedRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00800000+$004E0000	; initial drawing location

	; left wall
	dc.l	PatternFrameSideClosedLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00800000	; initial drawing location

	; south wall - left side
	dc.l	PatternFrameBottomOpenLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; south wall - right side
	dc.l	PatternFrameBottomOpenRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000+$00360000	; initial drawing location

	; ladder frame
	dc.l	Pattern40x40	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000010010000
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00800000+$00440000	; initial drawing location

	; ladder
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000010000111
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$01000000+$00460000	; initial drawing location

	; dead arcade cabinets

	; pattern 0 - palette 0 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000001101100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00080000+$01800000	; initial drawing location

	; pattern 0 - palette 0 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001110010
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00080000+$02800000	; initial drawing location

	; pattern 0 - palette 0 - base
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001010001
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00080000+$03000000	; initial drawing location

	; pattern 0 - palette 0 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000001101100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00460000+$03800000	; initial drawing location

	; pattern 0 - palette 0 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001110010
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00460000+$04800000	; initial drawing location

	; pattern 0 - palette 0 - base
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001010001
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00460000+$05000000	; initial drawing location

	; pattern 1 - palette 1 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001110101
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00380000+$04800000	; initial drawing location

	; pattern 1 - palette 1 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001111011
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00380000+$05800000	; initial drawing location

	; pattern 1 - palette 1 - base
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001011010
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00380000+$06000000	; initial drawing location

	; pattern 1 - palette 1 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001110101
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00040000+$09800000	; initial drawing location

	; pattern 1 - palette 1 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001111011
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00040000+$0A800000	; initial drawing location

	; pattern 1 - palette 1 - base
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001011010
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00040000+$0B000000	; initial drawing location

	; pattern 2 - palette 2 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001111110
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$04000000+$00140000	; initial drawing location

	; pattern 2 - palette 2 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000010000100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05000000+$00140000	; initial drawing location

	; pattern 2 - palette 2 - base
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001100011
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05800000+$00140000	; initial drawing location

	; pattern 2 - palette 0 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000001111110
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$01000000+$002A0000	; initial drawing location

	; pattern 2 - palette 0 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000010000100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$002A0000	; initial drawing location

	; pattern 2 - palette 0 - base
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001100011
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02800000+$002A0000	; initial drawing location

	; pattern 2 - palette 2 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001111110
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07800000+$00420000	; initial drawing location

	; pattern 2 - palette 2 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000010000100
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$08800000+$00420000	; initial drawing location

	; pattern 2 - palette 2 - base
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001100011
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$09000000+$00420000	; initial drawing location

	; pattern 1 - palette 0 - high
	dc.l	Pattern24x16	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000001110101
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$01800000+$001E0000	; initial drawing location

	; pattern 1 - palette 0 - low
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001111011
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02800000+$001E0000	; initial drawing location

	; pattern 1 - palette 0 - base
	dc.l	Pattern24x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000001011010
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$03000000+$001E0000	; initial drawing location

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
	dc.w	OBJ_SCENE_DEAD_ARCADE_GAME
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011010000001101+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011111010100001+%0000000010000000

	dc.w	OBJ_SCENE_DEAD_ARCADE_GAME
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011010000011101+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011111000100001+%0000000010000000

	dc.w	OBJ_SCENE_DEAD_ARCADE_GAME
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011010001001101+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011111001001001+%0000000010000000

	dc.w	OBJ_SCENE_DEAD_ARCADE_GAME
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011010001110101+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011111000100010+%0000000010000000

	dc.w	OBJ_SCENE_DEAD_ARCADE_GAME
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011010010101000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011111000011001+%0000000010000000

	dc.w	OBJ_SCENE_DEAD_ARCADE_GAME
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011010011100000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011111001010001+%0000000010000000

	dc.w	OBJ_SCENE_DEAD_ARCADE_GAME
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011010100001000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011111010000001+%0000000010000000

	dc.w	OBJ_SCENE_DEAD_ARCADE_GAME
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0011010100011000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011111001000001+%0000000010000000

	dc.w	OBJ_SCENE_CAVERN_BACKROOM_LADDER
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0100100100010110+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000000001000+%0000000010000000

	dc.w	OBJ_NOTHING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0000000000000000+%0000000010000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0000000000000000+%0000000010000000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.l	CavernBackroomCollisionStart

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_CAVERN	; south exit
	dc.w	$FFFF	; north exit
	dc.w	$FFFF	; west exit
	dc.w	$FFFF	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0003	; four npc slots

	dc.w	$00CC	; starting x location of npc0
	dc.w	$00F0	; starting y location of npc0
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
