;*******************************************************************************
; Night 2 is Day 5 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_FCBCAMPING
;*******************************************************************************
ActionScriptNight02FCBInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[ScriptedEventNight02_01_FCBCamping]
;[set FLAG_NIGHT02_EVENT00_FCBCamping]
;Maybe you suspect that guy is up to something and decide to look for him, or maybe you think he needs help since you're all helpful like that
;[Story event at FCB camping - conversation about there being an employee who lived in the mall]

	rts		

;*******************************************************************************
; SCENE_ID_NSHACK
;*******************************************************************************
ActionScriptNight02NShackEnter:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[ScriptedEventNight02_02_NShack]
;Story event Nut Shack - dialog about "is this the weirdo you told me about?"
;[set FLAG_NIGHT02_EVENT01_NShack]
;
;When both [FLAG_NIGHT02_EVENT00_FCBCamping] and [FLAG_NIGHT02_EVENT01_NShack] are set
;[Set objective to OBJECTIVE_D00_O04_Leave]
;[Story Event at South Hall with prompt]


	rts		

;*******************************************************************************
; SCENE_ID_WWHALL
;*******************************************************************************
ActionScriptNight02WWHallEnter:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[ScriptedEventNight02_03_WWHall]
;maybe a scene with Victor heading East - he is now in CNow - dialog about what this place used to look like
;[set FLAG_NIGHT02_EVENT02_WWHall]
;[Move Victor to CNow]

	rts		

;*******************************************************************************
; SCENE_ID_CNOW
;*******************************************************************************
ActionScriptNight02CNowInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;Talking to victor sets FLAG_GLOBAL_Victor1204

	rts	


;*******************************************************************************
; SCENE_ID_SHALL
;*******************************************************************************
ActionScriptNight02SHallExit:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;After exiting south hall
;[ScriptedEventNight02_04_Vision]
;Carl's vision at the hotel
	rts		

ActionScriptNight02SHallRespond:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------

	rts

;*******************************************************************************
; SCENE_ID_CPLANET
;*******************************************************************************
ActionScriptNight02CPlanetInteract:	
	bsr.w ShowDefaultText

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	rts		

ActionScriptNight02CPlanetRespond:	
	bsr.w ShowDefaultText
	rts
	
;*******************************************************************************
; SCENE_ID_VB
;*******************************************************************************
ActionScriptNight02VBInteract:	
	bsr.w ShowDefaultText

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	rts		

ActionScriptNight02VBRespond:	
	bsr.w ShowDefaultText
	rts		
