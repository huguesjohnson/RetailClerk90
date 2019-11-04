;ScriptedEventDay00Exit:
;	dc.w	$0004	; NPC2
;	dc.w	DIRECTION_DOWN	; move them offscreen
;	dc.w	$0190
;	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
;	dc.w	$0003	; NPC1
;	dc.w	DIRECTION_RIGHT
;	dc.w	$0060
;	dc.w	DIRECTION_UP
;	dc.w	$0030
;	dc.w	SCRIPTED_EVENT_DIALOG
;	dc.l	DialogTextDaniScene00Day00Exit0
;	dc.w	DIRECTION_DOWN	; start moving them offscren
;	dc.w	$0010
;	dc.w	SCRIPTED_EVENT_DIALOG
;	dc.l	DialogTextDaniScene00Day00Exit1
;	dc.w	DIRECTION_DOWN	; continue moving them offscren
;	dc.w	$0010
;	dc.w	SCRIPTED_EVENT_DIALOG
;	dc.l	DialogTextDaniScene00Day00Exit2
;	dc.w	DIRECTION_DOWN	; finish moving them offscren
;	dc.w	$0060
;	dc.w	SCRIPTED_EVENT_CHANGE_SPRITE
;	dc.w	$0002	; NPC0
;	dc.w	DIRECTION_UP	; move them onto the screen
;	dc.w	$0086
;	dc.w	DIRECTION_DOWN	; move down 1 to show the front of the sprite
;	dc.w	$0001
;	dc.w	SCRIPTED_EVENT_DIALOG
;	dc.l	DialogTextGreenbergScene00Day00Exit
;	dc.w	SCRIPTED_EVENT_END

