	.file "uart.pas"
# Begin asmlist al_procedures

.section .text.n_uart_ss_uart_init,"ax"
.globl	UART_ss_UART_INIT
UART_ss_UART_INIT:
.Lc2:
# [uart.pas]
# [18] begin
# [19] UBRR0  := CPU_Clock div (16 * Baud) - 1;
	ldi	r18,103
	sts	(197),r1
	sts	(196),r18
# [20] UCSR0A := 0;
	sts	(192),r1
# [21] UCSR0B := (1 shl TXEN0) or (1 shl RXEN0);
	ldi	r18,24
	sts	(193),r18
# [22] UCSR0C := (3 shl UCSZ0);
	ldi	r18,6
	sts	(194),r18
# [23] end;
	ret
.Lc1:
.Le0:
	.size	UART_ss_UART_INIT, .Le0 - UART_ss_UART_INIT

.section .text.n_uart_ss_uart_getcsschar,"ax"
.globl	UART_ss_UART_GETCssCHAR
UART_ss_UART_GETCssCHAR:
.Lc4:
# Var $result located in register r18
# [26] begin
.Lj7:
# [27] while UCSR0A and (1 shl RXC0) = 0 do;
	lds	r18,(192)
	andi	r18,-128
	breq	.Lj7
# Var $result located in register r24
# [28] Result := Char(UDR0);
	lds	r24,(198)
# [29] end;
	ret
.Lc3:
.Le1:
	.size	UART_ss_UART_GETCssCHAR, .Le1 - UART_ss_UART_GETCssCHAR

.section .text.n_uart_ss_uart_putcschar,"ax"
.globl	UART_ss_UART_PUTCsCHAR
UART_ss_UART_PUTCsCHAR:
.Lc6:
# [32] begin
	mov	r18,r24
# Var c located in register r18
.Lj12:
# [33] while UCSR0A and (1 shl UDRE0) = 0 do;
	lds	r19,(192)
	andi	r19,32
	breq	.Lj12
# Var c located in register r18
# [34] UDR0 := Byte(c);
	sts	(198),r18
# [35] end;
	ret
.Lc5:
.Le2:
	.size	UART_ss_UART_PUTCsCHAR, .Le2 - UART_ss_UART_PUTCsCHAR

.section .text.n_uart_ss_uart_xputcsbyte,"ax"
.globl	UART_ss_UART_XPUTCsBYTE
UART_ss_UART_XPUTCsBYTE:
.Lc8:
# Var t located in register r18
# Var b located in register r24
# [40] begin
.Lj17:
# [41] while UCSR0A and (1 shl UDRE0) = 0 do;
	lds	r18,(192)
	andi	r18,32
	breq	.Lj17
# [42] UDR0 := Ord('$');
	ldi	r18,36
	sts	(198),r18
.Lj20:
# [44] while UCSR0A and (1 shl UDRE0) = 0 do;
	lds	r18,(192)
	andi	r18,32
	breq	.Lj20
# [45] t := b shr 4;
	mov	r18,r24
	lsr	r18
	lsr	r18
	lsr	r18
	lsr	r18
# Var t located in register r18
# [46] if t < 10 then
	cpi	r18,10
	brsh	.Lj24
# [47] UDR0 := t + Ord('0')
	mov	r19,r18
	ldi	r20,48
	add	r19,r20
	sts	(198),r19
	rjmp	.Lj26
.Lj24:
# [49] UDR0 := t - (10 - Ord('A'));
	mov	r19,r1
	subi	r18,-55
	sbci	r19,-1
	sts	(198),r18
.Lj26:
# [51] while UCSR0A and (1 shl UDRE0) = 0 do;
	lds	r18,(192)
	andi	r18,32
	breq	.Lj26
# [52] t := b and $0F;
	andi	r24,15
# Var t located in register r24
# [53] if t < 10 then
	cpi	r24,10
	brsh	.Lj30
# [54] UDR0 := t + Ord('0')
	mov	r18,r24
	ldi	r19,48
	add	r18,r19
	sts	(198),r18
	rjmp	.Lj31
.Lj30:
# [56] UDR0 := t - (10 - Ord('A'));
	mov	r18,r1
	subi	r24,-55
	sbci	r18,-1
	sts	(198),r24
.Lj31:
# [57] end;
	ret
.Lc7:
.Le3:
	.size	UART_ss_UART_XPUTCsBYTE, .Le3 - UART_ss_UART_XPUTCsBYTE

.section .text.n_uart_ss_uart_putsspchar,"ax"
.globl	UART_ss_UART_PUTSsPCHAR
UART_ss_UART_PUTSsPCHAR:
.Lc10:
# [60] begin
	push	r3
	push	r2
	movw	r2,r24
# Var s located in register r2
# [61] while s^ <> #0 do
	rjmp	.Lj35
.Lj34:
# [63] uart_putc(s^);
	movw	r30,r2
	ld	r24,Z
	call	UART_ss_UART_PUTCsCHAR
# [64] Inc(s);
	ldi	r18,1
	add	r2,r18
	adc	r3,r1
.Lj35:
	movw	r30,r2
	ld	r18,Z
	cp	r18,r1
	brne	.Lj34
# [66] end;
	pop	r2
	pop	r3
	ret
.Lc9:
.Le4:
	.size	UART_ss_UART_PUTSsPCHAR, .Le4 - UART_ss_UART_PUTSsPCHAR
# End asmlist al_procedures
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

