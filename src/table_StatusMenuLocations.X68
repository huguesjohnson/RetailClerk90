;*********************************************************
; THESE WILL CHANGE IF THE MENU SCREEN CHANGES
;*********************************************************
; the maximum number of navigation items per menu page
MenuPageMaxNavItem:
	; Map
	dc.w	$000B
	; Status
	dc.w	$0007
	; Data
	dc.w	$000B
	; Help
	dc.w	$0003

StatusNavigationTable:
	; item 0
	dc.w	$0080+$00B0	; y
	dc.w	$0080+$0010	; x
	; item 1
	dc.w	$0080+$00B8	; y
	dc.w	$0080+$0010	; x
	; item 2
	dc.w	$0080+$00C0	; y
	dc.w	$0080+$0010	; x
	; item 3
	dc.w	$0080+$00C8	; y
	dc.w	$0080+$0010	; x

; locations for the navigation menu selector
MenuNavigationTable:
	; Map
	dc.w	$0080+$0008	; y
	dc.w	$0080+$0018	; x
	; Status
	dc.w	$0080+$0008	; y
	dc.w	$0080+$0060; x
	; Data
	dc.w	$0080+$0008	; y
	dc.w	$0080+$00B0; x
	; Help
	dc.w	$0080+$0008	; y
	dc.w	$0080+$0100	; y

DataNavigationTable:
	; save 0
	dc.w	$0080+$0038	; y
	dc.w	$0080+$0048	; x
	; save 1
	dc.w	$0080+$0040	; y
	dc.w	$0080+$0048	; x
	; save 2
	dc.w	$0080+$0048	; y
	dc.w	$0080+$0048	; x
	; save 3
	dc.w	$0080+$0050	; y
	dc.w	$0080+$0048	; x
	; load 0
	dc.w	$0080+$0088	; y
	dc.w	$0080+$0048	; x
	; load 1
	dc.w	$0080+$0090	; y
	dc.w	$0080+$0048	; x
	; load 2
	dc.w	$0080+$0098	; y
	dc.w	$0080+$0048	; x
	; load 3
	dc.w	$0080+$00A0	; y
	dc.w	$0080+$0048	; x

MapNavigationTable:
	; fast travel 0
	dc.w	$0080+$0098	; y
	dc.w	$0080+$00B0	; x
	; fast travel 1
	dc.w	$0080+$00A0	; y
	dc.w	$0080+$00B0	; x
	; fast travel 2
	dc.w	$0080+$00A8	; y
	dc.w	$0080+$00B0	; x
	; fast travel 3
	dc.w	$0080+$00B0	; y
	dc.w	$0080+$00B0	; x
	; fast travel 4
	dc.w	$0080+$00B8	; y
	dc.w	$0080+$00B0	; x
	; fast travel 5
	dc.w	$0080+$00C0	; y
	dc.w	$0080+$00B0	; x
	; fast travel 6
	dc.w	$0080+$00C8	; y
	dc.w	$0080+$00B0	; x
	; fast travel 7
	dc.w	$0080+$00D0	; y
	dc.w	$0080+$00B0	; x

; locations for the "you are here" map
MenuMapIconLocationTable:
	; SCENE_ID_VB=$0000
	dc.l	VDP_VRAM_WRITE_A+$00120000+$03800000

	; SCENE_ID_WWHALL=$0001
	dc.l	VDP_VRAM_WRITE_A+$00120000+$04800000

	; SCENE_ID_WEHALL=$0002
	dc.l	VDP_VRAM_WRITE_A+$00180000+$04800000

	; SCENE_ID_CENTER=$0003
	dc.l	VDP_VRAM_WRITE_A+$00200000+$04800000

	; SCENE_ID_SHALL=$0004
	dc.l	VDP_VRAM_WRITE_A+$001E0000+$06800000

	; SCENE_ID_CAVERN_BACKROOM=$0005
	dc.l	VDP_VRAM_WRITE_A+$002C0000+$03000000

	; SCENE_ID_EWHALL=$0006
	dc.l	VDP_VRAM_WRITE_A+$00260000+$04800000

	; SCENE_ID_EEHALL=$0007
	dc.l	VDP_VRAM_WRITE_A+$002C0000+$04800000

	; SCENE_ID_DENIMCOUNTRY=$0008
	dc.l	VDP_VRAM_WRITE_A+$00260000+$05000000

	; SCENE_ID_CHECKERS=$0009
	dc.l	VDP_VRAM_WRITE_A+$00260000+$03800000

	; SCENE_ID_TLODGE=$000A
	dc.l	VDP_VRAM_WRITE_A+$002C0000+$05000000

	; SCENE_ID_CAVERN=$000B
	dc.l	VDP_VRAM_WRITE_A+$002C0000+$03800000

	; SCENE_ID_SVIDEO=$000C
	dc.l	VDP_VRAM_WRITE_A+$00300000+$04800000

	; SCENE_ID_NSHACK=$000D
	dc.l	VDP_VRAM_WRITE_A+$00260000+$06800000

	; SCENE_ID_POGODAWG=$000E
	dc.l	VDP_VRAM_WRITE_A+$00180000+$06800000

	; SCENE_ID_CPLANET=$000F
	dc.l	VDP_VRAM_WRITE_A+$00180000+$03800000

	; SCENE_ID_CNOW=$0010
	dc.l	VDP_VRAM_WRITE_A+$00180000+$05000000

	; SCENE_ID_TBOOKS=$0011
	dc.l	VDP_VRAM_WRITE_A+$00120000+$05000000

	; SCENE_ID_FCBCHECKOUT=$0012
	dc.l	VDP_VRAM_WRITE_A+$000C0000+$05800000

	; SCENE_ID_FCBFIREARMS=$0013
	dc.l	VDP_VRAM_WRITE_A+$000C0000+$03800000

	; SCENE_ID_FCBFISHING=$0014
	dc.l	VDP_VRAM_WRITE_A+$00080000+$05800000

	; SCENE_ID_FCBCAMPING=$0015
	dc.l	VDP_VRAM_WRITE_A+$00080000+$03800000

	; SCENE_ID_SOUTH_CENTER=$0016
	dc.l	VDP_VRAM_WRITE_A+$001E0000+$05800000

	; SCENE_ID_WWCHECKOUT=$0017
	dc.l	VDP_VRAM_WRITE_A+$00200000+$03000000

	; SCENE_ID_WWTV=$0018
	dc.l	VDP_VRAM_WRITE_A+$00200000+$02800000

	; SCENE_ID_WWAUDIO=$0019
	dc.l	VDP_VRAM_WRITE_A+$001C0000+$02800000

	; SCENE_ID_WWAPPLIANCES=$001A
	dc.l	VDP_VRAM_WRITE_A+$00220000+$02800000

	; SCENE_ID_BASEMENTWDORM=$001B
	dc.l	VDP_VRAM_WRITE_A+$003C0000+$08000000

	; SCENE_ID_BASEMENTMDORM=$001C
	dc.l	VDP_VRAM_WRITE_A+$00420000+$07000000

	; SCENE_ID_BASEMENTCAFE=$001D
	dc.l	VDP_VRAM_WRITE_A+$003C0000+$07000000

	; SCENE_ID_BASEMENTOFFICE=$001E
	dc.l	VDP_VRAM_WRITE_A+$003C0000+$05800000

FastTravelSceneIDTable:
	dc.w	SCENE_ID_WWHALL
	dc.w	SCENE_ID_EEHALL
	dc.w	SCENE_ID_WWCHECKOUT
	dc.w	SCENE_ID_SOUTH_CENTER
	dc.w	SCENE_ID_CAVERN
	dc.w	SCENE_ID_DENIMCOUNTRY
	dc.w	SCENE_ID_TBOOKS
	dc.w	SCENE_ID_SHALL


