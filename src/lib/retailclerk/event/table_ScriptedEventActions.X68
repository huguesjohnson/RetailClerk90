ScriptedEventActionTableStart:
		dc.l	ScriptedEventEnd ; SCRIPTED_EVENT_END
		dc.l	ScriptedEventDialog ; SCRIPTED_EVENT_DIALOG
		dc.l	ScriptedEventChangeSprite ; SCRIPTED_EVENT_CHANGE_SPRITE
		dc.l	ScriptedEventChangeScene ; SCRIPTED_EVENT_CHANGE_SCENE
		dc.l	ScriptedEventChangePlayerSprite ; SCRIPTED_EVENT_CHANGE_PLAYER_SPRITE
		dc.l	ScriptedEventSetPlayerSpriteX ; SCRIPTED_EVENT_SET_PLAYER_SPRITE_X
		dc.l	ScriptedEventSetPlayerSpriteY ; SCRIPTED_EVENT_SET_PLAYER_SPRITE_Y
		dc.l	ScriptedEventSetPlayerSpriteDirection ; SCRIPTED_EVENT_SET_PLAYER_SPRITE_DIRECTION
		dc.l	ScriptedEventFadeBlack ; SCRIPTED_EVENT_FADE_BLACK
		dc.l	ScriptedEventFadeIn ; SCRIPTED_EVENT_FADE_IN
		dc.l	ScriptedEventDrawScene ; SCRIPTED_EVENT_DRAW_SCENE
		dc.l	ScriptedEventTimer ; SCRIPTED_EVENT_TIMER
		dc.l	ScriptedEventEndGame ; SCRIPTED_EVENT_ENDGAME
		dc.l	ScriptedEventLoadFont ; SCRIPTED_EVENT_LOADFONT
		dc.l	ScriptedEventAddItem ; SCRIPTED_EVENT_ADDITEM
		dc.l	ScriptedEventRemoveItem ; SCRIPTED_EVENT_REMOVEITEM
		dc.l	ScriptedEventUpdateSceneNPCs ; SCRIPTED_EVENT_UPDATE_SCENE_NPCS
		dc.l	ScriptedEventLoadPalette ; SCRIPTED_EVENT_LOADPALETTE
		dc.l	ScriptedEventSetStateFlag ; SCRIPTED_EVENT_SET_STATE_FLAG
		dc.l	ScriptedEventClearStateFlag ; SCRIPTED_EVENT_CLEAR_STATE_FLAG
ScriptedEventActionTableEnd:

