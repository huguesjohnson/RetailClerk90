;*******************************************************************************
; night 01+ - trading sequence
; (really day03,day05,day07,day09,day11,day13)
; scene 13 - FCBFirearms
; Randy
;  give: OBJ_ITEM_VHS_TAPE
;  get: OBJ_ITEM_MOOSE_ATTRACTANT
;*******************************************************************************
ActionScriptNight01SceneFCBFirearmsTrading:
	bsr.w ShowDefaultText
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
	bsr.w ShowDefaultText
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
	bsr.w ShowDefaultText
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
	bsr.w ShowDefaultText
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
	bsr.w ShowDefaultText
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
	bsr.w ShowDefaultText
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
	bsr.w ShowDefaultText
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
