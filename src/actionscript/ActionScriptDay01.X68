;*******************************************************************************
; Day 1 is Day 2 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_DENIMCOUNTRY
;*******************************************************************************
ActionScriptDay01DenimCountryInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;Denim Country - talk to Lisa if FLAG_DAY01_EVENT02_RumorsDone not set
;[ScriptedEventDay01_02_ReportBack]

	rts

;*******************************************************************************
; SCENE_ID_CPLANET
;*******************************************************************************
ActionScriptDay01CPlanetInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;CPlanet - talk to Eliza if FLAG_DAY01_EVENT00_CPlanet not set
;[set FLAG_DAY01_EVENT00_CPlanet]
;[ScriptedEventDay01_01_CPlanet]

	rts

;*******************************************************************************
; SCENE_ID_WWAPPLIANCES
;*******************************************************************************
ActionScriptDay01WWAppliancesInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;WW Appliances - talk to Laura if FLAG_DAY01_EVENT01_WWAppliances not set
;[set FLAG_DAY01_EVENT01_WWAppliances]
;[ScriptedEventDay01_02_WWAppliances]
;After each - check if both flags FLAG_DAY01_EVENT00_CPlanet and FLAG_DAY01_EVENT01_WWAppliances are set and change objective if so
;[Set objective to OBJECTIVE_D01_O01_ReportBack]
;[set story event at denim country]
;[set FLAG_DAY01_EVENT02_RumorsDone]


	rts
		
;*******************************************************************************
; SCENE_ID_CAVERN
;*******************************************************************************
ActionScriptDay01CavernInteract:	
	bsr.w ShowDefaultText

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	rts		

ActionScriptDay01CavernRespond:	
	bsr.w ShowDefaultText
	rts
	
;*******************************************************************************
; SCENE_ID_FCBCAMPING
;*******************************************************************************
ActionScriptDay01FCBCampingInteract:	
	bsr.w ShowDefaultText

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	rts		

ActionScriptDay01FCBCampingRespond:	
	bsr.w ShowDefaultText
	rts			
		
