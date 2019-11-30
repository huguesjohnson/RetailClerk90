SceneTitle:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_TITLE

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0003	; three tilesets

	; tileset 0
	dc.l	TransparentTileStart	; start of scene tiles
	dc.l	TransparentTileEnd	; end of scene tiles

	; tileset 1
	dc.l	TitleBackgroundTilesStart	; start of background tiles
	dc.l	TitleBackgroundTilesEnd	; end of background tiles

	; tileset 2
	dc.l	TitleLogoTilesStart	; start of logo tiles
	dc.l	TitleLogoTilesEnd	; end of logo tiles

	; tileset 3
	dc.l	TitleMenuBGTilesStart	; start of menu background tiles
	dc.l	TitleMenuBGTilesEnd	; end of menu background tiles

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteTitle00	; first palette
	dc.l	PaletteTitle01	; second palette
	dc.l	PaletteTitle02	; third palette
	dc.l	PaletteTitle03	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	if	_DEBUG_
	dc.w	$0005	; scenery count
	else
	dc.w	$0004	; scenery count
	endif

	; background
	dc.l	PatternTitleBackground	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000000001	; base pattern
	dc.w	$0003	; repeat 4 times
	dc.l	VDP_VRAM_WRITE_B+$00000000+$00000000	; initial drawing location

	; title - 89
	dc.l	Pattern184x16	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0010000000000101	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_A+$05000000+$00100000	; initial drawing location

	; menu background - new game
	dc.l	PatternTitleMenu	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0010000000110011	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$09800000+$003A0000	; initial drawing location

	; menu background - load
	dc.l	PatternTitleMenu	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0010000000110011	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$0A800000+$003A0000	; initial drawing location

	if	_DEBUG_
	; menu background - debug
	dc.l	PatternTitleMenu	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0010000000110011	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$0B800000+$003A0000	; initial drawing location
	endif

	; footer text frame
	dc.l	PatternTitleFooter	; location of pattern to load
	dc.w	DIALOG_BASE_TILE+%0110000000000000	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_A+$0C000000	; initial drawing location

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	if	_DEBUG_
	dc.w	$0003	; text count
	else
	dc.w	$0002	; text count
	endif

	; new game text
	dc.l	TitleScreenTextNewGame	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$09800000+$003E0000	; initial drawing location

	; load game text
	dc.l	TitleScreenTextLoadGame	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0A800000+$003E0000	; initial drawing location

	if	_DEBUG_
	; debug text
	dc.l	TitleScreenTextDebug	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0B800000+$003E0000	; initial drawing location
	endif

	; footer
	dc.l	TitleScreenTextFooter	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0110000000000000	; base pattern
	; this will need to be shifted around a little while the build name changes 
	dc.l	VDP_VRAM_WRITE_A+$0C800000+$00020000	; initial drawing location

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
	dc.w	SCENE_ID_VB	; north exit
	dc.w	SCENE_ID_VB	; south exit
	dc.w	SCENE_ID_VB	; east exit
	dc.w	SCENE_ID_VB	; west exit

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
	dc.l	$00000000	; no background music
;	dc.l	BGM_Title	; location of background music

