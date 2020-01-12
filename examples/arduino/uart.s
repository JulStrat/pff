	.file "uart.pas"
# Begin asmlist al_procedures

.section .text.n_uart_ss_uart_init,"ax"
.globl	UART_ss_UART_INIT
UART_ss_UART_INIT:
.Lc2:
# [uart.pas]
# [19] begin
# [20] UBRR0  := CPU_Clock div (16 * Baud) - 1;
	ldi	r18,103
	sts	(197),r1
	sts	(196),r18
# [21] UCSR0A := 0;
	sts	(192),r1
# [22] UCSR0B := (1 shl TXEN0) or (1 shl RXEN0);
	ldi	r18,24
	sts	(193),r18
# [23] UCSR0C := (3 shl UCSZ0);
	ldi	r18,6
	sts	(194),r18
# [24] end;
	ret
.Lc1:
.Le0:
	.size	UART_ss_UART_INIT, .Le0 - UART_ss_UART_INIT

.section .text.n_uart_ss_uart_getcsschar,"ax"
.globl	UART_ss_UART_GETCssCHAR
UART_ss_UART_GETCssCHAR:
.Lc4:
# Var $result located in register r18
# [27] begin
.Lj7:
# [28] while UCSR0A and (1 shl RXC0) = 0 do;
	lds	r18,(192)
	andi	r18,-128
	breq	.Lj7
# Var $result located in register r24
# [29] Result := Char(UDR0);
	lds	r24,(198)
# [30] end;
	ret
.Lc3:
.Le1:
	.size	UART_ss_UART_GETCssCHAR, .Le1 - UART_ss_UART_GETCssCHAR

.section .text.n_uart_ss_uart_putcschar,"ax"
.globl	UART_ss_UART_PUTCsCHAR
UART_ss_UART_PUTCsCHAR:
.Lc6:
# [33] begin
	mov	r18,r24
# Var c located in register r18
.Lj12:
# [34] while UCSR0A and (1 shl UDRE0) = 0 do;
	lds	r19,(192)
	andi	r19,32
	breq	.Lj12
# Var c located in register r18
# [35] UDR0 := Byte(c);
	sts	(198),r18
# [36] end;
	ret
.Lc5:
.Le2:
	.size	UART_ss_UART_PUTCsCHAR, .Le2 - UART_ss_UART_PUTCsCHAR

.section .text.n_uart_ss_uart_xputcsbyte,"ax"
.globl	UART_ss_UART_XPUTCsBYTE
UART_ss_UART_XPUTCsBYTE:
.Lc8:
# [43] begin
	mov	r19,r24
# Var b located in register r19
.Lj17:
# [44] while UCSR0A and (1 shl UDRE0) = 0 do;
	lds	r18,(192)
	andi	r18,32
	breq	.Lj17
# [45] UDR0 := Ord('$');
	ldi	r18,36
	sts	(198),r18
.Lj20:
# [46] while UCSR0A and (1 shl UDRE0) = 0 do;
	lds	r18,(192)
	andi	r18,32
	breq	.Lj20
# [48] UDR0 := hexbyte[b shr 4];
	mov	r20,r19
	lsr	r20
	lsr	r20
	lsr	r20
	lsr	r20
	ldi	r30,lo8(TC_sUARTs_sUART_XPUTCsBYTE_ss_HEXBYTE)
	ldi	r31,hi8(TC_sUARTs_sUART_XPUTCsBYTE_ss_HEXBYTE)
	add	r30,r20
	adc	r31,r1
	ld	r0,Z
	sts	(198),r0
.Lj23:
# [49] while UCSR0A and (1 shl UDRE0) = 0 do;
	lds	r18,(192)
	andi	r18,32
	breq	.Lj23
# [51] UDR0 := hexbyte[b and $0F];
	andi	r19,15
	ldi	r30,lo8(TC_sUARTs_sUART_XPUTCsBYTE_ss_HEXBYTE)
	ldi	r31,hi8(TC_sUARTs_sUART_XPUTCsBYTE_ss_HEXBYTE)
	add	r30,r19
	adc	r31,r1
	ld	r0,Z
	sts	(198),r0
# [52] end;
	ret
.Lc7:
.Le3:
	.size	UART_ss_UART_XPUTCsBYTE, .Le3 - UART_ss_UART_XPUTCsBYTE

.section .text.n_uart_ss_uart_putsspchar,"ax"
.globl	UART_ss_UART_PUTSsPCHAR
UART_ss_UART_PUTSsPCHAR:
.Lc10:
# [55] begin
	push	r3
	push	r2
	movw	r2,r24
# Var s located in register r2
# [56] while s^ <> #0 do
	rjmp	.Lj29
.Lj28:
# [58] uart_putc(s^);
	movw	r30,r2
	ld	r24,Z
	call	UART_ss_UART_PUTCsCHAR
# [59] Inc(s);
	ldi	r18,1
	add	r2,r18
	adc	r3,r1
.Lj29:
	movw	r30,r2
	ld	r18,Z
	cp	r18,r1
	brne	.Lj28
# [61] end;
	pop	r2
	pop	r3
	ret
.Lc9:
.Le4:
	.size	UART_ss_UART_PUTSsPCHAR, .Le4 - UART_ss_UART_PUTSsPCHAR
# End asmlist al_procedures
# Begin asmlist al_typedconsts

.section .data.n_TC_sUARTs_sUART_XPUTCsBYTE_ss_HEXBYTE
TC_sUARTs_sUART_XPUTCsBYTE_ss_HEXBYTE:
	.byte	48,49,50,51,52,53,54,55,56,57,65,66,67,68,69,70
.Le5:
	.size	TC_sUARTs_sUART_XPUTCsBYTE_ss_HEXBYTE, .Le5 - TC_sUARTs_sUART_XPUTCsBYTE_ss_HEXBYTE
# End asmlist al_typedconsts
# Begin asmlist al_dwarf_frame

.section .debug_frame
.Lc11:
	.long	.Lc13-.Lc12
.Lc12:
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
.Lc13:
	.long	.Lc15-.Lc14
.Lc14:
	.short	.Lc11
	.short	.Lc2
	.short	.Lc1-.Lc2
	.balign 4,0
.Lc15:
	.long	.Lc18-.Lc17
.Lc17:
	.short	.Lc11
	.short	.Lc4
	.short	.Lc3-.Lc4
	.balign 4,0
.Lc18:
	.long	.Lc21-.Lc20
.Lc20:
	.short	.Lc11
	.short	.Lc6
	.short	.Lc5-.Lc6
	.balign 4,0
.Lc21:
	.long	.Lc24-.Lc23
.Lc23:
	.short	.Lc11
	.short	.Lc8
	.short	.Lc7-.Lc8
	.balign 4,0
.Lc24:
	.long	.Lc27-.Lc26
.Lc26:
	.short	.Lc11
	.short	.Lc10
	.short	.Lc9-.Lc10
	.balign 4,0
.Lc27:
# End asmlist al_dwarf_frame

