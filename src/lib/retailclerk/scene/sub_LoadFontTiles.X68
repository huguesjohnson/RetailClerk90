;-------------------------------------------------------------------------------
; LoadFontTiles
; loads (or reloads) the font tiles into the VDP
; a0 = address of first tile to load
; d0, d1, d2, and a0 are all modified by this routine
;-------------------------------------------------------------------------------
LoadFontTiles:
	move.w	#FONT_VDP,d1	; setup call to BuildVRAMWriteAddress
	bsr.w	BuildVRAMWriteAddress	; build the VRAM write address
	move.l	#FontTilesStart,d2	; start address of tileset
	move.l	#DialogFrameTilesEnd,d0	; end address of tileset
	sub.l	d2,d0	; subtract the start address to get length
	divu.w	#$0004,d0	; divide by 4 to setup call to LoadTiles
	movea.l	d2,a0	; set address of first tile to load
	bsr.w	LoadTiles	; branch to LoadTiles subroutine
	rts	

;-------------------------------------------------------------------------------
; rewrites fonts with slightly distorted version
; a0 = address of first tile to load
; d0, d1, d2, d3 and a0 are all modified by this routine
;-------------------------------------------------------------------------------	
LoadFontTilesSlightDistort:	
	bsr.w	PseudoRandomWord ; generate a pseudo random number
	move.w	d0,d3 ; the result is in d0, copy it to d3
	move.w	#FONT_VDP,d1 ; setup call to BuildVRAMWriteAddress
	bsr.w	BuildVRAMWriteAddress ; build the VRAM write address
	move.l	#FontTilesStart,d2 ; start address of tileset
	move.l	#DialogFrameTilesStart,d0 ; end address of tileset
	sub.l	d2,d0 ; subtract the start address to get length
	divu.w	#$0004,d0 ; divide by 4 to setup call to LoadTiles
	movea.l	d2,a0 ; set address of first tile to load
	subq	#$01,d0 ; iterate over ((number of tiles to load) - 1)
	move.l	d1,(VDP_CONTROL) ; set address for VDP write
.loop:
	move.l (a0)+,d1 ; copy next tile to d1
	add.w	d0,d3 ; shifts the distort effect a little each tile
	bchg.l	d3,d1 ; the actual distort effect happens here
	move.l d1,(VDP_DATA) ; move data to VDP & increment address
	dbra d0,.loop ; loop until all data is loaded	
	rts
