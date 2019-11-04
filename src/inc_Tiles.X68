TransparentTileStart:
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
TransparentTileEnd:

;-------------------------------------------------------------------------------
; font tiles
;-------------------------------------------------------------------------------

FontTilesStart:
	include 'tiles/font-tiles/dwf.X68'
	include 'tiles/font-tiles/dialog-frame.X68'
FontTilesEnd:

;-------------------------------------------------------------------------------
; title screen tiles
;-------------------------------------------------------------------------------
;TitleScreenTilesStart:
;	include 'tiles/title-tiles/tileset_title_logo.X68'
;	include 'tiles/title-tiles/tileset_title_bg.X68'
;	include 'tiles/title-tiles/tileset_title_menu.X68'
;TitleScreenTilesEnd:


