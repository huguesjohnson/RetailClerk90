SceneIntroDay00:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_TITLE

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$0004	; two tilesets

	; tileset 0
	dc.l	TransparentTileStart	; start of scene tiles
	dc.l	TransparentTileEnd	; end of scene tiles

	; tileset 1
	dc.l	TitleLogoTilesStart	; start of logo tiles
	dc.l	TitleLogoTilesEnd	; end of logo tiles

	; tileset 2
	dc.l	TitleMenuBGTilesStart	; start of menu background tiles
	dc.l	TitleMenuBGTilesEnd	; end of menu background tiles

	; tileset 3
	dc.l	TitleBGTilesStart	; start of background tiles
	dc.l	TitleBGTilesEnd	; end of background tiles

	; tileset 4
	dc.l	TitleMallTilesStart	; start of mall tiles
	dc.l	TitleMallTilesEnd	; end of mall tiles


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
	dc.w	$0025	; scenery count
	else
	dc.w	$0024	; scenery count
	endif

	; background - sky, first set of rows
	dc.l	Pattern8x8Row	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000110011	; base pattern
	dc.w	$0003	; repeat 4 times
	dc.l	VDP_VRAM_WRITE_B+$00000000+$00000000	; initial drawing location

	; background - star
	dc.l	Pattern8x8	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000110100	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$00800000+$00020000	; initial drawing location

	; background - star
	dc.l	Pattern8x8	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000110100	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$00000000+$00140000	; initial drawing location

	; background - star
	dc.l	Pattern8x8	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000110100	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$01800000+$00320000	; initial drawing location

	; background - star
	dc.l	Pattern8x8	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000110100	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$00800000+$00440000	; initial drawing location

	; background - large snowflake
	dc.l	Pattern8x8	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000110101	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$01800000+$000A0000	; initial drawing location

	; background - small snowflake
	dc.l	Pattern8x8	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000110110	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$00800000+$00480000	; initial drawing location

	; background - sky, second set of rows
	dc.l	Pattern8x8Row	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000110111	; base pattern
	dc.w	$0003	; repeat 4 times
	dc.l	VDP_VRAM_WRITE_B+$02000000+$00000000	; initial drawing location

	; background - star
	dc.l	Pattern8x8	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111000	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$03800000+$00040000	; initial drawing location

	; background - star
	dc.l	Pattern8x8	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111000	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$02000000+$001C0000	; initial drawing location

	; background - small snowflake
	dc.l	Pattern8x8	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111010	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$03000000+$00400000	; initial drawing location

	; background - small snowflake
	dc.l	Pattern8x8	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111010	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$02000000+$002A0000	; initial drawing location

	; background - large snowflake
	dc.l	Pattern8x8	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111001	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$02000000+$00460000	; initial drawing location

	; background - small snowflake
	dc.l	Pattern8x8	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111010	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$01800000+$000E0000	; initial drawing location

	; background - small snowflake
	dc.l	Pattern8x8	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111010	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$02800000+$00200000	; initial drawing location

	; background - sky, third set of rows
	dc.l	Pattern8x8Row	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111011	; base pattern
	dc.w	$0008	; repeat 9 times
	dc.l	VDP_VRAM_WRITE_B+$04000000+$00000000	; initial drawing location

	; background - small snowflake
	dc.l	Pattern8x8	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111100	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$04000000+$000C0000	; initial drawing location

	; background - small snowflake
	dc.l	Pattern8x8	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111100	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$05000000+$001C0000	; initial drawing location

	; background - small snowflake
	dc.l	Pattern8x8	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111100	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$04800000+$00300000	; initial drawing location

	; background - small snowflake
	dc.l	Pattern8x8	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111100	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$05000000+$00420000	; initial drawing location

	; background - snow
	dc.l	Pattern8x8Row	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111101	; base pattern
	dc.w	$000A	; repeat 11 times
	dc.l	VDP_VRAM_WRITE_B+$08800000+$00000000	; initial drawing location

	; background - snow accent
	dc.l	Pattern16x8	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111110	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$08800000+$00040000	; initial drawing location

	; background - snow accent
	dc.l	Pattern16x8	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000001000000	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$08800000+$000A0000	; initial drawing location

	; background - snow accent
	dc.l	Pattern16x8	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111110	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$09000000+$00120000	; initial drawing location

	; background - snow accent
	dc.l	Pattern16x8	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000001000000	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$09800000+$001C0000	; initial drawing location

	; background - snow accent
	dc.l	Pattern16x8	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111110	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$09800000+$002C0000	; initial drawing location

	; background - snow accent
	dc.l	Pattern16x8	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000001000000	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$09000000+$00320000	; initial drawing location

	; background - snow accent
	dc.l	Pattern16x8	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000000111110	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$08800000+$00400000	; initial drawing location

	; background - snow accent
	dc.l	Pattern16x8	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0000000001000000	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$08800000+$00460000	; initial drawing location

	; mall - background tile
	dc.l	Pattern232x48Row	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0010000001000010	; base pattern
	dc.w	$0005	; repeat 6 times
	dc.l	VDP_VRAM_WRITE_B+$05800000+$00140000	; initial drawing location

	; mall - sign
	dc.l	Pattern16x16	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0010000001000011	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$06000000+$00180000	; initial drawing location

	; mall - door
	dc.l	Pattern32x16	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0010000001000111	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$07800000+$002C0000	; initial drawing location

	; mall - side
	dc.l	Pattern8x48	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0010000001001111	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$05800000+$004E0000	; initial drawing location

	; title - 90
	dc.l	Pattern192x16	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0110000000000001	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_A+$00800000+$00100000	; initial drawing location

	; menu background - new game
	dc.l	PatternTitleMenuBG	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0110000000110001	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$09800000+$003A0000	; initial drawing location

	; menu background - load
	dc.l	PatternTitleMenuBG	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0110000000110001	; base pattern
	dc.w	$0000	; repeat 1 time
	dc.l	VDP_VRAM_WRITE_B+$0A800000+$003A0000	; initial drawing location

	if	_DEBUG_
	; menu background - debug
	dc.l	PatternTitleMenuBG	; location of pattern to load
	;		%pccvhnnnnnnnnnnn
	dc.w	%0110000000110001	; base pattern
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
	dc.w	DIALOG_BASE_TILE+%0110000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$09800000+$003C0000	; initial drawing location

	; load game text
	dc.l	TitleScreenTextLoadGame	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0110000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0A800000+$003C0000	; initial drawing location

	if	_DEBUG_
	; debug text
	dc.l	TitleScreenTextDebug	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0110000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0B800000+$003C0000	; initial drawing location
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
	dc.l	BGM_DayIntro	; location of background music

