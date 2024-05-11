;*******************************************************************************
; This is (also) way too much duplicate code
; See comments in ActionScriptDayTrading
;*******************************************************************************

;*******************************************************************************
; night 01+ - trading sequence
; (really day03,day05,day07,day09,day11,day13)
; scene 13 - FCBFirearms
; Randy
;  give: OBJ_ITEM_VHS_TAPE
;  get: OBJ_ITEM_MOOSE_ATTRACTANT
;*******************************************************************************
ActionScriptNight01SceneFCBFirearmsTrading:
	;---------------------------------------------------------------
	; clerk hit region is an object because they are behind the counter
	;---------------------------------------------------------------
	move.w	(MEM_ACTION_TARGET_OBJID),d7 ; copy the object id to d7
	cmpi.w	#OBJ_NPC_RANDY,d7 ; test if the target is the clerk
	bne.w	TradingDefault ; not npc0 - show default text
	;----------------------------
	; trading sequence
	;----------------------------
	move.l	(MEM_TRADING_SEQUENCE_NIGHT),d7 ; copy progress of night trading to d7
	btst.l	#$0,d7 ; test if this trade is done
	bne.s	.after
	; otherwise trade
	bset.l	#$0,d7 ; set trade complete
	move.l	d7,(MEM_TRADING_SEQUENCE_NIGHT) ; save updated progress
	; queue scripted event	
	lea ScriptedEventTradingSequenceFCBFirearmsStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
.after
	lea	StoryTextTradingSequenceFCBFirearmsAfter,a6 ; point to text to display
	bsr.w	ShowDialog
	rts
	
;*******************************************************************************
; night 02+ - trading sequence
; (really day05,day07,day09,day11,day13)
; scene 09 - checkers
; Todd
;  give: OBJ_ITEM_MOOSE_ATTRACTANT
;  get: OBJ_ITEM_SHIRT
;*******************************************************************************
ActionScriptNight02SceneCheckersTrading:
	;----------------------------
	; test if talking to npc0
	;----------------------------
	move.w	(MEM_ACTION_TARGET_NPCID),d7 ; copy the npc id to d7
	cmpi.w	#$FFFF,d7 ; test if the target is even an npc
	beq.w	TradingDefault ; not an npc - show default text
	cmpi.w	#$0000,d7 ; test for npc0
	bne.w	TradingDefault ; not npc0 - show default text
	;----------------------------
	; trading sequence
	;----------------------------
	move.l	(MEM_TRADING_SEQUENCE_NIGHT),d7 ; copy progress of night trading to d7
	btst.l	#$1,d7 ; test if this trade is done
	bne.s	.after
	btst.l	#$0,d7 ; test if this trade is available
	beq.s	.before
	; otherwise trade
	bset.l	#$1,d7 ; set trade complete
	move.l	d7,(MEM_TRADING_SEQUENCE_NIGHT) ; save updated progress
	; queue scripted event	
	lea ScriptedEventTradingSequenceCheckersStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
.after
	lea	StoryTextTradingSequenceCheckersAfter,a6 ; point to text to display
	bsr.w	ShowDialog
	rts
.before
	lea	StoryTextTradingSequenceCheckersBefore,a6 ; point to text to display
	bsr.w	ShowDialog
	rts

;*******************************************************************************
; night 03+ - trading sequence
; (really day07,day09,day11,day13)
; scene 19 - wwaudio
; Craig
;  give: OBJ_ITEM_SHIRT
;  get: OBJ_ITEM_HEADBAND 
;*******************************************************************************
ActionScriptNight03SceneWWAudioTrading:
	;----------------------------
	; test if talking to npc0
	;----------------------------
	move.w	(MEM_ACTION_TARGET_NPCID),d7 ; copy the npc id to d7
	cmpi.w	#$FFFF,d7 ; test if the target is even an npc
	beq.w	TradingDefault ; not an npc - show default text
	cmpi.w	#$0000,d7 ; test for npc0
	bne.w	TradingDefault ; not npc0 - show default text
	;----------------------------
	; trading sequence
	;----------------------------
	move.l	(MEM_TRADING_SEQUENCE_NIGHT),d7 ; copy progress of night trading to d7
	btst.l	#$2,d7 ; test if this trade is done
	bne.s	.after
	btst.l	#$1,d7 ; test if this trade is available
	beq.s	.before
	; otherwise trade
	bset.l	#$2,d7 ; set trade complete
	move.l	d7,(MEM_TRADING_SEQUENCE_NIGHT) ; save updated progress
	; queue scripted event	
	lea ScriptedEventTradingSequenceWWAudioStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
.after
	lea	StoryTextTradingSequenceWWAudioAfter,a6 ; point to text to display
	bsr.w	ShowDialog
	rts
.before
	lea	StoryTextTradingSequenceWWAudioBefore,a6 ; point to text to display
	bsr.w	ShowDialog
	rts

;*******************************************************************************
; night 04+ - trading sequence
; (really day09,day11,day13)
; scene 0A - tlodge
; Scott
;  give: OBJ_ITEM_HEADBAND 
;  get: OBJ_ITEM_FM_CONVERTER
;*******************************************************************************
ActionScriptNight04SceneTLodgeTrading:
	;----------------------------
	; test if talking to npc0
	;----------------------------
	move.w	(MEM_ACTION_TARGET_NPCID),d7 ; copy the npc id to d7
	cmpi.w	#$FFFF,d7 ; test if the target is even an npc
	beq.w	TradingDefault ; not an npc - show default text
	cmpi.w	#$0000,d7 ; test for npc0
	bne.w	TradingDefault ; not npc0 - show default text
	;----------------------------
	; trading sequence
	;----------------------------
	move.l	(MEM_TRADING_SEQUENCE_NIGHT),d7 ; copy progress of night trading to d7
	btst.l	#$3,d7 ; test if this trade is done
	bne.s	.after
	btst.l	#$2,d7 ; test if this trade is available
	beq.s	.before
	; otherwise trade
	bset.l	#$3,d7 ; set trade complete
	move.l	d7,(MEM_TRADING_SEQUENCE_NIGHT) ; save updated progress
	; queue scripted event	
	lea ScriptedEventTradingSequenceTLodgeStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
.after
	lea	StoryTextTradingSequenceTLodgeAfter,a6 ; point to text to display
	bsr.w	ShowDialog
	rts
.before
	lea	StoryTextTradingSequenceTLodgeBefore,a6 ; point to text to display
	bsr.w	ShowDialog
	rts
	
;*******************************************************************************
; night 04+ - trading sequence
; (really day09,day11,day13)
; scene 10 - cnow
; Becky
;  give: OBJ_ITEM_FM_CONVERTER
;  get: OBJ_ITEM_FLANNEL_SHIRT
;*******************************************************************************
ActionScriptNight04SceneCNowTrading:
	;----------------------------
	; test if talking to npc0
	;----------------------------
	move.w	(MEM_ACTION_TARGET_NPCID),d7 ; copy the npc id to d7
	cmpi.w	#$FFFF,d7 ; test if the target is even an npc
	beq.w	TradingDefault ; not an npc - show default text
	cmpi.w	#$0000,d7 ; test for npc0
	bne.w	TradingDefault ; not npc0 - show default text
	;----------------------------
	; trading sequence
	;----------------------------
	move.l	(MEM_TRADING_SEQUENCE_NIGHT),d7 ; copy progress of night trading to d7
	btst.l	#$4,d7 ; test if this trade is done
	bne.s	.after
	btst.l	#$3,d7 ; test if this trade is available
	beq.s	.before
	; otherwise trade
	bset.l	#$4,d7 ; set trade complete
	move.l	d7,(MEM_TRADING_SEQUENCE_NIGHT) ; save updated progress
	; queue scripted event	
	lea ScriptedEventTradingSequenceCNowStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
.after
	lea	StoryTextTradingSequenceCNowAfter,a6 ; point to text to display
	bsr.w	ShowDialog
	rts
.before
	lea	StoryTextTradingSequenceCNowBefore,a6 ; point to text to display
	bsr.w	ShowDialog
	rts
	
;*******************************************************************************
; night 05+ - trading sequence
; (really day11,day13)
; scene 15 - FCBcamping
; Grant
;  give: OBJ_ITEM_FLANNEL_SHIRT
;  get: OBJ_ITEM_UTILITY_KNIFE
;*******************************************************************************
ActionScriptNight05SceneFCBCampingTrading:
	;----------------------------
	; test if talking to npc0
	;----------------------------
	move.w	(MEM_ACTION_TARGET_NPCID),d7 ; copy the npc id to d7
	cmpi.w	#$FFFF,d7 ; test if the target is even an npc
	beq.w	TradingDefault ; not an npc - show default text
	cmpi.w	#$0000,d7 ; test for npc0
	bne.w	TradingDefault ; not npc0 - show default text
	;----------------------------
	; trading sequence
	;----------------------------
	move.l	(MEM_TRADING_SEQUENCE_NIGHT),d7 ; copy progress of night trading to d7
	btst.l	#$5,d7 ; test if this trade is done
	bne.s	.after
	btst.l	#$4,d7 ; test if this trade is available
	beq.s	.before
	; otherwise trade
	bset.l	#$5,d7 ; set trade complete
	move.l	d7,(MEM_TRADING_SEQUENCE_NIGHT) ; save updated progress
	; queue scripted event	
	lea ScriptedEventTradingSequenceFCBCampingStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
.after
	lea	StoryTextTradingSequenceFCBCampingAfter,a6 ; point to text to display
	bsr.w	ShowDialog
	rts
.before
	lea	StoryTextTradingSequenceFCBCampingBefore,a6 ; point to text to display
	bsr.w	ShowDialog
	rts
	
;*******************************************************************************
; night 06 - trading sequence
; (really day13)
; scene 0B - cavern
; D.B.
;  give: OBJ_ITEM_UTILITY_KNIFE
;  get: OBJ_ITEM_EARRING
;*******************************************************************************
ActionScriptNight06SceneCavernTrading:
	;----------------------------
	; test if talking to npc0
	;----------------------------
	move.w	(MEM_ACTION_TARGET_NPCID),d7 ; copy the npc id to d7
	cmpi.w	#$FFFF,d7 ; test if the target is even an npc
	beq.w	TradingDefault ; not an npc - show default text
	cmpi.w	#$0000,d7 ; test for npc0
	bne.w	TradingDefault ; not npc0 - show default text
	;----------------------------
	; trading sequence
	;----------------------------
	move.l	(MEM_TRADING_SEQUENCE_NIGHT),d7 ; copy progress of night trading to d7
	btst.l	#$6,d7 ; test if this trade is done
	bne.s	.after
	btst.l	#$5,d7 ; test if this trade is available
	beq.s	.before
	; otherwise trade
	bset.l	#$6,d7 ; set trade complete
	move.l	d7,(MEM_TRADING_SEQUENCE_NIGHT) ; save updated progress
	; queue scripted event	
	lea ScriptedEventTradingSequenceCavernStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
.after
	lea	StoryTextTradingSequenceCavernAfter,a6 ; point to text to display
	bsr.w	ShowDialog
	rts
.before
	lea	StoryTextTradingSequenceCavernBefore,a6 ; point to text to display
	bsr.w	ShowDialog
	rts
	
;*******************************************************************************
; night 06 - trading sequence
; (really day13)
; scene 08 - denim country
; Lisa
;  give: OBJ_ITEM_EARRING
;  get: OBJ_ITEM_FINALITEM
;*******************************************************************************
ActionScriptNight06SceneDenimCountryTrading:
	;----------------------------
	; test if talking to npc0
	;----------------------------
	move.w	(MEM_ACTION_TARGET_NPCID),d7 ; copy the npc id to d7
	cmpi.w	#$FFFF,d7 ; test if the target is even an npc
	beq.w	TradingDefault ; not an npc - show default text
	cmpi.w	#$0000,d7 ; test for npc0
	bne.w	TradingDefault ; not npc0 - show default text
	;----------------------------
	; trading sequence
	;----------------------------
	move.l	(MEM_TRADING_SEQUENCE_NIGHT),d7 ; copy progress of night trading to d7
	btst.l	#$7,d7 ; test if this trade is done
	bne.s	.after
	btst.l	#$6,d7 ; test if this trade is available
	beq.s	.before
	; otherwise trade
	bset.l	#$7,d7 ; set trade complete
	move.l	d7,(MEM_TRADING_SEQUENCE_NIGHT) ; save updated progress
	; set FLAG_GLOBAL_TradingNightComplete
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7
	bset.l	#FLAG_GLOBAL_TradingNightComplete,d7
	move.l	d7,(MEM_GLOBAL_EVENT_FLAGS)
	; queue scripted event	
	lea ScriptedEventTradingSequenceDenimCountryStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
.after
	lea	StoryTextTradingSequenceDenimCountryBefore,a6 ; point to text to display
	bsr.w	ShowDialog
	rts
.before
	lea	StoryTextTradingSequenceDenimCountryAfter,a6 ; point to text to display
	bsr.w	ShowDialog
	rts
	
