;*******************************************************************************
; This is way too much duplicate code
; If/when I decided to optimize this, like if I port it to soemthing else
; Big if... but then this should be one subroutine with parameters
;*******************************************************************************


;*******************************************************************************
; day 01+ - trading sequence 
; (really day02,day04,day06,day08,day10,day12)
; FCBFishing
; Heather
;  give: OBJ_ITEM_SCARF
;  get: OBJ_ITEM_HANDWARMER
;*******************************************************************************
ActionScriptDay01SceneFCBFishingTrading:
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
	move.l	(MEM_TRADING_SEQUENCE_DAY),d7 ; copy progress of day trading to d7
	btst.l	#$0,d7 ; test if this trade is done
	bne.s	.after
	; otherwise trade
	bset.l	#$0,d7 ; set trade complete
	move.l	d7,(MEM_TRADING_SEQUENCE_DAY) ; save updated progress
	; remove item
	lea	MEM_PLAYER1_ITEM_COUNT,a1 ; point to 1st pc inventory
	move.w	#OBJ_ITEM_SCARF,d7 ; remove item from trading sequence
	bsr.w	RemoveItem ; remove item from the inventory			
	; add item to start trading sequence
	lea	MEM_PLAYER1_ITEM_COUNT,a1 ; point to 1st pc inventory
	move.w	#OBJ_ITEM_HANDWARMER,d7 ; add item from trading sequence
	bsr.w	AddItem ; add item to inventory				
	; queue scripted event
	lea ScriptedEventTradingSequenceFCBFishingStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event
	rts
.after
	lea	StoryTextTradingSequenceFCBFishingAfter,a6 ; point to text to display
	bsr.w	ShowDialog
	rts
	
;*******************************************************************************
; day 02+ - trading sequence
; (really day04,day06,day08,day10,day12)
; WWAppliances
; Laura - get lipstick
;  give: OBJ_ITEM_HANDWARMER
;  get: OBJ_ITEM_LIPSTICK
;*******************************************************************************
ActionScriptDay02SceneWWAppliancesTrading:
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
	move.l	(MEM_TRADING_SEQUENCE_DAY),d7 ; copy progress of day trading to d7
	btst.l	#$1,d7 ; test if this trade is done
	bne.s	.after
	btst.l	#$0,d7 ; test if this trade is available
	beq.s	.before
	; otherwise trade
	bset.l	#$1,d7 ; set trade complete
	move.l	d7,(MEM_TRADING_SEQUENCE_DAY) ; save updated progress
	; queue scripted event
	lea ScriptedEventTradingSequenceWWAppliancesStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event	
	rts
.after
	lea	StoryTextTradingSequenceWWAppliancesAfter,a6 ; point to text to display
	bsr.w	ShowDialog
	rts
.before
	lea	StoryTextTradingSequenceWWAppliancesBefore,a6 ; point to text to display
	bsr.w	ShowDialog
	rts
	
;*******************************************************************************
; day 03+ - trading sequence
; (really day06,day08,day10,day12)
; CPlanet
; Eliza
;  give: OBJ_ITEM_LIPSTICK
;  get: OBJ_ITEM_TICKETS
;*******************************************************************************
ActionScriptDay03SceneCPlanetTrading:
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
	move.l	(MEM_TRADING_SEQUENCE_DAY),d7 ; copy progress of day trading to d7
	btst.l	#$2,d7 ; test if this trade is done
	bne.s	.after
	btst.l	#$1,d7 ; test if this trade is available
	beq.s	.before
	; otherwise trade
	bset.l	#$2,d7 ; set trade complete
	move.l	d7,(MEM_TRADING_SEQUENCE_DAY) ; save updated progress
	; queue scripted event
	lea ScriptedEventTradingSequenceCPlanetStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event		
	rts
.after
	lea	StoryTextTradingSequenceCPlanetAfter,a6 ; point to text to display
	bsr.w	ShowDialog
	rts
.before
	lea	StoryTextTradingSequenceCPlanetBefore,a6 ; point to text to display
	bsr.w	ShowDialog
	rts
	
;*******************************************************************************
; day 04+ - trading sequence
; (really day08,day10,day12)
; scene 18 - wwtv
; Juan
;  give: OBJ_ITEM_TICKETS
;  get: OBJ_ITEM_PORTABLE_TV
;*******************************************************************************
ActionScriptDay04SceneWWTVTrading:
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
	move.l	(MEM_TRADING_SEQUENCE_DAY),d7 ; copy progress of day trading to d7
	btst.l	#$3,d7 ; test if this trade is done
	bne.s	.after
	btst.l	#$2,d7 ; test if this trade is available
	beq.s	.before
	; otherwise trade
	bset.l	#$3,d7 ; set trade complete
	move.l	d7,(MEM_TRADING_SEQUENCE_DAY) ; save updated progress
	; queue scripted event
	lea ScriptedEventTradingSequenceWWVideoStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event		
	rts
.after
	lea	StoryTextTradingSequenceWWVideoAfter,a6 ; point to text to display
	bsr.w	ShowDialog
	rts
.before
	lea	StoryTextTradingSequenceWWVideoBefore,a6 ; point to text to display
	bsr.w	ShowDialog
	rts	
	
;*******************************************************************************
; day 05+ - trading sequence
; (really day10,day12)
; scene 12 - fcbcheckout
; Thomas
;  give: OBJ_ITEM_PORTABLE_TV
;  get: OBJ_ITEM_COUPONS
;*******************************************************************************
ActionScriptDay05SceneFCBCheckoutTrading:
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
	move.l	(MEM_TRADING_SEQUENCE_DAY),d7 ; copy progress of day trading to d7
	btst.l	#$4,d7 ; test if this trade is done
	bne.s	.after
	btst.l	#$3,d7 ; test if this trade is available
	beq.s	.before
	; otherwise trade
	bset.l	#$4,d7 ; set trade complete
	move.l	d7,(MEM_TRADING_SEQUENCE_DAY) ; save updated progress
	; queue scripted event
	lea ScriptedEventTradingSequenceFCBCheckoutStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event		
	rts
.after
	lea	StoryTextTradingSequenceFCBCheckoutAfter,a6 ; point to text to display
	bsr.w	ShowDialog
	rts
.before
	lea	StoryTextTradingSequenceFCBCheckoutBefore,a6 ; point to text to display
	bsr.w	ShowDialog
	rts	
	
;*******************************************************************************
; day 05+ - trading sequence
; (really day10,day12)
; scene 17 - wwcheckout
; Tanya
;  give: OBJ_ITEM_COUPONS
;  get: OBJ_ITEM_LPS
;*******************************************************************************
ActionScriptDay05SceneWWCheckoutTrading:
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
	move.l	(MEM_TRADING_SEQUENCE_DAY),d7 ; copy progress of day trading to d7
	btst.l	#$5,d7 ; test if this trade is done
	bne.s	.after
	btst.l	#$4,d7 ; test if this trade is available
	beq.s	.before
	; otherwise trade
	bset.l	#$5,d7 ; set trade complete
	move.l	d7,(MEM_TRADING_SEQUENCE_DAY) ; save updated progress
	; queue scripted event
	lea ScriptedEventTradingSequenceWWCheckoutStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event		
	rts
.after
	lea	StoryTextTradingSequenceWWCheckoutAfter,a6 ; point to text to display
	bsr.w	ShowDialog
	rts
.before
	lea	StoryTextTradingSequenceWWCheckoutBefore,a6 ; point to text to display
	bsr.w	ShowDialog
	rts	
	
;*******************************************************************************
; day 06 - trading sequence
; (really day12)
; scene 0E - PogoDawg
; Griffy
;  give: OBJ_ITEM_LPS
;  get: OBJ_ITEM_MYSTERY_BOX
;*******************************************************************************
ActionScriptDay06ScenePogoDawgTrading:
	;---------------------------------------------------------------
	; clerk hit region is an object because they are behind the counter
	;---------------------------------------------------------------
	move.w	(MEM_ACTION_TARGET_OBJID),d7 ; copy the object id to d7
	cmpi.w	#OBJ_NPC_GRIFFY,d7 ; test if the target is the clerk
	bne.w	TradingDefault ; not npc0 - show default text
	;----------------------------
	; trading sequence
	;----------------------------
	move.l	(MEM_TRADING_SEQUENCE_DAY),d7 ; copy progress of day trading to d7
	btst.l	#$6,d7 ; test if this trade is done
	bne.s	.after
	btst.l	#$5,d7 ; test if this trade is available
	beq.s	.before
	; otherwise trade
	bset.l	#$6,d7 ; set trade complete
	move.l	d7,(MEM_TRADING_SEQUENCE_DAY) ; save updated progress
	; queue scripted event
	lea ScriptedEventTradingSequencePogoDawgStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event		
	rts
.after
	lea	StoryTextTradingSequencePogoDawgAfter,a6 ; point to text to display
	bsr.w	ShowDialog
	rts
.before
	lea	StoryTextTradingSequencePogoDawgBefore,a6 ; point to text to display
	bsr.w	ShowDialog
	rts	
	
;*******************************************************************************
; day 06 - trading sequence
; (really day12)
; scene 00 - VB
; Grunberg
;  give: OBJ_ITEM_MYSTERY_BOX
;  get: OBJ_ITEM_TROPHY
;
; THIS WAS MOVED TO ActionScriptDay06
;*******************************************************************************

;*******************************************************************************
; Default for both day and night
;*******************************************************************************
TradingDefault:
	bsr.w ShowDefaultText
	rts		
	

