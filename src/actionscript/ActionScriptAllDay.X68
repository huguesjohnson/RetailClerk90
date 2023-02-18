;-------------------------------------------------------------------------------
; there are two south exits and I didn't plan the scene exit system well
;-------------------------------------------------------------------------------
ActionScriptExitCavernBackroom:
	;---------------------------------------------------------------------------
	; the exit to the cavern runs a little past the middle of the screen
	;---------------------------------------------------------------------------
	cmpi.w	#MAP_MID_X+$0040,(MEM_PLAYER_SPRITE_X)
	bge.s	.1 ; player X is > midpoint, use staircase exit
	move.w	#SCENE_ID_CAVERN,d6 ; player X is midpoint, use cavern exit
	bra.s	.2 ; branch to scene exit
.1 ; destination if player X is > midpoint
	move.w	#SCENE_ID_BASEMENTMDORM,d6 ; player X is > midpoint, use staircase exit
.2 ; this is where we branch to the default exit handler
	;---------------------------------------------------------------------------
	; skip part of DefaultExitScene that looks-up the direction
	;---------------------------------------------------------------------------
	bsr.w	DefaultExitSceneLoadNewScene
	rts
