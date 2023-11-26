;*******************************************************************************
; day 01+ - trading sequence 
; (really day02,day04,day06,day08,day10,day12)
; FCBFishing
; Heather
;  give: OBJ_ITEM_SCARF
;  get: OBJ_ITEM_HANDWARMER
;*******************************************************************************
ActionScriptDay01SceneFCBFishingTrading:
	bsr.w ShowDefaultText
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
	bsr.w ShowDefaultText
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
	bsr.w ShowDefaultText
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
	bsr.w ShowDefaultText
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
	bsr.w ShowDefaultText
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
	bsr.w ShowDefaultText
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
	bsr.w ShowDefaultText
	rts
	
;*******************************************************************************
; day 06 - trading sequence
; (really day12)
; scene 00 - VB
; Grunberg
;  give: OBJ_ITEM_MYSTERY_BOX
;  get: (still haven't figured this out)
;*******************************************************************************
ActionScriptDay06SceneVBTrading:
	bsr.w ShowDefaultText
	
	; need to set FLAG_GLOBAL_TradingNightComplete
	
	rts		
