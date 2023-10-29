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
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY01_OPTIONAL1,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextDay01CavernChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptDay01CavernRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextDay01CavernChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_DB) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_DAY01_OPTIONAL1,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT1_SCENE_ID)
	; setup the scripted event
	lea	StoryTextDay01CavernChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay01_Optional00_DBStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; SCENE_ID_FCBCAMPING
;*******************************************************************************
ActionScriptDay01FCBCampingInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY01_OPTIONAL2,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextDay01FCBCampingChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptDay01FCBCampingRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextDay01FCBCampingChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_GRANT) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_DAY01_OPTIONAL2,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT2_SCENE_ID)
	; setup the scripted event
	lea	StoryTextDay01FCBCampingChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay01_Optional01_GrantStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts			
		
;*******************************************************************************
; End of the day
;*******************************************************************************
EndDay01:

;Intro scene
;[ScriptedEventNight01_00_Intro]
;Dialog with guard, maybe in WE hall, about encounter with Brett last week - "He just took off, I don't know where he went"
;[Set objective to OBJECTIVE_D01_O02_FollowGuy]


	rts	
		
