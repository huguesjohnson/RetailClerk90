SceneWWCheckout:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_WWCHECKOUT

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0008	; tileset count

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
	dc.l	GlassTilesStart
	dc.l	GlassTilesEnd

	; tileset 4 - for entryway
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 5
	dc.l	CounterTopTilesStart
	dc.l	CounterTopTilesEnd

	; tileset 6
	dc.l	CounterShelvesTilesStart
	dc.l	CounterShelvesTilesEnd

	; tileset 7
	dc.l	LaserDiscsHighTilesStart
	dc.l	LaserDiscsHighTilesEnd

	; tileset 8
	dc.l	LaserDiscsLowTilesStart
	dc.l	LaserDiscsLowTilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteWWFloorWall	; first palette
	dc.l	PaletteWWCheckout00	; second palette
	dc.l	PaletteWWCheckout01	; third palette
	dc.l	PalettePeople	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$000C	; scenery count

	; floor
	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001	; base pattern
	dc.w	$0006	; repeat 7 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; right wall
	dc.l	PatternFrameSideClosedRight
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$004E0000	; initial drawing location

	; left wall
	dc.l	PatternFrameSideClosedLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location

	; store front
	dc.l	PatternStoreFront
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0C000000	; initial drawing location

	; shelves under counter
	dc.l	Pattern3Tile208x8	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001000000	; base pattern
	dc.w	$0001	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$000E0000+$08000000	; initial drawing location

	; counter
	dc.l	PatternCounterHigh208x8Closed	; location of pattern
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000110101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$000E0000+$06800000	; initial drawing location

	dc.l	PatternCounterLow208x24Closed	; location of pattern
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000110101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$000E0000+$07000000	; initial drawing location

	; laserdisc - left high
	dc.l	PatternLaserDiscsHigh	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001000011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00080000+$02000000	; initial drawing location

	; laserdisc - left low
	dc.l	PatternLaserDiscsLow	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001010011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00080000+$03000000	; initial drawing location

	; laserdisc - center high
	dc.l	PatternLaserDiscsHigh	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001000011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00200000+$02000000	; initial drawing location

	; laserdisc - center low
	dc.l	PatternLaserDiscsLow	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001010011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00200000+$03000000	; initial drawing location

	; laserdisc - right high
	dc.l	PatternLaserDiscsHigh	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000001000011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00380000+$02000000	; initial drawing location

	; laserdisc - right low
	dc.l	PatternLaserDiscsLow	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000001010011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_B+$00380000+$03000000	; initial drawing location

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
	dc.w	OBJ_SCENE_WWCHECKOUT_LASERDISCS
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0111110010100000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011100010100100

	dc.w	OBJ_SCENE_WWCHECKOUT_LASERDISCS
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0111110100000000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011100010100100

	dc.w	OBJ_SCENE_WWCHECKOUT_LASERDISCS
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0111110101100000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011100010100100

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
	dc.l	WWCheckoutCollisionStart

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_CENTER	; south exit
	dc.w	SCENE_ID_WWTV	; north exit
	dc.w	$FFFF	; west exit
	dc.w	$FFFF	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0003	; four npc slots

	dc.w	$00E8	; starting x location of npc0
	dc.w	$00D0	; starting y location of npc0
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
