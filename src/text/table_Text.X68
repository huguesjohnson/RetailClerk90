;-------------------------------------------------------------------------------
; default object descriptions
;-------------------------------------------------------------------------------
DefaultObjectDescriptionTable:
	dc.l	$00000000
;	; nothing
;	dc.l	DialogTextNothing
DefaultObjectDescriptionTableEnd:

;-------------------------------------------------------------------------------
; default character dialog
;-------------------------------------------------------------------------------
CharacterInteractTextTableStart:
	dc.l	DialogTextUnknownNPC
	dc.l	DialogTextUnknownNPC
	dc.l	DialogTextUnknownNPC
	dc.l	DialogTextUnknownNPC
	dc.l	DialogTextUnknownNPC
	dc.l	DialogTextUnknownNPC
	dc.l	DialogTextUnknownNPC
	;-----------------------------------
	; OBJ_NPC_ERYN=$2001
	;-----------------------------------
	dc.l	DialogTextErynDay00
	dc.l	DialogTextErynDay01
	dc.l	DialogTextErynDay02
	dc.l	DialogTextErynDay03
	dc.l	DialogTextErynDay04
	dc.l	DialogTextErynDay05
	dc.l	DialogTextErynDay06
	;-----------------------------------
	; OBJ_NPC_CARL=$2002
	;-----------------------------------
	dc.l	DialogTextCarlDay00
	dc.l	DialogTextCarlDay01
	dc.l	DialogTextCarlDay02
	dc.l	DialogTextCarlDay03
	dc.l	DialogTextCarlDay04
	dc.l	DialogTextCarlDay05
	dc.l	DialogTextCarlDay06
	;-----------------------------------
	; OBJ_NPC_FRANK=$2003
	;-----------------------------------
	dc.l	DialogTextFrankDay00
	dc.l	DialogTextFrankDay01
	dc.l	DialogTextFrankDay02
	dc.l	DialogTextFrankDay03
	dc.l	DialogTextFrankDay04
	dc.l	DialogTextFrankDay05
	dc.l	DialogTextFrankDay06
	;-----------------------------------
	; OBJ_NPC_CAROL=$2004
	;-----------------------------------
	dc.l	DialogTextCarolDay00
	dc.l	DialogTextCarolDay01
	dc.l	DialogTextCarolDay02
	dc.l	DialogTextCarolDay03
	dc.l	DialogTextCarolDay04
	dc.l	DialogTextCarolDay05
	dc.l	DialogTextCarolDay06
	;-----------------------------------
	; OBJ_NPC_LISA=$2005
	;-----------------------------------
	dc.l	DialogTextLisaDay00
	dc.l	DialogTextLisaDay01
	dc.l	DialogTextLisaDay02
	dc.l	DialogTextLisaDay03
	dc.l	DialogTextLisaDay04
	dc.l	DialogTextLisaDay05
	dc.l	DialogTextLisaDay06
	;-----------------------------------
	; OBJ_NPC_GRUNBERG=$2006
	;-----------------------------------
	dc.l	DialogTextGrunbergDay00
	dc.l	DialogTextGrunbergDay01
	dc.l	DialogTextGrunbergDay02
	dc.l	DialogTextGrunbergDay03
	dc.l	DialogTextGrunbergDay04
	dc.l	DialogTextGrunbergDay05
	dc.l	DialogTextGrunbergDay06
	;-----------------------------------
	; OBJ_NPC_JEN=$2007
	;-----------------------------------
	dc.l	DialogTextJenDay00
	dc.l	DialogTextJenDay01
	dc.l	DialogTextJenDay02
	dc.l	DialogTextJenDay03
	dc.l	DialogTextJenDay04
	dc.l	DialogTextJenDay05
	dc.l	DialogTextJenDay06
	;-----------------------------------
	; OBJ_NPC_GRIFFY=$2008
	;-----------------------------------
	dc.l	DialogTextGriffyDay00
	dc.l	DialogTextGriffyDay01
	dc.l	DialogTextGriffyDay02
	dc.l	DialogTextGriffyDay03
	dc.l	DialogTextGriffyDay04
	dc.l	DialogTextGriffyDay05
	dc.l	DialogTextGriffyDay06
	;-----------------------------------
	; OBJ_NPC_SCOTT=$2009
	;-----------------------------------
	dc.l	DialogTextScottDay00
	dc.l	DialogTextScottDay01
	dc.l	DialogTextScottDay02
	dc.l	DialogTextScottDay03
	dc.l	DialogTextScottDay04
	dc.l	DialogTextScottDay05
	dc.l	DialogTextScottDay06
	;-----------------------------------
	; OBJ_NPC_TODD=$200A
	;-----------------------------------
	dc.l	DialogTextToddDay00
	dc.l	DialogTextToddDay01
	dc.l	DialogTextToddDay02
	dc.l	DialogTextToddDay03
	dc.l	DialogTextToddDay04
	dc.l	DialogTextToddDay05
	dc.l	DialogTextToddDay06
	;-----------------------------------
	; OBJ_NPC_ELIZA=$200B
	;-----------------------------------
	dc.l	DialogTextElizaDay00
	dc.l	DialogTextElizaDay01
	dc.l	DialogTextElizaDay02
	dc.l	DialogTextElizaDay03
	dc.l	DialogTextElizaDay04
	dc.l	DialogTextElizaDay05
	dc.l	DialogTextElizaDay06
	;-----------------------------------
	; OBJ_NPC_BECKY=$200C
	;-----------------------------------
	dc.l	DialogTextBeckyDay00
	dc.l	DialogTextBeckyDay01
	dc.l	DialogTextBeckyDay02
	dc.l	DialogTextBeckyDay03
	dc.l	DialogTextBeckyDay04
	dc.l	DialogTextBeckyDay05
	dc.l	DialogTextBeckyDay06
	;-----------------------------------
	; OBJ_NPC_CHARLES=$200D
	;-----------------------------------
	dc.l	DialogTextCharlesDay00
	dc.l	DialogTextCharlesDay01
	dc.l	DialogTextCharlesDay02
	dc.l	DialogTextCharlesDay03
	dc.l	DialogTextCharlesDay04
	dc.l	DialogTextCharlesDay05
	dc.l	DialogTextCharlesDay06
	;-----------------------------------
	; OBJ_NPC_RANDY=$200E
	;-----------------------------------
	dc.l	DialogTextRandyDay00
	dc.l	DialogTextRandyDay01
	dc.l	DialogTextRandyDay02
	dc.l	DialogTextRandyDay03
	dc.l	DialogTextRandyDay04
	dc.l	DialogTextRandyDay05
	dc.l	DialogTextRandyDay06
	;-----------------------------------
	; OBJ_NPC_DB=$200F
	;-----------------------------------
	dc.l	DialogTextDBDay00
	dc.l	DialogTextDBDay01
	dc.l	DialogTextDBDay02
	dc.l	DialogTextDBDay03
	dc.l	DialogTextDBDay04
	dc.l	DialogTextDBDay05
	dc.l	DialogTextDBDay06
	;-----------------------------------
	; OBJ_NPC_DANI=$200F
	;-----------------------------------
	dc.l	DialogTextDaniDay00
	dc.l	DialogTextDaniDay01
	dc.l	DialogTextDaniDay02
	dc.l	DialogTextDaniDay03
	dc.l	DialogTextDaniDay04
	dc.l	DialogTextDaniDay05
	dc.l	DialogTextDaniDay06
	;-----------------------------------
	; OBJ_NPC_GUARD=$2011
	;-----------------------------------
	dc.l	DialogTextGuardDay00
	dc.l	DialogTextGuardDay01
	dc.l	DialogTextGuardDay02
	dc.l	DialogTextGuardDay03
	dc.l	DialogTextGuardDay04
	dc.l	DialogTextGuardDay05
	dc.l	DialogTextGuardDay06
	;-----------------------------------
	; OBJ_NPC_BILLY=$2012
	;-----------------------------------
	dc.l	DialogTextBillyDay00
	dc.l	DialogTextBillyDay01
	dc.l	DialogTextBillyDay02
	dc.l	DialogTextBillyDay03
	dc.l	DialogTextBillyDay04
	dc.l	DialogTextBillyDay05
	dc.l	DialogTextBillyDay06
	;-----------------------------------
	; OBJ_NPC_AL=$2013
	;-----------------------------------
	dc.l	DialogTextAlDay00
	dc.l	DialogTextAlDay01
	dc.l	DialogTextAlDay02
	dc.l	DialogTextAlDay03
	dc.l	DialogTextAlDay04
	dc.l	DialogTextAlDay05
	dc.l	DialogTextAlDay06
	;-----------------------------------
	; OBJ_NPC_THOMAS=$2014
	;-----------------------------------
	dc.l	DialogTextThomasDay00
	dc.l	DialogTextThomasDay01
	dc.l	DialogTextThomasDay02
	dc.l	DialogTextThomasDay03
	dc.l	DialogTextThomasDay04
	dc.l	DialogTextThomasDay05
	dc.l	DialogTextThomasDay06
	;-----------------------------------
	; OBJ_NPC_HEATHER=$2015
	;-----------------------------------
	dc.l	DialogTextHeatherDay00
	dc.l	DialogTextHeatherDay01
	dc.l	DialogTextHeatherDay02
	dc.l	DialogTextHeatherDay03
	dc.l	DialogTextHeatherDay04
	dc.l	DialogTextHeatherDay05
	dc.l	DialogTextHeatherDay06
	;-----------------------------------
	; OBJ_NPC_GARY=$2016
	;-----------------------------------
	dc.l	DialogTextGaryDay00
	dc.l	DialogTextGaryDay01
	dc.l	DialogTextGaryDay02
	dc.l	DialogTextGaryDay03
	dc.l	DialogTextGaryDay04
	dc.l	DialogTextGaryDay05
	dc.l	DialogTextGaryDay06
	;-----------------------------------
	; OBJ_NPC_GRANT=$2017
	;-----------------------------------
	dc.l	DialogTextGrantDay00
	dc.l	DialogTextGrantDay01
	dc.l	DialogTextGrantDay02
	dc.l	DialogTextGrantDay03
	dc.l	DialogTextGrantDay04
	dc.l	DialogTextGrantDay05
	dc.l	DialogTextGrantDay06
	;-----------------------------------
	; OBJ_NPC_BRETT=$2018
	;-----------------------------------
	dc.l	DialogTextBrettDay00
	dc.l	DialogTextBrettDay01
	dc.l	DialogTextBrettDay02
	dc.l	DialogTextBrettDay03
	dc.l	DialogTextBrettDay04
	dc.l	DialogTextBrettDay05
	dc.l	DialogTextBrettDay06
	;-----------------------------------
	; OBJ_NPC_NICKY=$2019
	;-----------------------------------
	dc.l	DialogTextNickyDay00
	dc.l	DialogTextNickyDay01
	dc.l	DialogTextNickyDay02
	dc.l	DialogTextNickyDay03
	dc.l	DialogTextNickyDay04
	dc.l	DialogTextNickyDay05
	dc.l	DialogTextNickyDay06
	;-----------------------------------
	; OBJ_NPC_TANYA=$201A
	;-----------------------------------
	dc.l	DialogTextTanyaDay00
	dc.l	DialogTextTanyaDay01
	dc.l	DialogTextTanyaDay02
	dc.l	DialogTextTanyaDay03
	dc.l	DialogTextTanyaDay04
	dc.l	DialogTextTanyaDay05
	dc.l	DialogTextTanyaDay06
	;-----------------------------------
	; OBJ_NPC_CRAIG=$201B
	;-----------------------------------
	dc.l	DialogTextCraigDay00
	dc.l	DialogTextCraigDay01
	dc.l	DialogTextCraigDay02
	dc.l	DialogTextCraigDay03
	dc.l	DialogTextCraigDay04
	dc.l	DialogTextCraigDay05
	dc.l	DialogTextCraigDay06
	;-----------------------------------
	; OBJ_NPC_JUAN=$201C
	;-----------------------------------
	dc.l	DialogTextJuanDay00
	dc.l	DialogTextJuanDay01
	dc.l	DialogTextJuanDay02
	dc.l	DialogTextJuanDay03
	dc.l	DialogTextJuanDay04
	dc.l	DialogTextJuanDay05
	dc.l	DialogTextJuanDay06
	;-----------------------------------
	; OBJ_NPC_LAURA=$201D
	;-----------------------------------
	dc.l	DialogTextLauraDay00
	dc.l	DialogTextLauraDay01
	dc.l	DialogTextLauraDay02
	dc.l	DialogTextLauraDay03
	dc.l	DialogTextLauraDay04
	dc.l	DialogTextLauraDay05
	dc.l	DialogTextLauraDay06
	;-----------------------------------
	; OBJ_NPC_GINA=$201E
	;-----------------------------------
	dc.l	DialogTextGinaDay00
	dc.l	DialogTextGinaDay01
	dc.l	DialogTextGinaDay02
	dc.l	DialogTextGinaDay03
	dc.l	DialogTextGinaDay04
	dc.l	DialogTextGinaDay05
	dc.l	DialogTextGinaDay06
	;-----------------------------------
	; OBJ_NPC_SANTA=$201F
	;-----------------------------------
	dc.l	DialogTextSantaDay00
	dc.l	DialogTextSantaDay01
	dc.l	DialogTextSantaDay02
	dc.l	DialogTextSantaDay03
	dc.l	DialogTextSantaDay04
	dc.l	DialogTextSantaDay05
	dc.l	DialogTextSantaDay06
	;-----------------------------------
	; OBJ_NPC_LOSTGUY=$2020
	;-----------------------------------
	dc.l	DialogTextLostGuyDay00
	dc.l	DialogTextLostGuyDay01
	dc.l	DialogTextLostGuyDay02
	dc.l	DialogTextLostGuyDay03
	dc.l	DialogTextLostGuyDay04
	dc.l	DialogTextLostGuyDay05
	dc.l	DialogTextLostGuyDay06
	;-----------------------------------
	; OBJ_NPC_ROCKER=$2021
	;-----------------------------------
	dc.l	DialogTextRockerDay00
	dc.l	DialogTextRockerDay01
	dc.l	DialogTextRockerDay02
	dc.l	DialogTextRockerDay03
	dc.l	DialogTextRockerDay04
	dc.l	DialogTextRockerDay05
	dc.l	DialogTextRockerDay06
	;-----------------------------------
	; OBJ_NPC_SHOPPER=$2022
	;-----------------------------------
	dc.l	DialogTextShopperDay00
	dc.l	DialogTextShopperDay01
	dc.l	DialogTextShopperDay02
	dc.l	DialogTextShopperDay03
	dc.l	DialogTextShopperDay04
	dc.l	DialogTextShopperDay05
	dc.l	DialogTextShopperDay06
	;-----------------------------------
	; OBJ_NPC_BUSYMOM=$2023
	;-----------------------------------
	dc.l	DialogTextBusyMomDay00
	dc.l	DialogTextBusyMomDay01
	dc.l	DialogTextBusyMomDay02
	dc.l	DialogTextBusyMomDay03
	dc.l	DialogTextBusyMomDay04
	dc.l	DialogTextBusyMomDay05
	dc.l	DialogTextBusyMomDay06
	;-----------------------------------
	; OBJ_NPC_MALLRAT=$2024
	;-----------------------------------
	dc.l	DialogTextMallratDay00
	dc.l	DialogTextMallratDay01
	dc.l	DialogTextMallratDay02
	dc.l	DialogTextMallratDay03
	dc.l	DialogTextMallratDay04
	dc.l	DialogTextMallratDay05
	dc.l	DialogTextMallratDay06
	;-----------------------------------
	; OBJ_NPC_PREPPY=$2025
	;-----------------------------------
	dc.l	DialogTextPreppyDay00
	dc.l	DialogTextPreppyDay01
	dc.l	DialogTextPreppyDay02
	dc.l	DialogTextPreppyDay03
	dc.l	DialogTextPreppyDay04
	dc.l	DialogTextPreppyDay05
	dc.l	DialogTextPreppyDay06
	;-----------------------------------
	; OBJ_NPC_YUPPIE=$2026
	;-----------------------------------
	dc.l	DialogTextYuppieDay00
	dc.l	DialogTextYuppieDay01
	dc.l	DialogTextYuppieDay02
	dc.l	DialogTextYuppieDay03
	dc.l	DialogTextYuppieDay04
	dc.l	DialogTextYuppieDay05
	dc.l	DialogTextYuppieDay06
	;-----------------------------------
	; OBJ_NPC_HIDDENHJ=$2027
	;-----------------------------------
	dc.l	DialogTextHiddenHJDay00
	dc.l	DialogTextHiddenHJDay01
	dc.l	DialogTextHiddenHJDay02
	dc.l	DialogTextHiddenHJDay03
	dc.l	DialogTextHiddenHJDay04
	dc.l	DialogTextHiddenHJDay05
	dc.l	DialogTextHiddenHJDay06
	;-----------------------------------
	; OBJ_NPC_HIDDENMJ=$2028
	;-----------------------------------
	dc.l	DialogTextHiddenMJDay00
	dc.l	DialogTextHiddenMJDay01
	dc.l	DialogTextHiddenMJDay02
	dc.l	DialogTextHiddenMJDay03
	dc.l	DialogTextHiddenMJDay04
	dc.l	DialogTextHiddenMJDay05
	dc.l	DialogTextHiddenMJDay06
CharacterInteractTextTableEnd:

;-------------------------------------------------------------------------------
; object names
;-------------------------------------------------------------------------------
ObjectNameTable:
	dc.l	$00000000
ObjectNameTableEnd:

;-------------------------------------------------------------------------------
; npc names
;-------------------------------------------------------------------------------
NPCNameTable:
	dc.l	$00000000
;	dc.l	NPCNameUnknown
NPCNameTableEnd:

;-------------------------------------------------------------------------------
; item names
;-------------------------------------------------------------------------------
ItemNameTable:
	dc.l	$00000000
;	; OBJ_ITEM_NOTHING
;	dc.l	ItemNameNothing
ItemNameTableEnd:

;-------------------------------------------------------------------------------
; item descriptions
;-------------------------------------------------------------------------------
ItemDescriptionTable:
	dc.l	$00000000
;	; OBJ_ITEM_NOTHING
;	dc.l	$00000000
ItemDescriptionTableEnd:

;-------------------------------------------------------------------------------
; store names
;-------------------------------------------------------------------------------
StoreNameTable:
	dc.l	$00000000
;	dc.l	StoreName00
StoreNameTableEnd:

;-------------------------------------------------------------------------------
; status screen objectives
;-------------------------------------------------------------------------------
StatusScreenObjectives:
	dc.l	$00000000
;	dc.l	StatusScreenDay00Objective00
StatusScreenObjectivesEnd:

;-------------------------------------------------------------------------------
; save game titles
;-------------------------------------------------------------------------------
SaveGameTitles:
	dc.l	$00000000
;	dc.l	SaveGameTitleD0O0
SaveGameTitlesEnd:


