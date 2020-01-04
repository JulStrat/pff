	.file "disk_io.pas"
# Begin asmlist al_procedures

.section .text.n_disk_io_ss_send_cmdsbyteslongwordssbyte,"ax"
DISK_IO_ss_SEND_CMDsBYTEsLONGWORDssBYTE:
.Lc2:
# [disk_io.pas]
# [74] begin
	push	r8
	push	r7
	push	r6
	push	r5
	push	r4
	push	r3
	push	r2
# Var $result located in register r2
# Var n located in register r18
# Var res located in register r7
	mov	r6,r24
# Var cmd located in register r6
	mov	r3,r20
	mov	r4,r21
	mov	r8,r22
	mov	r5,r23
# Var arg located in register r3
# [76] if cmd and $80 <> 0 then
	mov	r18,r6
	andi	r18,-128
	breq	.Lj6
# [78] cmd := cmd and $7F;
	ldi	r26,127
	and	r6,r26
# [79] res := send_cmd(CMD55, 0);
	mov	r20,r1
	mov	r21,r1
	mov	r22,r1
	mov	r23,r1
	ldi	r26,119
	mov	r24,r26
	call	DISK_IO_ss_SEND_CMDsBYTEsLONGWORDssBYTE
	mov	r7,r24
# [80] if res > 1 then
	ldi	r18,1
	cp	r18,r7
	brsh	.Lj6
# [81] Exit(res);
	mov	r2,r7
	rjmp	.Lj3
.Lj6:
# [65] {$define DESELECT := PORTB := PORTB or 4 }
	sbi	5,2
# [84] spi_transceiver();
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
# [64] {$define SELECT := PORTB := PORTB and (not 4) }
	cbi	5,2
# [86] spi_transceiver();
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
# Var cmd located in register r6
# [89] spi_transceiver(cmd);            (* Start + Command index *)
	mov	r24,r6
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
# [90] spi_transceiver(byte(arg shr 24));  (* Argument[31..24] *)
	mov	r24,r5
	mov	r18,r1
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
# [91] spi_transceiver(byte(arg shr 16));  (* Argument[23..16] *)
	mov	r24,r8
	mov	r18,r1
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
# [92] spi_transceiver(byte(arg shr 8));   (* Argument[15..8] *)
	mov	r24,r4
	mov	r18,r1
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
# [93] spi_transceiver(byte(arg));      (* Argument[7..0] *)
	mov	r24,r3
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
# Var n located in register r24
# [94] n := $01;                (* Dummy CRC + Stop *)
	ldi	r24,1
# [95] if (cmd = CMD0) then
	ldi	r26,64
	cp	r6,r26
	brne	.Lj10
# [96] n := $95;  (* Valid CRC for CMD0(0) *)
	ldi	r24,-107
.Lj10:
# [97] if (cmd = CMD8) then
	ldi	r26,72
	cp	r6,r26
	brne	.Lj12
# [98] n := $87;  (* Valid CRC for CMD8(0x1AA) *)
	ldi	r24,-121
.Lj12:
# Var n located in register r24
# [99] spi_transceiver(n);
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
# Var n located in register r3
# [101] for n := 0 to 9 do
	ldi	r26,-1
	mov	r3,r26
.Lj13:
	inc	r3
# [103] res := spi_transceiver();
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	mov	r7,r24
# [104] if res and $80 = 0 then
	mov	r18,r7
	andi	r18,-128
	breq	.Lj15
	ldi	r26,9
	cp	r3,r26
	brlo	.Lj13
.Lj15:
# Var res located in register r7
# [107] Result := res;
	mov	r2,r7
.Lj3:
# [108] end;
	mov	r24,r2
	pop	r2
	pop	r3
	pop	r4
	pop	r5
	pop	r6
	pop	r7
	pop	r8
	ret
.Lc1:
.Le0:
	.size	DISK_IO_ss_SEND_CMDsBYTEsLONGWORDssBYTE, .Le0 - DISK_IO_ss_SEND_CMDsBYTEsLONGWORDssBYTE

.section .text.n_disk_io_ss_disk_initializessbyte,"ax"
.globl	DISK_IO_ss_DISK_INITIALIZEssBYTE
DISK_IO_ss_DISK_INITIALIZEssBYTE:
.Lc4:
# [118] begin
	push	r29
	push	r28
	push	r16
	push	r7
	push	r6
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
# Var cmd located in register r7
# Var ty located in register r18
# Var ocr located at r28+2, size=OS_32
# Var tmr located in register r3
# [120] spi_init_master();
	call	SPI_ss_SPI_INIT_MASTER
	sbi	5,2
# [123] spi_transceiver();
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
# [125] ty := 0;
	mov	r2,r1
# [126] if send_cmd(CMD0, 0) = 1 then
	mov	r20,r1
	mov	r21,r1
	mov	r22,r1
	mov	r23,r1
	ldi	r26,64
	mov	r24,r26
	call	DISK_IO_ss_SEND_CMDsBYTEsLONGWORDssBYTE
	cpi	r24,1
	breq	.Lj53
# [188] end;
	rjmp	.Lj21
.Lj53:
# [129] if send_cmd(CMD8, $1AA) = 1 then
	ldi	r20,-86
	ldi	r21,1
	mov	r22,r1
	mov	r23,r1
	ldi	r26,72
	mov	r24,r26
	call	DISK_IO_ss_SEND_CMDsBYTEsLONGWORDssBYTE
	cpi	r24,1
	breq	.Lj54
	rjmp	.Lj23
.Lj54:
# [133] ocr[n] := spi_transceiver();
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
# [134] if (ocr[2] = $01) and (ocr[3] = $AA) then
	ldd	r18,Y+4
	cpi	r18,1
	breq	.Lj55
	rjmp	.Lj21
.Lj55:
	ldd	r18,Y+5
	cpi	r18,-86
	breq	.Lj56
	rjmp	.Lj21
.Lj56:
# [137] for tmr := 10000 downto 0 do
	ldi	r26,17
	mov	r3,r26
	ldi	r26,39
	mov	r4,r26
	mov	r5,r1
	mov	r6,r1
.Lj27:
	ldi	r26,1
	sub	r3,r26
	sbc	r4,r1
	sbc	r5,r1
	sbc	r6,r1
# [139] if send_cmd(ACMD41, 1 shl 30) = 0 then
	mov	r20,r1
	mov	r21,r1
	mov	r22,r1
	ldi	r23,64
	ldi	r26,-23
	mov	r24,r26
	call	DISK_IO_ss_SEND_CMDsBYTEsLONGWORDssBYTE
	cp	r24,r1
	breq	.Lj29
	cp	r1,r3
	cpc	r1,r4
	cpc	r1,r5
	cpc	r1,r6
	brlo	.Lj27
.Lj29:
# [143] if (tmr <> 0) and (send_cmd(CMD58, 0) = 0) then
	cp	r3,r1
	cpc	r4,r1
	cpc	r5,r1
	cpc	r6,r1
	brne	.Lj57
	rjmp	.Lj21
.Lj57:
	mov	r20,r1
	mov	r21,r1
	mov	r22,r1
	mov	r23,r1
	ldi	r26,122
	mov	r24,r26
	call	DISK_IO_ss_SEND_CMDsBYTEsLONGWORDssBYTE
	cp	r24,r1
	breq	.Lj58
	rjmp	.Lj21
.Lj58:
# [146] ocr[n] := spi_transceiver();
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
# [147] if (ocr[0] and $40) <> 0 then
	ldd	r18,Y+2
	andi	r18,64
	breq	.Lj36
# [148] ty := CT_SD2 or CT_BLOCK
	ldi	r26,12
	mov	r2,r26
	rjmp	.Lj21
.Lj36:
# [150] ty := CT_SD2;
	ldi	r26,4
	mov	r2,r26
	rjmp	.Lj21
.Lj23:
# [157] if send_cmd(ACMD41, 0) <= 1 then
	mov	r20,r1
	mov	r21,r1
	mov	r22,r1
	mov	r23,r1
	ldi	r26,-23
	mov	r24,r26
	call	DISK_IO_ss_SEND_CMDsBYTEsLONGWORDssBYTE
	ldi	r18,1
	cp	r18,r24
	brlo	.Lj40
# [159] ty := CT_SD1;
	ldi	r26,2
	mov	r2,r26
# [160] cmd := ACMD41;
	ldi	r26,-23
	mov	r7,r26
	rjmp	.Lj41
.Lj40:
# [164] ty := CT_MMC;
	ldi	r26,1
	mov	r2,r26
# [165] cmd := CMD1;
	ldi	r26,65
	mov	r7,r26
.Lj41:
# [168] for tmr := 10000 downto 0 do
	ldi	r26,17
	mov	r3,r26
	ldi	r26,39
	mov	r4,r26
	mov	r5,r1
	mov	r6,r1
.Lj42:
	ldi	r26,1
	sub	r3,r26
	sbc	r4,r1
	sbc	r5,r1
	sbc	r6,r1
# [170] if send_cmd(cmd, 0) = 0 then
	mov	r20,r1
	mov	r21,r1
	mov	r22,r1
	mov	r23,r1
	mov	r24,r7
	call	DISK_IO_ss_SEND_CMDsBYTEsLONGWORDssBYTE
	cp	r24,r1
	breq	.Lj44
	cp	r1,r3
	cpc	r1,r4
	cpc	r1,r5
	cpc	r1,r6
	brlo	.Lj42
.Lj44:
# [174] if (tmr = 0) or (send_cmd(CMD16, 512) <> 0) then
	cp	r3,r1
	cpc	r4,r1
	cpc	r5,r1
	cpc	r6,r1
	breq	.Lj47
	mov	r20,r1
	ldi	r21,2
	mov	r22,r1
	mov	r23,r1
	ldi	r26,80
	mov	r24,r26
	call	DISK_IO_ss_SEND_CMDsBYTEsLONGWORDssBYTE
	cp	r24,r1
	breq	.Lj21
.Lj47:
# [175] ty := 0;
	mov	r2,r1
.Lj21:
# [178] CardType := ty;
	mov	r16,r2
# Var ty located in register r16
	sts	(U_sDISK_IO_ss_CARDTYPE),r16
	sbi	5,2
# [180] spi_transceiver();
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
# [182] if ty <> 0 then
	cp	r16,r1
	breq	.Lj51
# [184] Result := 0;
	mov	r18,r1
	rjmp	.Lj52
.Lj51:
# [187] Result := STA_NOINIT;
	ldi	r18,1
.Lj52:
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
	pop	r6
	pop	r7
	pop	r16
	pop	r28
	pop	r29
	ret
.Lc3:
.Le1:
	.size	DISK_IO_ss_DISK_INITIALIZEssBYTE, .Le1 - DISK_IO_ss_DISK_INITIALIZEssBYTE

.section .text.n_disk_io_ss_disk_readpspointerslongwordslongwordslongwordssdresult,"ax"
.globl	DISK_IO_ss_DISK_READPsPOINTERsLONGWORDsLONGWORDsLONGWORDssDRESULT
DISK_IO_ss_DISK_READPsPOINTERsLONGWORDsLONGWORDsLONGWORDssDRESULT:
.Lc6:
# Temps allocated between r28+2 and r28+4
# [197] begin
	push	r29
	push	r28
	push	r17
	push	r16
	push	r15
	push	r14
	push	r13
	push	r12
	push	r11
	push	r10
	push	r9
	push	r8
	push	r7
	push	r6
	push	r5
	push	r4
	push	r3
	push	r2
	in	r28,61
	in	r29,62
	subi	r28,4
	sbci	r29,0
	in	r0,63
	cli
	out	62,r29
	out	63,r0
	out	61,r28
# Var $result located in register r18
# Var res located in register r18
# Var bp located in register r6
# Var rc located in register r6
# Var bc located in register r5
	mov	r9,r24
	mov	r10,r25
# Var buff located in register r9
# Var sector located in register r20
	mov	r8,r18
	mov	r7,r19
# Var offset located in register r16
	std	Y+2,r12
	std	Y+3,r13
	mov	r12,r15
# Var Count located in register r18
# [200] if CardType and CT_BLOCK = 0 then
	lds	r18,(U_sDISK_IO_ss_CARDTYPE)
	andi	r18,8
	brne	.Lj62
# [201] sector := sector * 512;
	movw	r18,r20
	mov	r24,r22
	lsl	r18
	rol	r19
	rol	r24
	mov	r20,r1
	mov	r21,r18
	mov	r22,r19
	mov	r23,r24
.Lj62:
# Var res located in register r11
# [203] res := RES_ERROR;
	ldi	r26,1
	mov	r11,r26
# [204] if send_cmd(CMD17, sector) = 0 then
	ldi	r26,81
	mov	r24,r26
	call	DISK_IO_ss_SEND_CMDsBYTEsLONGWORDssBYTE
	cp	r24,r1
	breq	.Lj87
# [253] end;
	rjmp	.Lj64
.Lj87:
# [206] for bc := 40000 downto 0 do
	ldi	r26,65
	mov	r5,r26
	ldi	r26,-100
	mov	r4,r26
	mov	r3,r1
	mov	r2,r1
.Lj65:
	ldi	r26,1
	sub	r5,r26
	sbc	r4,r1
	sbc	r3,r1
	sbc	r2,r1
# [208] rc := spi_transceiver();
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	mov	r6,r24
# [209] if rc <> $FF then
	ldi	r26,-1
	cp	r6,r26
	brne	.Lj67
	cp	r1,r5
	cpc	r1,r4
	cpc	r1,r3
	cpc	r1,r2
	brlo	.Lj65
.Lj67:
# [212] if rc = $FE then
	ldi	r26,-2
	cp	r6,r26
	breq	.Lj88
	rjmp	.Lj64
.Lj88:
# [215] bc := 512 - offset - Count;
	mov	r19,r1
	ldi	r20,2
	mov	r21,r1
	mov	r22,r1
	sub	r19,r16
	sbc	r20,r17
	sbc	r21,r8
	sbc	r22,r7
	ldd	r18,Y+2
	sub	r19,r18
	ldd	r18,Y+3
	sbc	r20,r18
	sbc	r21,r14
	sbc	r22,r12
	mov	r5,r19
	mov	r4,r20
	mov	r3,r21
	mov	r2,r22
# [216] while offset > 0 do
	rjmp	.Lj73
.Lj72:
# [218] spi_transceiver();
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
# [219] Dec(offset);
	subi	r16,1
	sbc	r17,r1
	sbc	r8,r1
	sbc	r7,r1
.Lj73:
	cp	r1,r16
	cpc	r1,r17
	cpc	r1,r8
	cpc	r1,r7
	brlo	.Lj72
# [221] if buff <> nil then
	cp	r9,r1
	cpc	r10,r1
	brne	.Lj89
	rjmp	.Lj82
.Lj89:
# [223] bp := PBYTE(buff);
	mov	r6,r9
	mov	r7,r10
# [224] while Count > 0 do
	rjmp	.Lj78
.Lj77:
# [226] bp^ := spi_transceiver();
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	movw	r30,r6
	st	Z,r24
# [227] Inc(bp);
	ldi	r18,1
	add	r6,r18
	adc	r7,r1
# [228] Dec(Count);
	ldi	r26,1
	ldd	r18,Y+2
	sub	r18,r26
	std	Y+2,r18
	ldd	r18,Y+3
	sbc	r18,r1
	std	Y+3,r18
	sbc	r14,r1
	sbc	r12,r1
.Lj78:
	ldd	r18,Y+2
	cp	r1,r18
	ldd	r18,Y+3
	cpc	r1,r18
	cpc	r1,r14
	cpc	r1,r12
	brlo	.Lj77
	rjmp	.Lj85
.Lj81:
# [236] uart_xputc(spi_transceiver());
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
	call	UART_ss_UART_XPUTCsBYTE
# [237] Dec(Count);
	ldi	r26,1
	ldd	r18,Y+2
	sub	r18,r26
	std	Y+2,r18
	ldd	r18,Y+3
	sbc	r18,r1
	std	Y+3,r18
	sbc	r14,r1
	sbc	r12,r1
.Lj82:
# [234] while Count > 0 do
	ldd	r18,Y+2
	cp	r1,r18
	ldd	r18,Y+3
	cpc	r1,r18
	cpc	r1,r14
	cpc	r1,r12
	brlo	.Lj81
# [241] while bc > 0 do
	rjmp	.Lj85
.Lj84:
# [243] spi_transceiver();
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
# [244] Dec(bc);
	ldi	r26,1
	sub	r5,r26
	sbc	r4,r1
	sbc	r3,r1
	sbc	r2,r1
.Lj85:
	cp	r1,r5
	cpc	r1,r4
	cpc	r1,r3
	cpc	r1,r2
	brlo	.Lj84
# [246] res := RES_OK;
	mov	r11,r1
.Lj64:
	sbi	5,2
# [251] spi_transceiver();
	ldi	r26,-1
	mov	r24,r26
	call	SPI_ss_SPI_TRANSCEIVERsBYTEssBYTE
# Var $result located in register r24
# [252] Result := res;
	mov	r24,r11
# Var res located in register r24
	subi	r28,-4
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
	pop	r6
	pop	r7
	pop	r8
	pop	r9
	pop	r10
	pop	r11
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	r16
	pop	r17
	pop	r28
	pop	r29
	ret
.Lc5:
.Le2:
	.size	DISK_IO_ss_DISK_READPsPOINTERsLONGWORDsLONGWORDsLONGWORDssDRESULT, .Le2 - DISK_IO_ss_DISK_READPsPOINTERsLONGWORDsLONGWORDsLONGWORDssDRESULT

.section .text.n_disk_io_ss_disk_writepspointerslongwordssdresult,"ax"
.globl	DISK_IO_ss_DISK_WRITEPsPOINTERsLONGWORDssDRESULT
DISK_IO_ss_DISK_WRITEPsPOINTERsLONGWORDssDRESULT:
.Lc8:
# Var $result located in register r18
# Var res located in register r24
# Var buff located in register r24
# Var sc located in register r20
# [258] begin
# [259] if buff = nil then
	cp	r24,r1
	cpc	r25,r1
	brne	.Lj97
# [261] if sc <> 0 then
	cp	r20,r1
	cpc	r21,r1
	cpc	r22,r1
	cpc	r23,r1
.Lj97:
# Var $result located in register r24
# Var res located in register r24
# [276] end;
	ret
.Lc7:
.Le3:
	.size	DISK_IO_ss_DISK_WRITEPsPOINTERsLONGWORDssDRESULT, .Le3 - DISK_IO_ss_DISK_WRITEPsPOINTERsLONGWORDssDRESULT
# End asmlist al_procedures
# Begin asmlist al_globals

.section .bss.n_u_sdisk_io_ss_cardtype,"aw",%nobits
# [69] CardType: byte;
	.size U_sDISK_IO_ss_CARDTYPE,1
U_sDISK_IO_ss_CARDTYPE:
	.zero 1
# End asmlist al_globals
# Begin asmlist al_rtti

.section .data.n_RTTI_sDISK_IO_ss_DRESULT
.globl	RTTI_sDISK_IO_ss_DRESULT
RTTI_sDISK_IO_ss_DRESULT:
	.byte	3,7
# [279] 
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
# End asmlist al_rtti
# Begin asmlist al_indirectglobals

.section .data.n_RTTI_sDISK_IO_ss_DRESULT
	.balign 2
.globl	RTTI_sDISK_IO_ss_DRESULTsindirect
RTTI_sDISK_IO_ss_DRESULTsindirect:
	.short	RTTI_sDISK_IO_ss_DRESULT
.Le7:
	.size	RTTI_sDISK_IO_ss_DRESULTsindirect, .Le7 - RTTI_sDISK_IO_ss_DRESULTsindirect

.section .data.n_RTTI_sDISK_IO_ss_DRESULT_s2o
	.balign 2
.globl	RTTI_sDISK_IO_ss_DRESULT_s2osindirect
RTTI_sDISK_IO_ss_DRESULT_s2osindirect:
	.short	RTTI_sDISK_IO_ss_DRESULT_s2o
.Le8:
	.size	RTTI_sDISK_IO_ss_DRESULT_s2osindirect, .Le8 - RTTI_sDISK_IO_ss_DRESULT_s2osindirect

.section .data.n_RTTI_sDISK_IO_ss_DRESULT_o2s
	.balign 2
.globl	RTTI_sDISK_IO_ss_DRESULT_o2ssindirect
RTTI_sDISK_IO_ss_DRESULT_o2ssindirect:
	.short	RTTI_sDISK_IO_ss_DRESULT_o2s
.Le9:
	.size	RTTI_sDISK_IO_ss_DRESULT_o2ssindirect, .Le9 - RTTI_sDISK_IO_ss_DRESULT_o2ssindirect
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

