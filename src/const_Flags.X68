;-------------------------------------------------------------------------------
; game state flags
;-------------------------------------------------------------------------------
STATE_FLAG_VBLANK=$00 ; vblank flag
STATE_FLAG_PAUSED=$01 ; game is paused
STATE_FLAG_EXPLORING=$02 ; player is controlling the sprite on the map
STATE_FLAG_DIALOG=$03 ; player is interacting with a dialog
STATE_FLAG_ACTION=$04 ; there is an action queued
STATE_FLAG_SCRIPTED_EVENT=$05 ; a scripted event is running
STATE_FLAG_TITLE_SCREEN=$06 ; title screen is displaying
STATE_FLAG_EXITS_BLOCKED=$07 ; blocks sprite from leaving scene
STATE_FLAG_END_SCREEN=$08 ; end screen is displaying
STATE_FLAG_INTRO_SCREEN=$09 ; day intro screen is displaying
STATE_FLAG_STATUS_SCREEN=$0A ; status screen is displaying
STATE_FLAG_MALL_CLOSED=$0B ; mall is closed for the night (unused in rc90)
STATE_FLAG_BASEMENT_OPEN=$C ; basement is accessible
STATE_FLAG_LOAD_MENU=$0D ; load menu is displaying
STATE_FLAG_FAST_TRAVEL_AVAILABLE=$0E ; whether fast-travel is available
	if	_DEBUG_
STATE_FLAG_DEBUG_MENU=$0F ; debug menu is displaying
	endif

;-------------------------------------------------------------------------------
; dialog state flags
;-------------------------------------------------------------------------------
; high word of MEM_DIALOG_FLAGS is used to track the state
DIALOG_FLAG_OPTION_PERSIST_SELECTOR=$12	; don't hide the selector after closing
DIALOG_FLAG_STYLE_TITLED=$13	; show dialog with title
DIALOG_FLAG_STYLE_ITEM_MENU=$14	; item menu dialog
DIALOG_FLAG_STYLE_MENU=$15	; overworld menu style dialog
DIALOG_FLAG_STYLE_TEXT_4CHOICE=$16	; dialog has text with selection at the end
DIALOG_FLAG_STYLE_TEXT_2CHOICE=$17	; dialog has text with selection at the end
DIALOG_FLAG_STYLE_SIMPLE_TEXT=$18	; dialog is a simple text dialog
DIALOG_FLAG_SELECTION_WAIT=$19	; waiting for the player to make a selection 
DIALOG_FLAG_TEXT_OPENING=$1A	; dialog is opening
DIALOG_FLAG_TEXT_TITLE_DRAWING=$1B	; dialog title text is drawing
DIALOG_FLAG_TEXT_DRAWING=$1C	; dialog text is drawing
DIALOG_FLAG_TEXT_OPEN=$1D	; dialog is open
DIALOG_FLAG_TEXT_NEW_PAGE=$1E	; dialog text has another page
DIALOG_FLAG_TEXT_CLOSING=$1F	; dialog is closing

;-------------------------------------------------------------------------------
; global event flags - used to track events across days 
;-------------------------------------------------------------------------------


;-------------------------------------------------------------------------------
; day event flags - used to track events in the current day 
;-------------------------------------------------------------------------------
FLAG_DAY00_EVENT00=$00 ; set after helping all customers in your store
FLAG_DAY00_EVENT01=$01 ; set after visiting the info desk

;-------------------------------------------------------------------------------
; mission event flags - used to track progress within sub-quests 
;-------------------------------------------------------------------------------

