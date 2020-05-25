SceneTBooks:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_TBOOKS

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$000A	; tileset count

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	FloorWoodVertTilesStart
	dc.l	FloorWoodVertTilesEnd

	; tileset 2
	dc.l	FrameRoundTilesStart
	dc.l	FrameRoundTilesEnd

	; tileset 3
	dc.l	CounterTopTilesStart
	dc.l	CounterTopTilesEnd

	; tileset 4
	dc.l	CounterTopNorthCornersTilesStart
	dc.l	CounterTopNorthCornersTilesEnd

	; tileset 5
	dc.l	CounterShelvesTilesStart
	dc.l	CounterShelvesTilesEnd

	; tileset 6
	dc.l	TBooksBookcaseTitleTilesStart
	dc.l	TBooksBookcaseTitleTilesEnd

	; tileset 7
	dc.l	TBooksBookcaseAHighTilesStart
	dc.l	TBooksBookcaseAHighTilesEnd

	; tileset 8
	dc.l	TBooksBookcaseALowTilesStart
	dc.l	TBooksBookcaseALowTilesEnd

	; tileset 9
	dc.l	TBooksBookcaseBHighTilesStart
	dc.l	TBooksBookcaseBHighTilesEnd

	; tileset A
	dc.l	TBooksBookcaseBLowTilesStart
	dc.l	TBooksBookcaseBLowTilesEnd

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
	dc.w	$0016	; scenery count

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

	; shelves under counter
	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101010	
	dc.w	$0001	; repeat one time
	dc.l	VDP_VRAM_WRITE_B+$07000000+$001A0000	; initial drawing location

	dc.l	Pattern24x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000101010	
	dc.w	$0001	; repeat one time
	dc.l	VDP_VRAM_WRITE_B+$07000000+$00300000	; initial drawing location

	; counter sides
	dc.l	PatternCounterSide24x40ClosedBottom	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000011101	
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$05000000+$001A0000	; initial drawing location

	dc.l	PatternCounterSide24x40ClosedBottom	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000011101	
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$05000000+$00300000	; initial drawing location

	dc.l	PatternCounterLow112x24ClosedTop	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000011101	
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$03800000+$001A0000	; initial drawing location

	; bookshelves
	dc.l	PatternTBooksBookcaseTitle	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000101101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07800000+$00020000	; initial drawing location

	dc.l	Pattern72x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000110001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$08800000+$00020000	; initial drawing location

	dc.l	Pattern72x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001001100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$0A000000+$00020000	; initial drawing location

	dc.l	PatternTBooksBookcaseTitle	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000101101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$003C0000	; initial drawing location

	dc.l	Pattern72x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000110001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$03000000+$003C0000	; initial drawing location

	dc.l	Pattern72x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001001100	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$04800000+$003C0000	; initial drawing location

	dc.l	PatternTBooksBookcaseTitle	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000101101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$02000000+$00020000	; initial drawing location

	dc.l	Pattern72x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001100111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$03000000+$00020000	; initial drawing location

	dc.l	Pattern72x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000010000010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$04800000+$00020000	; initial drawing location

	dc.l	PatternTBooksBookcaseTitle	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000000101101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$07800000+$003C0000	; initial drawing location

	dc.l	Pattern72x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001100111	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$08800000+$003C0000	; initial drawing location

	dc.l	Pattern72x24	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000010000010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$0A000000+$003C0000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$0003	; text count

	dc.l	StoreSignFiction	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$08000000+$00040000	; initial drawing location

	dc.l	StoreSignCooking	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$08000000+$003E0000	; initial drawing location

	dc.l	StoreSignRomance	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$02800000+$00040000	; initial drawing location

	dc.l	StoreSignHistory	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$02800000+$003E0000	; initial drawing location.

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

	dc.w	OBJ_SCENE_TBOOKS_FICTION
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1000111010001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000100001000

	dc.w	OBJ_SCENE_TBOOKS_ROMANCE
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1000111010001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000010110000

	dc.w	OBJ_SCENE_TBOOKS_HISTORY
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1000111101110000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000010110000

	dc.w	OBJ_SCENE_TBOOKS_COOKING
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1000111101110000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0101000100001000

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

	dc.w	$00A2	; starting x location of npc0
	dc.w	$00DA	; starting y location of npc0
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
