;*******************************************************************************
; Night 4 is Day 9 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_NSHACK
;*******************************************************************************
ActionScriptNight04NShackInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[Story event at NShack - Eryn explains she saw a guy head into the Cavern and then disappear]
;[ScriptedEventNight04_01_NShack]
;[Set objective to OBJECTIVE_D04_O03_Cavern]
;[set FLAG_NIGHT04_EVENT00_NShackNight]
;[set story event at Cavern]

	rts		

;*******************************************************************************
; SCENE_ID_CAVERN
;*******************************************************************************
ActionScriptNight04CavernInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
; is this really needed?

	rts		

;*******************************************************************************
; SCENE_ID_WWHALL
;*******************************************************************************
ActionScriptNight04WWHallExit:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;Trying to enter the Cavern before [FLAG_DAY04_EVENT01_NShackNight] is set should have a message like “I’ll check back here later”
;
;[ScriptedEventNight04_02_Cavern] [Story event at Cavern backroom - DB is gone, you inspect the staircase but decide against going downstairs]


	rts		

;*******************************************************************************
; SCENE_ID_CAVERN_BACKROOM
;*******************************************************************************
ActionScriptNight04CavernBackroomExit:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;Trying to exit via the ladder or inspecting it
;Set [set FLAG_NIGHT04_EVENT01_CavernBackroom]
;Different text depending on the FLAG_NIGHT04_EVENT01_CavernBackroom
;[Set objective to OBJECTIVE_D04_O04_Leave]
;[Move Victor to south hall]

	rts	

;*******************************************************************************
; SCENE_ID_SHALL
;*******************************************************************************
ActionScriptNight04SHallExit:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;Exit is blocked until [FLAG_DAY04_EVENT03_Done] is set


	rts	

ActionScriptNight04SHallEnter:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;If [FLAG_NIGHT04_EVENT01_CavernBackroom] but not [FLAG_DAY04_EVENT03_Done]
;[ScriptedEventNight04_03_SouthHall] [Story event at South Hall - probably another scene with Victor - a "you know something about this place" scene]
;[Set objective to OBJECTIVE_D04_O05_Done]

	rts	

;*******************************************************************************
; SCENE_ID_VB
;*******************************************************************************
ActionScriptNight04VBInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT04_OPTIONAL1,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextNight04VBChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptNight04VBRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextNight04VBChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_GRUNBERG) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_NIGHT04_OPTIONAL1,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT1_SCENE_ID)
	; setup the scripted event
	lea	StoryTextNight04VBChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventNight04_Optional01_GrunbergStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
	
;*******************************************************************************
; SCENE_ID_WWAPPLIANCES
;*******************************************************************************
ActionScriptNight04WWAppliancesInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT04_OPTIONAL2,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextNight04WWAppliancesChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptNight04WWAppliancesRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextNight04WWAppliancesChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_LAURA) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_NIGHT04_OPTIONAL2,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT2_SCENE_ID)
	; setup the scripted event
	lea	StoryTextNight04WWAppliancesChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventNight04_Optional00_LauraStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; End of the day
;*******************************************************************************
EndNight04:

;Intro scene - 
;[ScriptedEventDay05_00_Intro]
;Dani is visiting the store. You need to round up some last minute shoppers. Dani mentions she is a pro. Awkward conversation between Lisa and Dani. Maybe Dani suggests a contest.
;[Set objective to OBJECTIVE_D05_O00_Contest]
;[set story events at FCBFirearms and WWAudio]


	rts	
		
