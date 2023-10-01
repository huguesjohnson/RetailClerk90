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
	bsr.w ShowDefaultText

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	rts		

ActionScriptDay05CavernRespond:	
	bsr.w ShowDefaultText
	rts
	
;*******************************************************************************
; SCENE_ID_FCBCAMPING
;*******************************************************************************
ActionScriptDay05FCBCampingInteract:	
	bsr.w ShowDefaultText

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	rts		

ActionScriptDay05FCBCampingRespond:	
	bsr.w ShowDefaultText
	rts			
		
