SceneWWAudio:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_WWAUDIO

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
	dc.l	WWAudioWallTilesStart
	dc.l	WWAudioWallTilesEnd

	; tileset 4
	dc.l	WWAudioStereoWoodHighTilesStart
	dc.l	WWAudioStereoWoodHighTilesEnd

	; tileset 5
	dc.l	WWAudioStereoWoodLowTilesStart
	dc.l	WWAudioStereoWoodLowTilesEnd

	; tileset 6
	dc.l	WWAudioStereoBlackHighTilesStart
	dc.l	WWAudioStereoBlackHighTilesEnd

	; tileset 7
	dc.l	WWAudioStereoBlackLowTilesStart
	dc.l	WWAudioStereoBlackLowTilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteWWFloorWall	; first palette
	dc.l	PaletteWWAudio00	; second palette
	dc.l	PaletteWWAudio01	; third palette
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

	; shelves
	dc.l	PatternShelvesHLWide	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000100101	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_B+$00800000	; initial drawing location

	dc.l	PatternShelvesMWide	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000100101	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_B+$01000000	; initial drawing location

	dc.l	PatternShelvesHLWide	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000000100101	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_B+$01800000	; initial drawing location

	; north wall
	dc.l	PatternFrameTopLongRight	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000010001	; base pattern
	dc.w	$0000	; repeat 1 times
	dc.l	VDP_VRAM_WRITE_A	; initial drawing location

	; left wall
	dc.l	PatternFrameSideClosedLeft
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00800000	; initial drawing location

	; south wall
	dc.l	PatternFrameBottom
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1000000000010001	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$0D800000	; initial drawing location

	; wood stereo
	dc.l	PatternWWAudioStereoWoodHigh	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1010000000101011	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00080000+$03000000	; initial drawing location

	dc.l	PatternWWAudioStereoWoodLow	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0010000000110101	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00080000+$04000000	; initial drawing location

	; black stereo
	dc.l	PatternWWAudioStereoBlackHigh	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001001010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001E0000+$03800000	; initial drawing location

	dc.l	PatternWWAudioStereoBlackLow	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001010010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$001E0000+$04800000	; initial drawing location

	; black stereo
	dc.l	PatternWWAudioStereoBlackHigh	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%1100000001001010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00320000+$03800000	; initial drawing location

	dc.l	PatternWWAudioStereoBlackLow	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0100000001010010	; base pattern
	dc.w	$0000	; no repeat
	dc.l	VDP_VRAM_WRITE_A+$00320000+$04800000	; initial drawing location

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
	dc.w	OBJ_SCENE_WWAUDIO_WALL
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1100100010001000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000010001000

	dc.w	OBJ_SCENE_WWAUDIO_WALL
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1100100011101100
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000010001000

	dc.w	OBJ_SCENE_WWAUDIO_WALL
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%1111111110000110
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0010000010001000

	dc.w	OBJ_SCENE_WWAUDIO_WOODSTEREO
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0111000010011110
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011000000

	dc.w	OBJ_SCENE_WWAUDIO_BLACKSTEREO
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0101111011111000
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011000000

	dc.w	OBJ_SCENE_WWAUDIO_BLACKSTEREO
	; 		%wwwwwwwxxxxxxxxx
	dc.w	%0110000101000110
	; 		%hhhhhhhyyyyyyyyy
	dc.w	%0011000011000000

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
	dc.l	WWAudioCollisionStart

	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; south exit
	dc.w	$FFFF	; north exit
	dc.w	$FFFF	; west exit
	dc.w	SCENE_ID_WWTV	; east exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0003	; four npc slots

	dc.w	$0080+$0098	; starting x location of npc0
	dc.w	$0080+$004E	; starting y location of npc0
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
