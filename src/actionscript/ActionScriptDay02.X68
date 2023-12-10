;*******************************************************************************
; Day 2 is Day 4 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_TLODGE
;*******************************************************************************
ActionScriptDay02TLodgeInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY02_EVENT00_TLODGE,d7 ; test if the event is complete
	bne.s	.default ; show default text if the event is complete
	;---------------------------------------------------------------------------
	; else update flags and run the scripted event
	;---------------------------------------------------------------------------
	bset.l	#FLAG_DAY02_EVENT00_TLODGE,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#$FFFF,(MEM_STORY_EVENT1_SCENE_ID) ; clear story event
	bsr.w	CheckDay02Flags ; test if both required events are done
	; setup scripted event
	lea	StoryTextDay02TLodgeLine1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay02_01_TLodgeStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
.default
	bsr.w ShowDefaultText
	rts		

;*******************************************************************************
; SCENE_ID_TBOOKS
;*******************************************************************************
ActionScriptDay02TBooksInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY02_EVENT01_TBOOKS,d7 ; test if the event is complete
	bne.s	.default ; show default text if the event is complete
	;---------------------------------------------------------------------------
	; else update flags and run the scripted event
	;---------------------------------------------------------------------------
	bset.l	#FLAG_DAY02_EVENT01_TBOOKS,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#$FFFF,(MEM_STORY_EVENT2_SCENE_ID) ; clear story event
	bsr.w	CheckDay02Flags ; test if both required events are done
	; setup scripted event
	lea	StoryTextDay02TBooksLine1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay02_02_TBooksStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
.default
	bsr.w ShowDefaultText
	rts

CheckDay02Flags:
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY02_EVENT00_TLODGE,d7 ; test if the event is complete
	beq.s	.exit ; not set, exit
	btst.l	#FLAG_DAY02_EVENT01_TBOOKS,d7 ; test if the event is complete
	beq.s	.exit ; not set, exit
	; both events are done - setup next event
	bset.l	#FLAG_DAY02_EVENT02_TALKEDTOPEOPLE,d7 ; set flag
	move.w	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#OBJECTIVE_D02_O01_ReportBack,(MEM_OBJECTIVE) ; update objective
	move.w	#SCENE_ID_DENIMCOUNTRY,(MEM_STORY_EVENT2_SCENE_ID) ; set story event	
.exit
	rts
	
;*******************************************************************************
; SCENE_ID_NSHACK
;*******************************************************************************
ActionScriptDay02NShackEnter:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY02_EVENT03_DENIMCOUNTRY,d7 ; test if the event is complete
	beq.s	.default ; default if the event is not complete
	;---------------------------------------------------------------------------
	; else end the day
	;---------------------------------------------------------------------------
	bsr.w	EndDay02
.default
	rts	

;*******************************************************************************
; SCENE_ID_DENIMCOUNTRY
;*******************************************************************************
ActionScriptDay02DenimCountryInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_DAY02_EVENT02_TALKEDTOPEOPLE,d7 ; test if the event is complete
	beq.s	.notdone ; flag not set, show 'not done' response
	btst.l	#FLAG_DAY02_EVENT03_DENIMCOUNTRY,d7 ; test if the event is complete
	bne.s	.default ; flag set, show default reponse
	;---------------------------------------------------------------------------
	; else update flags and run the scripted event
	;---------------------------------------------------------------------------
	bset.l	#FLAG_DAY02_EVENT03_DENIMCOUNTRY,d7 ; set event is done
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	move.w	#SCENE_ID_NSHACK,(MEM_STORY_EVENT1_SCENE_ID) ; update story event
	move.w	#OBJECTIVE_D02_O02_VisitNS,(MEM_OBJECTIVE) ; update objective
	move.l	#$070F0000,(MEM_NPC_LOCATION_NSHACK) ; db is now at nshack
	; setup scripted event
	lea	StoryTextDay02NShackLine1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventDay02_03_DenimCountryStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
.notdone
	lea	StoryTextDay02DenimCountryNotDone,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the dialog
.default
	bsr.w ShowDefaultText
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
	bsr.s	EndDay02SetupGameState
	;---------------------------------------------------------------------------	
	; queue the introduction
	;---------------------------------------------------------------------------	
	lea ScriptedEventDay02_TransitionStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
		
EndDay02SetupGameState: ; separated to help with debugging		
	;---------------------------------------------------------------------------	
	; setup the next day
	;---------------------------------------------------------------------------	
	move.w	#$0005,(MEM_DAY) ; increment day
	move.w	#OBJECTIVE_D02_O03_Investigate,(MEM_OBJECTIVE) ; initial objective
	and.l	#$00000000,(MEM_DAY_EVENT_FLAGS) ; clear event flags
	move.w	#SCENE_ID_FCBCAMPING,(MEM_STORY_EVENT1_SCENE_ID) ; 1st story event
	move.w	#SCENE_ID_NSHACK,(MEM_STORY_EVENT2_SCENE_ID) ; 2nd story event
	move.w	#SCENE_ID_CPLANET,(MEM_OPTIONAL_EVENT1_SCENE_ID) ; 1st optional event
	move.w	#SCENE_ID_VB,(MEM_OPTIONAL_EVENT2_SCENE_ID) ; 2nd optional event
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT3_SCENE_ID) ; no 3rd optional event
	move.w	#PLAYER_SPRITE_CARL,(MEM_PLAYER_SPRITE) ; initial sprite
	move.w	#DIRECTION_UP,(MEM_PLAYER_SPRITE_DIRECTION)
	move.w	#$00DE,(MEM_PLAYER_SPRITE_X)
	move.w	#$00EE,(MEM_PLAYER_SPRITE_Y)
	;[ScriptedEventDay02_04_NS]
	;---------------------------------------------------------------------------	
	; update NPC locations
	;---------------------------------------------------------------------------	
	bsr.w	InitNPCLocationsNight ; reset the NPC locations
	move.l	#$22000000,(MEM_NPC_LOCATION_WWHALL) ; victor is in wwhall
	move.l	#$07010000,(MEM_NPC_LOCATION_NSHACK) ; eryn is in nshack
	rts
