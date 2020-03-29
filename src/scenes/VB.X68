SceneVB:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_VB

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$000F	; tileset count

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	FloorCarpetTilesStart
	dc.l	FloorCarpetTilesEnd

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
	dc.l	CounterTopTilesStart
	dc.l	CounterTopTilesEnd

	; tileset 6
	dc.l	VBMagazinesTilesStart
	dc.l	VBMagazinesTilesEnd

	; tileset 7
	dc.l	VBGamesTilesStart
	dc.l	VBGamesTilesEnd

	; tileset 8
	dc.l	VBGenHighTilesStart
	dc.l	VBGenHighTilesEnd

	; tileset 9
	dc.l	VBGenLowTilesStart
	dc.l	VBGenLowTilesEnd

	; tileset A
	dc.l	VBPCHighTilesStart
	dc.l	VBPCHighTilesEnd

	; tileset B
	dc.l	VBPCLowTilesStart
	dc.l	VBPCLowTilesEnd

	; tileset C
	dc.l	VBGBHighTilesStart
	dc.l	VBGBHighTilesEnd

	; tileset D
	dc.l	VBGBLowTilesStart
	dc.l	VBGBLowTilesEnd

	; tileset E
	dc.l	VBTGHighTilesStart
	dc.l	VBTGHighTilesEnd

	; tileset F
	dc.l	VBTGLowTilesStart
	dc.l	VBTGLowTilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteVB00	; first palette
	dc.l	PaletteVB01	; second palette
	dc.l	PaletteVB02	; third palette
	dc.l	PalettePeople	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0014	; scenery count

	; floor
	dc.l	PatternFloor	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001	; base pattern
	dc.w	$001F	; repeat 32 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; top shelf
	dc.l	PatternShelvesH	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00800000	; initial drawing location

	; middle shelf
	dc.l	PatternShelvesM	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000111110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$01000000	; initial drawing location

	; low shelf
	dc.l	PatternShelvesL	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000111110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$01800000	; initial drawing location

	; north wall
	dc.l	PatternFrameTop
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; right wall
	dc.l	PatternFrameSideClosedRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00800000+$004E0000	; initial drawing location

	; left wall
	dc.l	PatternFrameSideClosedLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00800000	; initial drawing location

	; store front
	dc.l	PatternStoreFront
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000000101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0C000000	; initial drawing location

	; shelves under counter
	dc.l	Pattern80x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000110100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00220000+$05000000	; initial drawing location

	dc.l	Pattern80x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000110100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00220000+$05800000	; initial drawing location

	; counter side
	dc.l	PatternCounterSide24x64OpenLowerLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00300000+$01800000	; initial drawing location

	; counter high
	dc.l	PatternCounterHigh56x8OpenLowerRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000101001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00220000+$03800000	; initial drawing location

	; counter low
	dc.l	PatternCounterLow56x24OpenTopRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00220000+$04000000	; initial drawing location

	; genesis rack - low
	dc.l	PatternVBGenLow	; location of first pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001011010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0A000000+$00020000	; initial drawing location

	; genesis rack - high
	dc.l	PatternVBGenHigh	; location of first pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001000001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07800000+$00020000	; initial drawing location

	; pc games rack - low
	dc.l	PatternVBPCLow	; location of first pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000010001101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05000000+$00020000	; initial drawing location

	; pc games rack - high
	dc.l	PatternVBPCHigh	; location of first pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001101101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02800000+$00020000	; initial drawing location

	; tg rack - low
	dc.l	PatternVBTGLow	; location of first pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000011001110	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0A000000+$00400000	; initial drawing location

	; tg rack - high
	dc.l	PatternVBTGHigh	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000010111010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07800000+$00400000	; initial drawing location

	; gb rack - low
	dc.l	PatternVBGBLow	; location of first pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000010110010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$05000000+$00400000	; initial drawing location

	; gb rack - high
	dc.l	PatternVBGBHigh	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000010100000	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02800000+$00400000	; initial drawing location

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
	dc.w	OBJ_SCENE_VB_8BIT
	; x0=136 width=106 = 1101010 010001000 = D488
	dc.w	$D488
	; height=16 [0010000] y0=136 [010001000] 
	dc.w	%0010000010001000

	dc.w	OBJ_SCENE_VB_8BIT
	; x0=242 width=79 = 1001111 011110010  = 9EF2
	dc.w	$9EF2
	; height=16 [0010000] y0=136 [010001000] 
	dc.w	%0010000010001000

	dc.w	OBJ_SCENE_VB_8BIT
	; x0=351 width=90 = 1011010 101011111 = B55F
	dc.w	$B55F
	; height=16 [0010000] y0=136 [010001000] 
	dc.w	%0010000010001000

	dc.w	OBJ_SCENE_VB_MAGS
	; width=8 [1010000] x0=264 [100001000]
	dc.w	%1010000100001000
	; height=8 [0001000] y0=212 [011010100]
	dc.w	%0001000011010100

	dc.w	OBJ_SCENE_VB_GEN
	; width=40 [0101000] x0=136 [010001000]
	dc.w	%0101000010001000
	; height=32 [0100000] y0=272 [100010000]
	dc.w	%0100000100010000

	dc.w	OBJ_SCENE_VB_TG
	; width=40 [0101000] x0=390 [110000110]
	dc.w	%0101000110000110
	; height=32 [0100000] y0=272 [100010000]
	dc.w	%0100000100010000

	dc.w	OBJ_SCENE_VB_GB
	; width=40 [0101000] x0=390 [110000110]
	dc.w	%0101000110000110
	; height=32 [0100000] y0=192 [011000000]
	dc.w	%0100000011000000

	dc.w	OBJ_SCENE_VB_PC
	; width=40 [0101000] x0=136 [010001000]
	dc.w	%0101000010001000
	; height=32 [0100000] y0=192 [011000000]
	dc.w	%0100000011000000

	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000

	dc.w	OBJ_NOTHING
	dc.w	$0000
	dc.w	$0000

	;---------------------------------------------------------------------------
	; collision data
	;---------------------------------------------------------------------------
	dc.l	VBCollisionStart

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_WWHALL	; south exit
	dc.w	$FFFF	; north exit
	dc.w	$FFFF	; west exit
	dc.w	$FFFF	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0003	; four npc slots

	dc.w	$0128	; starting x location of npc0
	dc.w	$00A0	; starting y location of npc0
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
