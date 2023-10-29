;*******************************************************************************
; Night 3 is Day 7 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_TLODGE
;*******************************************************************************
ActionScriptNight03TLodgeInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[ScriptedEventNight03_01_TLodge]
;[set FLAG_NIGHT03_EVENT00_TLodge]

	rts		

;*******************************************************************************
; SCENE_ID_CNOW
;*******************************************************************************
ActionScriptNight03CNowInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;Different text based on whether or not you saw the dialog with Victor FLAG_GLOBAL_Victor1204]
;[ScriptedEventNight03_02_CNow]
;[ScriptedEventNight03_02_CNowAlt]
;Set [FLAG_NIGHT03_EVENT01_CNow]
;
;After each check if [FLAG_NIGHT03_EVENT00_TLodge] and [FLAG_NIGHT03_EVENT01_CNow] are set, if so
;[Set objective to OBJECTIVE_D03_O04_CheckIn]
;[Set story event at NShack]

	rts		

;*******************************************************************************
; SCENE_ID_SHALL
;*******************************************************************************
ActionScriptNight03SHallExit:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; Blocked from entering Nut Shack until [FLAG_NIGHT03_EVENT00_TLodge] and [FLAG_NIGHT03_EVENT01_CNow] are set
; Blocked from exiting until [FLAG_NIGHT03_EVENT02_NShack]

	rts	
	
;*******************************************************************************
; SCENE_ID_NSHACK
;*******************************************************************************
ActionScriptNight03NShackInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[Story event at NShack - "hey, you're late dialog" "there are these two strange guys I ran into after hours - don't know if they're connected"]
;[ScriptedEventNight03_03_NShack]
;[set FLAG_NIGHT03_EVENT02_NShack]
;[set story event at South Hall or parking lot after]

	rts		

;*******************************************************************************
; SCENE_ID_CPLANET
;*******************************************************************************
ActionScriptNight03CPlanetInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT03_OPTIONAL1,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextNight03CPlanetChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptNight03CPlanetRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextNight03CPlanetChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_ELIZA) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_NIGHT03_OPTIONAL1,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT1_SCENE_ID)
	; setup the scripted event
	lea	StoryTextNight03CPlanetChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventNight03_Optional00Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; SCENE_ID_WWAPPLIANCES
;*******************************************************************************
ActionScriptNight03WWAppliancesInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT03_OPTIONAL2,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextNight03WWAppliancesChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptNight03WWAppliancesRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextNight03WWAppliancesChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_LAURA) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_NIGHT03_OPTIONAL2,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT2_SCENE_ID)
	; setup the scripted event
	lea	StoryTextNight03WWAppliancesChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventNight03_Optional01Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; End of the day
;*******************************************************************************
EndNight03:

;Intro scene - 
;[ScriptedEventDay04_00_Intro]
;see Brett enter the Cavern
;[Set objective to OBJECTIVE_D04_O00_Cavern]
;[set story event at Cavern]



	rts	
		
	
