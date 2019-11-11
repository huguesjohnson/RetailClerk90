	dc.b	'SEGA GENESIS    '	; console name
	dc.b	'(C)HUJO '	; copyright
	dc.b	'2019.NOV'	; date
	dc.b	'Retail Clerk 90                                 '	; copyright
	dc.b	'Retail Clerk 90                                 '	; copyright
	dc.b	'GM 20191110-20'	; program type / serial number / version
	dc.w	$0000	; ROM checksum
	dc.b	'J               '	; I/O device support (unused)
	dc.l	$00000000	; address of ROM start
	dc.l	RomEnd	; address of ROM end
	dc.l	$FFFF0000,$FFFFFFFF	; RAM start/end
	dc.b	'RA',$F8,$20	; SRAM type
	dc.l	SRAM_START	; SRAM start address
	dc.l	SRAM_END	; SRAM endaddress
	dc.b	'            '	; modem info
	dc.b	'http://huguesjohnson.com/               '	; comment
	dc.b	'JUE             '	; regions allowed
