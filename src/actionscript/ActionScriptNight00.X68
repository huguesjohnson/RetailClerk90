;*******************************************************************************
; Night 0 is Day 1 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_EEHALL
;*******************************************************************************
ActionScriptNight00EEHallEnter:	
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;Event on entering EE Hall if FLAG_NIGHT00_EVENT00_EEHall not set
;Security guard hassles Brett for loitering after close
;[Run ScriptedEventNight00_01_EEHall]
;[set FLAG_NIGHT00_EVENT00_EEHall]

	bsr.w ShowDefaultText
	rts		
	
;*******************************************************************************
; SCENE_ID_SVIDEO
;*******************************************************************************
ActionScriptNight00SVideoInteract:	
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;1) Deliver special order to SVideo
;[Story Event in SVideo]
;[Run ScriptedEventNight00_01_SVideo]
;[set FLAG_NIGHT00_EVENT01_SVideo]
;Delivering the special order also begins Carl's trading sequence  
;[Move Victor to South Hall]
;[Story event at south hall]
;[Set objective to OBJECTIVE_D00_O04_Leave] 

	bsr.w ShowDefaultText
	rts		

;*******************************************************************************
; SCENE_ID_SHALL
;*******************************************************************************
ActionScriptNight00SouthHallEnter:
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT00_EVENT00_EEHALL,d7 ; test if required event ran
	beq.s	.exit
	btst.l	#FLAG_NIGHT00_EVENT01_SVIDEO,d7 ; test if required event ran
	beq.s	.exit
.event	;TODO
	bsr.w ShowDefaultText
	rts		

.exit	
	rts
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;Enter south hall with FLAG_NIGHT00_EVENT00_EEHall set and FLAG_NIGHT00_EVENT01_SVideo set
;[Run ScriptedEventNight00_02_VictorEncounter]
;scene with Victor where it's clear he recognizes you but you aren't sure where you know him from - like he gives you some kind of good night message and Carl's like "I don't remember him being a customer" - Carl reflects on how weird the mall is at night
;[set FLAG_NIGHT00_EVENT02_StoryEventsDone]

ActionScriptNight00SouthHallExit:	
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;If FLAG_NIGHT00_EVENT02_StoryEventsDone is set, transition to the next day
;Otherwise blocked with message (also a reusable message)

	bsr.w ShowDefaultText
	rts
	
ActionScriptNight00SouthHallRespond:
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; is this really needed?
	bsr.w ShowDefaultText
	rts
	
;*******************************************************************************
; SCENE_ID_VB
;*******************************************************************************
ActionScriptNight00VBInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT00_OPTIONAL1,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextNight00VBChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptNight00VBRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextNight00VBChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_GRUNBERG) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_NIGHT00_OPTIONAL1,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT1_SCENE_ID)
	; setup the scripted event
	lea	StoryTextNight00VBChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventNight00_Optional00Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; SCENE_ID_CPLANET
;*******************************************************************************
ActionScriptNight00CPlanetInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT00_OPTIONAL2,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextNight00CPlanetChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptNight00CPlanetRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextNight00CPlanetChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_ELIZA) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_NIGHT00_OPTIONAL2,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT2_SCENE_ID)
	; setup the scripted event
	lea	StoryTextNight00CPlanetChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventNight00_Optional01_ElizaStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; End of the day
;*******************************************************************************
EndNight00:

;[ScriptedEventDay01_00_Intro]
;Lisa is sending you to bug other stores for rumors
;[Set objective to OBJECTIVE_D01_O00_RumorSearch]
;[set story events at cplanet and wwappliances]


	rts	
		

