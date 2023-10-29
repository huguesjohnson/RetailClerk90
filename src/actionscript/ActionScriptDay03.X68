;*******************************************************************************
; Day 3 is Day 6 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_POGODAWG
;*******************************************************************************
ActionScriptDay03PogoDawgInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[ScriptedEventDay03_01_PogoDawg]
;[set FLAG_DAY03_EVENT00_PogoDawg]
;[Set objective to OBJECTIVE_D03_O01_DeliverLunches]
;
;Need to check for FLAG_DAY03_EVENT03_LunchesDelivered
;[ScriptedEventDay03_05_PogoDawg]
;[Set FLAG_DAY03_EVENT04_Done]
;[Set objective to OBJECTIVE_D03_O02_ReportBack]

	rts		

;*******************************************************************************
; SCENE_ID_CHECKERS
;*******************************************************************************
ActionScriptDay03CheckersInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[ScriptedEventDay03_02_Checkers]
;[set FLAG_DAY03_EVENT01_Checkers]

	rts		

;*******************************************************************************
; SCENE_ID_CNOW
;*******************************************************************************
ActionScriptDay03CNowInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[ScriptedEventDay03_03_ClothesNow]
;[set FLAG_DAY03_EVENT02_ClothesNow]
;
;After both [FLAG_DAY03_EVENT01_Checkers] and [FLAG_DAY03_EVENT02_ClothesNow]
;[Set objective to OBJECTIVE_D03_O02_ReportBack]
;[Set FLAG_DAY03_EVENT03_LunchesDelivered]
;[Story event at PogoDawg]
;[Move Brett to south hall]

	rts		

;*******************************************************************************
; SCENE_ID_DENIMCOUNTRY
;*******************************************************************************
ActionScriptDay03DenimCountryInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; OBJECTIVE_D03_O02_ReportBack - reporting back after everything is done
	rts	

;*******************************************************************************
; SCENE_ID_SHALL
;*******************************************************************************
ActionScriptDay03SHallEnter:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;South hall - on enter
;[ScriptedEventDay03_04_SouthHall]
;Story event at south hall - also where you also run into Brett - or maybe in PogoDawg itself
;[Set FLAG_DAY03_EVENT03_SouthHall]

	rts	
	
ActionScriptDay03SHallExit:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;South exit blocked 

	rts

;*******************************************************************************
; SCENE_ID_SVIDEO
;*******************************************************************************
ActionScriptDay03SVideoInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY03_OPTIONAL1,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextDay03SVideoChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptDay03SVideoRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextDay03SVideoChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_NICKY) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_DAY03_OPTIONAL1,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT1_SCENE_ID)
	; setup the scripted event
	lea	StoryTextDay03SVideoChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay03_Optional01_NickyStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; SCENE_ID_CAVERN
;*******************************************************************************
ActionScriptDay03CavernInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY03_OPTIONAL1,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextDay03CavernChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptDay03CavernRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextDay03CavernChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_DB) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_DAY03_OPTIONAL2,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT2_SCENE_ID)
	; setup the scripted event
	lea	StoryTextDay03CavernChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay03_Optional00_DBStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; End of the day
;*******************************************************************************
EndDay03:

;[ScriptedEventNight03_00_Intro]
;Carl contemplating his reoccurring dreams
;[Set objective to OBJECTIVE_D03_O03_Revist]
;[set story events at TLodge and CNow]



	rts	
				
