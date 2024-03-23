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
	
;-------------------------------------------------------------------------------
; the west exit in this scene doesn't lead anywhere (on purpose)
;-------------------------------------------------------------------------------
ActionScriptExitBasementCafe:
	move.w	(MEM_PLAYER_SPRITE_DIRECTION),d7 ; copy player sprite direction to d7
	cmpi.w	#DIRECTION_LEFT,d7 ; is the player facing west?
	bne.s	.default ; branch if not
	lea ScriptedEventCantEnterBasementShowerStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event	
	rts	
.default
	bsr.w	DefaultExitScene ; default scene exit
	rts	

;-------------------------------------------------------------------------------
; Eryn can't enter the cavern backroom ever
;-------------------------------------------------------------------------------
ActionScriptExitCavernEryn:
	move.w	(MEM_PLAYER_SPRITE_DIRECTION),d7 ; copy player sprite direction to d7
	cmpi.w	#DIRECTION_UP,d7 ; is the player facing north?
	bne.s	.default ; branch if not
	; test if DB is npc0
	move.w	(MEM_OBJECT_LIST_NPCS),d7
	cmpi.w	#OBJ_NPC_DB,d7
	bne.s	.npc1
.npc0	
	lea ScriptedEventCantEnterCavernBackroomErynDBisNPC0Start,a6 ; point a6 to event to load
	bra.s	.queue
.npc1	
	lea ScriptedEventCantEnterCavernBackroomErynDBisNPC1Start,a6 ; point a6 to event to load
.queue
	bsr.w QueueScriptedEvent ; queue the event	
	rts	
.default
	bsr.w	DefaultExitScene ; default scene exit
	rts	

;-------------------------------------------------------------------------------
; Carl can't enter the cavern backroom on most nights
;-------------------------------------------------------------------------------
ActionScriptExitCavernCarl:
	move.w	(MEM_PLAYER_SPRITE_DIRECTION),d7 ; copy player sprite direction to d7
	cmpi.w	#DIRECTION_UP,d7 ; is the player facing north?
	bne.s	.default ; branch if not
	lea ScriptedEventCantEnterCavernBackroomCarlStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event	
	rts	
.default
	bsr.w	DefaultExitScene ; default scene exit
	rts	

