;*******************************************************************************
; night 01+ - trading sequence
; (really day03,day05,day07,day09,day11,day13)
; scene 13 - FCBFirearms
; Randy
;  give: OBJ_ITEM_VHS_TAPE
;  get: OBJ_ITEM_MOOSE_ATTRACTANT
;*******************************************************************************
ActionScriptNight01SceneFCBFirearmsTrading:
	move.l	(MEM_TRADING_SEQUENCE_NIGHT),d7 ; copy progress of night trading to d7
	btst.l	#$0,d7 ; test if this trade is done
	bne.s	.after
	; otherwise trade
	bset.l	#$0,d7 ; set trade complete
	move.l	d7,(MEM_TRADING_SEQUENCE_NIGHT) ; save updated progress
	; remove item
	lea	MEM_PLAYER2_ITEM_COUNT,a1 ; point to 2nd pc inventory
	move.w	#OBJ_ITEM_VHS_TAPE,d7 ; remove item from trading sequence
	bsr.w	RemoveItem ; remove item from the inventory			
	; add item to start trading sequence
	lea	MEM_PLAYER2_ITEM_COUNT,a1 ; point to 2nd pc inventory
	move.w	#OBJ_ITEM_MOOSE_ATTRACTANT,d7 ; add item from trading sequence
	bsr.w	AddItem ; add item to inventory				
	; show the dialog
	lea	StoryTextTradingSequenceFCBFirearms,a6 ; point to text to display
	bsr.w	ShowDialog
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
	move.l	(MEM_TRADING_SEQUENCE_NIGHT),d7 ; copy progress of night trading to d7
	btst.l	#$1,d7 ; test if this trade is done
	bne.s	.after
	btst.l	#$0,d7 ; test if this trade is available
	beq.s	.before
	; otherwise trade
	bset.l	#$1,d7 ; set trade complete
	move.l	d7,(MEM_TRADING_SEQUENCE_NIGHT) ; save updated progress
	; remove item
	lea	MEM_PLAYER2_ITEM_COUNT,a1 ; point to 2nd pc inventory
	move.w	#OBJ_ITEM_MOOSE_ATTRACTANT,d7 ; remove item from trading sequence
	bsr.w	RemoveItem ; remove item from the inventory			
	; add item to start trading sequence
	lea	MEM_PLAYER2_ITEM_COUNT,a1 ; point to 2nd pc inventory
	move.w	#OBJ_ITEM_SHIRT,d7 ; add item from trading sequence
	bsr.w	AddItem ; add item to inventory				
	; show the dialog
	lea	StoryTextTradingSequenceCheckers,a6 ; point to text to display
	bsr.w	ShowDialog
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
	move.l	(MEM_TRADING_SEQUENCE_NIGHT),d7 ; copy progress of night trading to d7
	btst.l	#$2,d7 ; test if this trade is done
	bne.s	.after
	btst.l	#$1,d7 ; test if this trade is available
	beq.s	.before
	; otherwise trade
	bset.l	#$2,d7 ; set trade complete
	move.l	d7,(MEM_TRADING_SEQUENCE_NIGHT) ; save updated progress
	; remove item
	lea	MEM_PLAYER2_ITEM_COUNT,a1 ; point to 2nd pc inventory
	move.w	#OBJ_ITEM_SHIRT,d7 ; remove item from trading sequence
	bsr.w	RemoveItem ; remove item from the inventory			
	; add item to start trading sequence
	lea	MEM_PLAYER2_ITEM_COUNT,a1 ; point to 2nd pc inventory
	move.w	#OBJ_ITEM_HEADBAND,d7 ; add item from trading sequence
	bsr.w	AddItem ; add item to inventory				
	; show the dialog
	lea	StoryTextTradingSequenceWWAudio,a6 ; point to text to display
	bsr.w	ShowDialog
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
	move.l	(MEM_TRADING_SEQUENCE_NIGHT),d7 ; copy progress of night trading to d7
	btst.l	#$3,d7 ; test if this trade is done
	bne.s	.after
	btst.l	#$2,d7 ; test if this trade is available
	beq.s	.before
	; otherwise trade
	bset.l	#$3,d7 ; set trade complete
	move.l	d7,(MEM_TRADING_SEQUENCE_NIGHT) ; save updated progress
	; remove item
	lea	MEM_PLAYER2_ITEM_COUNT,a1 ; point to 2nd pc inventory
	move.w	#OBJ_ITEM_HEADBAND,d7 ; remove item from trading sequence
	bsr.w	RemoveItem ; remove item from the inventory			
	; add item to start trading sequence
	lea	MEM_PLAYER2_ITEM_COUNT,a1 ; point to 2nd pc inventory
	move.w	#OBJ_ITEM_FM_CONVERTER,d7 ; add item from trading sequence
	bsr.w	AddItem ; add item to inventory				
	; show the dialog
	lea	StoryTextTradingSequenceTLodge,a6 ; point to text to display
	bsr.w	ShowDialog
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
	move.l	(MEM_TRADING_SEQUENCE_NIGHT),d7 ; copy progress of night trading to d7
	btst.l	#$4,d7 ; test if this trade is done
	bne.s	.after
	btst.l	#$3,d7 ; test if this trade is available
	beq.s	.before
	; otherwise trade
	bset.l	#$4,d7 ; set trade complete
	move.l	d7,(MEM_TRADING_SEQUENCE_NIGHT) ; save updated progress
	; remove item
	lea	MEM_PLAYER2_ITEM_COUNT,a1 ; point to 2nd pc inventory
	move.w	#OBJ_ITEM_FM_CONVERTER,d7 ; remove item from trading sequence
	bsr.w	RemoveItem ; remove item from the inventory			
	; add item to start trading sequence
	lea	MEM_PLAYER2_ITEM_COUNT,a1 ; point to 2nd pc inventory
	move.w	#OBJ_ITEM_FLANNEL_SHIRT,d7 ; add item from trading sequence
	bsr.w	AddItem ; add item to inventory				
	; show the dialog
	lea	StoryTextTradingSequenceCNow,a6 ; point to text to display
	bsr.w	ShowDialog
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
	move.l	(MEM_TRADING_SEQUENCE_NIGHT),d7 ; copy progress of night trading to d7
	btst.l	#$5,d7 ; test if this trade is done
	bne.s	.after
	btst.l	#$4,d7 ; test if this trade is available
	beq.s	.before
	; otherwise trade
	bset.l	#$5,d7 ; set trade complete
	move.l	d7,(MEM_TRADING_SEQUENCE_NIGHT) ; save updated progress
	; remove item
	lea	MEM_PLAYER2_ITEM_COUNT,a1 ; point to 2nd pc inventory
	move.w	#OBJ_ITEM_FLANNEL_SHIRT,d7 ; remove item from trading sequence
	bsr.w	RemoveItem ; remove item from the inventory			
	; add item to start trading sequence
	lea	MEM_PLAYER2_ITEM_COUNT,a1 ; point to 2nd pc inventory
	move.w	#OBJ_ITEM_UTILITY_KNIFE,d7 ; add item from trading sequence
	bsr.w	AddItem ; add item to inventory				
	; show the dialog
	lea	StoryTextTradingSequenceFCBCamping,a6 ; point to text to display
	bsr.w	ShowDialog
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
	move.l	(MEM_TRADING_SEQUENCE_NIGHT),d7 ; copy progress of night trading to d7
	btst.l	#$6,d7 ; test if this trade is done
	bne.s	.after
	btst.l	#$5,d7 ; test if this trade is available
	beq.s	.before
	; otherwise trade
	bset.l	#$6,d7 ; set trade complete
	move.l	d7,(MEM_TRADING_SEQUENCE_NIGHT) ; save updated progress
	; remove item
	lea	MEM_PLAYER2_ITEM_COUNT,a1 ; point to 2nd pc inventory
	move.w	#OBJ_ITEM_UTILITY_KNIFE,d7 ; remove item from trading sequence
	bsr.w	RemoveItem ; remove item from the inventory			
	; add item to start trading sequence
	lea	MEM_PLAYER2_ITEM_COUNT,a1 ; point to 2nd pc inventory
	move.w	#OBJ_ITEM_EARRING,d7 ; add item from trading sequence
	bsr.w	AddItem ; add item to inventory				
	; show the dialog
	lea	StoryTextTradingSequenceCavern,a6 ; point to text to display
	bsr.w	ShowDialog
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
;  get: (still haven't figured this out)
;*******************************************************************************
ActionScriptNight06SceneDenimCountryTrading:
	bsr.w ShowDefaultText

	; need to set FLAG_GLOBAL_TradingNightComplete

	rts				
