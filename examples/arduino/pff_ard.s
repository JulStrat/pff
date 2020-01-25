	.file "pff_ard.pas"
# Begin asmlist al_procedures

.section .text.n_pspff_ard_ss_t_dirspcharssboolean,"ax"
.globl	PsPFF_ARD_ss_T_DIRsPCHARssBOOLEAN
PsPFF_ARD_ss_T_DIRsPCHARssBOOLEAN:
.Lc2:
# [pff_ard.pas]
# [40] begin
	push	r29
	push	r28
	push	r3
	push	r2
	in	r28,61
	in	r29,62
	subi	r28,3
	sbci	r29,2
	in	r0,63
	cli
	out	62,r29
	out	63,r0
	out	61,r28
# Var $result located in register r2
# Var bfl located at r28+2, size=OS_NO
# Var brl located in register r18
# Var cntl located in register r18
	movw	r2,r24
# Var fname located in register r2
# [41] uart_puts(DIR_F); uart_puts(fname); uart_puts(''#13#10);
	lds	r24,(TC_sPsPFF_ARD_ss_DIR_F)
	lds	r25,(TC_sPsPFF_ARD_ss_DIR_F+1)
	call	UART_ss_UART_PUTSsPCHAR
# Var fname located in register r2
	movw	r24,r2
	call	UART_ss_UART_PUTSsPCHAR
	ldi	r24,lo8(_sPFF_ARDs_Ld14)
	ldi	r25,hi8(_sPFF_ARDs_Ld14)
	call	UART_ss_UART_PUTSsPCHAR
# [42] if pf_opendir(dr, fname) <> FR_OK then
	ldi	r24,lo8(U_sPsPFF_ARD_ss_DR)
	ldi	r25,hi8(U_sPsPFF_ARD_ss_DR)
	movw	r22,r2
	call	PFF_ss_PF_OPENDIRsDIRsPCHARssFRESULT
	cp	r24,r1
	breq	.Lj7
# [44] uart_puts(DIR_ERR);
	lds	r24,(TC_sPsPFF_ARD_ss_DIR_ERR)
	lds	r25,(TC_sPsPFF_ARD_ss_DIR_ERR+1)
	call	UART_ss_UART_PUTSsPCHAR
# [45] Exit(false);
	mov	r2,r1
	rjmp	.Lj3
.Lj7:
# [50] fr := pf_readdir(dr, fi);
	ldi	r22,lo8(U_sPsPFF_ARD_ss_FI)
	ldi	r23,hi8(U_sPsPFF_ARD_ss_FI)
	ldi	r24,lo8(U_sPsPFF_ARD_ss_DR)
	ldi	r25,hi8(U_sPsPFF_ARD_ss_DR)
	call	PFF_ss_PF_READDIRsDIRsFILINFOssFRESULT
	sts	(U_sPsPFF_ARD_ss_FR),r24
# [51] uart_puts('> '); uart_puts(fi.fname); uart_puts(''#13#10);
	ldi	r24,lo8(_sPFF_ARDs_Ld15)
	ldi	r25,hi8(_sPFF_ARDs_Ld15)
	call	UART_ss_UART_PUTSsPCHAR
	ldi	r24,lo8(U_sPsPFF_ARD_ss_FI+9)
	ldi	r25,hi8(U_sPsPFF_ARD_ss_FI+9)
	call	UART_ss_UART_PUTSsPCHAR
	ldi	r24,lo8(_sPFF_ARDs_Ld14)
	ldi	r25,hi8(_sPFF_ARDs_Ld14)
	call	UART_ss_UART_PUTSsPCHAR
# [53] until fi.fname[0] = char(#0);
	lds	r18,(U_sPsPFF_ARD_ss_FI+9)
	cp	r18,r1
	brne	.Lj7
# [54] uart_puts(DIR_OK);
	lds	r24,(TC_sPsPFF_ARD_ss_DIR_OK)
	lds	r25,(TC_sPsPFF_ARD_ss_DIR_OK+1)
	call	UART_ss_UART_PUTSsPCHAR
# [55] Result := true
	ldi	r26,1
	mov	r2,r26
.Lj3:
# [56] end;
	mov	r24,r2
	subi	r28,-3
	sbci	r29,-3
	in	r0,63
	cli
	out	62,r29
	out	63,r0
	out	61,r28
	pop	r2
	pop	r3
	pop	r28
	pop	r29
	ret
.Lc1:
.Le0:
	.size	PsPFF_ARD_ss_T_DIRsPCHARssBOOLEAN, .Le0 - PsPFF_ARD_ss_T_DIRsPCHARssBOOLEAN

.section .text.n_pspff_ard_ss_t_catspcharslongwordssboolean,"ax"
.globl	PsPFF_ARD_ss_T_CATsPCHARsLONGWORDssBOOLEAN
PsPFF_ARD_ss_T_CATsPCHARsLONGWORDssBOOLEAN:
.Lc4:
# [63] begin
	push	r29
	push	r28
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
	subi	r28,5
	sbci	r29,2
	in	r0,63
	cli
	out	62,r29
	out	63,r0
	out	61,r28
# Var $result located in register r5
# Var bfl located at r28+2, size=OS_NO
# Var brl located at r28+515, size=OS_16
# Var cntl located in register r18
	movw	r2,r24
# Var fname located in register r2
	mov	r10,r20
	mov	r7,r21
	movw	r8,r22
# Var off located in register r10
# [64] uart_puts(CAT_F); uart_puts(fname); uart_puts(''#13#10);
	lds	r24,(TC_sPsPFF_ARD_ss_CAT_F)
	lds	r25,(TC_sPsPFF_ARD_ss_CAT_F+1)
	call	UART_ss_UART_PUTSsPCHAR
# Var fname located in register r2
	movw	r24,r2
	call	UART_ss_UART_PUTSsPCHAR
	ldi	r24,lo8(_sPFF_ARDs_Ld14)
	ldi	r25,hi8(_sPFF_ARDs_Ld14)
	call	UART_ss_UART_PUTSsPCHAR
# [65] if pf_open(fname) <> FR_OK then
	movw	r24,r2
	call	PFF_ss_PF_OPENsPCHARssFRESULT
	cp	r24,r1
	breq	.Lj13
# [67] uart_puts(CAT_ERR);
	lds	r24,(TC_sPsPFF_ARD_ss_CAT_ERR)
	lds	r25,(TC_sPsPFF_ARD_ss_CAT_ERR+1)
	call	UART_ss_UART_PUTSsPCHAR
# [68] Exit(false);
	mov	r5,r1
	rjmp	.Lj10
.Lj13:
# Var cntl located in register r3
# [71] cntl := 0;
	mov	r3,r1
	mov	r6,r1
	mov	r2,r1
	mov	r4,r1
# [72] if pf_lseek(off) <> FR_OK then
	mov	r22,r10
	mov	r23,r7
	movw	r24,r8
	call	PFF_ss_PF_LSEEKsLONGWORDssFRESULT
	cp	r24,r1
	breq	.Lj15
# [74] uart_puts(CAT_ERR);
	lds	r24,(TC_sPsPFF_ARD_ss_CAT_ERR)
	lds	r25,(TC_sPsPFF_ARD_ss_CAT_ERR+1)
	call	UART_ss_UART_PUTSsPCHAR
# [75] Exit(false);
	mov	r5,r1
	rjmp	.Lj10
.Lj15:
# [78] cntl := cntl + fs.fptr;
	lds	r18,(U_sPsPFF_ARD_ss_FS+24)
	lds	r19,(U_sPsPFF_ARD_ss_FS+25)
	lds	r20,(U_sPsPFF_ARD_ss_FS+26)
	lds	r21,(U_sPsPFF_ARD_ss_FS+27)
	add	r3,r18
	adc	r6,r19
	adc	r2,r20
	adc	r4,r21
# [79] while pf_read(@bfl, 512, brl) = FR_OK do
	rjmp	.Lj17
.Lj16:
	ldi	r30,lo8(515)
	ldi	r31,hi8(515)
	add	r30,r28
	adc	r31,r29
	ld	r20,Z+
	ld	r21,Z
# [81] cntl := cntl + brl;
	add	r3,r20
	adc	r6,r21
	adc	r2,r1
	adc	r4,r1
# [82] bfl[brl] := #0;
	ldi	r30,lo8(515)
	ldi	r31,hi8(515)
	add	r30,r28
	adc	r31,r29
	ld	r20,Z+
	ld	r19,Z
	movw	r30,r28
	add	r30,r20
	adc	r31,r19
	adiw	r30,2
	st	Z,r1
# [83] uart_puts(bfl);
	ldi	r24,lo8(2)
	ldi	r25,hi8(2)
	add	r24,r28
	adc	r25,r29
	call	UART_ss_UART_PUTSsPCHAR
# [84] if brl < 512 then break;
	ldi	r30,lo8(515)
	ldi	r31,hi8(515)
	add	r30,r28
	adc	r31,r29
	ld	r18,Z+
	ld	r19,Z
	cp	r18,r1
	ldi	r18,2
	cpc	r19,r18
	brlo	.Lj18
.Lj17:
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
	brne	.Lj24
# [97] end;
	rjmp	.Lj16
.Lj24:
.Lj18:
# [87] if cntl = fs.fsize then
	lds	r18,(U_sPsPFF_ARD_ss_FS+28)
	lds	r19,(U_sPsPFF_ARD_ss_FS+29)
	lds	r20,(U_sPsPFF_ARD_ss_FS+30)
	lds	r21,(U_sPsPFF_ARD_ss_FS+31)
	cp	r18,r3
	cpc	r19,r6
	cpc	r20,r2
	cpc	r21,r4
	brne	.Lj22
# [89] uart_puts(CAT_OK);
	lds	r24,(TC_sPsPFF_ARD_ss_CAT_OK)
	lds	r25,(TC_sPsPFF_ARD_ss_CAT_OK+1)
	call	UART_ss_UART_PUTSsPCHAR
# [90] Result := true
	ldi	r26,1
	mov	r5,r26
	rjmp	.Lj10
.Lj22:
# [94] uart_puts(CAT_ERR);
	lds	r24,(TC_sPsPFF_ARD_ss_CAT_ERR)
	lds	r25,(TC_sPsPFF_ARD_ss_CAT_ERR+1)
	call	UART_ss_UART_PUTSsPCHAR
# [95] Result := false;
	mov	r5,r1
.Lj10:
	mov	r24,r5
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
	pop	r7
	pop	r8
	pop	r9
	pop	r10
	pop	r28
	pop	r29
	ret
.Lc3:
.Le1:
	.size	PsPFF_ARD_ss_T_CATsPCHARsLONGWORDssBOOLEAN, .Le1 - PsPFF_ARD_ss_T_CATsPCHARsLONGWORDssBOOLEAN

.section .text.n_pspff_ard_ss_t_readspcharssboolean,"ax"
.globl	PsPFF_ARD_ss_T_READsPCHARssBOOLEAN
PsPFF_ARD_ss_T_READsPCHARssBOOLEAN:
.Lc6:
# [104] begin
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
	movw	r2,r24
# Var fname located in register r2
# [105] uart_puts(READ_F); uart_puts(fname); uart_puts(''#13#10);
	lds	r24,(TC_sPsPFF_ARD_ss_READ_F)
	lds	r25,(TC_sPsPFF_ARD_ss_READ_F+1)
	call	UART_ss_UART_PUTSsPCHAR
# Var fname located in register r2
	movw	r24,r2
	call	UART_ss_UART_PUTSsPCHAR
	ldi	r24,lo8(_sPFF_ARDs_Ld14)
	ldi	r25,hi8(_sPFF_ARDs_Ld14)
	call	UART_ss_UART_PUTSsPCHAR
# [106] if pf_open(fname) <> FR_OK then
	movw	r24,r2
	call	PFF_ss_PF_OPENsPCHARssFRESULT
	cp	r24,r1
	breq	.Lj28
# [108] uart_puts(READ_ERR);
	lds	r24,(TC_sPsPFF_ARD_ss_READ_ERR)
	lds	r25,(TC_sPsPFF_ARD_ss_READ_ERR+1)
	call	UART_ss_UART_PUTSsPCHAR
# [109] Exit(false);
	mov	r2,r1
	rjmp	.Lj25
.Lj28:
# Var cntl located in register r3
# [112] cntl := 0;
	mov	r3,r1
	mov	r4,r1
	mov	r5,r1
	mov	r6,r1
# [113] while pf_read(@bfl, 512, brl) = FR_OK do
	rjmp	.Lj30
.Lj29:
	ldi	r30,lo8(515)
	ldi	r31,hi8(515)
	add	r30,r28
	adc	r31,r29
	ld	r20,Z+
	ld	r21,Z
# [115] cntl := cntl + brl;
	add	r3,r20
	adc	r4,r21
	adc	r5,r1
	adc	r6,r1
# [116] if brl < 512 then break;
	ldi	r30,lo8(515)
	ldi	r31,hi8(515)
	add	r30,r28
	adc	r31,r29
	ld	r18,Z+
	ld	r19,Z
	cp	r18,r1
	ldi	r18,2
	cpc	r19,r18
	brlo	.Lj31
.Lj30:
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
	brne	.Lj37
# [129] end;
	rjmp	.Lj29
.Lj37:
.Lj31:
# [119] if cntl = fs.fsize then
	lds	r18,(U_sPsPFF_ARD_ss_FS+28)
	lds	r19,(U_sPsPFF_ARD_ss_FS+29)
	lds	r20,(U_sPsPFF_ARD_ss_FS+30)
	lds	r21,(U_sPsPFF_ARD_ss_FS+31)
	cp	r18,r3
	cpc	r19,r4
	cpc	r20,r5
	cpc	r21,r6
	brne	.Lj35
# [121] uart_puts(READ_OK);
	lds	r24,(TC_sPsPFF_ARD_ss_READ_OK)
	lds	r25,(TC_sPsPFF_ARD_ss_READ_OK+1)
	call	UART_ss_UART_PUTSsPCHAR
# [122] Result := true
	ldi	r26,1
	mov	r2,r26
	rjmp	.Lj25
.Lj35:
# [126] uart_puts(READ_ERR);
	lds	r24,(TC_sPsPFF_ARD_ss_READ_ERR)
	lds	r25,(TC_sPsPFF_ARD_ss_READ_ERR+1)
	call	UART_ss_UART_PUTSsPCHAR
# [127] Result := false;
	mov	r2,r1
.Lj25:
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
.Lc5:
.Le2:
	.size	PsPFF_ARD_ss_T_READsPCHARssBOOLEAN, .Le2 - PsPFF_ARD_ss_T_READsPCHARssBOOLEAN

.section .text.n_pspff_ard_ss_t_writespcharssboolean,"ax"
.globl	PsPFF_ARD_ss_T_WRITEsPCHARssBOOLEAN
PsPFF_ARD_ss_T_WRITEsPCHARssBOOLEAN:
.Lc8:
# [137] begin
	push	r29
	push	r28
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
# Var $result located in register r8
# Var bfl located in register r18
# Var bwl located at r28+2, size=OS_16
# Var cntl located in register r18
	movw	r2,r24
# Var fname located in register r2
# [138] uart_puts(WRITE_F); uart_puts(fname); uart_puts(''#13#10);
	lds	r24,(TC_sPsPFF_ARD_ss_WRITE_F)
	lds	r25,(TC_sPsPFF_ARD_ss_WRITE_F+1)
	call	UART_ss_UART_PUTSsPCHAR
# Var fname located in register r2
	movw	r24,r2
	call	UART_ss_UART_PUTSsPCHAR
	ldi	r24,lo8(_sPFF_ARDs_Ld14)
	ldi	r25,hi8(_sPFF_ARDs_Ld14)
	call	UART_ss_UART_PUTSsPCHAR
# [139] if pf_open(fname) <> FR_OK then
	movw	r24,r2
	call	PFF_ss_PF_OPENsPCHARssFRESULT
	cp	r24,r1
	breq	.Lj41
# [141] uart_puts(WRITE_ERR);
	lds	r24,(TC_sPsPFF_ARD_ss_WRITE_ERR)
	lds	r25,(TC_sPsPFF_ARD_ss_WRITE_ERR+1)
	call	UART_ss_UART_PUTSsPCHAR
# [142] Exit(false);
	mov	r8,r1
	rjmp	.Lj38
.Lj41:
# Var bfl located in register r2
# [145] bfl := WRITE_PATTERN;
	lds	r2,(TC_sPsPFF_ARD_ss_WRITE_PATTERN)
	lds	r3,(TC_sPsPFF_ARD_ss_WRITE_PATTERN+1)
# Var cntl located in register r4
# [146] cntl := 0;
	mov	r4,r1
	mov	r5,r1
	mov	r6,r1
	mov	r7,r1
# [147] while pf_write(bfl, StrLen(bfl), bwl) = FR_OK do
	rjmp	.Lj43
.Lj42:
	ldd	r20,Y+2
	ldd	r21,Y+3
# [149] cntl := cntl + bwl;
	add	r4,r20
	adc	r5,r21
	adc	r6,r1
	adc	r7,r1
# [150] if bwl < StrLen(bfl) then
	movw	r24,r2
	call	FPC_PCHAR_LENGTH
	mov	r21,r25
	mov	r19,r1
	sbrc	r25,7
	com	r19
	ldd	r25,Y+2
	ldd	r23,Y+3
	cp	r25,r24
	cpc	r23,r21
	cpc	r1,r19
	cpc	r1,r19
	brge	.Lj43
# [152] pf_write(nil, 0, bwl);
	ldi	r20,lo8(2)
	ldi	r21,hi8(2)
	add	r20,r28
	adc	r21,r29
	mov	r22,r1
	mov	r23,r1
	mov	r24,r1
	mov	r25,r1
	call	PFF_ss_PF_WRITEsPOINTERsNATIVEUINTsNATIVEUINTssFRESULT
# [153] break;
	rjmp	.Lj44
.Lj43:
	movw	r24,r2
	call	FPC_PCHAR_LENGTH
	movw	r22,r24
	ldi	r20,lo8(2)
	ldi	r21,hi8(2)
	add	r20,r28
	adc	r21,r29
	movw	r24,r2
	call	PFF_ss_PF_WRITEsPOINTERsNATIVEUINTsNATIVEUINTssFRESULT
	cp	r24,r1
	brne	.Lj50
# [167] end;
	rjmp	.Lj42
.Lj50:
.Lj44:
# [157] if cntl = fs.fsize then
	lds	r20,(U_sPsPFF_ARD_ss_FS+28)
	lds	r19,(U_sPsPFF_ARD_ss_FS+29)
	lds	r18,(U_sPsPFF_ARD_ss_FS+30)
	lds	r21,(U_sPsPFF_ARD_ss_FS+31)
	cp	r20,r4
	cpc	r19,r5
	cpc	r18,r6
	cpc	r21,r7
	brne	.Lj48
# [159] uart_puts(WRITE_OK);
	lds	r24,(TC_sPsPFF_ARD_ss_WRITE_OK)
	lds	r25,(TC_sPsPFF_ARD_ss_WRITE_OK+1)
	call	UART_ss_UART_PUTSsPCHAR
# [160] Result := true
	ldi	r26,1
	mov	r8,r26
	rjmp	.Lj38
.Lj48:
# [164] uart_puts(WRITE_ERR);
	lds	r24,(TC_sPsPFF_ARD_ss_WRITE_ERR)
	lds	r25,(TC_sPsPFF_ARD_ss_WRITE_ERR+1)
	call	UART_ss_UART_PUTSsPCHAR
# [165] Result := false;
	mov	r8,r1
.Lj38:
	mov	r24,r8
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
	pop	r28
	pop	r29
	ret
.Lc7:
.Le3:
	.size	PsPFF_ARD_ss_T_WRITEsPCHARssBOOLEAN, .Le3 - PsPFF_ARD_ss_T_WRITEsPCHARssBOOLEAN

.section .text.n_main,"ax"
.globl	main
main:
.globl	PASCALMAIN
PASCALMAIN:
.Lc10:
.Lc11:
# [170] begin
	call	FPC_INIT_FUNC_TABLE
# [172] uart_init();
	call	UART_ss_UART_INIT
# [173] uart_puts('<<< PetitFS TEST >>>'#13#10);
	ldi	r18,lo8(_sPFF_ARDs_Ld16)
	ldi	r25,hi8(_sPFF_ARDs_Ld16)
	mov	r24,r18
	call	UART_ss_UART_PUTSsPCHAR
# [175] fr := pf_mount(fs);
	ldi	r24,lo8(U_sPsPFF_ARD_ss_FS)
	ldi	r25,hi8(U_sPsPFF_ARD_ss_FS)
	call	PFF_ss_PF_MOUNTsFATFSssFRESULT
	sts	(U_sPsPFF_ARD_ss_FR),r24
# [176] t_dir('');
	ldi	r24,lo8(_sPFF_ARDs_Ld17)
	ldi	r25,hi8(_sPFF_ARDs_Ld17)
	call	PsPFF_ARD_ss_T_DIRsPCHARssBOOLEAN
# [177] t_dir('RASPI');
	ldi	r24,lo8(_sPFF_ARDs_Ld18)
	ldi	r25,hi8(_sPFF_ARDs_Ld18)
	call	PsPFF_ARD_ss_T_DIRsPCHARssBOOLEAN
# [179] t_cat('00README.TXT');
	mov	r20,r1
	mov	r21,r1
	mov	r22,r1
	mov	r23,r1
	ldi	r24,lo8(_sPFF_ARDs_Ld19)
	ldi	r25,hi8(_sPFF_ARDs_Ld19)
	call	PsPFF_ARD_ss_T_CATsPCHARsLONGWORDssBOOLEAN
# [180] uart_puts(''#13#10);
	ldi	r24,lo8(_sPFF_ARDs_Ld14)
	ldi	r25,hi8(_sPFF_ARDs_Ld14)
	call	UART_ss_UART_PUTSsPCHAR
# [182] t_cat('LICENSE.TXT');
	mov	r20,r1
	mov	r21,r1
	mov	r22,r1
	mov	r23,r1
	ldi	r24,lo8(_sPFF_ARDs_Ld20)
	ldi	r25,hi8(_sPFF_ARDs_Ld20)
	call	PsPFF_ARD_ss_T_CATsPCHARsLONGWORDssBOOLEAN
# [183] uart_puts(''#13#10);
	ldi	r24,lo8(_sPFF_ARDs_Ld14)
	ldi	r25,hi8(_sPFF_ARDs_Ld14)
	call	UART_ss_UART_PUTSsPCHAR
# [185] t_read('RW.TXT');
	ldi	r24,lo8(_sPFF_ARDs_Ld21)
	ldi	r25,hi8(_sPFF_ARDs_Ld21)
	call	PsPFF_ARD_ss_T_READsPCHARssBOOLEAN
# [186] t_read('RW2.TXT');
	ldi	r24,lo8(_sPFF_ARDs_Ld22)
	ldi	r25,hi8(_sPFF_ARDs_Ld22)
	call	PsPFF_ARD_ss_T_READsPCHARssBOOLEAN
# [187] t_read('RW4.TXT');
	ldi	r24,lo8(_sPFF_ARDs_Ld23)
	ldi	r25,hi8(_sPFF_ARDs_Ld23)
	call	PsPFF_ARD_ss_T_READsPCHARssBOOLEAN
# [196] t_write('RW.TXT');
	ldi	r24,lo8(_sPFF_ARDs_Ld21)
	ldi	r25,hi8(_sPFF_ARDs_Ld21)
	call	PsPFF_ARD_ss_T_WRITEsPCHARssBOOLEAN
# [197] t_write('RW2.TXT');
	ldi	r24,lo8(_sPFF_ARDs_Ld22)
	ldi	r25,hi8(_sPFF_ARDs_Ld22)
	call	PsPFF_ARD_ss_T_WRITEsPCHARssBOOLEAN
# [198] t_write('RW4.TXT');
	ldi	r24,lo8(_sPFF_ARDs_Ld23)
	ldi	r25,hi8(_sPFF_ARDs_Ld23)
	call	PsPFF_ARD_ss_T_WRITEsPCHARssBOOLEAN
# [201] uart_puts('<<< FINISH >>>');
	ldi	r24,lo8(_sPFF_ARDs_Ld24)
	ldi	r25,hi8(_sPFF_ARDs_Ld24)
	call	UART_ss_UART_PUTSsPCHAR
# [202] end.
	call	fpc_do_exit
.Lc9:
.Le4:
	.size	main, .Le4 - main

.section .text.n_FPC_INIT_FUNC_TABLE,"ax"
.globl	FPC_INIT_FUNC_TABLE
FPC_INIT_FUNC_TABLE:
# [203] 
	ret

.section .text.n_FPC_FINALIZE_FUNC_TABLE,"ax"
.globl	FPC_FINALIZE_FUNC_TABLE
FPC_FINALIZE_FUNC_TABLE:
	ret
# End asmlist al_procedures
# Begin asmlist al_globals

.section .bss.n_u_spspff_ard_ss_fs,"aw",%nobits
# [30] fs: FATFS;
	.size U_sPsPFF_ARD_ss_FS,44
U_sPsPFF_ARD_ss_FS:
	.zero 44

.section .bss.n_u_spspff_ard_ss_dr,"aw",%nobits
# [31] dr: DIR;
	.size U_sPsPFF_ARD_ss_DR,16
U_sPsPFF_ARD_ss_DR:
	.zero 16

.section .bss.n_u_spspff_ard_ss_fi,"aw",%nobits
# [32] fi: FILINFO;
	.size U_sPsPFF_ARD_ss_FI,24
U_sPsPFF_ARD_ss_FI:
	.zero 24

.section .bss.n_u_spspff_ard_ss_fr,"aw",%nobits
# [33] fr: FRESULT;
	.size U_sPsPFF_ARD_ss_FR,1
U_sPsPFF_ARD_ss_FR:
	.zero 1

.section .data.n_INITFINAL
	.balign 2
.globl	INITFINAL
INITFINAL:
	.byte	0,0
.Le5:
	.size	INITFINAL, .Le5 - INITFINAL

.section .data.n_FPC_THREADVARTABLES
	.balign 2
.globl	FPC_THREADVARTABLES
FPC_THREADVARTABLES:
	.long	0
.Le6:
	.size	FPC_THREADVARTABLES, .Le6 - FPC_THREADVARTABLES

.section .data.n_FPC_RESOURCESTRINGTABLES
	.balign 2
.globl	FPC_RESOURCESTRINGTABLES
FPC_RESOURCESTRINGTABLES:
	.short	0
.Le7:
	.size	FPC_RESOURCESTRINGTABLES, .Le7 - FPC_RESOURCESTRINGTABLES

.section .data.n_FPC_WIDEINITTABLES
	.balign 2
.globl	FPC_WIDEINITTABLES
FPC_WIDEINITTABLES:
	.short	0
.Le8:
	.size	FPC_WIDEINITTABLES, .Le8 - FPC_WIDEINITTABLES

.section .data.n_FPC_RESSTRINITTABLES
	.balign 2
.globl	FPC_RESSTRINITTABLES
FPC_RESSTRINITTABLES:
	.short	0
.Le9:
	.size	FPC_RESSTRINITTABLES, .Le9 - FPC_RESSTRINITTABLES

.section .fpc.n_version,"aw"
__fpc_ident:
	.ascii	"FPC 3.3.1 [2020/01/25] for avr - embedded"
.Le10:
	.size	__fpc_ident, .Le10 - __fpc_ident

.section .data.n___stklen
	.balign 2
.globl	__stklen
__stklen:
	.short	1024
.Le11:
	.size	__stklen, .Le11 - __stklen

.section .data.n___heapsize
	.balign 2
.globl	__heapsize
__heapsize:
	.short	128
.Le12:
	.size	__heapsize, .Le12 - __heapsize

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
.Le13:
	.size	__fpc_valgrind, .Le13 - __fpc_valgrind
# End asmlist al_globals
# Begin asmlist al_const

.section .rodata.n_.Ld1
.Ld1:
# [11] DIR_F: PChar = 'DIR list - ';
	.ascii	"DIR list - \000"
.Le14:
	.size	.Ld1, .Le14 - .Ld1

.section .rodata.n_.Ld2
.Ld2:
# [12] DIR_OK: PChar = 'DIR - OK'#13#10;
	.ascii	"DIR - OK\015\012\000"
.Le15:
	.size	.Ld2, .Le15 - .Ld2

.section .rodata.n_.Ld3
.Ld3:
# [13] DIR_ERR: PChar = 'DIR - ERR'#13#10;
	.ascii	"DIR - ERR\015\012\000"
.Le16:
	.size	.Ld3, .Le16 - .Ld3

.section .rodata.n_.Ld4
.Ld4:
# [15] CAT_F: PChar = 'CAT file - ';
	.ascii	"CAT file - \000"
.Le17:
	.size	.Ld4, .Le17 - .Ld4

.section .rodata.n_.Ld5
.Ld5:
# [16] CAT_OK: PChar = 'CAT - OK'#13#10;
	.ascii	"CAT - OK\015\012\000"
.Le18:
	.size	.Ld5, .Le18 - .Ld5

.section .rodata.n_.Ld6
.Ld6:
# [17] CAT_ERR: PChar = 'CAT - ERR'#13#10;
	.ascii	"CAT - ERR\015\012\000"
.Le19:
	.size	.Ld6, .Le19 - .Ld6

.section .rodata.n_.Ld7
.Ld7:
# [19] READ_F: PChar = 'READ file - ';
	.ascii	"READ file - \000"
.Le20:
	.size	.Ld7, .Le20 - .Ld7

.section .rodata.n_.Ld8
.Ld8:
# [20] READ_OK: PChar = 'READ - OK'#13#10;
	.ascii	"READ - OK\015\012\000"
.Le21:
	.size	.Ld8, .Le21 - .Ld8

.section .rodata.n_.Ld9
.Ld9:
# [21] READ_ERR: PChar = 'READ - ERR'#13#10;
	.ascii	"READ - ERR\015\012\000"
.Le22:
	.size	.Ld9, .Le22 - .Ld9

.section .rodata.n_.Ld10
.Ld10:
# [23] WRITE_F: PChar = 'WRITE file - ';
	.ascii	"WRITE file - \000"
.Le23:
	.size	.Ld10, .Le23 - .Ld10

.section .rodata.n_.Ld11
.Ld11:
# [24] WRITE_OK: PChar = 'WRITE - OK'#13#10;
	.ascii	"WRITE - OK\015\012\000"
.Le24:
	.size	.Ld11, .Le24 - .Ld11

.section .rodata.n_.Ld12
.Ld12:
# [25] WRITE_ERR: PChar = 'WRITE - ERR'#13#10;
	.ascii	"WRITE - ERR\015\012\000"
.Le25:
	.size	.Ld12, .Le25 - .Ld12

.section .rodata.n_.Ld13
.Ld13:
# [27] WRITE_PATTERN: PChar = '_0123456789ABCDEF';
	.ascii	"_0123456789ABCDEF\000"
.Le26:
	.size	.Ld13, .Le26 - .Ld13
# End asmlist al_const
# Begin asmlist al_typedconsts

.section .data.n_TC_sPsPFF_ARD_ss_DIR_F
TC_sPsPFF_ARD_ss_DIR_F:
	.short	.Ld1
.Le27:
	.size	TC_sPsPFF_ARD_ss_DIR_F, .Le27 - TC_sPsPFF_ARD_ss_DIR_F

.section .data.n_TC_sPsPFF_ARD_ss_DIR_OK
TC_sPsPFF_ARD_ss_DIR_OK:
	.short	.Ld2
.Le28:
	.size	TC_sPsPFF_ARD_ss_DIR_OK, .Le28 - TC_sPsPFF_ARD_ss_DIR_OK

.section .data.n_TC_sPsPFF_ARD_ss_DIR_ERR
TC_sPsPFF_ARD_ss_DIR_ERR:
	.short	.Ld3
.Le29:
	.size	TC_sPsPFF_ARD_ss_DIR_ERR, .Le29 - TC_sPsPFF_ARD_ss_DIR_ERR

.section .data.n_TC_sPsPFF_ARD_ss_CAT_F
TC_sPsPFF_ARD_ss_CAT_F:
	.short	.Ld4
.Le30:
	.size	TC_sPsPFF_ARD_ss_CAT_F, .Le30 - TC_sPsPFF_ARD_ss_CAT_F

.section .data.n_TC_sPsPFF_ARD_ss_CAT_OK
TC_sPsPFF_ARD_ss_CAT_OK:
	.short	.Ld5
.Le31:
	.size	TC_sPsPFF_ARD_ss_CAT_OK, .Le31 - TC_sPsPFF_ARD_ss_CAT_OK

.section .data.n_TC_sPsPFF_ARD_ss_CAT_ERR
TC_sPsPFF_ARD_ss_CAT_ERR:
	.short	.Ld6
.Le32:
	.size	TC_sPsPFF_ARD_ss_CAT_ERR, .Le32 - TC_sPsPFF_ARD_ss_CAT_ERR

.section .data.n_TC_sPsPFF_ARD_ss_READ_F
TC_sPsPFF_ARD_ss_READ_F:
	.short	.Ld7
.Le33:
	.size	TC_sPsPFF_ARD_ss_READ_F, .Le33 - TC_sPsPFF_ARD_ss_READ_F

.section .data.n_TC_sPsPFF_ARD_ss_READ_OK
TC_sPsPFF_ARD_ss_READ_OK:
	.short	.Ld8
.Le34:
	.size	TC_sPsPFF_ARD_ss_READ_OK, .Le34 - TC_sPsPFF_ARD_ss_READ_OK

.section .data.n_TC_sPsPFF_ARD_ss_READ_ERR
TC_sPsPFF_ARD_ss_READ_ERR:
	.short	.Ld9
.Le35:
	.size	TC_sPsPFF_ARD_ss_READ_ERR, .Le35 - TC_sPsPFF_ARD_ss_READ_ERR

.section .data.n_TC_sPsPFF_ARD_ss_WRITE_F
TC_sPsPFF_ARD_ss_WRITE_F:
	.short	.Ld10
.Le36:
	.size	TC_sPsPFF_ARD_ss_WRITE_F, .Le36 - TC_sPsPFF_ARD_ss_WRITE_F

.section .data.n_TC_sPsPFF_ARD_ss_WRITE_OK
TC_sPsPFF_ARD_ss_WRITE_OK:
	.short	.Ld11
.Le37:
	.size	TC_sPsPFF_ARD_ss_WRITE_OK, .Le37 - TC_sPsPFF_ARD_ss_WRITE_OK

.section .data.n_TC_sPsPFF_ARD_ss_WRITE_ERR
TC_sPsPFF_ARD_ss_WRITE_ERR:
	.short	.Ld12
.Le38:
	.size	TC_sPsPFF_ARD_ss_WRITE_ERR, .Le38 - TC_sPsPFF_ARD_ss_WRITE_ERR

.section .data.n_TC_sPsPFF_ARD_ss_WRITE_PATTERN
TC_sPsPFF_ARD_ss_WRITE_PATTERN:
	.short	.Ld13
# [29] var
.Le39:
	.size	TC_sPsPFF_ARD_ss_WRITE_PATTERN, .Le39 - TC_sPsPFF_ARD_ss_WRITE_PATTERN

.section .rodata.n__sPFF_ARDs_Ld14
.globl	_sPFF_ARDs_Ld14
_sPFF_ARDs_Ld14:
	.ascii	"\015\012\000"
.Le40:
	.size	_sPFF_ARDs_Ld14, .Le40 - _sPFF_ARDs_Ld14

.section .rodata.n__sPFF_ARDs_Ld15
.globl	_sPFF_ARDs_Ld15
_sPFF_ARDs_Ld15:
	.ascii	"> \000"
.Le41:
	.size	_sPFF_ARDs_Ld15, .Le41 - _sPFF_ARDs_Ld15

.section .rodata.n__sPFF_ARDs_Ld16
.globl	_sPFF_ARDs_Ld16
_sPFF_ARDs_Ld16:
	.ascii	"<<< PetitFS TEST >>>\015\012\000"
.Le42:
	.size	_sPFF_ARDs_Ld16, .Le42 - _sPFF_ARDs_Ld16

.section .rodata.n__sPFF_ARDs_Ld17
.globl	_sPFF_ARDs_Ld17
_sPFF_ARDs_Ld17:
	.ascii	"\000"
.Le43:
	.size	_sPFF_ARDs_Ld17, .Le43 - _sPFF_ARDs_Ld17

.section .rodata.n__sPFF_ARDs_Ld18
.globl	_sPFF_ARDs_Ld18
_sPFF_ARDs_Ld18:
	.ascii	"RASPI\000"
.Le44:
	.size	_sPFF_ARDs_Ld18, .Le44 - _sPFF_ARDs_Ld18

.section .rodata.n__sPFF_ARDs_Ld19
.globl	_sPFF_ARDs_Ld19
_sPFF_ARDs_Ld19:
	.ascii	"00README.TXT\000"
.Le45:
	.size	_sPFF_ARDs_Ld19, .Le45 - _sPFF_ARDs_Ld19

.section .rodata.n__sPFF_ARDs_Ld20
.globl	_sPFF_ARDs_Ld20
_sPFF_ARDs_Ld20:
	.ascii	"LICENSE.TXT\000"
.Le46:
	.size	_sPFF_ARDs_Ld20, .Le46 - _sPFF_ARDs_Ld20

.section .rodata.n__sPFF_ARDs_Ld21
.globl	_sPFF_ARDs_Ld21
_sPFF_ARDs_Ld21:
	.ascii	"RW.TXT\000"
.Le47:
	.size	_sPFF_ARDs_Ld21, .Le47 - _sPFF_ARDs_Ld21

.section .rodata.n__sPFF_ARDs_Ld22
.globl	_sPFF_ARDs_Ld22
_sPFF_ARDs_Ld22:
	.ascii	"RW2.TXT\000"
.Le48:
	.size	_sPFF_ARDs_Ld22, .Le48 - _sPFF_ARDs_Ld22

.section .rodata.n__sPFF_ARDs_Ld23
.globl	_sPFF_ARDs_Ld23
_sPFF_ARDs_Ld23:
	.ascii	"RW4.TXT\000"
.Le49:
	.size	_sPFF_ARDs_Ld23, .Le49 - _sPFF_ARDs_Ld23

.section .rodata.n__sPFF_ARDs_Ld24
.globl	_sPFF_ARDs_Ld24
_sPFF_ARDs_Ld24:
	.ascii	"<<< FINISH >>>\000"
.Le50:
	.size	_sPFF_ARDs_Ld24, .Le50 - _sPFF_ARDs_Ld24
# End asmlist al_typedconsts
# Begin asmlist al_dwarf_frame

.section .debug_frame
.Lc12:
	.long	.Lc14-.Lc13
.Lc13:
	.long	-1
	.byte	1
	.byte	0
	.uleb128	1
	.sleb128	-4
	.byte	24
	.byte	12
	.uleb128	32
	.uleb128	2
	.byte	5
	.uleb128	36
	.uleb128	0
	.balign 4,0
.Lc14:
	.long	.Lc16-.Lc15
.Lc15:
	.short	.Lc12
	.short	.Lc2
	.short	.Lc1-.Lc2
	.balign 4,0
.Lc16:
	.long	.Lc19-.Lc18
.Lc18:
	.short	.Lc12
	.short	.Lc4
	.short	.Lc3-.Lc4
	.balign 4,0
.Lc19:
	.long	.Lc22-.Lc21
.Lc21:
	.short	.Lc12
	.short	.Lc6
	.short	.Lc5-.Lc6
	.balign 4,0
.Lc22:
	.long	.Lc25-.Lc24
.Lc24:
	.short	.Lc12
	.short	.Lc8
	.short	.Lc7-.Lc8
	.balign 4,0
.Lc25:
	.long	.Lc28-.Lc27
.Lc27:
	.short	.Lc12
	.short	.Lc10
	.short	.Lc9-.Lc10
	.byte	4
	.long	.Lc11-.Lc10
	.byte	7
	.uleb128	24
	.balign 4,0
.Lc28:
# End asmlist al_dwarf_frame

