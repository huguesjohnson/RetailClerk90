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
	bsr.w ShowDefaultText

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	rts		

ActionScriptDay02SVideoRespond:	
	bsr.w ShowDefaultText
	rts
	
;*******************************************************************************
; SCENE_ID_FCBCAMPING
;*******************************************************************************
ActionScriptDay02FCBCampingInteract:	
	bsr.w ShowDefaultText

;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; dialog and prompt for optional event

	rts		

ActionScriptDay02FCBCampingRespond:	
	bsr.w ShowDefaultText
	rts			
		
