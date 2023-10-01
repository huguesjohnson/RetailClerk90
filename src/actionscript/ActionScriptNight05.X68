;*******************************************************************************
; Night 5 is Day 11 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_CAVERN
;*******************************************************************************
ActionScriptNight05CavernEnter:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;On enter - [ScriptedEventNight05_01_Cavern]
;[Story event at the Cavern - Dani berates D.B. for keeping the basement a secret]
;[Set FLAG_NIGHT04_EVENT00_Cavern]
;[Set objective to OBJECTIVE_D05_O03_Basement]
;[set story events at BasementMDorm and BasementOffice]

	rts		

;*******************************************************************************
; SCENE_ID_BASEMENTMDORM
;*******************************************************************************
ActionScriptNight05BasementMDormEnter:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[Story event in dorm on enter - Carl learns about something]
;[ScriptedEventNight05_02_BasementMDorm]
;[FLAG_NIGHT05_EVENT01_BasementMDorm]

	rts		

;*******************************************************************************
; SCENE_ID_BASEMENTOFFICE
;*******************************************************************************
ActionScriptNight05BasementOfficeEnter:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[Dialog about the letters - Al is all like "why would I send that, I could care less about the people that work here"]
;[Story event in the office - Carl learns about the simulation]
;[ScriptedEventNight05_03_BasementOffice]
;[set FLAG_NIGHT05_EVENT02_BasementOffice]
;
;After each - check if both flags FLAG_NIGHT05_EVENT01_BasementMDorm and FLAG_NIGHT05_EVENT02_BasementOffice are set and change objective if so
;[Set objective to OBJECTIVE_D05_O04_Leave]
;[set story event at South Hall]
;[set FLAG_NIGHT05_EVENT03_BasementDone]

	rts		

;*******************************************************************************
; SCENE_ID_SHALL
;*******************************************************************************
ActionScriptNight05SHallExit:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;Exit blocked until [FLAG_NIGHT05_EVENT03_BasementDone] is set
;If set - [ScriptedEventNight05_04_SouthHall] - Carl does some introspection
;Transition to next day

	rts	

;*******************************************************************************
; SCENE_ID_CPLANET
;*******************************************************************************
ActionScriptNight05CPlanetInteract:	
	bsr.w ShowDefaultText

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	rts		

ActionScriptNight05CPlanetRespond:	
	bsr.w ShowDefaultText
	rts
	
;*******************************************************************************
; SCENE_ID_WWAPPLIANCES
;*******************************************************************************
ActionScriptNight05WWAppliancesInteract:	
	bsr.w ShowDefaultText

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	rts		

ActionScriptNight05WWAppliancesRespond:	
	bsr.w ShowDefaultText
	rts		
