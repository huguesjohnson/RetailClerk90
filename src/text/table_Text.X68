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


