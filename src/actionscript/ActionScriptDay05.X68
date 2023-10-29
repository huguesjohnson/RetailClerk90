;*******************************************************************************
; Day 5 is Day 10 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_FCBFIREARMS
;*******************************************************************************
ActionScriptDay05FCBFirearmsInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[ScriptedEventDay05_01_FCBFirearms]
;[set FLAG_DAY05_EVENT00_FCBFirearms]

	rts		

ActionScriptDay05FCBFirearmsRespond:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------

	rts

;*******************************************************************************
; SCENE_ID_WWAUDIO
;*******************************************************************************
ActionScriptDay05WWAudioInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[ScriptedEventDay05_02_WWAudio]
;[set FLAG_DAY05_EVENT01_WWAudio]
;
;After each - check if both flags FLAG_DAY04_EVENT00_FCBFirearms and FLAG_DAY04_EVENT01_WWAudio are set and change objective if so
;[Set objective to OBJECTIVE_D05_O01_ReportBack]
;[set story event at denim country]
;[set FLAG_DAY05_EVENT02_ContestDone]

	rts		

ActionScriptDay05WWAudioRespond:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------

	rts

;*******************************************************************************
; SCENE_ID_DENIMCOUNTRY
;*******************************************************************************
ActionScriptDay05DenimCountryInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;Dialog at Denim Country is the same until [FLAG_DAY05_EVENT02_ContestDone] - maybe doesn’t matter if there is a quick transition

	rts		

ActionScriptDay05DenimCountryEnter:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;On scene enter if [FLAG_DAY05_EVENT02_ContestDone] is set
;[ScriptedEventDay05_03_DenimCountry]
;[Story event at DCountry - likely another dialog with Dani, she's chastising Lisa about the letter. "Obviously it's the mall manager Al. Who else would know about something like this in advance?" "Doesn't he live in the basement?" "Yeah, more or less. If this is so important then go talk to him." "I can't.. the basement, it sounds scary." "Just give me the letter, I'm not scared of that loser. I can't wait to see the look on his face when I walk in." (to Eryn) "Also, I won."]
;Transition to night

	rts	


;*******************************************************************************
; SCENE_ID_CAVERN
;*******************************************************************************
ActionScriptDay05CavernInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY05_OPTIONAL1,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextDay05CavernChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptDay05CavernRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextDay05CavernChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_DB) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_DAY05_OPTIONAL1,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT1_SCENE_ID)
	; setup the scripted event
	lea	StoryTextDay05CavernChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay05_Optional00Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; SCENE_ID_FCBCAMPING
;*******************************************************************************
ActionScriptDay05FCBCampingInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY05_OPTIONAL2,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextDay05FCBCampingChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptDay05FCBCampingRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextDay05FCBCampingChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_GRANT) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_DAY05_OPTIONAL2,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT2_SCENE_ID)
	; setup the scripted event
	lea	StoryTextDay05FCBCampingChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay05_Optional01Start,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
		
;*******************************************************************************
; End of the day
;*******************************************************************************
EndDay05:

;Intro scene - 
;[ScriptedEventNight05_00_Intro]
;Carl and Charles reflect on stuff, Carl asks about last xmas
;[Set objective to OBJECTIVE_D05_O02_LastYear]
;[set story event at Cavern]



	rts	
		
