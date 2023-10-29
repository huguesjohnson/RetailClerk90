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
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT05_OPTIONAL1,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextNight05CPlanetChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptNight05CPlanetRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextNight05CPlanetChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_ELIZA) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_NIGHT05_OPTIONAL1,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT1_SCENE_ID)
	; setup the scripted event
	lea	StoryTextNight05CPlanetChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventNight05_Optional00Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; SCENE_ID_WWAPPLIANCES
;*******************************************************************************
ActionScriptNight05WWAppliancesInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT05_OPTIONAL2,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextNight05WWAppliancesChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptNight05WWAppliancesRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextNight05WWAppliancesChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_LAURA) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_NIGHT05_OPTIONAL2,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT2_SCENE_ID)
	; setup the scripted event
	lea	StoryTextNight05WWAppliancesChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventNight05_Optional01Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; End of the day
;*******************************************************************************
EndNight05:

;Intro scene - 
;[ScriptedEventDay06_00_Intro]
;Dialog about last day for Xmas help and how the store will be gone soon. Dialog about never figuring out who sent the letter.
;[Set objective to OBJECTIVE_D06_O00_GoingAwayGift]
;[set story event at NShack]



	rts	
	
	