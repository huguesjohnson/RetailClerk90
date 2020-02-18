;*******************************************************************************
; Main code file for RetailClerk90
;
; Build this using something like: 
;	vasmm68k_mot -o RetailClerk90.bin -Fbin RetailClerk90.X68
;
; Visit http://HuguesJohnson.com/ for random articles about this project.
; 
; General program notes:
; 	-there is a lot of copy and paste code from Retail Clerk '89
; 	-there are a lot of opportunities to optimize this code
;*******************************************************************************

;*******************************************************************************
; constants
;*******************************************************************************

;-------------------------------------------------------------------------------
; common constants
;-------------------------------------------------------------------------------
	include 'const_MegaDrive.X68'

;-------------------------------------------------------------------------------
; memory map
;-------------------------------------------------------------------------------
	include 'const_MemoryMap.X68'

;-------------------------------------------------------------------------------
; program-specific constants
;-------------------------------------------------------------------------------
	include 'const_GameSettings.X68'
	include 'const_ActionIDs.X68'
	include 'const_Flags.X68'
	include 'const_MemNPCLocations.X68'
	include 'const_ObjectIDs.X68'
	include 'const_Objectives.X68'
	include	'const_RomMap.X68'
	include 'const_SceneIDs.X68'
	include	'const_ScriptedEventCommands.X68'
	include	'const_StructFields.X68'

;*******************************************************************************
; vectors
;*******************************************************************************
	include 'init_Vectors.X68'

;*******************************************************************************
; ROM header
;*******************************************************************************
	include 'init_Header.X68'

;*******************************************************************************
; entry point & initialization
;*******************************************************************************
	include 'init_MDInit.X68'

;*******************************************************************************
; main game program
;*******************************************************************************

Main:

	include	'init_NewGame.X68'

	include	'sub_MainGameLoop.X68'

;-------------------------------------------------------------------------------
; WaitVBlank
;-------------------------------------------------------------------------------
WaitVBlank:
	btst	#STATE_FLAG_VBLANK,(MEM_GAME_STATE)	; test vblank flag
	beq.s	WaitVBlank	; loop until flag changes
	bclr	#STATE_FLAG_VBLANK,(MEM_GAME_STATE)	; clear vblank flag
	rts	; exit

;*******************************************************************************
; traps
;*******************************************************************************

ExtInt:
	rte

HBlank:
	rte

VBlank:
	bset	#STATE_FLAG_VBLANK,(MEM_GAME_STATE)	; set vblank flag
	addq	#$1,(MEM_VBLANK_COUNTER)	; increment debug counter 
	addq	#$1,(MEM_FRAME_COUNTER)		; increment frame counter
	bpl.s	VBlankReadJoypads
	and.w	#$0000,(MEM_FRAME_COUNTER)

VBlankReadJoypads:
	bsr.w	ReadJoypads					; read controllers

VBlankOrderSprites:
	; test if sprites need to be re-ordered
	tst.w	(MEM_SPRITE_Y_ORDER_CHANGED)	; has the sprite Y order changed?
	beq.s	VBlankExit	; hasn't changed, no need to order sprites
	move.l	(MEM_GAME_STATE),d0	; copy current game state to d0
	btst.l	#STATE_FLAG_EXPLORING,d0	; test game state
	beq.s	VBlankExit	; not exploring, no need to order sprites
	; else order sprites and loop
	bsr.w	OrderSprites	; reorder the sprites

VBlankExit:
	rte

TrapException:
	rte

;*******************************************************************************
; mostly stable subroutines
;*******************************************************************************
	include 'inc_Subroutines.X68'

;*******************************************************************************
; code to handle player actions based on game state
;*******************************************************************************
	include	'actionscript/ActionScript.X68'

;*******************************************************************************
; echo sound driver (https://github.com/sikthehedgehog/Echo)
;*******************************************************************************
	include 'echo/echo_main.X68'

	include	'echo/echo_list.X68'

;*******************************************************************************
; initialization data
;*******************************************************************************
	include 'data_Z80Init.X68'

	include 'data_VDPInit.X68'

;*******************************************************************************
; palettes
;*******************************************************************************
	;-------------------------------------	
	; auto-generated include file
	;-------------------------------------	
	include 'inc_Palettes.X68'
	;-------------------------------------	
	; used in text-only scenes
	;-------------------------------------	
PaletteBlack:
	include 'palettes/Black.X68'

;*******************************************************************************
; patterns
;*******************************************************************************
	include 'inc_Patterns.X68'

;*******************************************************************************
; scenes
;*******************************************************************************
	include 'inc_Scenes.X68'

;*******************************************************************************
; collision maps
;*******************************************************************************
	include	'inc_CollisionMaps.X68'

;*******************************************************************************
; sprite table definitions
;*******************************************************************************
	include 'data_SpriteDefinitions.X68'

;*******************************************************************************
; character definitions
;*******************************************************************************
	include 'data_CharacterDefinitions.X68'

;*******************************************************************************
; sprite movement
;*******************************************************************************
	include	'data_SpriteMovementPatterns.X68'

;*******************************************************************************
; scripted events
;*******************************************************************************
	include	'data_ScriptedEvents.X68'

;*******************************************************************************
; scene definition table
;*******************************************************************************
	include	'table_SceneDefinitions.X68'

;*******************************************************************************
; lookup tables for text
;*******************************************************************************
	include	'text/table_Text.X68'
	include	'text/table_CharacterNames.X68'

;*******************************************************************************
; action table
;*******************************************************************************
	include	'table_Actions.X68'

;*******************************************************************************
; status map icon location
;*******************************************************************************
	include	'table_StatusMapIconLocation.X68'

	org	ROM_ADDR_RESOURCES

;*******************************************************************************
; text
;*******************************************************************************
	include 'text/en-us/strings.X68'
	include 'text/en-us/CharacterNames.X68'

;*******************************************************************************
; background music
;*******************************************************************************
BGM_Title:
	incbin	'music/track0.esf'

BGM_DayIntro:
	incbin	'music/track1.esf'

BGM_Mall:
	incbin	'music/track2.esf'

BGM_End_Bad:
	incbin	'music/track3.esf'

BGM_End_Good:
	incbin	'music/track4.esf'

	align 2

;*******************************************************************************
; tiles
;*******************************************************************************
TransparentTileStart:
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
TransparentTileEnd:
	include 'inc_Tiles.X68'
	include	'inc_SpriteTiles.X68'

;*******************************************************************************
; echo instruments
;*******************************************************************************
	org	ROM_ADDR_INSTRUMENTS

	include 'echo/echo_instruments.X68'

;*******************************************************************************
; end of rom
;*******************************************************************************

RomEnd:
	ORG ROM_ADDR_END
	dc.b	%11111111
    end 0
