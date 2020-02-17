SceneIntroDay03:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_INTRO_DAY03

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0002	; three tilesets

	; tileset 0
	dc.l	TransparentTileStart
	dc.l	TransparentTileEnd

	; tileset 1
	dc.l	FloorCarpetBlacklightTilesStart
	dc.l	FloorCarpetBlacklightTilesEnd

	; tileset 2
	dc.l	TitleLogoTilesStart
	dc.l	TitleLogoTilesEnd

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteDayIntro00	; first palette
	dc.l	PaletteDayIntro01	; second palette
	dc.l	PaletteDayIntro02	; third palette
	dc.l	PaletteTitle03	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$0001	; scenery count

	; background
	dc.l	Pattern32x32Tile	; location of pattern to load
	; 		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001	; base pattern
	dc.w	$0002	; repeat 7 times
	dc.l	VDP_VRAM_WRITE_B	; initial drawing location


	; title - 90
	dc.l	Pattern192x16	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0110000000010001	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_A+$02800000+$00100000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$0007	; text count

	dc.l	Day03IntroText	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$06000000	; initial drawing location

	dc.l	Day03IntroTip0	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$07000000	; initial drawing location

	dc.l	Day03IntroTip1	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$08000000	; initial drawing location

	dc.l	Day03IntroTip2	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$09000000	; initial drawing location

	dc.l	Day03IntroTip3	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0A000000	; initial drawing location

	dc.l	Day03IntroTip4	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0B000000	; initial drawing location

	dc.l	Day03IntroTip5	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0C000000	; initial drawing location

	dc.l	Day03IntroTip6	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0D000000	; initial drawing location

	;---------------------------------------------------------------------------
	; objects
	;---------------------------------------------------------------------------
	dc.w	OBJ_LIST_LENGTH-1	; object count

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
	dc.w	$0000	; no collision data
	
	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_DENIMCOUNTRY	; north exit
	dc.w	SCENE_ID_DENIMCOUNTRY	; south exit
	dc.w	SCENE_ID_DENIMCOUNTRY	; east exit
	dc.w	SCENE_ID_DENIMCOUNTRY	; west exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0000	; one npc slot, which is just a placeholder

	dc.w	$0000	; starting x location of npc2
	dc.w	$0000	; starting y location of npc2
	dc.w	DIRECTION_LEFT	; starting direction of npc2
	dc.w	$FFFF	; movement frequency of npc2
	dc.l	NullMovementStart	; location of movement pattern for npc2
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	BGM_DayIntro	; location of background music

