	.file "pff_ard.pas"
# Begin asmlist al_procedures

.section .text.n_pspff_ard_ss_t_catspcharssboolean,"ax"
.globl	PsPFF_ARD_ss_T_CATsPCHARssBOOLEAN
PsPFF_ARD_ss_T_CATsPCHARssBOOLEAN:
.Lc2:
# [pff_ard.pas]
# [20] begin
	push	r29
	push	r28
	push	r6
	push	r5
	push	r4
	push	r3
	push	r2
	in	r28,61
	in	r29,62
	subi	r28,5
	sbci	r29,2
	in	r0,63
	cli
	out	62,r29
	out	63,r0
	out	61,r28
# Var $result located in register r6
# Var bfl located at r28+2, size=OS_NO
# Var brl located at r28+515, size=OS_16
# Var cntl located in register r18
# Var fname located in register r24
# [21] if pf_open(fname) <> FR_OK then
	call	PFF_ss_PF_OPENsPCHARssFRESULT
	cp	r24,r1
	breq	.Lj6
# [22] Exit(false);
	mov	r6,r1
	rjmp	.Lj3
.Lj6:
# Var cntl located in register r2
# [24] cntl := 0;
	mov	r2,r1
	mov	r3,r1
	mov	r4,r1
	mov	r5,r1
# [25] while pf_read(@bfl, 512, brl) = FR_OK do
	rjmp	.Lj8
.Lj7:
# [27] bfl[brl] := #0;
	ldi	r30,lo8(515)
	ldi	r31,hi8(515)
	add	r30,r28
	adc	r31,r29
	ld	r19,Z+
	ld	r20,Z
	movw	r30,r28
	add	r30,r19
	adc	r31,r20
	adiw	r30,2
	st	Z,r1
	ldi	r30,lo8(515)
	ldi	r31,hi8(515)
	add	r30,r28
	adc	r31,r29
	ld	r20,Z+
	ld	r21,Z
# [28] cntl := cntl + brl;
	add	r2,r20
	adc	r3,r21
	adc	r4,r1
	adc	r5,r1
# [29] uart_puts(bfl);
	ldi	r24,lo8(2)
	ldi	r25,hi8(2)
	add	r24,r28
	adc	r25,r29
	call	UART_ss_UART_PUTSsPCHAR
.Lj8:
	ldi	r24,lo8(2)
	ldi	r25,hi8(2)
	add	r24,r28
	adc	r25,r29
	ldi	r20,lo8(515)
	ldi	r21,hi8(515)
	add	r20,r28
	adc	r21,r29
	mov	r22,r1
	ldi	r26,2
	mov	r23,r26
	call	PFF_ss_PF_READsPOINTERsNATIVEUINTsNATIVEUINTssFRESULT
	cp	r24,r1
	brne	.Lj13
# [36] end;
	rjmp	.Lj7
.Lj13:
# [32] if cntl = fs.fsize then
	lds	r18,(U_sPsPFF_ARD_ss_FS+28)
	lds	r19,(U_sPsPFF_ARD_ss_FS+29)
	lds	r20,(U_sPsPFF_ARD_ss_FS+30)
	lds	r21,(U_sPsPFF_ARD_ss_FS+31)
	cp	r18,r2
	cpc	r19,r3
	cpc	r20,r4
	cpc	r21,r5
	brne	.Lj11
# [33] Result := true
	ldi	r26,1
	mov	r6,r26
	rjmp	.Lj3
.Lj11:
# [35] Result := false;
	mov	r6,r1
.Lj3:
	mov	r24,r6
	subi	r28,-5
	sbci	r29,-3
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
	pop	r28
	pop	r29
	ret
.Lc1:
.Le0:
	.size	PsPFF_ARD_ss_T_CATsPCHARssBOOLEAN, .Le0 - PsPFF_ARD_ss_T_CATsPCHARssBOOLEAN

.section .text.n_pspff_ard_ss_t_readspcharsbytessboolean,"ax"
.globl	PsPFF_ARD_ss_T_READsPCHARsBYTEssBOOLEAN
PsPFF_ARD_ss_T_READsPCHARsBYTEssBOOLEAN:
.Lc4:
# [43] begin
	push	r29
	push	r28
	push	r6
	push	r5
	push	r4
	push	r3
	push	r2
	in	r28,61
	in	r29,62
	subi	r28,5
	sbci	r29,2
	in	r0,63
	cli
	out	62,r29
	out	63,r0
	out	61,r28
# Var $result located in register r2
# Var bfl located at r28+2, size=OS_NO
# Var brl located at r28+515, size=OS_16
# Var cntl located in register r18
# Var fname located in register r24
# Var sig located in register r22
# [44] if pf_open(fname) <> FR_OK then
	call	PFF_ss_PF_OPENsPCHARssFRESULT
	cp	r24,r1
	breq	.Lj17
# [45] Exit(false);
	mov	r2,r1
	rjmp	.Lj14
.Lj17:
# Var cntl located in register r3
# [47] cntl := 0;
	mov	r3,r1
	mov	r4,r1
	mov	r5,r1
	mov	r6,r1
# [48] while pf_read(@bfl, 512, brl) = FR_OK do
	rjmp	.Lj19
.Lj18:
	ldi	r30,lo8(515)
	ldi	r31,hi8(515)
	add	r30,r28
	adc	r31,r29
	ld	r20,Z+
	ld	r21,Z
# [50] cntl := cntl + brl;
	add	r3,r20
	adc	r4,r21
	adc	r5,r1
	adc	r6,r1
.Lj19:
	ldi	r24,lo8(2)
	ldi	r25,hi8(2)
	add	r24,r28
	adc	r25,r29
	ldi	r20,lo8(515)
	ldi	r21,hi8(515)
	add	r20,r28
	adc	r21,r29
	mov	r22,r1
	ldi	r26,2
	mov	r23,r26
	call	PFF_ss_PF_READsPOINTERsNATIVEUINTsNATIVEUINTssFRESULT
	cp	r24,r1
	breq	.Lj18
# [53] if cntl = fs.fsize then
	lds	r18,(U_sPsPFF_ARD_ss_FS+28)
	lds	r19,(U_sPsPFF_ARD_ss_FS+29)
	lds	r20,(U_sPsPFF_ARD_ss_FS+30)
	lds	r21,(U_sPsPFF_ARD_ss_FS+31)
	cp	r18,r3
	cpc	r19,r4
	cpc	r20,r5
	cpc	r21,r6
	brne	.Lj22
# [54] Result := true
	ldi	r26,1
	mov	r2,r26
	rjmp	.Lj14
.Lj22:
# [56] Result := false;
	mov	r2,r1
.Lj14:
# [57] end;
	mov	r24,r2
	subi	r28,-5
	sbci	r29,-3
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
	pop	r28
	pop	r29
	ret
.Lc3:
.Le1:
	.size	PsPFF_ARD_ss_T_READsPCHARsBYTEssBOOLEAN, .Le1 - PsPFF_ARD_ss_T_READsPCHARsBYTEssBOOLEAN

.section .text.n_main,"ax"
.globl	main
main:
.globl	PASCALMAIN
PASCALMAIN:
.Lc6:
.Lc7:
# Var fr located in register r18
# [59] begin
	call	FPC_INIT_FUNC_TABLE
# [61] uart_init();
	call	UART_ss_UART_INIT
# [62] uart_puts('*** PetitFS test. ***'#13#10);
	ldi	r24,lo8(_sPFF_ARDs_Ld1)
	ldi	r25,hi8(_sPFF_ARDs_Ld1)
	call	UART_ss_UART_PUTSsPCHAR
# [63] fr := pf_mount(fs);
	ldi	r24,lo8(U_sPsPFF_ARD_ss_FS)
	ldi	r25,hi8(U_sPsPFF_ARD_ss_FS)
	call	PFF_ss_PF_MOUNTsFATFSssFRESULT
# Var fr located in register r24
# [65] fr := pf_opendir(dr, '');
	ldi	r24,lo8(U_sPsPFF_ARD_ss_DR)
	ldi	r25,hi8(U_sPsPFF_ARD_ss_DR)
	ldi	r22,lo8(_sPFF_ARDs_Ld2)
	ldi	r23,hi8(_sPFF_ARDs_Ld2)
	call	PFF_ss_PF_OPENDIRsDIRsPCHARssFRESULT
	mov	r2,r24
# Var fr located in register r2
# [66] uart_puts('*** List root directory'#13#10);
	ldi	r24,lo8(_sPFF_ARDs_Ld3)
	ldi	r25,hi8(_sPFF_ARDs_Ld3)
	call	UART_ss_UART_PUTSsPCHAR
.Lj24:
# [70] fr := pf_readdir(dr, fi);
	ldi	r22,lo8(U_sPsPFF_ARD_ss_FI)
	ldi	r23,hi8(U_sPsPFF_ARD_ss_FI)
	ldi	r24,lo8(U_sPsPFF_ARD_ss_DR)
	ldi	r25,hi8(U_sPsPFF_ARD_ss_DR)
	call	PFF_ss_PF_READDIRsDIRsFILINFOssFRESULT
	mov	r2,r24
# [71] uart_puts(fi.fname);
	ldi	r24,lo8(U_sPsPFF_ARD_ss_FI+9)
	ldi	r25,hi8(U_sPsPFF_ARD_ss_FI+9)
	call	UART_ss_UART_PUTSsPCHAR
# [72] uart_puts(''#13#10);
	ldi	r24,lo8(_sPFF_ARDs_Ld4)
	ldi	r25,hi8(_sPFF_ARDs_Ld4)
	call	UART_ss_UART_PUTSsPCHAR
# [74] until fi.fname[0] = char(#0);
	lds	r18,(U_sPsPFF_ARD_ss_FI+9)
	cp	r18,r1
	brne	.Lj24
# [76] fr := pf_rewinddir(dr);
	ldi	r24,lo8(U_sPsPFF_ARD_ss_DR)
	ldi	r25,hi8(U_sPsPFF_ARD_ss_DR)
	call	PFF_ss_PF_REWINDDIRsDIRssFRESULT
	mov	r2,r24
# Var fr located in register r2
# [77] uart_puts('*** Rewind and read ... '#13#10);
	ldi	r24,lo8(_sPFF_ARDs_Ld5)
	ldi	r25,hi8(_sPFF_ARDs_Ld5)
	call	UART_ss_UART_PUTSsPCHAR
.Lj27:
# [81] fr := pf_readdir(dr, fi);
	ldi	r22,lo8(U_sPsPFF_ARD_ss_FI)
	ldi	r23,hi8(U_sPsPFF_ARD_ss_FI)
	ldi	r24,lo8(U_sPsPFF_ARD_ss_DR)
	ldi	r25,hi8(U_sPsPFF_ARD_ss_DR)
	call	PFF_ss_PF_READDIRsDIRsFILINFOssFRESULT
	mov	r2,r24
# [82] uart_puts(fi.fname);
	ldi	r24,lo8(U_sPsPFF_ARD_ss_FI+9)
	ldi	r25,hi8(U_sPsPFF_ARD_ss_FI+9)
	call	UART_ss_UART_PUTSsPCHAR
# [83] uart_puts(''#13#10);
	ldi	r24,lo8(_sPFF_ARDs_Ld4)
	ldi	r25,hi8(_sPFF_ARDs_Ld4)
	call	UART_ss_UART_PUTSsPCHAR
# [85] until fi.fname[0] = char(#0);
	lds	r18,(U_sPsPFF_ARD_ss_FI+9)
	cp	r18,r1
	brne	.Lj27
# [87] fr := pf_opendir(dr, 'RASPI');
	ldi	r24,lo8(U_sPsPFF_ARD_ss_DR)
	ldi	r25,hi8(U_sPsPFF_ARD_ss_DR)
	ldi	r22,lo8(_sPFF_ARDs_Ld6)
	ldi	r23,hi8(_sPFF_ARDs_Ld6)
	call	PFF_ss_PF_OPENDIRsDIRsPCHARssFRESULT
	mov	r2,r24
# Var fr located in register r2
# [88] uart_puts('*** List RASPI directory - '#13#10);
	ldi	r24,lo8(_sPFF_ARDs_Ld7)
	ldi	r25,hi8(_sPFF_ARDs_Ld7)
	call	UART_ss_UART_PUTSsPCHAR
.Lj30:
# [91] fr := pf_readdir(dr, fi);
	ldi	r22,lo8(U_sPsPFF_ARD_ss_FI)
	ldi	r23,hi8(U_sPsPFF_ARD_ss_FI)
	ldi	r24,lo8(U_sPsPFF_ARD_ss_DR)
	ldi	r25,hi8(U_sPsPFF_ARD_ss_DR)
	call	PFF_ss_PF_READDIRsDIRsFILINFOssFRESULT
	mov	r2,r24
# [92] uart_puts(fi.fname);
	ldi	r24,lo8(U_sPsPFF_ARD_ss_FI+9)
	ldi	r25,hi8(U_sPsPFF_ARD_ss_FI+9)
	call	UART_ss_UART_PUTSsPCHAR
# [93] uart_puts(''#13#10);
	ldi	r24,lo8(_sPFF_ARDs_Ld4)
	ldi	r25,hi8(_sPFF_ARDs_Ld4)
	call	UART_ss_UART_PUTSsPCHAR
# [95] until fi.fname[0] = char(#0);
	lds	r18,(U_sPsPFF_ARD_ss_FI+9)
	cp	r18,r1
	brne	.Lj30
# [97] t_cat('00README.TXT');
	ldi	r24,lo8(_sPFF_ARDs_Ld8)
	ldi	r25,hi8(_sPFF_ARDs_Ld8)
	call	PsPFF_ARD_ss_T_CATsPCHARssBOOLEAN
# [98] uart_puts(''#13#10);
	ldi	r24,lo8(_sPFF_ARDs_Ld4)
	ldi	r25,hi8(_sPFF_ARDs_Ld4)
	call	UART_ss_UART_PUTSsPCHAR
# [100] t_cat('LICENSE.TXT');
	ldi	r24,lo8(_sPFF_ARDs_Ld9)
	ldi	r25,hi8(_sPFF_ARDs_Ld9)
	call	PsPFF_ARD_ss_T_CATsPCHARssBOOLEAN
# [101] uart_puts(''#13#10);
	ldi	r24,lo8(_sPFF_ARDs_Ld4)
	ldi	r25,hi8(_sPFF_ARDs_Ld4)
	call	UART_ss_UART_PUTSsPCHAR
# [103] uart_puts('Try read RW.TXT (1M)...'#13#10);
	ldi	r24,lo8(_sPFF_ARDs_Ld10)
	ldi	r25,hi8(_sPFF_ARDs_Ld10)
	call	UART_ss_UART_PUTSsPCHAR
# [104] if t_read('RW.TXT', Ord('A')) then
	ldi	r22,65
	ldi	r24,lo8(_sPFF_ARDs_Ld11)
	ldi	r25,hi8(_sPFF_ARDs_Ld11)
	call	PsPFF_ARD_ss_T_READsPCHARsBYTEssBOOLEAN
	cp	r24,r1
	breq	.Lj34
# [105] uart_puts('Done reading RW.TXT!'#13#10)
	ldi	r24,lo8(_sPFF_ARDs_Ld12)
	ldi	r25,hi8(_sPFF_ARDs_Ld12)
	call	UART_ss_UART_PUTSsPCHAR
	rjmp	.Lj35
.Lj34:
# [107] uart_puts('Error reading RW.TXT.'#13#10);
	ldi	r24,lo8(_sPFF_ARDs_Ld13)
	ldi	r25,hi8(_sPFF_ARDs_Ld13)
	call	UART_ss_UART_PUTSsPCHAR
.Lj35:
# [109] uart_puts('Try read RW2.TXT (2M)...'#13#10);
	ldi	r24,lo8(_sPFF_ARDs_Ld14)
	ldi	r25,hi8(_sPFF_ARDs_Ld14)
	call	UART_ss_UART_PUTSsPCHAR
# [110] if t_read('RW2.TXT', Ord('B')) then
	ldi	r22,66
	ldi	r24,lo8(_sPFF_ARDs_Ld15)
	ldi	r25,hi8(_sPFF_ARDs_Ld15)
	call	PsPFF_ARD_ss_T_READsPCHARsBYTEssBOOLEAN
	cp	r24,r1
	breq	.Lj37
# [111] uart_puts('Done reading RW2.TXT!'#13#10)
	ldi	r24,lo8(_sPFF_ARDs_Ld16)
	ldi	r25,hi8(_sPFF_ARDs_Ld16)
	call	UART_ss_UART_PUTSsPCHAR
	rjmp	.Lj38
.Lj37:
# [113] uart_puts('Error reading RW2.TXT.'#13#10);
	ldi	r24,lo8(_sPFF_ARDs_Ld17)
	ldi	r25,hi8(_sPFF_ARDs_Ld17)
	call	UART_ss_UART_PUTSsPCHAR
.Lj38:
# [115] uart_puts('Try read RW4.TXT (4M)...'#13#10);
	ldi	r24,lo8(_sPFF_ARDs_Ld18)
	ldi	r25,hi8(_sPFF_ARDs_Ld18)
	call	UART_ss_UART_PUTSsPCHAR
# [116] if t_read('RW4.TXT', Ord('C')) then
	ldi	r22,67
	ldi	r24,lo8(_sPFF_ARDs_Ld19)
	ldi	r25,hi8(_sPFF_ARDs_Ld19)
	call	PsPFF_ARD_ss_T_READsPCHARsBYTEssBOOLEAN
	cp	r24,r1
	breq	.Lj40
# [117] uart_puts('Done reading RW4.TXT!'#13#10)
	ldi	r24,lo8(_sPFF_ARDs_Ld20)
	ldi	r25,hi8(_sPFF_ARDs_Ld20)
	call	UART_ss_UART_PUTSsPCHAR
	rjmp	.Lj41
.Lj40:
# [119] uart_puts('Error reading RW4.TXT.'#13#10);
	ldi	r24,lo8(_sPFF_ARDs_Ld21)
	ldi	r25,hi8(_sPFF_ARDs_Ld21)
	call	UART_ss_UART_PUTSsPCHAR
.Lj41:
# [121] end.
	call	fpc_do_exit
.Lc5:
.Le2:
	.size	main, .Le2 - main

.section .text.n_FPC_INIT_FUNC_TABLE,"ax"
.globl	FPC_INIT_FUNC_TABLE
FPC_INIT_FUNC_TABLE:
# [122] 
	ret

.section .text.n_FPC_FINALIZE_FUNC_TABLE,"ax"
.globl	FPC_FINALIZE_FUNC_TABLE
FPC_FINALIZE_FUNC_TABLE:
	ret
# End asmlist al_procedures
# Begin asmlist al_globals

.section .bss.n_u_spspff_ard_ss_fs,"aw",%nobits
# [10] fs: FATFS;
	.size U_sPsPFF_ARD_ss_FS,44
U_sPsPFF_ARD_ss_FS:
	.zero 44

.section .bss.n_u_spspff_ard_ss_dr,"aw",%nobits
# [11] dr: DIR;
	.size U_sPsPFF_ARD_ss_DR,16
U_sPsPFF_ARD_ss_DR:
	.zero 16

.section .bss.n_u_spspff_ard_ss_fi,"aw",%nobits
# [12] fi: FILINFO;
	.size U_sPsPFF_ARD_ss_FI,24
U_sPsPFF_ARD_ss_FI:
	.zero 24

.section .bss.n_u_spspff_ard_ss_fr,"aw",%nobits
# [13] fr: FRESULT;
	.size U_sPsPFF_ARD_ss_FR,1
U_sPsPFF_ARD_ss_FR:
	.zero 1

.section .data.n_INITFINAL
	.balign 2
.globl	INITFINAL
INITFINAL:
	.byte	0,0
.Le3:
	.size	INITFINAL, .Le3 - INITFINAL

.section .data.n_FPC_THREADVARTABLES
	.balign 2
.globl	FPC_THREADVARTABLES
FPC_THREADVARTABLES:
	.long	0
.Le4:
	.size	FPC_THREADVARTABLES, .Le4 - FPC_THREADVARTABLES

.section .data.n_FPC_RESOURCESTRINGTABLES
	.balign 2
.globl	FPC_RESOURCESTRINGTABLES
FPC_RESOURCESTRINGTABLES:
	.short	0
.Le5:
	.size	FPC_RESOURCESTRINGTABLES, .Le5 - FPC_RESOURCESTRINGTABLES

.section .data.n_FPC_WIDEINITTABLES
	.balign 2
.globl	FPC_WIDEINITTABLES
FPC_WIDEINITTABLES:
	.short	0
.Le6:
	.size	FPC_WIDEINITTABLES, .Le6 - FPC_WIDEINITTABLES

.section .data.n_FPC_RESSTRINITTABLES
	.balign 2
.globl	FPC_RESSTRINITTABLES
FPC_RESSTRINITTABLES:
	.short	0
.Le7:
	.size	FPC_RESSTRINITTABLES, .Le7 - FPC_RESSTRINITTABLES

.section .fpc.n_version,"aw"
__fpc_ident:
	.ascii	"FPC 3.3.1 [2020/01/18] for avr - embedded"
.Le8:
	.size	__fpc_ident, .Le8 - __fpc_ident

.section .data.n___stklen
	.balign 2
.globl	__stklen
__stklen:
	.short	1024
.Le9:
	.size	__stklen, .Le9 - __stklen

.section .data.n___heapsize
	.balign 2
.globl	__heapsize
__heapsize:
	.short	128
.Le10:
	.size	__heapsize, .Le10 - __heapsize

.section .bss.n___fpc_initialheap,"aw",%nobits
	.globl __fpc_initialheap
	.size __fpc_initialheap,128
__fpc_initialheap:
	.zero 128

.section .data.n___fpc_valgrind
	.balign 2
.globl	__fpc_valgrind
__fpc_valgrind:
	.byte	0
.Le11:
	.size	__fpc_valgrind, .Le11 - __fpc_valgrind
# End asmlist al_globals
# Begin asmlist al_typedconsts

.section .rodata.n__sPFF_ARDs_Ld1
.globl	_sPFF_ARDs_Ld1
_sPFF_ARDs_Ld1:
	.ascii	"*** PetitFS test. ***\015\012\000"
.Le12:
	.size	_sPFF_ARDs_Ld1, .Le12 - _sPFF_ARDs_Ld1

.section .rodata.n__sPFF_ARDs_Ld2
.globl	_sPFF_ARDs_Ld2
_sPFF_ARDs_Ld2:
	.ascii	"\000"
.Le13:
	.size	_sPFF_ARDs_Ld2, .Le13 - _sPFF_ARDs_Ld2

.section .rodata.n__sPFF_ARDs_Ld3
.globl	_sPFF_ARDs_Ld3
_sPFF_ARDs_Ld3:
	.ascii	"*** List root directory\015\012\000"
.Le14:
	.size	_sPFF_ARDs_Ld3, .Le14 - _sPFF_ARDs_Ld3

.section .rodata.n__sPFF_ARDs_Ld4
.globl	_sPFF_ARDs_Ld4
_sPFF_ARDs_Ld4:
	.ascii	"\015\012\000"
.Le15:
	.size	_sPFF_ARDs_Ld4, .Le15 - _sPFF_ARDs_Ld4

.section .rodata.n__sPFF_ARDs_Ld5
.globl	_sPFF_ARDs_Ld5
_sPFF_ARDs_Ld5:
	.ascii	"*** Rewind and read ... \015\012\000"
.Le16:
	.size	_sPFF_ARDs_Ld5, .Le16 - _sPFF_ARDs_Ld5

.section .rodata.n__sPFF_ARDs_Ld6
.globl	_sPFF_ARDs_Ld6
_sPFF_ARDs_Ld6:
	.ascii	"RASPI\000"
.Le17:
	.size	_sPFF_ARDs_Ld6, .Le17 - _sPFF_ARDs_Ld6

.section .rodata.n__sPFF_ARDs_Ld7
.globl	_sPFF_ARDs_Ld7
_sPFF_ARDs_Ld7:
	.ascii	"*** List RASPI directory - \015\012\000"
.Le18:
	.size	_sPFF_ARDs_Ld7, .Le18 - _sPFF_ARDs_Ld7

.section .rodata.n__sPFF_ARDs_Ld8
.globl	_sPFF_ARDs_Ld8
_sPFF_ARDs_Ld8:
	.ascii	"00README.TXT\000"
.Le19:
	.size	_sPFF_ARDs_Ld8, .Le19 - _sPFF_ARDs_Ld8

.section .rodata.n__sPFF_ARDs_Ld9
.globl	_sPFF_ARDs_Ld9
_sPFF_ARDs_Ld9:
	.ascii	"LICENSE.TXT\000"
.Le20:
	.size	_sPFF_ARDs_Ld9, .Le20 - _sPFF_ARDs_Ld9

.section .rodata.n__sPFF_ARDs_Ld10
.globl	_sPFF_ARDs_Ld10
_sPFF_ARDs_Ld10:
	.ascii	"Try read RW.TXT (1M)...\015\012\000"
.Le21:
	.size	_sPFF_ARDs_Ld10, .Le21 - _sPFF_ARDs_Ld10

.section .rodata.n__sPFF_ARDs_Ld11
.globl	_sPFF_ARDs_Ld11
_sPFF_ARDs_Ld11:
	.ascii	"RW.TXT\000"
.Le22:
	.size	_sPFF_ARDs_Ld11, .Le22 - _sPFF_ARDs_Ld11

.section .rodata.n__sPFF_ARDs_Ld12
.globl	_sPFF_ARDs_Ld12
_sPFF_ARDs_Ld12:
	.ascii	"Done reading RW.TXT!\015\012\000"
.Le23:
	.size	_sPFF_ARDs_Ld12, .Le23 - _sPFF_ARDs_Ld12

.section .rodata.n__sPFF_ARDs_Ld13
.globl	_sPFF_ARDs_Ld13
_sPFF_ARDs_Ld13:
	.ascii	"Error reading RW.TXT.\015\012\000"
.Le24:
	.size	_sPFF_ARDs_Ld13, .Le24 - _sPFF_ARDs_Ld13

.section .rodata.n__sPFF_ARDs_Ld14
.globl	_sPFF_ARDs_Ld14
_sPFF_ARDs_Ld14:
	.ascii	"Try read RW2.TXT (2M)...\015\012\000"
.Le25:
	.size	_sPFF_ARDs_Ld14, .Le25 - _sPFF_ARDs_Ld14

.section .rodata.n__sPFF_ARDs_Ld15
.globl	_sPFF_ARDs_Ld15
_sPFF_ARDs_Ld15:
	.ascii	"RW2.TXT\000"
.Le26:
	.size	_sPFF_ARDs_Ld15, .Le26 - _sPFF_ARDs_Ld15

.section .rodata.n__sPFF_ARDs_Ld16
.globl	_sPFF_ARDs_Ld16
_sPFF_ARDs_Ld16:
	.ascii	"Done reading RW2.TXT!\015\012\000"
.Le27:
	.size	_sPFF_ARDs_Ld16, .Le27 - _sPFF_ARDs_Ld16

.section .rodata.n__sPFF_ARDs_Ld17
.globl	_sPFF_ARDs_Ld17
_sPFF_ARDs_Ld17:
	.ascii	"Error reading RW2.TXT.\015\012\000"
.Le28:
	.size	_sPFF_ARDs_Ld17, .Le28 - _sPFF_ARDs_Ld17

.section .rodata.n__sPFF_ARDs_Ld18
.globl	_sPFF_ARDs_Ld18
_sPFF_ARDs_Ld18:
	.ascii	"Try read RW4.TXT (4M)...\015\012\000"
.Le29:
	.size	_sPFF_ARDs_Ld18, .Le29 - _sPFF_ARDs_Ld18

.section .rodata.n__sPFF_ARDs_Ld19
.globl	_sPFF_ARDs_Ld19
_sPFF_ARDs_Ld19:
	.ascii	"RW4.TXT\000"
.Le30:
	.size	_sPFF_ARDs_Ld19, .Le30 - _sPFF_ARDs_Ld19

.section .rodata.n__sPFF_ARDs_Ld20
.globl	_sPFF_ARDs_Ld20
_sPFF_ARDs_Ld20:
	.ascii	"Done reading RW4.TXT!\015\012\000"
.Le31:
	.size	_sPFF_ARDs_Ld20, .Le31 - _sPFF_ARDs_Ld20

.section .rodata.n__sPFF_ARDs_Ld21
.globl	_sPFF_ARDs_Ld21
_sPFF_ARDs_Ld21:
	.ascii	"Error reading RW4.TXT.\015\012\000"
.Le32:
	.size	_sPFF_ARDs_Ld21, .Le32 - _sPFF_ARDs_Ld21
# End asmlist al_typedconsts
# Begin asmlist al_dwarf_frame

.section .debug_frame
.Lc8:
	.long	.Lc10-.Lc9
.Lc9:
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
.Lc10:
	.long	.Lc12-.Lc11
.Lc11:
	.short	.Lc8
	.short	.Lc2
	.short	.Lc1-.Lc2
	.balign 4,0
.Lc12:
	.long	.Lc15-.Lc14
.Lc14:
	.short	.Lc8
	.short	.Lc4
	.short	.Lc3-.Lc4
	.balign 4,0
.Lc15:
	.long	.Lc18-.Lc17
.Lc17:
	.short	.Lc8
	.short	.Lc6
	.short	.Lc5-.Lc6
	.byte	4
	.long	.Lc7-.Lc6
	.byte	7
	.uleb128	24
	.balign 4,0
.Lc18:
# End asmlist al_dwarf_frame

