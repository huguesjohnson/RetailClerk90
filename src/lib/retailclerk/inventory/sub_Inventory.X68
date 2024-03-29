;*******************************************************************************
; subroutines to manage player inventory
;*******************************************************************************

;-------------------------------------------------------------------------------
; adds an item to the player's inventory 
; d7 = item to add
; d6 is modified by this subroutine
; a1 should be pointing to MEM_PLAYER1_ITEM_COUNT or MEM_PLAYER2_ITEM_COUNT
;-------------------------------------------------------------------------------
AddItem:
	move.w	(a1),d6	; copy current item count to d6
	cmpi.w	#MAX_ITEMS,d6 ; check if inventory is full 
	bge.s	ExitAddItem ; branch if already at the limit
AddItemFindOpenSlot:
	addq	#$1,d6	; increment item count
	move.w	d6,(a1) ; save new item count
	mulu.w	#WORD_SIZE,d6 ; find index of location to write the item
	move.w	d7,(a1,d6) ; copy the item	
ExitAddItem:
	rts

;-------------------------------------------------------------------------------
; adds an item to the player's inventory
; overwrites first item if the player's inventory is full  
; d7 = item to add
; d6 is modified by this subroutine
; a1 should be pointing to MEM_PLAYER1_ITEM_COUNT or MEM_PLAYER2_ITEM_COUNT
;-------------------------------------------------------------------------------
AddItemOverwrite:
	move.w	(a1)+,d6 ; copy current item count to d6
	cmpi.w	#MAX_ITEMS,d6 ; check if inventory is full 
	blt.w	AddItemFindOpenSlot	; branch if below the limit
	; overwrite the first item
	move.w	d7,(a1)	; copy the item	
ExitAddItemOverwrite:
	rts

;-------------------------------------------------------------------------------
; tests if the player has an item
; d7 = item to look for
; d6 will have index of item if found, otherwise FFFF
; d5 is modified by this subroutine
; a1 is modified by this subroutine
; a2 should be pointing to MEM_PLAYER1_ITEM_COUNT or MEM_PLAYER2_ITEM_COUNT
;-------------------------------------------------------------------------------
HasItem:
	move.w	(a2)+,d6	; copy item count to d6
	tst.w	d6 ; test if item count is zero
	beq.s	HasItemNotFound ; item count is zero, return FFFF and exit
	subq	#$1,d6 ; decrement for zero-based list
	move.w	d6,d5 ; copy item count to d5
	mulu.w	#WORD_SIZE,d5 ; multiply to get the index of the last item
	adda.l	d5,a2 ; move a1 to last item in the list
HasItemLoop:
	cmp.w	(a2),d7	; test if this is the item we're looking for
	beq.s	ExitHasItem	; branch if it is
	suba.l	#WORD_SIZE,a2 ; move to next item
	dbra	d6,HasItemLoop ; loop to the end of the list
HasItemNotFound:
	move.w	#$FFFF,d6 ; set FFFF as the return value
ExitHasItem:
	rts

;-------------------------------------------------------------------------------
; removes an item from the player's inventory
; d7 = item to remove
; d5 and d6 are modified by this subroutine
; a1 should be pointing to MEM_PLAYER1_ITEM_COUNT or MEM_PLAYER2_ITEM_COUNT
;-------------------------------------------------------------------------------
RemoveActiveItem:
	move.w	(MEM_ACTIVE_ITEM),d7	; copy active item to d7
RemoveItem:
	movea.l	a1,a2 ; point a2 to MEM_PLAYER1_ITEM_COUNT or MEM_PLAYER2_ITEM_COUNT
	bsr.w	HasItem	; test if the item is in the inventory
	cmpi.w	#$FFFF,d6 ; test if the item was found
	beq.s	ExitRemoveItem ; exit if it was not
	movea.l	a1,a2 ; point a2 to MEM_PLAYER1_ITEM_COUNT or MEM_PLAYER2_ITEM_COUNT
	subq	#$1,(a1)+ ; decrement item count
	move.w	d6,d5 ; copy item index to d5
	mulu.w	#WORD_SIZE,d5 ; multiply to get the index of the removed item
	adda.l	d5,a1 ; move a1 to the removed item
	move.w	#$0000,(a1) ; clear removed item	
	move.w	(a2),d5	; copy item count to d5
	cmp.w	d6,d5 ; test if the last item in the list was removed
	beq.s	ExitRemoveItem	; if the last item was removed then exit
	sub.w	d6,d5 ; subtract item index from count to get loop control
	subq	#$1,d5 ; subtract one from loop control
RemoveItemLoop:
	move.w	(WORD_SIZE,a1),(a1)	; copy item+1 to current item
	adda.l	#WORD_SIZE,a1 ; move to next item
	move.w	#$0000,(a1) ; clear item slot	
	dbra	d5,RemoveItemLoop ; loop to next item
ExitRemoveItem:
	rts

