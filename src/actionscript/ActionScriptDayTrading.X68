;*******************************************************************************
; day 01+ - trading sequence 
; (really day02,day04,day06,day08,day10,day12)
; FCBFishing
; Heather
;  give: OBJ_ITEM_SCARF
;  get: OBJ_ITEM_HANDWARMER
;*******************************************************************************
ActionScriptDay01SceneFCBFishingTrading:
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
	; show the dialog
	lea	StoryTextTradingSequenceFCBFishing,a6 ; point to text to display
	bsr.w	ShowDialog
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
	move.l	(MEM_TRADING_SEQUENCE_DAY),d7 ; copy progress of day trading to d7
	btst.l	#$5,d7 ; test if this trade is done
	bne.s	.after
	btst.l	#$4,d7 ; test if this trade is available
	beq.s	.before
	; otherwise trade
	bset.l	#$5,d7 ; set trade complete
	move.l	d7,(MEM_TRADING_SEQUENCE_DAY) ; save updated progress
	bsr.w	ShowDialog
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
;*******************************************************************************
ActionScriptDay06SceneVBTrading:
	move.l	(MEM_TRADING_SEQUENCE_DAY),d7 ; copy progress of day trading to d7
	btst.l	#$7,d7 ; test if this trade is done
	bne.s	.after
	btst.l	#$6,d7 ; test if this trade is available
	beq.s	.before
	; otherwise trade
	bset.l	#$7,d7 ; set trade complete
	move.l	d7,(MEM_TRADING_SEQUENCE_DAY) ; save updated progress
	;set FLAG_GLOBAL_TradingDayComplete
	move.l	(MEM_GLOBAL_EVENT_FLAGS),d7
	bset.l	#FLAG_GLOBAL_TradingDayComplete,d7
	move.l	d7,(MEM_GLOBAL_EVENT_FLAGS)
	; queue scripted event	
	lea ScriptedEventTradingSequenceVBStart,a6 ; point a6 to event to load
	bsr.w QueueScriptedEvent ; queue the event			
	rts
.after
	lea	StoryTextTradingSequenceVBAfter,a6 ; point to text to display
	bsr.w	ShowDialog
	rts
.before
	lea	StoryTextTradingSequenceVBBefore,a6 ; point to text to display
	bsr.w	ShowDialog
	rts	

