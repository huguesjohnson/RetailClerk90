SceneLegal:

	;---------------------------------------------------------------------------
	; scene ID
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_LEGAL

	;---------------------------------------------------------------------------
	; tiles
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; no tilesets

	;---------------------------------------------------------------------------
	; palettes
	;---------------------------------------------------------------------------
	dc.l	PaletteBlack	; first palette
	dc.l	PaletteText00	; third palette
	dc.l	PaletteText01	; third palette
	dc.l	PaletteText02	; fourth palette

	;---------------------------------------------------------------------------
	; scenery
	;---------------------------------------------------------------------------
	dc.w	$FFFF	; no scenery

	;---------------------------------------------------------------------------
	; text
	;---------------------------------------------------------------------------
	dc.w	$0009	; text count

	dc.l	LegalScreenLine00	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0010000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$03800000	; initial drawing location

	dc.l	LegalScreenLine01	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$06000000	; initial drawing location

	dc.l	LegalScreenLine02	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$07800000	; initial drawing location

	dc.l	LegalScreenLine03	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$08000000	; initial drawing location

	dc.l	LegalScreenLine04	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$08800000	; initial drawing location

	dc.l	LegalScreenLine05	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0A000000	; initial drawing location

	dc.l	LegalScreenLine06	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0A800000	; initial drawing location

	dc.l	LegalScreenLine07	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0B000000	; initial drawing location

	dc.l	LegalScreenLine08	; location of string to display
	dc.w	DIALOG_BASE_TILE+%0100000000000000	; base pattern
	dc.l	VDP_VRAM_WRITE_A+$0C800000	; initial drawing location

	dc.l	LegalScreenLine09	; location of string to display
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
	dc.l	$00000000	; no collision data
	
	;---------------------------------------------------------------------------
	; exits
	;---------------------------------------------------------------------------
	dc.w	SCENE_ID_TITLE	; north exit
	dc.w	SCENE_ID_TITLE	; south exit
	dc.w	SCENE_ID_TITLE	; east exit
	dc.w	SCENE_ID_TITLE	; west exit

	;---------------------------------------------------------------------------
	; NPC locations
	;---------------------------------------------------------------------------
	dc.w	$0000	; one npc slot, which is just a placeholder

	dc.w	$0000	; starting x location of npc
	dc.w	$0000	; starting y location of npc
	dc.w	DIRECTION_LEFT	; starting direction of npc
	dc.w	$FFFF	; movement frequency of npc
	dc.l	NullMovementStart	; location of movement pattern for npc
	dc.w	(NullMovementEnd-NullMovementStart-1)	; pattern length

	;---------------------------------------------------------------------------
	; bgm
	;---------------------------------------------------------------------------
	dc.l	$00000000	; no background music

