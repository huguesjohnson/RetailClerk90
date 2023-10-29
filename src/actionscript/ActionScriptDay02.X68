;*******************************************************************************
; Day 2 is Day 4 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_TLODGE
;*******************************************************************************
ActionScriptDay02TLodgeInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[ScriptedEventDay02_01_TLodge]
;[set FLAG_DAY02_EVENT00_TLodge]

	rts		

;*******************************************************************************
; SCENE_ID_TBOOKS
;*******************************************************************************
ActionScriptDay02TBooksInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[ScriptedEventDay02_02_TBooks]
;[set FLAG_DAY02_EVENT01_TBooks]
;event with apology for previous encounter - "sure I'm older than the average employee but I haven't been here long"
;
;After both [FLAG_DAY02_EVENT00_TLodge] and [FLAG_DAY02_EVENT01_TBooks]
;[Set objective to OBJECTIVE_D02_O01_ReportBack]
;[Set FLAG_DAY02_EVENT02_TalkedToPeople]
;[Story event at Denim Country]

	rts
	
;*******************************************************************************
; SCENE_ID_NSHACK
;*******************************************************************************
ActionScriptDay02NShackEnter:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;Check for [FLAG_DAY02_EVENT03_DenimCountry]
;[ScriptedEventDay02_04_NS]
;[Story Event at Nut Shack - overhear dialog you probably shouldn't have with D.B. about time travel rumors and end of AM - Jen invites you to stay at the store after close]
;[Transition to night]

	rts	

;*******************************************************************************
; SCENE_ID_DENIMCOUNTRY
;*******************************************************************************
ActionScriptDay02DenimCountryInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;Need to check for [FLAG_DAY02_EVENT02_TalkedToPeople] and not [FLAG_DAY02_EVENT03_DenimCountry]
;[ScriptedEventDay02_03_DenimCountry]
;[Set FLAG_DAY02_EVENT03_DenimCountry]
;[Set story event at Nut Shack]
;[Set objective to OBJECTIVE_D02_O02_VisitNS]

	rts		

;*******************************************************************************
; SCENE_ID_SVIDEO
;*******************************************************************************
ActionScriptDay02SVideoInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY02_OPTIONAL1,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextDay02SVideoChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptDay02SVideoRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextDay02SVideoChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_NICKY) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_DAY02_OPTIONAL1,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT1_SCENE_ID)
	; setup the scripted event
	lea	StoryTextDay02SVideoChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay02_Optional00Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; SCENE_ID_FCBCAMPING
;*******************************************************************************
ActionScriptDay02FCBCampingInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY02_OPTIONAL2,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextDay02FCBCampingChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptDay02FCBCampingRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextDay02FCBCampingChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_GRANT) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_DAY02_OPTIONAL2,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT2_SCENE_ID)
	; setup the scripted event
	lea	StoryTextDay02FCBCampingChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay02_Optional01Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; End of the day
;*******************************************************************************
EndDay02:

;[ScriptedEventNight02_00_Intro]
;something to make you think of going to the camping section
;[Set objective to OBJECTIVE_D02_O03_Investigate]
;[set Story event at FCBCamping]
;[set Story event at NShack]
;[Move Victor to WWHall]


	rts	
			
		
