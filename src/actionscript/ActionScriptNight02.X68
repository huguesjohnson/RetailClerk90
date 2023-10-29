;*******************************************************************************
; Night 2 is Day 5 in the action script
; I know this is confusing to anyone that isn't me
;*******************************************************************************

;*******************************************************************************
; SCENE_ID_FCBCAMPING
;*******************************************************************************
ActionScriptNight02FCBInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[ScriptedEventNight02_01_FCBCamping]
;[set FLAG_NIGHT02_EVENT00_FCBCamping]
;Maybe you suspect that guy is up to something and decide to look for him, or maybe you think he needs help since you're all helpful like that
;[Story event at FCB camping - conversation about there being an employee who lived in the mall]

	rts		

;*******************************************************************************
; SCENE_ID_NSHACK
;*******************************************************************************
ActionScriptNight02NShackEnter:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[ScriptedEventNight02_02_NShack]
;Story event Nut Shack - dialog about "is this the weirdo you told me about?"
;[set FLAG_NIGHT02_EVENT01_NShack]
;
;When both [FLAG_NIGHT02_EVENT00_FCBCamping] and [FLAG_NIGHT02_EVENT01_NShack] are set
;[Set objective to OBJECTIVE_D00_O04_Leave]
;[Story Event at South Hall with prompt]


	rts		

;*******************************************************************************
; SCENE_ID_WWHALL
;*******************************************************************************
ActionScriptNight02WWHallEnter:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;[ScriptedEventNight02_03_WWHall]
;maybe a scene with Victor heading East - he is now in CNow - dialog about what this place used to look like
;[set FLAG_NIGHT02_EVENT02_WWHall]
;[Move Victor to CNow]

	rts		

;*******************************************************************************
; SCENE_ID_CNOW
;*******************************************************************************
ActionScriptNight02CNowInteract:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;Talking to victor sets FLAG_GLOBAL_Victor1204

	rts	


;*******************************************************************************
; SCENE_ID_SHALL
;*******************************************************************************
ActionScriptNight02SHallExit:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------
;After exiting south hall
;[ScriptedEventNight02_04_Vision]
;Carl's vision at the hotel
	rts		

ActionScriptNight02SHallRespond:	
	bsr.w ShowDefaultText
;-------------------------------------------------------------------------------
; TODO
;-------------------------------------------------------------------------------

	rts

;*******************************************************************************
; SCENE_ID_CPLANET
;*******************************************************************************
ActionScriptNight02CPlanetInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT02_OPTIONAL1,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextNight02CPlanetChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptNight02CPlanetRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextNight02CPlanetChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_ELIZA) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_NIGHT02_OPTIONAL1,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT1_SCENE_ID)
	; setup the scripted event
	lea	StoryTextNight02CPlanetChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventNight02_Optional01_ElizaStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; SCENE_ID_VB
;*******************************************************************************
ActionScriptNight02VBInteract:	
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	btst.l	#FLAG_NIGHT02_OPTIONAL2,d7 ; test if the optional event is complete
	bne.s	.default ; show default text if the event is complete
	lea	StoryTextNight02VBChoice,a6 ; load dialog text	
	bsr.w	Show2ChoiceDialog ; prompt to do the event
	rts	
.default
	bsr.w ShowDefaultText
	rts	

ActionScriptNight02VBRespond:	
	bsr.w	ResetDialog
	cmpi.w	#$0000,(MEM_MENU_RESPONSE) ; is the menu selection 0?
	beq.s	.yes
	; else show message
	lea	StoryTextNight02VBChoice1,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first response
	rts
.yes
	addq	#$1,(MEM_REL_GRUNBERG) ; increment the relationship score
	; update day state
	move.l	(MEM_DAY_EVENT_FLAGS),d7 ; copy day event flags to d7
	bset.l	#FLAG_NIGHT02_OPTIONAL2,d7 ; test if the optional event is complete	
	move.l	d7,(MEM_DAY_EVENT_FLAGS) ; save updated flags
	; clear the map icon
	move.w	#$FFFF,(MEM_OPTIONAL_EVENT2_SCENE_ID)
	; setup the scripted event
	lea	StoryTextNight02VBChoice0,a6 ; point a6 to the first dialog
	bsr.w	ShowDialog ; show the first dialog
	lea ScriptedEventNight02_Optional00_GrunbergStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts	
	
;*******************************************************************************
; End of the day
;*******************************************************************************
EndNight02:

;[ScriptedEventDay03_00_Intro]
;Lisa returns to the store with an update on her snooping and how she hates going to Pogo Dawg because it's so gross
;[Set objective to OBJECTIVE_D03_O00_VisitPogoDawg]
;[set story event at and Pogo Dawg]


	rts	
		
