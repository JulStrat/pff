	.file "disk_io.pas"
# Begin asmlist al_procedures

.section .text.n_disk_io_ss_send_cmdsbyteslongwordssbyte,"ax"
DISK_IO_ss_SEND_CMDsBYTEsLONGWORDssBYTE:
.Lc2:
# [disk_io.pas]
# [79] begin
	push	r7
	push	r6
	push	r5
	push	r4
	push	r3
	push	r2
# Var $result located in register r5
# Var n located in register r18
	mov	r3,r24
# Var cmd located in register r3
	mov	r4,r20
	mov	r2,r21
	mov	r7,r22
	mov	r6,r23
# Var arg located in register r4
# [81] if cmd and $80 <> 0 then
	mov	r18,r3
	andi	r18,-128
	breq	.Lj6
# [83] cmd := cmd and $7F;
	ldi	r26,127
	and	r3,r26
# [85] Result := send_cmd(CMD55, 0);
	mov	r20,r1
	mov	r21,r1
	mov	r22,r1
	mov	r23,r1
	ldi	r26,119
	mov	r24,r26
	call	DISK_IO_ss_SEND_CMDsBYTEsLONGWORDssBYTE
	mov	r5,r24
# [86] if Result > 1 then
	ldi	r18,1
	cp	r18,r5
	brsh	.Lj18
# [114] end;
	rjmp	.Lj3
.Lj18:
.Lj6:
# [69] {$define DESELECT := PORTB := PORTB or 4 }
	sbi	5,2
# [90] spi_transceiver();
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
# [68] {$define SELECT := PORTB := PORTB and (not 4) }
	cbi	5,2
# [92] spi_transceiver();
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
# Var cmd located in register r3
# [95] spi_transceiver(cmd);               (* Start + Command index *)
	mov	r24,r3
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
# [96] spi_transceiver(byte(arg shr 24));  (* Argument[31..24]      *)
	mov	r24,r6
	mov	r18,r1
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
# [97] spi_transceiver(byte(arg shr 16));  (* Argument[23..16]      *)
	mov	r24,r7
	mov	r18,r1
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
# [98] spi_transceiver(byte(arg shr 8));   (* Argument[15..8]       *)
	mov	r24,r2
	mov	r18,r1
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
# [99] spi_transceiver(byte(arg));         (* Argument[7..0]        *)
	mov	r24,r4
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
# Var n located in register r24
# [100] n := $01;                           (* Dummy CRC + Stop *)
	ldi	r24,1
# [101] if (cmd = CMD0) then
	ldi	r26,64
	cp	r3,r26
	brne	.Lj10
# [102] n := $95;                         (* Valid CRC for CMD0(0) *)
	ldi	r24,-107
.Lj10:
# [103] if (cmd = CMD8) then
	ldi	r26,72
	cp	r3,r26
	brne	.Lj12
# [104] n := $87;                         (* Valid CRC for CMD8(0x1AA) *)
	ldi	r24,-121
.Lj12:
# Var n located in register r24
# [105] spi_transceiver(n);
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
# Var n located in register r2
# [107] for n := 9 downto 0 do
	ldi	r26,10
	mov	r2,r26
.Lj13:
	dec	r2
# [109] Result := spi_transceiver();
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	mov	r5,r24
# [110] if Result and $80 = 0 then
	mov	r18,r5
	andi	r18,-128
	breq	.Lj3
	cp	r1,r2
	brlo	.Lj13
.Lj3:
	mov	r24,r5
	pop	r2
	pop	r3
	pop	r4
	pop	r5
	pop	r6
	pop	r7
	ret
.Lc1:
.Le0:
	.size	DISK_IO_ss_SEND_CMDsBYTEsLONGWORDssBYTE, .Le0 - DISK_IO_ss_SEND_CMDsBYTEsLONGWORDssBYTE

.section .text.n_disk_io_ss_disk_initializessbyte,"ax"
.globl	DISK_IO_ss_DISK_INITIALIZEssBYTE
DISK_IO_ss_DISK_INITIALIZEssBYTE:
.Lc4:
# [124] begin
	push	r29
	push	r28
	push	r16
	push	r5
	push	r4
	push	r3
	push	r2
	in	r28,61
	in	r29,62
	subi	r28,6
	sbci	r29,0
	in	r0,63
	cli
	out	62,r29
	out	63,r0
	out	61,r28
# Var $result located in register r18
# Var stat located in register r18
# Var n located in register r18
# Var cmd located in register r5
# Var ty located in register r18
# Var ocr located at r28+2, size=OS_32
# Var tmr located in register r3
# [126] spi_init_master();
	call	SPI_ss_SPI_INIT_MASTER
	sbi	5,2
# [129] spi_transceiver();
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
# Var ty located in register r2
# [131] ty := 0;
	mov	r2,r1
# [132] if send_cmd(CMD0, 0) = 1 then
	mov	r20,r1
	mov	r21,r1
	mov	r22,r1
	mov	r23,r1
	ldi	r26,64
	mov	r24,r26
	call	DISK_IO_ss_SEND_CMDsBYTEsLONGWORDssBYTE
	cpi	r24,1
	breq	.Lj54
# [192] end;
	rjmp	.Lj22
.Lj54:
# [135] if send_cmd(CMD8, $1AA) = 1 then
	ldi	r20,-86
	ldi	r21,1
	mov	r22,r1
	mov	r23,r1
	ldi	r26,72
	mov	r24,r26
	call	DISK_IO_ss_SEND_CMDsBYTEsLONGWORDssBYTE
	cpi	r24,1
	breq	.Lj55
	rjmp	.Lj24
.Lj55:
# [139] ocr[n] := spi_transceiver();
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	std	Y+2,r24
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	std	Y+3,r24
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	std	Y+4,r24
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	std	Y+5,r24
# [140] if (ocr[2] = $01) and (ocr[3] = $AA) then
	ldd	r18,Y+4
	cpi	r18,1
	breq	.Lj56
	rjmp	.Lj22
.Lj56:
	ldd	r18,Y+5
	cpi	r18,-86
	breq	.Lj57
	rjmp	.Lj22
.Lj57:
# [143] for tmr := 10000 downto 0 do
	ldi	r26,17
	mov	r3,r26
	ldi	r26,39
	mov	r4,r26
.Lj28:
	ldi	r26,1
	sub	r3,r26
	sbc	r4,r1
# [145] if send_cmd(ACMD41, 1 shl 30) = 0 then
	mov	r20,r1
	mov	r21,r1
	mov	r22,r1
	ldi	r23,64
	ldi	r26,-23
	mov	r24,r26
	call	DISK_IO_ss_SEND_CMDsBYTEsLONGWORDssBYTE
	cp	r24,r1
	breq	.Lj30
	cp	r1,r3
	cpc	r1,r4
	brlo	.Lj28
.Lj30:
# [149] if (tmr <> 0) and (send_cmd(CMD58, 0) = 0) then
	cp	r3,r1
	cpc	r4,r1
	brne	.Lj58
	rjmp	.Lj22
.Lj58:
	mov	r20,r1
	mov	r21,r1
	mov	r22,r1
	mov	r23,r1
	ldi	r26,122
	mov	r24,r26
	call	DISK_IO_ss_SEND_CMDsBYTEsLONGWORDssBYTE
	cp	r24,r1
	breq	.Lj59
	rjmp	.Lj22
.Lj59:
# [152] ocr[n] := spi_transceiver();
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	std	Y+2,r24
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	std	Y+3,r24
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	std	Y+4,r24
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	std	Y+5,r24
# [153] if (ocr[0] and $40) <> 0 then
	ldd	r18,Y+2
	andi	r18,64
	breq	.Lj37
# [154] ty := CT_SD2 or CT_BLOCK
	ldi	r26,12
	mov	r2,r26
	rjmp	.Lj22
.Lj37:
# [156] ty := CT_SD2;
	ldi	r26,4
	mov	r2,r26
	rjmp	.Lj22
.Lj24:
# [163] if send_cmd(ACMD41, 0) < 2 then
	mov	r20,r1
	mov	r21,r1
	mov	r22,r1
	mov	r23,r1
	ldi	r26,-23
	mov	r24,r26
	call	DISK_IO_ss_SEND_CMDsBYTEsLONGWORDssBYTE
	cpi	r24,2
	brsh	.Lj41
# [165] ty := CT_SD1;
	ldi	r26,2
	mov	r2,r26
# [166] cmd := ACMD41;
	ldi	r26,-23
	mov	r5,r26
	rjmp	.Lj42
.Lj41:
# [170] ty := CT_MMC;
	ldi	r26,1
	mov	r2,r26
# [171] cmd := CMD1;
	ldi	r26,65
	mov	r5,r26
.Lj42:
# [174] for tmr := 10000 downto 0 do
	ldi	r26,17
	mov	r3,r26
	ldi	r26,39
	mov	r4,r26
.Lj43:
	ldi	r26,1
	sub	r3,r26
	sbc	r4,r1
# [176] if send_cmd(cmd, 0) = 0 then
	mov	r20,r1
	mov	r21,r1
	mov	r22,r1
	mov	r23,r1
	mov	r24,r5
	call	DISK_IO_ss_SEND_CMDsBYTEsLONGWORDssBYTE
	cp	r24,r1
	breq	.Lj45
	cp	r1,r3
	cpc	r1,r4
	brlo	.Lj43
.Lj45:
# [180] if (tmr = 0) or (send_cmd(CMD16, 512) <> 0) then
	cp	r3,r1
	cpc	r4,r1
	breq	.Lj48
	mov	r20,r1
	ldi	r21,2
	mov	r22,r1
	mov	r23,r1
	ldi	r26,80
	mov	r24,r26
	call	DISK_IO_ss_SEND_CMDsBYTEsLONGWORDssBYTE
	cp	r24,r1
	breq	.Lj22
.Lj48:
# [181] ty := 0;
	mov	r2,r1
.Lj22:
# [184] CardType := ty;
	mov	r16,r2
# Var ty located in register r16
	sts	(U_sDISK_IO_ss_CARDTYPE),r16
	sbi	5,2
# [186] spi_transceiver();
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
# [188] if ty <> 0 then
	cp	r16,r1
	breq	.Lj52
# [189] Result := 0
	mov	r18,r1
	rjmp	.Lj53
.Lj52:
# [191] Result := STA_NOINIT;
	ldi	r18,1
.Lj53:
	mov	r24,r18
	subi	r28,-6
	sbci	r29,-1
	in	r0,63
	cli
	out	62,r29
	out	63,r0
	out	61,r28
	pop	r2
	pop	r3
	pop	r4
	pop	r5
	pop	r16
	pop	r28
	pop	r29
	ret
.Lc3:
.Le1:
	.size	DISK_IO_ss_DISK_INITIALIZEssBYTE, .Le1 - DISK_IO_ss_DISK_INITIALIZEssBYTE

.section .text.n_disk_io_ss_disk_readpspointerslongwordsnativeuintsnativeuintssdresult,"ax"
.globl	DISK_IO_ss_DISK_READPsPOINTERsLONGWORDsNATIVEUINTsNATIVEUINTssDRESULT
DISK_IO_ss_DISK_READPsPOINTERsLONGWORDsNATIVEUINTsNATIVEUINTssDRESULT:
.Lc6:
# [201] begin
	push	r17
	push	r16
	push	r9
	push	r8
	push	r7
	push	r6
	push	r5
	push	r4
	push	r3
	push	r2
# Var $result located in register r18
# Var bp located in register r4
# Var rc located in register r9
# Var bc located in register r6
	mov	r8,r24
	mov	r2,r25
# Var buff located in register r8
# Var sector located in register r20
	mov	r5,r18
	mov	r4,r19
# Var offset located in register r5
# Var Count located in register r16
# [204] if CardType and CT_BLOCK = 0 then
	lds	r18,(U_sDISK_IO_ss_CARDTYPE)
	andi	r18,8
	brne	.Lj63
# [205] sector := sector * 512;
	mov	r19,r20
	mov	r24,r21
	mov	r25,r22
	lsl	r19
	rol	r24
	rol	r25
	mov	r20,r1
	mov	r21,r19
	movw	r22,r24
.Lj63:
# Var $result located in register r3
# [207] Result := RES_ERROR;
	ldi	r26,1
	mov	r3,r26
# [208] if send_cmd(CMD17, sector) = 0 then
	ldi	r26,81
	mov	r24,r26
	call	DISK_IO_ss_SEND_CMDsBYTEsLONGWORDssBYTE
	cp	r24,r1
	breq	.Lj88
# [257] end;
	rjmp	.Lj65
.Lj88:
# [210] for bc := 40000 downto 0 do
	ldi	r26,65
	mov	r6,r26
	ldi	r26,-100
	mov	r7,r26
.Lj66:
	ldi	r26,1
	sub	r6,r26
	sbc	r7,r1
# [212] rc := spi_transceiver();
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	mov	r9,r24
# [213] if rc <> $FF then
	ldi	r26,-1
	cp	r9,r26
	brne	.Lj68
	cp	r1,r6
	cpc	r1,r7
	brlo	.Lj66
.Lj68:
# [216] if rc = $FE then
	ldi	r26,-2
	cp	r9,r26
	breq	.Lj89
	rjmp	.Lj65
.Lj89:
# [219] bc := 512 - offset - Count;
	mov	r19,r1
	ldi	r25,2
	mov	r22,r1
	mov	r18,r1
	sub	r19,r5
	sbc	r25,r4
	sbc	r22,r1
	sbc	r18,r1
	sub	r19,r16
	sbc	r25,r17
	sbc	r22,r1
	sbc	r18,r1
	mov	r6,r19
	mov	r7,r25
# [220] while offset > 0 do
	rjmp	.Lj74
.Lj73:
# [222] spi_transceiver();
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
# [223] Dec(offset);
	ldi	r26,1
	sub	r5,r26
	sbc	r4,r1
.Lj74:
	cp	r1,r5
	cpc	r1,r4
	brlo	.Lj73
# [225] if buff <> nil then
	cp	r8,r1
	cpc	r2,r1
	breq	.Lj83
# [227] bp := PBYTE(buff);
	mov	r4,r8
# [228] while Count > 0 do
	rjmp	.Lj79
.Lj78:
# [230] bp^ := spi_transceiver();
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	mov	r30,r4
	mov	r31,r2
	st	Z,r24
# [231] Inc(bp);
	ldi	r18,1
	add	r4,r18
	adc	r2,r1
# [232] Dec(Count);
	subi	r16,1
	sbc	r17,r1
.Lj79:
	cp	r1,r16
	cpc	r1,r17
	brlo	.Lj78
	rjmp	.Lj86
.Lj82:
# [240] uart_xputc(spi_transceiver());
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	call	UART_ss_UART_XPUTCsBYTE
# [241] Dec(Count);
	subi	r16,1
	sbc	r17,r1
.Lj83:
# [238] while Count > 0 do
	cp	r1,r16
	cpc	r1,r17
	brlo	.Lj82
# [245] while bc > 0 do
	rjmp	.Lj86
.Lj85:
# [247] spi_transceiver();
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
# [248] Dec(bc);
	ldi	r26,1
	sub	r6,r26
	sbc	r7,r1
.Lj86:
	cp	r1,r6
	cpc	r1,r7
	brlo	.Lj85
# [250] Result := RES_OK;
	mov	r3,r1
.Lj65:
	sbi	5,2
# [255] spi_transceiver();
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	mov	r24,r3
	pop	r2
	pop	r3
	pop	r4
	pop	r5
	pop	r6
	pop	r7
	pop	r8
	pop	r9
	pop	r16
	pop	r17
	ret
.Lc5:
.Le2:
	.size	DISK_IO_ss_DISK_READPsPOINTERsLONGWORDsNATIVEUINTsNATIVEUINTssDRESULT, .Le2 - DISK_IO_ss_DISK_READPsPOINTERsLONGWORDsNATIVEUINTsNATIVEUINTssDRESULT

.section .text.n_disk_io_ss_disk_writepspointerslongwordssdresult,"ax"
.globl	DISK_IO_ss_DISK_WRITEPsPOINTERsLONGWORDssDRESULT
DISK_IO_ss_DISK_WRITEPsPOINTERsLONGWORDssDRESULT:
.Lc8:
# Var $result located in register r18
# Var res located in register r24
# Var buff located in register r24
# Var sc located in register r20
# [262] begin
# [263] if buff = nil then
	cp	r24,r1
	cpc	r25,r1
	brne	.Lj97
# [265] if sc <> 0 then
	cp	r20,r1
	cpc	r21,r1
	cpc	r22,r1
	cpc	r23,r1
.Lj97:
# Var $result located in register r24
# Var res located in register r24
# [280] end;
	ret
.Lc7:
.Le3:
	.size	DISK_IO_ss_DISK_WRITEPsPOINTERsLONGWORDssDRESULT, .Le3 - DISK_IO_ss_DISK_WRITEPsPOINTERsLONGWORDssDRESULT
# End asmlist al_procedures
# Begin asmlist al_globals

.section .bss.n_u_sdisk_io_ss_cardtype,"aw",%nobits
# [73] CardType: byte;
	.size U_sDISK_IO_ss_CARDTYPE,1
U_sDISK_IO_ss_CARDTYPE:
	.zero 1
# End asmlist al_globals
# Begin asmlist al_rtti

.section .data.n_RTTI_sDISK_IO_ss_DRESULT
.globl	RTTI_sDISK_IO_ss_DRESULT
RTTI_sDISK_IO_ss_DRESULT:
	.byte	3,7
# [283] 
	.ascii	"DRESULT"
	.short	0
	.byte	1
	.long	0,3
	.short	0
	.byte	6
	.ascii	"RES_OK"
	.byte	9
	.ascii	"RES_ERROR"
	.byte	10
	.ascii	"RES_NOTRDY"
	.byte	10
	.ascii	"RES_PARERR"
	.byte	7
	.ascii	"disk_io"
	.byte	0
.Le4:
	.size	RTTI_sDISK_IO_ss_DRESULT, .Le4 - RTTI_sDISK_IO_ss_DRESULT

.section .data.n_RTTI_sDISK_IO_ss_DRESULT_s2o
	.balign 2
.globl	RTTI_sDISK_IO_ss_DRESULT_s2o
RTTI_sDISK_IO_ss_DRESULT_s2o:
	.long	4,1
	.short	RTTI_sDISK_IO_ss_DRESULT+29
	.long	2
	.short	RTTI_sDISK_IO_ss_DRESULT+39
	.long	0
	.short	RTTI_sDISK_IO_ss_DRESULT+22
	.long	3
	.short	RTTI_sDISK_IO_ss_DRESULT+50
.Le5:
	.size	RTTI_sDISK_IO_ss_DRESULT_s2o, .Le5 - RTTI_sDISK_IO_ss_DRESULT_s2o

.section .data.n_RTTI_sDISK_IO_ss_DRESULT_o2s
	.balign 2
.globl	RTTI_sDISK_IO_ss_DRESULT_o2s
RTTI_sDISK_IO_ss_DRESULT_o2s:
	.long	0
	.short	RTTI_sDISK_IO_ss_DRESULT+22
	.short	RTTI_sDISK_IO_ss_DRESULT+29
	.short	RTTI_sDISK_IO_ss_DRESULT+39
	.short	RTTI_sDISK_IO_ss_DRESULT+50
.Le6:
	.size	RTTI_sDISK_IO_ss_DRESULT_o2s, .Le6 - RTTI_sDISK_IO_ss_DRESULT_o2s

.section .data.n_RTTI_sDISK_IO_ss_PUINT
.globl	RTTI_sDISK_IO_ss_PUINT
RTTI_sDISK_IO_ss_PUINT:
	.byte	29,5
	.ascii	"PUINT"
	.short	0
	.short	RTTI_sSYSTEM_ss_NATIVEUINTsindirect
.Le7:
	.size	RTTI_sDISK_IO_ss_PUINT, .Le7 - RTTI_sDISK_IO_ss_PUINT
# End asmlist al_rtti
# Begin asmlist al_indirectglobals

.section .data.n_RTTI_sDISK_IO_ss_DRESULT
	.balign 2
.globl	RTTI_sDISK_IO_ss_DRESULTsindirect
RTTI_sDISK_IO_ss_DRESULTsindirect:
	.short	RTTI_sDISK_IO_ss_DRESULT
.Le8:
	.size	RTTI_sDISK_IO_ss_DRESULTsindirect, .Le8 - RTTI_sDISK_IO_ss_DRESULTsindirect

.section .data.n_RTTI_sDISK_IO_ss_DRESULT_s2o
	.balign 2
.globl	RTTI_sDISK_IO_ss_DRESULT_s2osindirect
RTTI_sDISK_IO_ss_DRESULT_s2osindirect:
	.short	RTTI_sDISK_IO_ss_DRESULT_s2o
.Le9:
	.size	RTTI_sDISK_IO_ss_DRESULT_s2osindirect, .Le9 - RTTI_sDISK_IO_ss_DRESULT_s2osindirect

.section .data.n_RTTI_sDISK_IO_ss_DRESULT_o2s
	.balign 2
.globl	RTTI_sDISK_IO_ss_DRESULT_o2ssindirect
RTTI_sDISK_IO_ss_DRESULT_o2ssindirect:
	.short	RTTI_sDISK_IO_ss_DRESULT_o2s
.Le10:
	.size	RTTI_sDISK_IO_ss_DRESULT_o2ssindirect, .Le10 - RTTI_sDISK_IO_ss_DRESULT_o2ssindirect

.section .data.n_RTTI_sDISK_IO_ss_PUINT
	.balign 2
.globl	RTTI_sDISK_IO_ss_PUINTsindirect
RTTI_sDISK_IO_ss_PUINTsindirect:
	.short	RTTI_sDISK_IO_ss_PUINT
.Le11:
	.size	RTTI_sDISK_IO_ss_PUINTsindirect, .Le11 - RTTI_sDISK_IO_ss_PUINTsindirect
# End asmlist al_indirectglobals
# Begin asmlist al_dwarf_frame

.section .debug_frame
.Lc9:
	.long	.Lc11-.Lc10
.Lc10:
	.long	-1
	.byte	1
	.byte	0
	.uleb128	1
	.sleb128	-4
	.byte	24
	.byte	12
	.uleb128	13
	.uleb128	1
	.byte	5
	.uleb128	24
	.uleb128	0
	.balign 4,0
.Lc11:
	.long	.Lc13-.Lc12
.Lc12:
	.short	.Lc9
	.short	.Lc2
	.short	.Lc1-.Lc2
	.balign 4,0
.Lc13:
	.long	.Lc16-.Lc15
.Lc15:
	.short	.Lc9
	.short	.Lc4
	.short	.Lc3-.Lc4
	.balign 4,0
.Lc16:
	.long	.Lc19-.Lc18
.Lc18:
	.short	.Lc9
	.short	.Lc6
	.short	.Lc5-.Lc6
	.balign 4,0
.Lc19:
	.long	.Lc22-.Lc21
.Lc21:
	.short	.Lc9
	.short	.Lc8
	.short	.Lc7-.Lc8
	.balign 4,0
.Lc22:
# End asmlist al_dwarf_frame

