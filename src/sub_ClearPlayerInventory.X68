;-------------------------------------------------------------------------------
; clear player inventory
;-------------------------------------------------------------------------------
ClearPlayerInventory:
	move.w	#$0000,(MEM_PLAYER1_ITEM_COUNT) ; reset item count
	move.w	#$0000,(MEM_PLAYER2_ITEM_COUNT) ; reset item count
	lea	MEM_PLAYER1_ITEMS,a1 ; point to start of item list
	bsr.w	ClearPlayerInventoryA
	lea	MEM_PLAYER2_ITEMS,a1 ; point to start of item list
ClearPlayerInventoryA:
	move.w	#MAX_ITEMS,d7	; copy max items to d7
	subq	#$1,d7	; decrement for zero-based list
ClearPlayerInventoryLoop:
	move.w	#$0000,(a1)+
	dbra	d7,ClearPlayerInventoryLoop	; loop to the end of the list
	rts
