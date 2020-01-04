	.file "pff.pas"
# Begin asmlist al_procedures

.section .text.n_pff_ss_isdbcs1ssmallintssboolean,"ax"
PFF_ss_ISDBCS1sSMALLINTssBOOLEAN:
.Lc2:
# Var $result located in register r18
# Var c located in register r24
# [pff.pas]
# [621] begin
# Var $result located in register r24
# [622] Result := False;
	mov	r24,r1
# [623] end;
	ret
.Lc1:
.Le0:
	.size	PFF_ss_ISDBCS1sSMALLINTssBOOLEAN, .Le0 - PFF_ss_ISDBCS1sSMALLINTssBOOLEAN

.section .text.n_pff_ss_isdbcs2ssmallintssboolean,"ax"
PFF_ss_ISDBCS2sSMALLINTssBOOLEAN:
.Lc4:
# Var $result located in register r18
# Var c located in register r24
# [626] begin
# Var $result located in register r24
# [627] Result := False;
	mov	r24,r1
# [628] end;
	ret
.Lc3:
.Le1:
	.size	PFF_ss_ISDBCS2sSMALLINTssBOOLEAN, .Le1 - PFF_ss_ISDBCS2sSMALLINTssBOOLEAN

.section .text.n_pff_ss_isupperscharssboolean,"ax"
PFF_ss_ISUPPERsCHARssBOOLEAN:
.Lc6:
# Var $result located in register r18
# Var c located in register r24
# [632] begin
# [633] Result := (c >= 'A') and (c <= 'Z');
	subi	r24,65
	ldi	r18,25
	cp	r18,r24
# Var $result located in register r24
	ldi	r24,1
	brsh	.Lj9
	mov	r24,r1
.Lj9:
# [634] end;
	ret
.Lc5:
.Le2:
	.size	PFF_ss_ISUPPERsCHARssBOOLEAN, .Le2 - PFF_ss_ISUPPERsCHARssBOOLEAN

.section .text.n_pff_ss_islowerscharssboolean,"ax"
PFF_ss_ISLOWERsCHARssBOOLEAN:
.Lc8:
# Var $result located in register r18
# Var c located in register r24
# [637] begin
# [638] Result := (c >= 'a') and (c <= 'z');
	subi	r24,97
	ldi	r18,25
	cp	r18,r24
# Var $result located in register r24
	ldi	r24,1
	brsh	.Lj12
	mov	r24,r1
.Lj12:
# [639] end;
	ret
.Lc7:
.Le3:
	.size	PFF_ss_ISLOWERsCHARssBOOLEAN, .Le3 - PFF_ss_ISLOWERsCHARssBOOLEAN

.section .text.n_pff_ss_ld_wordspbytessword,"ax"
PFF_ss_LD_WORDsPBYTEssWORD:
.Lc10:
# Var $result located in register r18
# Var ptr located in register r24
# [643] begin
# Var ptr located in register r24
# Var $result located in register r24
# [646] Result := PWord(ptr)^;
	movw	r30,r24
	ld	r24,Z
	ldd	r25,Z+1
# [651] end;
	ret
.Lc9:
.Le4:
	.size	PFF_ss_LD_WORDsPBYTEssWORD, .Le4 - PFF_ss_LD_WORDsPBYTEssWORD

.section .text.n_pff_ss_ld_dwordspbytesslongword,"ax"
PFF_ss_LD_DWORDsPBYTEssLONGWORD:
.Lc12:
# Var $result located in register r18
# Var ptr located in register r24
# [655] begin
# Var ptr located in register r24
# Var $result located in register r22
# [658] Result := PDWord(ptr)^;
	movw	r30,r24
	ld	r22,Z
	ldd	r23,Z+1
	ldd	r24,Z+2
	ldd	r25,Z+3
# [665] end;
	ret
.Lc11:
.Le5:
	.size	PFF_ss_LD_DWORDsPBYTEssLONGWORD, .Le5 - PFF_ss_LD_DWORDsPBYTEssLONGWORD

.section .text.n_pff_ss_mem_setspointerssmallintssmallint,"ax"
PFF_ss_MEM_SETsPOINTERsSMALLINTsSMALLINT:
.Lc14:
# Var d located in register r18
# Var dst located in register r24
# Var val located in register r22
# Var cnt located in register r20
# [672] begin
# Var d located in register r24
# Var dst located in register r24
# [674] while cnt > 0 do
	rjmp	.Lj20
.Lj19:
# [676] d^ := char(val);
	movw	r30,r24
	st	Z,r22
# [677] Inc(d);
	ldi	r18,1
	add	r24,r18
	adc	r25,r1
# [678] Dec(cnt);
	subi	r20,1
	sbc	r21,r1
.Lj20:
	cp	r1,r20
	cpc	r1,r21
	brlt	.Lj19
# [680] end;
	ret
.Lc13:
.Le6:
	.size	PFF_ss_MEM_SETsPOINTERsSMALLINTsSMALLINT, .Le6 - PFF_ss_MEM_SETsPOINTERsSMALLINTsSMALLINT

.section .text.n_pff_ss_mem_cmpspointerspointerssmallintsssmallint,"ax"
PFF_ss_MEM_CMPsPOINTERsPOINTERsSMALLINTssSMALLINT:
.Lc16:
# [687] begin
	push	r5
	push	r4
	push	r3
	push	r2
# Var $result located in register r18
# Var d located in register r18
# Var s located in register r18
# Var r located in register r18
	movw	r2,r24
# Var dst located in register r2
# Var src located in register r22
# Var cnt located in register r20
# Var d located in register r2
# Var dst located in register r2
# Var s located in register r22
# Var src located in register r22
# Var r located in register r24
# [690] r := 0;
	mov	r24,r1
	mov	r25,r1
# [691] while (cnt > 0) and (r = 0) do
	rjmp	.Lj25
.Lj24:
# [693] r := Ord(d^) - Ord(s^);
	movw	r30,r2
	ld	r4,Z
	mov	r18,r1
	movw	r30,r22
	ld	r5,Z
	sub	r4,r5
	sbc	r18,r1
	mov	r24,r4
	mov	r25,r18
# [694] Inc(d); Inc(s);
	ldi	r18,1
	add	r2,r18
	adc	r3,r1
	ldi	r18,1
	add	r22,r18
	adc	r23,r1
# [695] Dec(cnt);
	subi	r20,1
	sbc	r21,r1
.Lj25:
	cp	r1,r20
	cpc	r1,r21
	brge	.Lj28
	cp	r24,r1
	cpc	r25,r1
	breq	.Lj24
.Lj28:
# Var $result located in register r24
# Var r located in register r24
# [698] end;
	pop	r2
	pop	r3
	pop	r4
	pop	r5
	ret
.Lc15:
.Le7:
	.size	PFF_ss_MEM_CMPsPOINTERsPOINTERsSMALLINTssSMALLINT, .Le7 - PFF_ss_MEM_CMPsPOINTERsPOINTERsSMALLINTssSMALLINT

.section .text.n_pff_ss_get_fatslongwordsslongword,"ax"
PFF_ss_GET_FATsLONGWORDssLONGWORD:
.Lc18:
# [712] begin
	push	r29
	push	r28
	push	r17
	push	r16
	push	r15
	push	r14
	push	r13
	push	r12
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
# Var $result located in register r5
# Var buf located at r28+2, size=OS_32
# Var fs located in register r18
	movw	r16,r22
	movw	r18,r24
# Var clst located in register r16
# Var fs located in register r20
# [713] fs := iFatFs;
	lds	r20,(U_sPFF_ss_IFATFS)
	lds	r21,(U_sPFF_ss_IFATFS+1)
# [715] if (clst < 2) or (clst >= fs.n_fatent) then
	cpi	r16,2
	cpc	r17,r1
	cpc	r18,r1
	cpc	r19,r1
	brlo	.Lj32
	movw	r30,r20
	ldd	r22,Z+8
	ldd	r23,Z+9
	ldd	r24,Z+10
	ldd	r25,Z+11
	cp	r16,r22
	cpc	r17,r23
	cpc	r18,r24
	cpc	r19,r25
	brlo	.Lj34
.Lj32:
# [716] Exit(1);
	ldi	r26,1
	mov	r5,r26
	mov	r4,r1
	mov	r2,r1
	mov	r3,r1
	rjmp	.Lj30
.Lj34:
# [718] Result := 1;
	ldi	r26,1
	mov	r5,r26
	mov	r4,r1
	mov	r2,r1
	mov	r3,r1
# [720] case fs.fs_type of
	movw	r30,r20
	ld	r22,Z
	cpi	r22,3
	breq	.Lj40
# [766] end;
	rjmp	.Lj30
.Lj40:
# [760] if disk_readp(@buf, fs.fatbase + clst div 128, (UINT(clst) mod 128) * 4, 4) =
	mov	r7,r16
	mov	r24,r17
	mov	r25,r18
	mov	r6,r19
	ldi	r22,7
.Lj37:
	lsr	r6
	ror	r25
	ror	r24
	ror	r7
	dec	r22
	brne	.Lj37
	movw	r30,r20
	ldd	r20,Z+12
	ldd	r21,Z+13
	ldd	r22,Z+14
	ldd	r23,Z+15
	add	r20,r7
	adc	r21,r24
	adc	r22,r25
	adc	r23,r6
	andi	r16,127
	mov	r17,r1
	mov	r18,r1
	mov	r19,r1
	lsl	r16
	rol	r17
	rol	r18
	rol	r19
	lsl	r16
	rol	r17
	rol	r18
	rol	r19
	ldi	r24,lo8(2)
	ldi	r25,hi8(2)
	add	r24,r28
	adc	r25,r29
	ldi	r26,4
	mov	r12,r26
	mov	r13,r1
	mov	r14,r1
	mov	r15,r1
	call	DISK_IO_ss_DISK_READPsPOINTERsLONGWORDsLONGWORDsLONGWORDssDRESULT
	cp	r24,r1
	brne	.Lj30
# [762] Result := ld_dword(buf) and $0FFFFFFF;
	ldi	r24,lo8(2)
	ldi	r25,hi8(2)
	add	r24,r28
	adc	r25,r29
	call	PFF_ss_LD_DWORDsPBYTEssLONGWORD
	andi	r25,15
	mov	r5,r22
	mov	r4,r23
	movw	r2,r24
.Lj30:
	mov	r22,r5
	mov	r23,r4
	movw	r24,r2
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
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	r16
	pop	r17
	pop	r28
	pop	r29
	ret
.Lc17:
.Le8:
	.size	PFF_ss_GET_FATsLONGWORDssLONGWORD, .Le8 - PFF_ss_GET_FATsLONGWORDssLONGWORD

.section .text.n_pff_ss_clust2sectslongwordsslongword,"ax"
PFF_ss_CLUST2SECTsLONGWORDssLONGWORD:
.Lc20:
# [775] begin
	push	r16
	push	r15
	push	r14
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
# Var $result located in register r2
# Var fs located in register r18
# Var clst located in register r22
# Var fs located in register r7
# [776] fs := iFatFs;
	lds	r7,(U_sPFF_ss_IFATFS)
	lds	r6,(U_sPFF_ss_IFATFS+1)
# [777] clst := clst - 2;
	subi	r22,2
	sbc	r23,r1
	sbc	r24,r1
	sbc	r25,r1
# [778] if clst >= (fs.n_fatent - 2) then
	mov	r30,r7
	mov	r31,r6
	ldd	r8,Z+8
	ldd	r9,Z+9
	ldd	r10,Z+10
	ldd	r11,Z+11
	mov	r21,r1
	mov	r2,r1
	mov	r4,r1
	mov	r18,r1
	ldi	r26,2
	sub	r8,r26
	sbc	r9,r1
	sbc	r10,r1
	sbc	r11,r1
	sbc	r21,r1
	sbc	r2,r1
	sbc	r4,r1
	sbc	r18,r1
	cp	r22,r8
	cpc	r23,r9
	cpc	r24,r10
	cpc	r25,r11
	cpc	r1,r21
	cpc	r1,r2
	cpc	r1,r4
	cpc	r1,r18
	brlt	.Lj44
# [780] Result := 0
	mov	r2,r1
	mov	r3,r1
	mov	r4,r1
	mov	r5,r1
	rjmp	.Lj45
.Lj44:
# [782] Result := DWORD(clst * fs.csize + fs.database);
	mov	r30,r7
	mov	r31,r6
	ldd	r18,Z+2
	mov	r19,r1
	mov	r20,r1
	mov	r21,r1
	call	fpc_mul_dword
	mov	r30,r7
	mov	r31,r6
	ldd	r18,Z+20
	ldd	r19,Z+21
	ldd	r20,Z+22
	ldd	r21,Z+23
	add	r18,r22
	adc	r19,r23
	adc	r20,r24
	adc	r21,r25
	movw	r2,r18
	movw	r4,r20
.Lj45:
# [783] end;
	movw	r22,r2
	movw	r24,r4
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
	pop	r14
	pop	r15
	pop	r16
	ret
.Lc19:
.Le9:
	.size	PFF_ss_CLUST2SECTsLONGWORDssLONGWORD, .Le9 - PFF_ss_CLUST2SECTsLONGWORDssLONGWORD

.section .text.n_pff_ss_get_clustspbytesslongword,"ax"
PFF_ss_GET_CLUSTsPBYTEssLONGWORD:
.Lc22:
# [793] begin
	push	r7
	push	r6
	push	r5
	push	r4
	push	r3
	push	r2
# Var $result located in register r18
# Var fs located in register r18
# Var clst located in register r18
	movw	r2,r24
# Var dir located in register r2
# Var fs located in register r18
# [794] fs := iFatFs;
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r18,(U_sPFF_ss_IFATFS+1)
# Var clst located in register r18
# [798] clst := ld_word(dir + DIR_FstClusHI);
	movw	r24,r2
	ldi	r18,20
	add	r24,r18
	adc	r25,r1
	call	PFF_ss_LD_WORDsPBYTEssWORD
	movw	r4,r24
# Var clst located in register r4
# [799] clst := clst shl 16;
	mov	r6,r1
	mov	r7,r1
# Var clst located in register r6
# [802] Result := clst or ld_word(dir + DIR_FstClusLO);
	movw	r24,r2
	ldi	r18,26
	add	r24,r18
	adc	r25,r1
	call	PFF_ss_LD_WORDsPBYTEssWORD
	movw	r20,r24
	movw	r22,r6
	movw	r24,r4
	or	r22,r20
	or	r23,r21
	or	r24,r1
	or	r25,r1
# Var $result located in register r22
# [803] end;
	pop	r2
	pop	r3
	pop	r4
	pop	r5
	pop	r6
	pop	r7
	ret
.Lc21:
.Le10:
	.size	PFF_ss_GET_CLUSTsPBYTEssLONGWORD, .Le10 - PFF_ss_GET_CLUSTsPBYTEssLONGWORD

.section .text.n_pff_ss_dir_rewindsdirssfresult,"ax"
PFF_ss_DIR_REWINDsDIRssFRESULT:
.Lc24:
# [813] begin
	push	r5
	push	r4
	push	r3
	push	r2
# Var $result located in register r4
# Var clst located in register r18
# Var fs located in register r18
	movw	r2,r24
# Var dj located in register r2
# Var fs located in register r20
# [814] fs := iFatFs;
	lds	r20,(U_sPFF_ss_IFATFS)
	lds	r21,(U_sPFF_ss_IFATFS+1)
# [815] dj.index := 0;
	movw	r30,r2
	st	Z,r1
	std	Z+1,r1
# Var clst located in register r22
# [816] clst := dj.sclust;
	movw	r30,r2
	ldd	r22,Z+4
	ldd	r23,Z+5
	ldd	r24,Z+6
	ldd	r25,Z+7
# [818] if (clst = 1) or (clst >= fs.n_fatent) then
	cpi	r22,1
	cpc	r23,r1
	cpc	r24,r1
	cpc	r25,r1
	breq	.Lj50
	movw	r30,r20
	ldd	r5,Z+8
	ldd	r18,Z+9
	ldd	r19,Z+10
	ldd	r4,Z+11
	cp	r22,r5
	cpc	r23,r18
	cpc	r24,r19
	cpc	r25,r4
	brlo	.Lj52
.Lj50:
# [819] Exit(FR_DISK_ERR);
	ldi	r26,1
	mov	r4,r26
	rjmp	.Lj48
.Lj52:
# [821] if PF_FS_FAT32 and (clst = 0) and (_FS_32ONLY or
	cp	r22,r1
	cpc	r23,r1
	cpc	r24,r1
	cpc	r25,r1
	brne	.Lj54
# [824] clst := CLUST(fs.dirbase);
	movw	r30,r20
	ldd	r22,Z+16
	ldd	r23,Z+17
	ldd	r24,Z+18
	ldd	r25,Z+19
.Lj54:
# Var clst located in register r22
# [827] dj.clust := clst;
	movw	r30,r2
	std	Z+8,r22
	std	Z+9,r23
	std	Z+10,r24
	std	Z+11,r25
# Var clst located in register r22
# [830] dj.sect := clust2sect(clst)
	call	PFF_ss_CLUST2SECTsLONGWORDssLONGWORD
# [829] if _FS_32ONLY or (clst <> 0) then
	movw	r30,r2
	std	Z+12,r22
	std	Z+13,r23
	std	Z+14,r24
	std	Z+15,r25
# [834] Result := FR_OK;
	mov	r4,r1
.Lj48:
# [835] end;
	mov	r24,r4
	pop	r2
	pop	r3
	pop	r4
	pop	r5
	ret
.Lc23:
.Le11:
	.size	PFF_ss_DIR_REWINDsDIRssFRESULT, .Le11 - PFF_ss_DIR_REWINDsDIRssFRESULT

.section .text.n_pff_ss_dir_nextsdirssfresult,"ax"
PFF_ss_DIR_NEXTsDIRssFRESULT:
.Lc26:
# [847] begin
	push	r8
	push	r7
	push	r6
	push	r5
	push	r4
	push	r3
	push	r2
# Var $result located in register r8
# Var clst located in register r22
# Var i located in register r18
# Var fs located in register r18
	mov	r7,r24
	mov	r2,r25
# Var dj located in register r7
# Var fs located in register r3
# [848] fs := iFatFs;
	lds	r3,(U_sPFF_ss_IFATFS)
	lds	r4,(U_sPFF_ss_IFATFS+1)
# [849] i := dj.index + 1;
	mov	r30,r7
	mov	r31,r2
	ld	r6,Z
	ldd	r5,Z+1
	mov	r18,r1
	mov	r19,r1
	ldi	r20,1
	add	r6,r20
	adc	r5,r1
	adc	r18,r1
	adc	r19,r1
# Var i located in register r6
# [850] if (i = 0) or (dj.sect = 0) then
	cp	r6,r1
	cpc	r5,r1
	breq	.Lj57
	mov	r30,r7
	mov	r31,r2
	ldd	r19,Z+12
	ldd	r20,Z+13
	ldd	r21,Z+14
	ldd	r18,Z+15
	cp	r19,r1
	cpc	r20,r1
	cpc	r21,r1
	cpc	r18,r1
	brne	.Lj59
.Lj57:
# [852] Exit(FR_NO_FILE);
	ldi	r26,3
	mov	r8,r26
	rjmp	.Lj55
.Lj59:
# [854] if (i mod 16) = 0 then
	mov	r18,r6
	mov	r19,r5
	andi	r18,15
	cp	r18,r1
	cpc	r1,r1
	breq	.Lj74
# [882] end;
	rjmp	.Lj61
.Lj74:
# [857] Inc(dj.sect);
	mov	r30,r7
	mov	r31,r2
	ldd	r20,Z+12
	ldd	r21,Z+13
	ldd	r22,Z+14
	ldd	r19,Z+15
	ldi	r18,1
	add	r20,r18
	adc	r21,r1
	adc	r22,r1
	adc	r19,r1
	mov	r30,r7
	mov	r31,r2
	std	Z+12,r20
	std	Z+13,r21
	std	Z+14,r22
	std	Z+15,r19
# [859] if dj.clust = 0 then
	mov	r30,r7
	mov	r31,r2
	ldd	r19,Z+8
	ldd	r20,Z+9
	ldd	r21,Z+10
	ldd	r18,Z+11
	cp	r19,r1
	cpc	r20,r1
	cpc	r21,r1
	cpc	r18,r1
	breq	.Lj75
	rjmp	.Lj61
.Lj75:
# [860] if i >= fs.n_rootdir then
	mov	r30,r3
	mov	r31,r4
	ldd	r19,Z+4
	ldd	r18,Z+5
	cp	r6,r19
	cpc	r5,r18
	brlo	.Lj65
# [863] else
	ldi	r26,3
	mov	r8,r26
# [862] Exit(FR_NO_FILE)
	rjmp	.Lj55
.Lj65:
# [865] if ((i div 16) and (fs.csize - 1)) = 0 then
	mov	r30,r3
	mov	r31,r4
	ldd	r19,Z+2
	mov	r18,r1
	subi	r19,1
	sbc	r18,r1
	mov	r20,r6
	mov	r21,r5
	ldi	r22,4
.Lj67:
	lsr	r21
	ror	r20
	dec	r22
	brne	.Lj67
	and	r20,r19
	and	r21,r18
	cp	r20,r1
	cpc	r21,r1
	breq	.Lj76
	rjmp	.Lj61
.Lj76:
# [869] clst := get_fat(dj.clust);
	mov	r30,r7
	mov	r31,r2
	ldd	r22,Z+8
	mov	r30,r7
	mov	r31,r2
	ldd	r23,Z+9
	mov	r30,r7
	mov	r31,r2
	ldd	r24,Z+10
	mov	r30,r7
	mov	r31,r2
	ldd	r25,Z+11
	call	PFF_ss_GET_FATsLONGWORDssLONGWORD
# [870] if clst <= 1 then
	ldi	r21,1
	cp	r21,r22
	cpc	r1,r23
	cpc	r1,r24
	cpc	r1,r25
	brlo	.Lj71
# [871] Exit(FR_DISK_ERR);
	ldi	r26,1
	mov	r8,r26
	rjmp	.Lj55
.Lj71:
# [872] if clst >= fs.n_fatent then
	mov	r30,r3
	mov	r31,r4
	ldd	r21,Z+8
	ldd	r18,Z+9
	ldd	r19,Z+10
	ldd	r20,Z+11
	cp	r22,r21
	cpc	r23,r18
	cpc	r24,r19
	cpc	r25,r20
	brlo	.Lj73
# [874] Exit(FR_NO_FILE);
	ldi	r26,3
	mov	r8,r26
	rjmp	.Lj55
.Lj73:
# [876] dj.clust := clst;
	mov	r30,r7
	mov	r31,r2
	std	Z+8,r22
	std	Z+9,r23
	std	Z+10,r24
	std	Z+11,r25
# [877] dj.sect := clust2sect(clst);
	call	PFF_ss_CLUST2SECTsLONGWORDssLONGWORD
	mov	r30,r7
	mov	r31,r2
	std	Z+12,r22
	std	Z+13,r23
	std	Z+14,r24
	std	Z+15,r25
.Lj61:
# Var i located in register r6
# [880] dj.index := i;
	mov	r30,r7
	mov	r31,r2
	st	Z,r6
	std	Z+1,r5
# [881] Result := FR_OK;
	mov	r8,r1
.Lj55:
	mov	r24,r8
	pop	r2
	pop	r3
	pop	r4
	pop	r5
	pop	r6
	pop	r7
	pop	r8
	ret
.Lc25:
.Le12:
	.size	PFF_ss_DIR_NEXTsDIRssFRESULT, .Le12 - PFF_ss_DIR_NEXTsDIRssFRESULT

.section .text.n_pff_ss_dir_findsdirspbytessfresult,"ax"
PFF_ss_DIR_FINDsDIRsPBYTEssFRESULT:
.Lc28:
# [893] begin
	push	r17
	push	r16
	push	r15
	push	r14
	push	r13
	push	r12
	push	r8
	push	r7
	push	r6
	push	r5
	push	r4
	push	r3
	push	r2
# Var $result located in register r3
# Var res located in register r18
# Var c located in register r4
	mov	r6,r24
	mov	r5,r25
# Var dj located in register r6
	mov	r8,r22
	mov	r7,r23
# Var dir located in register r8
# [895] res := dir_rewind(dj);
	mov	r24,r6
	mov	r25,r5
	call	PFF_ss_DIR_REWINDsDIRssFRESULT
# Var res located in register r2
	mov	r2,r24
# [896] if res <> FR_OK then
	cp	r2,r1
	breq	.Lj81
# [897] Exit(res);
	mov	r3,r2
	rjmp	.Lj77
.Lj81:
# [902] if disk_readp(dir, dj.sect, (dj.index mod 16) * 32, 32) <> RES_OK then
	mov	r30,r6
	mov	r31,r5
	ld	r19,Z
	ldd	r20,Z+1
	andi	r19,15
	mov	r20,r1
	mov	r18,r1
	mov	r21,r1
	ldi	r22,5
.Lj84:
	lsl	r19
	rol	r20
	rol	r18
	rol	r21
	dec	r22
	brne	.Lj84
	mov	r16,r19
	mov	r17,r20
	mov	r19,r21
	mov	r30,r6
	mov	r31,r5
	ldd	r20,Z+12
	mov	r30,r6
	mov	r31,r5
	ldd	r21,Z+13
	mov	r30,r6
	mov	r31,r5
	ldd	r22,Z+14
	mov	r30,r6
	mov	r31,r5
	ldd	r23,Z+15
	ldi	r26,32
	mov	r12,r26
	mov	r13,r1
	mov	r14,r1
	mov	r15,r1
	mov	r24,r8
	mov	r25,r7
	call	DISK_IO_ss_DISK_READPsPOINTERsLONGWORDsLONGWORDsLONGWORDssDRESULT
	cp	r24,r1
	breq	.Lj86
# [903] Exit(FRESULT.FR_DISK_ERR);
	ldi	r26,1
	mov	r3,r26
	rjmp	.Lj77
.Lj86:
# [905] c := dir[DIR_Name];
	mov	r30,r8
	mov	r31,r7
	ld	r4,Z
# [906] if c = 0 then
	cp	r4,r1
	brne	.Lj88
# [909] res := FR_NO_FILE;
	ldi	r26,3
	mov	r2,r26
# [910] break;
	rjmp	.Lj83
.Lj88:
# [914] if ((dir[DIR_Attr] and AM_VOL) = 0)
	mov	r30,r8
	mov	r31,r7
	ldd	r18,Z+11
	andi	r18,8
	brne	.Lj90
# [915] and (mem_cmp(dir, dj.fn, 11) = 0) then
	mov	r30,r6
	mov	r31,r5
	ldd	r22,Z+2
	mov	r30,r6
	mov	r31,r5
	ldd	r23,Z+3
	ldi	r20,11
	mov	r21,r1
	mov	r24,r8
	mov	r25,r7
	call	PFF_ss_MEM_CMPsPOINTERsPOINTERsSMALLINTssSMALLINT
	cp	r24,r1
	cpc	r25,r1
	breq	.Lj83
.Lj90:
# [918] res := dir_next(dj);
	mov	r24,r6
	mov	r25,r5
	call	PFF_ss_DIR_NEXTsDIRssFRESULT
	mov	r2,r24
# [920] until res <> FR_OK;
	cp	r2,r1
	brne	.Lj92
# [923] end;
	rjmp	.Lj81
.Lj92:
.Lj83:
# Var res located in register r18
# [922] Result := res;
	mov	r3,r2
.Lj77:
	mov	r24,r3
	pop	r2
	pop	r3
	pop	r4
	pop	r5
	pop	r6
	pop	r7
	pop	r8
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	r16
	pop	r17
	ret
.Lc27:
.Le13:
	.size	PFF_ss_DIR_FINDsDIRsPBYTEssFRESULT, .Le13 - PFF_ss_DIR_FINDsDIRsPBYTEssFRESULT

.section .text.n_pff_ss_dir_readsdirspbytessfresult,"ax"
PFF_ss_DIR_READsDIRsPBYTEssFRESULT:
.Lc30:
# [936] begin
	push	r17
	push	r16
	push	r15
	push	r14
	push	r13
	push	r12
	push	r8
	push	r7
	push	r6
	push	r5
	push	r4
	push	r3
	push	r2
# Var $result located in register r18
# Var res located in register r18
# Var a located in register r4
# Var c located in register r3
	mov	r7,r24
	mov	r6,r25
# Var dj located in register r7
	mov	r5,r22
	mov	r2,r23
# Var dir located in register r5
# Var res located in register r8
# [937] res := FR_NO_FILE;
	ldi	r26,3
	mov	r8,r26
# [938] while dj.sect <> 0 do
	rjmp	.Lj96
.Lj95:
# [941] if disk_readp(dir, dj.sect, (dj.index mod 16) * 32, 32) <> DRESULT.RES_OK then
	mov	r30,r7
	mov	r31,r6
	ld	r21,Z
	ldd	r18,Z+1
	andi	r21,15
	mov	r18,r1
	mov	r19,r1
	mov	r20,r1
	ldi	r22,5
.Lj98:
	lsl	r21
	rol	r18
	rol	r19
	rol	r20
	dec	r22
	brne	.Lj98
	mov	r16,r21
	mov	r17,r18
	mov	r18,r19
	mov	r19,r20
	mov	r30,r7
	mov	r31,r6
	ldd	r20,Z+12
	mov	r30,r7
	mov	r31,r6
	ldd	r21,Z+13
	mov	r30,r7
	mov	r31,r6
	ldd	r22,Z+14
	mov	r30,r7
	mov	r31,r6
	ldd	r23,Z+15
	ldi	r26,32
	mov	r12,r26
	mov	r13,r1
	mov	r14,r1
	mov	r15,r1
	mov	r24,r5
	mov	r25,r2
	call	DISK_IO_ss_DISK_READPsPOINTERsLONGWORDsLONGWORDsLONGWORDssDRESULT
	cp	r24,r1
	breq	.Lj100
# [943] res := FR_DISK_ERR;
	ldi	r26,1
	mov	r8,r26
# [944] break;
	rjmp	.Lj97
.Lj100:
# [947] res := FR_OK;
	mov	r8,r1
# [949] c := dir[DIR_Name];
	mov	r30,r5
	mov	r31,r2
	ld	r3,Z
# [950] if c = 0 then
	cp	r3,r1
	brne	.Lj103
# [953] res := FR_NO_FILE;
	ldi	r26,3
	mov	r8,r26
# [954] break;
	rjmp	.Lj97
.Lj103:
# [956] a := dir[DIR_Attr] and AM_MASK;
	mov	r30,r5
	mov	r31,r2
	ldd	r18,Z+11
	andi	r18,63
	mov	r4,r18
# [959] if (c <> $E5) and (c <> Ord('.'))
	ldi	r26,-27
	cp	r3,r26
	breq	.Lj105
	ldi	r26,46
	cp	r3,r26
	breq	.Lj105
# [960] and ((a and AM_VOL) = 0) then
	mov	r18,r4
	andi	r18,8
	breq	.Lj97
.Lj105:
# [963] res := dir_next(dj);
	mov	r24,r7
	mov	r25,r6
	call	PFF_ss_DIR_NEXTsDIRssFRESULT
	mov	r8,r24
# [964] if res <> FR_OK then
	cp	r8,r1
	brne	.Lj97
.Lj96:
	mov	r30,r7
	mov	r31,r6
	ldd	r18,Z+12
	ldd	r19,Z+13
	ldd	r20,Z+14
	ldd	r21,Z+15
	cp	r18,r1
	cpc	r19,r1
	cpc	r20,r1
	cpc	r21,r1
	breq	.Lj112
# [971] end;
	rjmp	.Lj95
.Lj112:
.Lj97:
# [968] if res <> FR_OK then
	cp	r8,r1
	breq	.Lj111
# [969] dj.sect := 0;
	mov	r30,r7
	mov	r31,r6
	std	Z+12,r1
	std	Z+13,r1
	std	Z+14,r1
	std	Z+15,r1
.Lj111:
# Var $result located in register r24
# [970] Result := res;
	mov	r24,r8
# Var res located in register r24
	pop	r2
	pop	r3
	pop	r4
	pop	r5
	pop	r6
	pop	r7
	pop	r8
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	r16
	pop	r17
	ret
.Lc29:
.Le14:
	.size	PFF_ss_DIR_READsDIRsPBYTEssFRESULT, .Le14 - PFF_ss_DIR_READsDIRsPBYTEssFRESULT

.section .text.n_pff_ss_create_namesdirspcharssfresult,"ax"
PFF_ss_CREATE_NAMEsDIRsPCHARssFRESULT:
.Lc32:
# [991] begin
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
# Var $result located in register r18
# Var p located in register r18
# Var c located in register r9
# Var d located in register r10
# Var ni located in register r18
# Var si located in register r18
# Var i located in register r18
# Var sfn located in register r18
# Var dj located in register r24
	mov	r12,r22
	mov	r11,r23
# Var path located in register r12
# Var sfn located in register r18
# [993] sfn := dj.fn;
	movw	r30,r24
	ldd	r18,Z+2
	ldd	r19,Z+3
# [994] mem_set(sfn, Ord(' '), 11);
	ldi	r20,11
	mov	r21,r1
	ldi	r22,32
	mov	r23,r1
	movw	r2,r18
# Var sfn located in register r2
	movw	r24,r2
	call	PFF_ss_MEM_SETsPOINTERsSMALLINTsSMALLINT
# Var si located in register r4
# [995] si := 0;
	mov	r4,r1
# Var i located in register r5
# [996] i := 0;
	mov	r5,r1
# Var ni located in register r6
# [997] ni := 8;
	ldi	r26,8
	mov	r6,r26
# Var p located in register r7
# [998] p := PByte(path);
	mov	r30,r12
	mov	r31,r11
	ld	r7,Z
	ldd	r8,Z+1
.Lj115:
# [1001] c := p[si];
	mov	r30,r7
	mov	r31,r8
	add	r30,r4
	adc	r31,r1
	ld	r9,Z
# [1002] Inc(si);
	inc	r4
# [1003] if (c <= Ord(' ')) or (c = Ord('/')) then
	ldi	r18,32
	cp	r18,r9
	brlo	.Lj135
# [1047] end;
	rjmp	.Lj117
.Lj135:
	ldi	r26,47
	cp	r9,r26
	brne	.Lj136
	rjmp	.Lj117
.Lj136:
# [1007] if (c = Ord('.')) or (i >= ni) then
	ldi	r26,46
	cp	r9,r26
	breq	.Lj121
	cp	r5,r6
	brlo	.Lj123
.Lj121:
# [1009] if (ni <> 8) or (c <> Ord('.')) then
	ldi	r26,8
	cp	r6,r26
	breq	.Lj137
	rjmp	.Lj117
.Lj137:
	ldi	r26,46
	cp	r9,r26
	breq	.Lj138
	rjmp	.Lj117
.Lj138:
# [1011] i := 8;
	ldi	r26,8
	mov	r5,r26
# [1012] ni := 11;
	ldi	r26,11
	mov	r6,r26
# [1013] continue;
	rjmp	.Lj115
.Lj123:
# [1022] if IsDBCS1(c) and (i < ni - 1) then
	mov	r24,r9
	mov	r25,r1
	call	PFF_ss_ISDBCS1sSMALLINTssBOOLEAN
	cp	r24,r1
	breq	.Lj132
	mov	r20,r6
	mov	r18,r1
	subi	r20,1
	sbc	r18,r1
	cp	r5,r20
	cpc	r1,r18
	brge	.Lj132
# [1025] d := p[si];
	mov	r30,r7
	mov	r31,r8
	add	r30,r4
	adc	r31,r1
	ld	r10,Z
# [1026] Inc(si);
	inc	r4
# [1027] sfn[i] := c;
	movw	r30,r2
	add	r30,r5
	adc	r31,r1
	st	Z,r9
# [1028] Inc(i);
	inc	r5
# [1029] sfn[i] := d;
	movw	r30,r2
	add	r30,r5
	adc	r31,r1
	st	Z,r10
# [1030] Inc(i);
	inc	r5
	rjmp	.Lj115
.Lj132:
# [1038] sfn[i] := c;
	movw	r30,r2
	add	r30,r5
	adc	r31,r1
	st	Z,r9
# [1039] Inc(i);
	inc	r5
# [999] while True do
	rjmp	.Lj115
.Lj117:
# [1043] path := @p[si];
	mov	r21,r7
	mov	r18,r8
	add	r21,r4
	adc	r18,r1
	mov	r30,r12
	mov	r31,r11
	st	Z,r21
	std	Z+1,r18
# [1045] sfn[11] := Byte(c <= Ord(' '));
	ldi	r18,32
	cp	r18,r9
	ldi	r18,1
	brsh	.Lj134
	mov	r18,r1
.Lj134:
	movw	r30,r2
	std	Z+11,r18
# Var $result located in register r24
# [1046] Result := FR_OK;
	mov	r24,r1
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
	ret
.Lc31:
.Le15:
	.size	PFF_ss_CREATE_NAMEsDIRsPCHARssFRESULT, .Le15 - PFF_ss_CREATE_NAMEsDIRsPCHARssFRESULT

.section .text.n_pff_ss_get_fileinfosdirspbytesfilinfo,"ax"
PFF_ss_GET_FILEINFOsDIRsPBYTEsFILINFO:
.Lc34:
# [1060] begin
	push	r7
	push	r6
	push	r5
	push	r4
	push	r3
	push	r2
# Var i located in register r19
# Var c located in register r21
# Var p located in register r18
# Var dj located in register r24
	movw	r4,r22
# Var dir located in register r4
	mov	r7,r20
	mov	r6,r21
# Var fno located in register r7
# [1061] p := fno.fname;
	ldi	r18,lo8(9)
	ldi	r19,hi8(9)
	add	r18,r7
	adc	r19,r6
# Var p located in register r2
	movw	r2,r18
# [1062] if dj.sect <> 0 then
	movw	r30,r24
	ldd	r18,Z+12
	ldd	r19,Z+13
	ldd	r20,Z+14
	ldd	r21,Z+15
	cp	r18,r1
	cpc	r19,r1
	cpc	r20,r1
	cpc	r21,r1
	brne	.Lj157
# [1099] end;
	rjmp	.Lj142
.Lj157:
# [1065] for i := 0 to Pred(8) do
	ldi	r19,-1
.Lj143:
	inc	r19
# [1067] c := dir[i];
	movw	r30,r4
	add	r30,r19
	adc	r31,r1
	ld	r21,Z
# [1068] if c = Ord(' ') then
	cpi	r21,32
	breq	.Lj145
# [1070] if c = $05 then
	cpi	r21,5
	brne	.Lj149
# [1071] c := $E5;
	ldi	r21,-27
.Lj149:
# [1072] p^ := char(c);
	movw	r30,r2
	st	Z,r21
# [1073] Inc(p);
	ldi	r18,1
	add	r2,r18
	adc	r3,r1
	cpi	r19,7
	brlo	.Lj143
.Lj145:
# [1075] if dir[8] <> Ord(' ') then
	movw	r30,r4
	ldd	r18,Z+8
	cpi	r18,32
	breq	.Lj151
# [1078] p^ := '.';
	ldi	r18,46
	movw	r30,r2
	st	Z,r18
# [1079] Inc(p);
	ldi	r18,1
	add	r2,r18
	adc	r3,r1
# [1080] for i := 8 to Pred(11) do
	ldi	r19,7
.Lj152:
	inc	r19
# [1082] c := dir[i];
	movw	r30,r4
	add	r30,r19
	adc	r31,r1
	ld	r21,Z
# [1083] if c = Ord(' ') then
	cpi	r21,32
	breq	.Lj151
# [1085] p^ := char(c);
	movw	r30,r2
	st	Z,r21
# [1086] Inc(p);
	ldi	r18,1
	add	r2,r18
	adc	r3,r1
	cpi	r19,10
	brlo	.Lj152
.Lj151:
# [1090] fno.fattrib := dir[DIR_Attr];
	movw	r30,r4
	adiw	r30,11
	ldi	r18,lo8(8)
	ldi	r19,hi8(8)
	add	r18,r7
	adc	r19,r6
	movw	r26,r18
	ld	r0,Z
	st	X,r0
# [1092] fno.fsize := ld_dword(dir + DIR_FileSize);
	movw	r24,r4
	ldi	r18,28
	add	r24,r18
	adc	r25,r1
	call	PFF_ss_LD_DWORDsPBYTEssLONGWORD
	mov	r30,r7
	mov	r31,r6
	st	Z,r22
	std	Z+1,r23
	std	Z+2,r24
	std	Z+3,r25
# [1094] fno.fdate := ld_word(dir + DIR_WrtDate);
	movw	r24,r4
	ldi	r18,24
	add	r24,r18
	adc	r25,r1
	call	PFF_ss_LD_WORDsPBYTEssWORD
	mov	r30,r7
	mov	r31,r6
	std	Z+4,r24
	std	Z+5,r25
# [1096] fno.ftime := ld_word(dir + DIR_WrtTime);
	movw	r24,r4
	ldi	r18,22
	add	r24,r18
	adc	r25,r1
	call	PFF_ss_LD_WORDsPBYTEssWORD
	mov	r30,r7
	mov	r31,r6
	std	Z+6,r24
	std	Z+7,r25
.Lj142:
# Var p located in register r2
# [1098] p^ := char(0);
	movw	r30,r2
	st	Z,r1
	pop	r2
	pop	r3
	pop	r4
	pop	r5
	pop	r6
	pop	r7
	ret
.Lc33:
.Le16:
	.size	PFF_ss_GET_FILEINFOsDIRsPBYTEsFILINFO, .Le16 - PFF_ss_GET_FILEINFOsDIRsPBYTEsFILINFO

.section .text.n_pff_ss_follow_pathsdirspbytespcharssfresult,"ax"
PFF_ss_FOLLOW_PATHsDIRsPBYTEsPCHARssFRESULT:
.Lc36:
# [1111] begin
	push	r29
	push	r28
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
# Var path located at r28+2, size=OS_16
# Var $result located in register r18
# Var res located in register r6
	movw	r2,r24
# Var dj located in register r2
	movw	r4,r22
# Var dir located in register r4
	std	Y+2,r20
	std	Y+3,r21
# [1113] while path^ = ' ' do
	rjmp	.Lj161
.Lj160:
# [1114] Inc(path);
	ldd	r19,Y+2
	ldd	r20,Y+3
	ldi	r18,1
	add	r19,r18
	adc	r20,r1
	std	Y+2,r19
	std	Y+3,r20
.Lj161:
	ldd	r18,Y+2
	ldd	r19,Y+3
	movw	r30,r18
	ld	r18,Z
	cpi	r18,32
	breq	.Lj160
# [1116] if path^ = '/' then
	ldd	r18,Y+2
	ldd	r19,Y+3
	movw	r30,r18
	ld	r18,Z
	cpi	r18,47
	brne	.Lj164
# [1117] Inc(path);
	ldd	r19,Y+2
	ldd	r20,Y+3
	ldi	r18,1
	add	r19,r18
	adc	r20,r1
	std	Y+2,r19
	std	Y+3,r20
.Lj164:
# [1119] dj.sclust := 0;
	movw	r30,r2
	std	Z+4,r1
	std	Z+5,r1
	std	Z+6,r1
	std	Z+7,r1
# [1121] if path^ < ' ' then
	ldd	r18,Y+2
	ldd	r19,Y+3
	movw	r30,r18
	ld	r18,Z
	cpi	r18,32
	brsh	.Lj168
# [1124] res := dir_rewind(dj);
	movw	r24,r2
	call	PFF_ss_DIR_REWINDsDIRssFRESULT
	mov	r6,r24
# [1125] dir[0] := 0;
	movw	r30,r4
	st	Z,r1
	rjmp	.Lj167
.Lj168:
# [1133] res := create_name(dj, path);
	ldi	r22,lo8(2)
	ldi	r23,hi8(2)
	add	r22,r28
	adc	r23,r29
	movw	r24,r2
	call	PFF_ss_CREATE_NAMEsDIRsPCHARssFRESULT
	mov	r6,r24
# [1134] if res <> FR_OK then
	cp	r6,r1
	breq	.Lj179
# [1156] end;
	rjmp	.Lj167
.Lj179:
# [1137] res := dir_find(dj, dir);
	movw	r24,r2
	movw	r22,r4
	call	PFF_ss_DIR_FINDsDIRsPBYTEssFRESULT
	mov	r6,r24
# [1138] if res <> FR_OK then
	cp	r6,r1
	brne	.Lj167
# [1141] if dj.fn[11] <> 0 then
	movw	r30,r2
	ldd	r18,Z+2
	ldd	r19,Z+3
	movw	r30,r18
	ldd	r18,Z+11
	cp	r18,r1
	brne	.Lj167
# [1144] if (dir[DIR_Attr] = 0) and (AM_DIR <> 0) then
	movw	r30,r4
	ldd	r18,Z+11
	cp	r18,r1
	brne	.Lj178
# [1147] res := FR_NO_FILE;
	ldi	r26,3
	mov	r6,r26
# [1148] break;
	rjmp	.Lj167
.Lj178:
# [1151] dj.sclust := get_clust(dir);
	movw	r24,r4
	call	PFF_ss_GET_CLUSTsPBYTEssLONGWORD
	movw	r30,r2
	std	Z+4,r22
	std	Z+5,r23
	std	Z+6,r24
	std	Z+7,r25
# [1130] while True do
	rjmp	.Lj168
.Lj167:
# Var $result located in register r24
# [1155] Result := res;
	mov	r24,r6
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
	pop	r28
	pop	r29
	ret
.Lc35:
.Le17:
	.size	PFF_ss_FOLLOW_PATHsDIRsPBYTEsPCHARssFRESULT, .Le17 - PFF_ss_FOLLOW_PATHsDIRsPBYTEsPCHARssFRESULT

.section .text.n_pff_ss_check_fsspbyteslongwordssbyte,"ax"
PFF_ss_CHECK_FSsPBYTEsLONGWORDssBYTE:
.Lc38:
# [1167] begin
	push	r17
	push	r16
	push	r15
	push	r14
	push	r13
	push	r12
	push	r8
	push	r7
	push	r6
	push	r5
	push	r4
	push	r3
	push	r2
# Var $result located in register r4
	mov	r8,r24
	mov	r7,r25
# Var buf located in register r8
	movw	r2,r20
	mov	r5,r22
	mov	r6,r23
# Var sect located in register r2
# [1169] if disk_readp(buf, sect, 510, 2) <> RES_OK then
	ldi	r26,2
	mov	r12,r26
	mov	r13,r1
	mov	r14,r1
	mov	r15,r1
	ldi	r16,-2
	ldi	r17,1
	mov	r18,r1
	mov	r19,r1
	movw	r20,r2
	mov	r22,r5
	mov	r23,r6
	mov	r24,r8
	mov	r25,r7
	call	DISK_IO_ss_DISK_READPsPOINTERsLONGWORDsLONGWORDsLONGWORDssDRESULT
	cp	r24,r1
	breq	.Lj183
# [1170] Exit(3);
	ldi	r26,3
	mov	r4,r26
	rjmp	.Lj180
.Lj183:
# [1173] if (buf[0] <> $55) or (buf[1] <> $AA) then
	mov	r30,r8
	mov	r31,r7
	ld	r18,Z
	cpi	r18,85
	brne	.Lj184
	mov	r30,r8
	mov	r31,r7
	ldd	r18,Z+1
	cpi	r18,-86
	breq	.Lj188
.Lj184:
# [1174] Exit(2);
	ldi	r26,2
	mov	r4,r26
	rjmp	.Lj180
.Lj188:
# [1181] if PF_FS_FAT32 and (disk_readp(buf, sect, BS_FilSysType32, 2) = RES_OK) then
	ldi	r26,2
	mov	r12,r26
	mov	r13,r1
	mov	r14,r1
	mov	r15,r1
	ldi	r16,82
	mov	r17,r1
	mov	r18,r1
	mov	r19,r1
	movw	r20,r2
	mov	r22,r5
	mov	r23,r6
	mov	r24,r8
	mov	r25,r7
	call	DISK_IO_ss_DISK_READPsPOINTERsLONGWORDsLONGWORDsLONGWORDssDRESULT
	cp	r24,r1
	brne	.Lj194
# [1183] if (buf[0] = $46) and (buf[1] = $41) then
	mov	r30,r8
	mov	r31,r7
	ld	r18,Z
	cpi	r18,70
	brne	.Lj194
	mov	r30,r8
	mov	r31,r7
	ldd	r18,Z+1
	cpi	r18,65
	brne	.Lj194
# [1184] Exit(0);
	mov	r4,r1
	rjmp	.Lj180
.Lj194:
# [1186] Result := 1;
	ldi	r26,1
	mov	r4,r26
.Lj180:
# [1187] end;
	mov	r24,r4
	pop	r2
	pop	r3
	pop	r4
	pop	r5
	pop	r6
	pop	r7
	pop	r8
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	pop	r16
	pop	r17
	ret
.Lc37:
.Le18:
	.size	PFF_ss_CHECK_FSsPBYTEsLONGWORDssBYTE, .Le18 - PFF_ss_CHECK_FSsPBYTEsLONGWORDssBYTE

.section .text.n_pff_ss_pf_mountsfatfsssfresult,"ax"
.globl	PFF_ss_PF_MOUNTsFATFSssFRESULT
PFF_ss_PF_MOUNTsFATFSssFRESULT:
.Lc40:
# Temps allocated between r28+38 and r28+41
# [1194] begin
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
	subi	r28,41
	sbci	r29,0
	in	r0,63
	cli
	out	62,r29
	out	63,r0
	out	61,r28
# Var $result located in register r18
# Var fmt located in register r18
# Var buf located at r28+2, size=OS_NO
# Var bsect located in register r18
# Var fsize located in register r18
# Var tsect located in register r18
# Var mclst located in register r18
	std	Y+38,r24
	std	Y+39,r25
# Var fs located in register r18
# [1195] iFatFs := nil;
	sts	(U_sPFF_ss_IFATFS),r1
	sts	(U_sPFF_ss_IFATFS+1),r1
# [1197] if (disk_initialize() and STA_NOINIT) <> 0 then
	call	DISK_IO_ss_DISK_INITIALIZEssBYTE
	andi	r24,1
	breq	.Lj202
# [1198] Exit(FR_NOT_READY);
	ldi	r26,2
	std	Y+40,r26
	rjmp	.Lj199
.Lj202:
# Var bsect located in register r18
# [1203] fmt := check_fs(@buf, bsect);
	ldi	r24,lo8(2)
	ldi	r25,hi8(2)
	add	r24,r28
	adc	r25,r29
	mov	r9,r1
	mov	r8,r1
	mov	r7,r1
	mov	r6,r1
# Var bsect located in register r9
	mov	r20,r9
	mov	r21,r8
	mov	r22,r7
	mov	r23,r6
	call	PFF_ss_CHECK_FSsPBYTEsLONGWORDssBYTE
# Var fmt located in register r2
	mov	r2,r24
# [1204] if fmt = 1 then
	ldi	r26,1
	cp	r2,r26
	breq	.Lj226
# [1280] end;
	rjmp	.Lj204
.Lj226:
# [1208] if disk_readp(@buf, bsect, MBR_Table, 16) <> RES_OK then
	ldi	r24,lo8(2)
	ldi	r25,hi8(2)
	add	r24,r28
	adc	r25,r29
	ldi	r26,16
	mov	r12,r26
	mov	r13,r1
	mov	r14,r1
	mov	r15,r1
	ldi	r16,-66
	ldi	r17,1
	mov	r18,r1
	mov	r19,r1
	mov	r20,r9
	mov	r21,r8
	mov	r22,r7
	mov	r23,r6
	call	DISK_IO_ss_DISK_READPsPOINTERsLONGWORDsLONGWORDsLONGWORDssDRESULT
	cp	r24,r1
	breq	.Lj206
# [1210] fmt := 3
	ldi	r26,3
	mov	r2,r26
	rjmp	.Lj204
.Lj206:
# [1213] if buf[4] <> 0 then
	ldd	r18,Y+6
	cp	r18,r1
	breq	.Lj204
# [1216] bsect := ld_dword(@buf[8]);
	ldi	r24,lo8(10)
	ldi	r25,hi8(10)
	add	r24,r28
	adc	r25,r29
	call	PFF_ss_LD_DWORDsPBYTEssLONGWORD
	mov	r9,r22
	mov	r8,r23
	mov	r7,r24
	mov	r6,r25
# [1218] fmt := check_fs(@buf, bsect);
	ldi	r24,lo8(2)
	ldi	r25,hi8(2)
	add	r24,r28
	adc	r25,r29
	mov	r20,r9
	mov	r21,r8
	mov	r22,r7
	mov	r23,r6
	call	PFF_ss_CHECK_FSsPBYTEsLONGWORDssBYTE
	mov	r2,r24
.Lj204:
# [1221] if fmt = 3 then
	ldi	r26,3
	cp	r2,r26
	brne	.Lj211
# [1222] Exit(FR_DISK_ERR);
	ldi	r26,1
	std	Y+40,r26
	rjmp	.Lj199
.Lj211:
# [1223] if fmt <> 0 then
	cp	r2,r1
	breq	.Lj213
# [1225] Exit(FR_NO_FILESYSTEM);
	ldi	r26,6
	std	Y+40,r26
	rjmp	.Lj199
.Lj213:
# [1228] if disk_readp(@buf, bsect, 13, sizeof(buf)) <> RES_OK then
	ldi	r24,lo8(2)
	ldi	r25,hi8(2)
	add	r24,r28
	adc	r25,r29
	ldi	r26,36
	mov	r12,r26
	mov	r13,r1
	mov	r14,r1
	mov	r15,r1
	ldi	r16,13
	mov	r17,r1
	mov	r18,r1
	mov	r19,r1
	mov	r20,r9
	mov	r21,r8
	mov	r22,r7
	mov	r23,r6
	call	DISK_IO_ss_DISK_READPsPOINTERsLONGWORDsLONGWORDsLONGWORDssDRESULT
	cp	r24,r1
	breq	.Lj215
# [1229] Exit(FR_DISK_ERR);
	ldi	r26,1
	std	Y+40,r26
	rjmp	.Lj199
.Lj215:
# [1232] fsize := ld_word(PByte(@buf) + (BPB_FATSz16 - 13));
	ldi	r24,lo8(2)
	ldi	r25,hi8(2)
	add	r24,r28
	adc	r25,r29
	ldi	r18,9
	add	r24,r18
	adc	r25,r1
	call	PFF_ss_LD_WORDsPBYTEssWORD
# Var fsize located in register r5
	mov	r5,r24
	mov	r4,r25
	mov	r3,r1
	mov	r2,r1
# [1233] if fsize = 0 then
	cp	r5,r1
	cpc	r4,r1
	cpc	r3,r1
	cpc	r2,r1
	brne	.Lj217
# [1234] fsize := ld_dword(PByte(@buf) + (BPB_FATSz32 - 13));
	ldi	r24,lo8(2)
	ldi	r25,hi8(2)
	add	r24,r28
	adc	r25,r29
	ldi	r18,23
	add	r24,r18
	adc	r25,r1
	call	PFF_ss_LD_DWORDsPBYTEssLONGWORD
	mov	r5,r22
	mov	r4,r23
	mov	r3,r24
	mov	r2,r25
.Lj217:
# [1237] fsize := fsize * (buf[BPB_NumFATs - 13]);
	ldd	r18,Y+5
	mov	r19,r1
	mov	r20,r1
	mov	r21,r1
	mov	r22,r5
	mov	r23,r4
	mov	r24,r3
	mov	r25,r2
# Var fsize located in register r22
	call	fpc_mul_dword
# Var fsize located in register r14
	mov	r14,r22
	mov	r12,r23
	mov	r11,r24
	mov	r10,r25
# [1239] fs.fatbase := bsect + ld_word(PByte(@buf) + (BPB_RsvdSecCnt - 13));
	ldi	r24,lo8(2)
	ldi	r25,hi8(2)
	add	r24,r28
	adc	r25,r29
	ldi	r18,1
	add	r24,r18
	adc	r25,r1
	call	PFF_ss_LD_WORDsPBYTEssWORD
	mov	r23,r9
	mov	r22,r8
	mov	r21,r7
	mov	r19,r6
	add	r23,r24
	adc	r22,r25
	adc	r21,r1
	adc	r19,r1
	ldd	r18,Y+38
	mov	r30,r18
	ldd	r18,Y+39
	mov	r31,r18
	std	Z+12,r23
	std	Z+13,r22
	std	Z+14,r21
	std	Z+15,r19
# [1241] fs.csize := buf[BPB_SecPerClus - 13];
	ldd	r18,Y+38
	mov	r30,r18
	ldd	r18,Y+39
	mov	r31,r18
	adiw	r30,2
	ldd	r0,Y+2
	st	Z,r0
# [1243] fs.n_rootdir := ld_word(PByte(@buf) + (BPB_RootEntCnt - 13));
	ldi	r24,lo8(2)
	ldi	r25,hi8(2)
	add	r24,r28
	adc	r25,r29
	ldi	r18,4
	add	r24,r18
	adc	r25,r1
	call	PFF_ss_LD_WORDsPBYTEssWORD
	ldd	r18,Y+38
	mov	r30,r18
	ldd	r18,Y+39
	mov	r31,r18
	std	Z+4,r24
	std	Z+5,r25
# [1245] tsect := ld_word(PByte(@buf) + (BPB_TotSec16 - 13));
	ldi	r24,lo8(2)
	ldi	r25,hi8(2)
	add	r24,r28
	adc	r25,r29
	ldi	r18,6
	add	r24,r18
	adc	r25,r1
	call	PFF_ss_LD_WORDsPBYTEssWORD
# Var tsect located in register r5
	mov	r5,r24
	mov	r4,r25
	mov	r3,r1
	mov	r2,r1
# [1247] if tsect = 0 then
	cp	r5,r1
	cpc	r4,r1
	cpc	r3,r1
	cpc	r2,r1
	brne	.Lj219
# [1248] tsect := ld_dword(PByte(@buf) + (BPB_TotSec32 - 13));
	ldi	r24,lo8(2)
	ldi	r25,hi8(2)
	add	r24,r28
	adc	r25,r29
	ldi	r18,19
	add	r24,r18
	adc	r25,r1
	call	PFF_ss_LD_DWORDsPBYTEssLONGWORD
	mov	r5,r22
	mov	r4,r23
	mov	r3,r24
	mov	r2,r25
.Lj219:
# [1251] mclst := (tsect - ld_word(PByte(@buf) + (BPB_RsvdSecCnt - 13)) - fsize -
	ldi	r24,lo8(2)
	ldi	r25,hi8(2)
	add	r24,r28
	adc	r25,r29
	ldi	r18,1
	add	r24,r18
	adc	r25,r1
	call	PFF_ss_LD_WORDsPBYTEssWORD
	mov	r18,r5
	mov	r19,r4
	mov	r20,r3
	mov	r21,r2
	sub	r18,r24
	sbc	r19,r25
	sbc	r20,r1
	sbc	r21,r1
	sub	r18,r14
	sbc	r19,r12
	sbc	r20,r11
	sbc	r21,r10
# [1252] fs.n_rootdir div 16) div fs.csize + 2;
	ldd	r22,Y+38
	mov	r30,r22
	ldd	r22,Y+39
	mov	r31,r22
	ldd	r24,Z+4
	ldd	r25,Z+5
	ldi	r22,4
.Lj220:
	lsr	r25
	ror	r24
	dec	r22
	brne	.Lj220
	sub	r18,r24
	sbc	r19,r25
	sbc	r20,r1
	sbc	r21,r1
	ldd	r22,Y+38
	mov	r30,r22
	ldd	r22,Y+39
	mov	r31,r22
	ldd	r22,Z+2
	mov	r23,r1
	mov	r24,r1
	mov	r25,r1
	call	fpc_div_dword
	ldi	r18,2
	add	r22,r18
	adc	r23,r1
	adc	r24,r1
	adc	r25,r1
# Var mclst located in register r22
# Var mclst located in register r22
# [1253] fs.n_fatent := CLUST(mclst);
	ldd	r18,Y+38
	mov	r30,r18
	ldd	r18,Y+39
	mov	r31,r18
	std	Z+8,r22
	std	Z+9,r23
	std	Z+10,r24
	std	Z+11,r25
# Var fmt located in register r18
# [1255] fmt := 0;
	mov	r18,r1
# [1262] if PF_FS_FAT32 and (mclst >= $FFF7) then
	cpi	r22,-9
	ldi	r19,-1
	cpc	r23,r19
	cpc	r24,r1
	cpc	r25,r1
	brlo	.Lj222
# [1263] fmt := FS_FAT32;
	ldi	r18,3
.Lj222:
# [1264] if fmt = 0 then
	cp	r18,r1
	brne	.Lj224
# [1265] Exit(FR_NO_FILESYSTEM);
	ldi	r26,6
	std	Y+40,r26
	rjmp	.Lj199
.Lj224:
# Var fmt located in register r18
# [1267] fs.fs_type := fmt;
	ldd	r19,Y+38
	mov	r30,r19
	ldd	r19,Y+39
	mov	r31,r19
	st	Z,r18
# [1270] fs.dirbase := ld_dword(PByte(@buf) + (BPB_RootClus - 13))
	ldi	r24,lo8(2)
	ldi	r25,hi8(2)
	add	r24,r28
	adc	r25,r29
	ldi	r18,31
	add	r24,r18
	adc	r25,r1
	call	PFF_ss_LD_DWORDsPBYTEssLONGWORD
# [1268] if _FS_32ONLY or (PF_FS_FAT32 and (fmt = FS_FAT32)) then
	ldd	r18,Y+38
	mov	r30,r18
	ldd	r18,Y+39
	mov	r31,r18
	std	Z+16,r22
	std	Z+17,r23
	std	Z+18,r24
	std	Z+19,r25
# [1275] fs.database := fs.fatbase + fsize + fs.n_rootdir div 16;
	ldd	r18,Y+38
	mov	r30,r18
	ldd	r18,Y+39
	mov	r31,r18
	ldd	r19,Z+4
	ldd	r5,Z+5
	ldi	r18,4
.Lj225:
	lsr	r5
	ror	r19
	dec	r18
	brne	.Lj225
	ldd	r18,Y+38
	mov	r30,r18
	ldd	r18,Y+39
	mov	r31,r18
	ldd	r22,Z+12
	ldd	r20,Z+13
	ldd	r21,Z+14
	ldd	r18,Z+15
	mov	r4,r14
	mov	r2,r12
	mov	r3,r11
	mov	r25,r10
	add	r4,r22
	adc	r2,r20
	adc	r3,r21
	adc	r25,r18
	add	r4,r19
	adc	r2,r5
	adc	r3,r1
	adc	r25,r1
	ldd	r18,Y+38
	mov	r30,r18
	ldd	r18,Y+39
	mov	r31,r18
	std	Z+20,r4
	std	Z+21,r2
	std	Z+22,r3
	std	Z+23,r25
# [1277] fs.flag := 0;
	ldd	r18,Y+38
	mov	r30,r18
	ldd	r18,Y+39
	mov	r31,r18
	std	Z+1,r1
# [1278] iFatFs := @fs;
	ldd	r18,Y+38
	sts	(U_sPFF_ss_IFATFS),r18
	ldd	r18,Y+39
	sts	(U_sPFF_ss_IFATFS+1),r18
# [1279] Result := FR_OK;
	std	Y+40,r1
.Lj199:
	ldd	r18,Y+40
	mov	r24,r18
	subi	r28,-41
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
.Lc39:
.Le19:
	.size	PFF_ss_PF_MOUNTsFATFSssFRESULT, .Le19 - PFF_ss_PF_MOUNTsFATFSssFRESULT

.section .text.n_pff_ss_pf_openspcharssfresult,"ax"
.globl	PFF_ss_PF_OPENsPCHARssFRESULT
PFF_ss_PF_OPENsPCHARssFRESULT:
.Lc42:
# [1289] begin
	push	r29
	push	r28
	push	r4
	push	r3
	push	r2
	in	r28,61
	in	r29,62
	subi	r28,62
	sbci	r29,0
	in	r0,63
	cli
	out	62,r29
	out	63,r0
	out	61,r28
# Var $result located in register r4
# Var res located in register r18
# Var dj located at r28+2, size=OS_NO
# Var sp located at r28+18, size=OS_NO
# Var dir located at r28+30, size=OS_NO
# Var fs located in register r18
	movw	r20,r24
# Var path located in register r20
# Var fs located in register r2
# [586] {$define CHECK_FS_ENABLED := begin fs := iFatFs; if fs = nil then Exit(FR_NOT_ENABLED); end}
	lds	r2,(U_sPFF_ss_IFATFS)
	lds	r3,(U_sPFF_ss_IFATFS+1)
	cp	r2,r1
	cpc	r3,r1
	brne	.Lj230
	ldi	r26,5
	mov	r4,r26
	rjmp	.Lj227
.Lj230:
# Var fs located in register r2
# [1293] fs.flag := 0;
	movw	r30,r2
	std	Z+1,r1
# [1294] dj.fn := sp;
	ldi	r18,lo8(18)
	ldi	r19,hi8(18)
	add	r18,r28
	adc	r19,r29
	std	Y+4,r18
	std	Y+5,r19
# [1296] res := follow_path(dj, dir, path);
	ldi	r22,lo8(30)
	ldi	r23,hi8(30)
	add	r22,r28
	adc	r23,r29
	ldi	r24,lo8(2)
	ldi	r25,hi8(2)
	add	r24,r28
	adc	r25,r29
# Var path located in register r20
	call	PFF_ss_FOLLOW_PATHsDIRsPBYTEsPCHARssFRESULT
# Var res located in register r24
# [1298] if res <> FR_OK then
	cp	r24,r1
	breq	.Lj232
# [1299] Exit(res);
	mov	r4,r24
	rjmp	.Lj227
.Lj232:
# [1301] if (dir[0] = 0) or ((dir[DIR_Attr] and AM_DIR) <> 0) then
	ldd	r18,Y+30
	cp	r18,r1
	breq	.Lj233
	ldd	r18,Y+41
	andi	r18,16
	breq	.Lj235
.Lj233:
# [1302] Exit(FR_NO_FILE);
	ldi	r26,3
	mov	r4,r26
	rjmp	.Lj227
.Lj235:
# [1305] fs.org_clust := get_clust(dir);
	ldi	r24,lo8(30)
	ldi	r25,hi8(30)
	add	r24,r28
	adc	r25,r29
	call	PFF_ss_GET_CLUSTsPBYTEssLONGWORD
# Var fs located in register r2
	movw	r30,r2
	std	Z+32,r22
	std	Z+33,r23
	std	Z+34,r24
	std	Z+35,r25
# [1307] fs.fsize := ld_dword(PByte(@dir) + DIR_FileSize);
	ldi	r24,lo8(30)
	ldi	r25,hi8(30)
	add	r24,r28
	adc	r25,r29
	ldi	r18,28
	add	r24,r18
	adc	r25,r1
	call	PFF_ss_LD_DWORDsPBYTEssLONGWORD
# Var fs located in register r2
	movw	r30,r2
	std	Z+28,r22
	std	Z+29,r23
	std	Z+30,r24
	std	Z+31,r25
# Var fs located in register r2
# [1309] fs.fptr := 0;
	movw	r30,r2
	std	Z+24,r1
	std	Z+25,r1
	std	Z+26,r1
	std	Z+27,r1
# Var fs located in register r2
# [1310] fs.flag := FA_OPENED;
	ldi	r18,1
	movw	r30,r2
	std	Z+1,r18
# [1311] Result := FR_OK;
	mov	r4,r1
.Lj227:
# [1312] end;
	mov	r24,r4
	subi	r28,-62
	sbci	r29,-1
	in	r0,63
	cli
	out	62,r29
	out	63,r0
	out	61,r28
	pop	r2
	pop	r3
	pop	r4
	pop	r28
	pop	r29
	ret
.Lc41:
.Le20:
	.size	PFF_ss_PF_OPENsPCHARssFRESULT, .Le20 - PFF_ss_PF_OPENsPCHARssFRESULT

.section .text.n_pff_ss_pf_readspointerslongwordslongwordssfresult,"ax"
.globl	PFF_ss_PF_READsPOINTERsLONGWORDsLONGWORDssFRESULT
PFF_ss_PF_READsPOINTERsLONGWORDsLONGWORDssFRESULT:
.Lc44:
# Temps allocated between r28+2 and r28+18
# [1324] begin
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
	subi	r28,18
	sbci	r29,0
	in	r0,63
	cli
	out	62,r29
	out	63,r0
	out	61,r28
# Var $result located in register r18
# Var dr located in register r6
# Var clst located in register r18
# Var sect located in register r18
# Var remain located in register r18
# Var rcnt located in register r3
# Var cs located in register r7
# Var rbuff located in register r18
# Var fs located in register r18
# Var buff located in register r24
	std	Y+5,r20
	std	Y+6,r21
	std	Y+7,r22
	std	Y+8,r23
# Var btr located in register r18
	std	Y+3,r18
	std	Y+4,r19
# Var br located in register r18
# Var fs located in register r23
	lds	r23,(U_sPFF_ss_IFATFS)
	lds	r22,(U_sPFF_ss_IFATFS+1)
	cp	r23,r1
	cpc	r22,r1
	brne	.Lj239
	ldi	r26,5
	std	Y+2,r26
	rjmp	.Lj236
.Lj239:
# Var rbuff located in register r18
# Var buff located in register r24
# [1328] rbuff := buff;
	std	Y+9,r24
	std	Y+10,r25
# [1329] br := 0;
	ldd	r18,Y+3
	mov	r30,r18
	ldd	r18,Y+4
	mov	r31,r18
	st	Z,r1
	std	Z+1,r1
	std	Z+2,r1
	std	Z+3,r1
# [1331] if (fs.flag and FA_OPENED) = 0 then
	mov	r30,r23
	mov	r31,r22
	ldd	r18,Z+1
	andi	r18,1
	brne	.Lj241
# [1332] Exit(FR_NOT_OPENED);
	ldi	r26,4
	std	Y+2,r26
	rjmp	.Lj236
.Lj241:
# Var fs located in register r23
# [1334] remain := fs.fsize - fs.fptr;
	std	Y+11,r23
	std	Y+12,r22
# Var fs located in register r18
	mov	r30,r23
	mov	r31,r22
	ldd	r22,Z+28
	ldd	r23,Z+29
	ldd	r24,Z+30
	ldd	r25,Z+31
	ldd	r18,Y+11
	mov	r30,r18
	ldd	r18,Y+12
	mov	r31,r18
	ldd	r18,Z+24
	ldd	r19,Z+25
	ldd	r20,Z+26
	ldd	r21,Z+27
	sub	r22,r18
	sbc	r23,r19
	sbc	r24,r20
	sbc	r25,r21
# Var remain located in register r22
# [1335] if btr > remain then
	ldd	r18,Y+5
	cp	r22,r18
	ldd	r18,Y+6
	cpc	r23,r18
	ldd	r18,Y+7
	cpc	r24,r18
	ldd	r18,Y+8
	cpc	r25,r18
	brlo	.Lj264
# [1387] end;
	rjmp	.Lj245
.Lj264:
# [1337] btr := UINT(remain);
	std	Y+5,r22
	std	Y+6,r23
	std	Y+7,r24
	std	Y+8,r25
# [1340] while btr <> 0 do
	rjmp	.Lj245
.Lj244:
# [1344] if (fs.fptr and (SECTOR_SIZE-1)) = 0 then
	ldd	r18,Y+11
	mov	r30,r18
	ldd	r18,Y+12
	mov	r31,r18
	ldd	r18,Z+24
	ldd	r19,Z+25
	ldd	r22,Z+26
	ldd	r23,Z+27
	mov	r21,r18
	mov	r20,r19
	mov	r19,r22
	mov	r18,r23
	andi	r20,1
	cp	r21,r1
	cpc	r20,r1
	cpc	r1,r1
	cpc	r1,r1
	breq	.Lj265
	rjmp	.Lj248
.Lj265:
# [1348] cs := Byte((fs.fptr shr SECTOR_SIZE_BP) and (fs.csize - 1));
	ldd	r18,Y+11
	mov	r30,r18
	ldd	r18,Y+12
	mov	r31,r18
	ldd	r18,Z+2
	mov	r19,r1
	subi	r18,1
	sbc	r19,r1
	mov	r23,r18
	mov	r21,r19
	mov	r22,r1
	sbrc	r19,7
	com	r22
	ldd	r18,Y+11
	mov	r30,r18
	ldd	r18,Y+12
	mov	r31,r18
	ldd	r18,Z+24
	ldd	r18,Z+25
	ldd	r20,Z+26
	ldd	r25,Z+27
	mov	r19,r18
	lsr	r25
	ror	r20
	ror	r19
	mov	r11,r19
	mov	r19,r25
	mov	r18,r1
	and	r11,r23
	and	r20,r21
	and	r19,r22
	and	r18,r22
	mov	r7,r11
# [1350] if cs = 0 then
	cp	r7,r1
	breq	.Lj266
	rjmp	.Lj250
.Lj266:
# [1353] if fs.fptr = 0 then
	ldd	r18,Y+11
	mov	r30,r18
	ldd	r18,Y+12
	mov	r31,r18
	ldd	r19,Z+24
	ldd	r21,Z+25
	ldd	r18,Z+26
	ldd	r20,Z+27
	cp	r19,r1
	cpc	r21,r1
	cpc	r18,r1
	cpc	r20,r1
	brne	.Lj252
# [1354] clst := fs.org_clust
	ldd	r18,Y+11
	mov	r30,r18
	ldd	r18,Y+12
	mov	r31,r18
	ldd	r18,Z+32
	std	Y+13,r18
	ldd	r18,Z+33
	std	Y+14,r18
	ldd	r18,Z+34
	std	Y+15,r18
	ldd	r18,Z+35
	std	Y+16,r18
	rjmp	.Lj253
.Lj252:
# [1356] clst := get_fat(fs.curr_clust);
	ldd	r18,Y+11
	mov	r30,r18
	ldd	r18,Y+12
	mov	r31,r18
	ldd	r22,Z+36
	ldd	r18,Y+11
	mov	r30,r18
	ldd	r18,Y+12
	mov	r31,r18
	ldd	r23,Z+37
	ldd	r18,Y+11
	mov	r30,r18
	ldd	r18,Y+12
	mov	r31,r18
	ldd	r24,Z+38
	ldd	r18,Y+11
	mov	r30,r18
	ldd	r18,Y+12
	mov	r31,r18
	ldd	r25,Z+39
	call	PFF_ss_GET_FATsLONGWORDssLONGWORD
	std	Y+13,r22
	std	Y+14,r23
	std	Y+15,r24
	std	Y+16,r25
.Lj253:
# [1357] if clst <= 1 then
	ldi	r19,1
	ldd	r18,Y+13
	cp	r19,r18
	ldd	r18,Y+14
	cpc	r1,r18
	ldd	r18,Y+15
	cpc	r1,r18
	ldd	r18,Y+16
	cpc	r1,r18
	brlo	.Lj255
# [585] {$define ABORT_DISK_ERR := begin fs.flag := 0; Exit(FR_DISK_ERR); end}
	ldd	r18,Y+11
	mov	r30,r18
	ldd	r18,Y+12
	mov	r31,r18
	std	Z+1,r1
	ldi	r26,1
	std	Y+2,r26
	rjmp	.Lj236
.Lj255:
# [1360] fs.curr_clust := clst;
	ldd	r18,Y+11
	mov	r30,r18
	ldd	r18,Y+12
	mov	r31,r18
	ldd	r18,Y+13
	std	Z+36,r18
	ldd	r18,Y+14
	std	Z+37,r18
	ldd	r18,Y+15
	std	Z+38,r18
	ldd	r18,Y+16
	std	Z+39,r18
.Lj250:
# [1363] sect := clust2sect(fs.curr_clust);
	ldd	r18,Y+11
	mov	r30,r18
	ldd	r18,Y+12
	mov	r31,r18
	ldd	r22,Z+36
	ldd	r18,Y+11
	mov	r30,r18
	ldd	r18,Y+12
	mov	r31,r18
	ldd	r23,Z+37
	ldd	r18,Y+11
	mov	r30,r18
	ldd	r18,Y+12
	mov	r31,r18
	ldd	r24,Z+38
	ldd	r18,Y+11
	mov	r30,r18
	ldd	r18,Y+12
	mov	r31,r18
	ldd	r25,Z+39
	call	PFF_ss_CLUST2SECTsLONGWORDssLONGWORD
	std	Y+17,r22
	mov	r10,r23
	mov	r9,r24
	mov	r8,r25
# [1364] if sect = 0 then
	ldd	r18,Y+17
	cp	r18,r1
	cpc	r10,r1
	cpc	r9,r1
	cpc	r8,r1
	brne	.Lj257
	ldd	r18,Y+11
	mov	r30,r18
	ldd	r18,Y+12
	mov	r31,r18
	std	Z+1,r1
	ldi	r26,1
	std	Y+2,r26
	rjmp	.Lj236
.Lj257:
# [1366] fs.dsect := sect + cs;
	ldd	r18,Y+17
	mov	r11,r18
	mov	r24,r10
	mov	r23,r9
	mov	r25,r8
	add	r11,r7
	adc	r24,r1
	adc	r23,r1
	adc	r25,r1
	ldd	r18,Y+11
	mov	r30,r18
	ldd	r18,Y+12
	mov	r31,r18
	std	Z+40,r11
	std	Z+41,r24
	std	Z+42,r23
	std	Z+43,r25
.Lj248:
# [1370] rcnt := SECTOR_SIZE - UINT(fs.fptr and (SECTOR_SIZE-1));
	ldd	r18,Y+11
	mov	r30,r18
	ldd	r18,Y+12
	mov	r31,r18
	ldd	r18,Z+24
	ldd	r19,Z+25
	ldd	r20,Z+26
	ldd	r21,Z+27
	mov	r11,r18
	mov	r12,r19
	mov	r25,r20
	mov	r24,r21
	ldi	r26,1
	and	r12,r26
	mov	r23,r1
	ldi	r20,2
	mov	r19,r1
	mov	r18,r1
	sub	r23,r11
	sbc	r20,r12
	sbc	r19,r1
	sbc	r18,r1
	mov	r3,r23
	mov	r2,r20
	mov	r5,r19
	mov	r4,r18
# [1371] if rcnt > btr then
	ldd	r18,Y+5
	cp	r18,r3
	ldd	r18,Y+6
	cpc	r18,r2
	ldd	r18,Y+7
	cpc	r18,r5
	ldd	r18,Y+8
	cpc	r18,r4
	brsh	.Lj259
# [1372] rcnt := btr;
	ldd	r18,Y+5
	mov	r3,r18
	ldd	r18,Y+6
	mov	r2,r18
	ldd	r18,Y+7
	mov	r5,r18
	ldd	r18,Y+8
	mov	r4,r18
.Lj259:
# [1374] dr := disk_readp(rbuff, fs.dsect, UINT(fs.fptr and (SECTOR_SIZE-1)), rcnt);
	ldd	r18,Y+11
	mov	r30,r18
	ldd	r18,Y+12
	mov	r31,r18
	ldd	r18,Z+24
	ldd	r19,Z+25
	ldd	r20,Z+26
	ldd	r21,Z+27
	andi	r19,1
	movw	r16,r18
	mov	r18,r1
	mov	r19,r1
	ldd	r20,Y+11
	mov	r30,r20
	ldd	r20,Y+12
	mov	r31,r20
	ldd	r20,Z+40
	ldd	r21,Y+11
	mov	r30,r21
	ldd	r21,Y+12
	mov	r31,r21
	ldd	r21,Z+41
	ldd	r22,Y+11
	mov	r30,r22
	ldd	r22,Y+12
	mov	r31,r22
	ldd	r22,Z+42
	ldd	r23,Y+11
	mov	r30,r23
	ldd	r23,Y+12
	mov	r31,r23
	ldd	r23,Z+43
	mov	r12,r3
	mov	r13,r2
	mov	r14,r5
	mov	r15,r4
	ldd	r25,Y+9
	mov	r24,r25
	ldd	r11,Y+10
	mov	r25,r11
	call	DISK_IO_ss_DISK_READPsPOINTERsLONGWORDsLONGWORDsLONGWORDssDRESULT
	mov	r6,r24
# [1375] if dr <> RES_OK then
	cp	r6,r1
	breq	.Lj261
	ldd	r18,Y+11
	mov	r30,r18
	ldd	r18,Y+12
	mov	r31,r18
	std	Z+1,r1
	ldi	r26,1
	std	Y+2,r26
	rjmp	.Lj236
.Lj261:
# [1378] fs.fptr := fs.fptr + rcnt;
	ldd	r18,Y+11
	mov	r30,r18
	ldd	r18,Y+12
	mov	r31,r18
	ldd	r20,Z+24
	ldd	r22,Z+25
	ldd	r21,Z+26
	ldd	r19,Z+27
	add	r20,r3
	adc	r22,r2
	adc	r21,r5
	adc	r19,r4
	ldd	r18,Y+11
	mov	r30,r18
	ldd	r18,Y+12
	mov	r31,r18
	std	Z+24,r20
	std	Z+25,r22
	std	Z+26,r21
	std	Z+27,r19
# [1380] btr := btr - rcnt;
	ldd	r18,Y+5
	sub	r18,r3
	std	Y+5,r18
	ldd	r18,Y+6
	sbc	r18,r2
	std	Y+6,r18
	ldd	r18,Y+7
	sbc	r18,r5
	std	Y+7,r18
	ldd	r18,Y+8
	sbc	r18,r4
	std	Y+8,r18
# [1381] br := br + rcnt;
	ldd	r18,Y+3
	mov	r30,r18
	ldd	r18,Y+4
	mov	r31,r18
	ld	r21,Z
	ldd	r20,Z+1
	ldd	r19,Z+2
	ldd	r22,Z+3
	add	r21,r3
	adc	r20,r2
	adc	r19,r5
	adc	r22,r4
	ldd	r18,Y+3
	mov	r30,r18
	ldd	r18,Y+4
	mov	r31,r18
	st	Z,r21
	std	Z+1,r20
	std	Z+2,r19
	std	Z+3,r22
# [1383] if rbuff <> nil then
	ldd	r18,Y+9
	cp	r18,r1
	ldd	r18,Y+10
	cpc	r18,r1
	breq	.Lj245
# [1384] rbuff := rbuff + rcnt;
	ldd	r18,Y+9
	mov	r21,r18
	ldd	r18,Y+10
	mov	r22,r18
	add	r21,r3
	adc	r22,r2
	std	Y+9,r21
	std	Y+10,r22
.Lj245:
	ldd	r18,Y+5
	cp	r18,r1
	ldd	r18,Y+6
	cpc	r18,r1
	ldd	r18,Y+7
	cpc	r18,r1
	ldd	r18,Y+8
	cpc	r18,r1
	breq	.Lj267
	rjmp	.Lj244
.Lj267:
# [1386] Result := FR_OK;
	std	Y+2,r1
.Lj236:
	ldd	r18,Y+2
	mov	r24,r18
	subi	r28,-18
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
.Lc43:
.Le21:
	.size	PFF_ss_PF_READsPOINTERsLONGWORDsLONGWORDssFRESULT, .Le21 - PFF_ss_PF_READsPOINTERsLONGWORDsLONGWORDssFRESULT

.section .text.n_pff_ss_pf_opendirsdirspcharssfresult,"ax"
.globl	PFF_ss_PF_OPENDIRsDIRsPCHARssFRESULT
PFF_ss_PF_OPENDIRsDIRsPCHARssFRESULT:
.Lc46:
# [1560] begin
	push	r29
	push	r28
	push	r5
	push	r4
	push	r3
	push	r2
	in	r28,61
	in	r29,62
	subi	r28,46
	sbci	r29,0
	in	r0,63
	cli
	out	62,r29
	out	63,r0
	out	61,r28
# Var $result located in register r4
# Var res located in register r18
# Var sp located at r28+2, size=OS_NO
# Var dir located at r28+14, size=OS_NO
# Var fs located in register r18
	movw	r2,r24
# Var dj located in register r2
	movw	r20,r22
# Var path located in register r20
# Var fs located in register r18
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	cp	r18,r1
	cpc	r19,r1
	brne	.Lj271
	ldi	r26,5
	mov	r4,r26
	rjmp	.Lj268
.Lj271:
# [1564] dj.fn := sp;
	ldi	r19,lo8(2)
	ldi	r18,hi8(2)
	add	r19,r28
	adc	r18,r29
	movw	r30,r2
	std	Z+2,r19
	std	Z+3,r18
# [1566] res := follow_path(dj, dir, path);
	ldi	r22,lo8(14)
	ldi	r23,hi8(14)
	add	r22,r28
	adc	r23,r29
	movw	r24,r2
# Var path located in register r20
	call	PFF_ss_FOLLOW_PATHsDIRsPBYTEsPCHARssFRESULT
	mov	r5,r24
# Var res located in register r5
# [1567] if res = FR_OK then
	cp	r5,r1
	brne	.Lj273
# [1570] if dir[0] <> 0 then
	ldd	r18,Y+14
	cp	r18,r1
	breq	.Lj275
# [1572] if (dir[DIR_Attr] and AM_DIR) <> 0 then
	ldd	r18,Y+25
	andi	r18,16
	breq	.Lj277
# [1574] dj.sclust := get_clust(dir)
	ldi	r24,lo8(14)
	ldi	r25,hi8(14)
	add	r24,r28
	adc	r25,r29
	call	PFF_ss_GET_CLUSTsPBYTEssLONGWORD
	movw	r30,r2
	std	Z+4,r22
	std	Z+5,r23
	std	Z+6,r24
	std	Z+7,r25
	rjmp	.Lj275
.Lj277:
# [1577] res := FR_NO_FILE;
	ldi	r26,3
	mov	r5,r26
.Lj275:
# [1578] if res = FR_OK then
	cp	r5,r1
	brne	.Lj273
# [1580] res := dir_rewind(dj);
	movw	r24,r2
	call	PFF_ss_DIR_REWINDsDIRssFRESULT
	mov	r5,r24
.Lj273:
# Var res located in register r5
# [1583] Result := res;
	mov	r4,r5
.Lj268:
# [1584] end;
	mov	r24,r4
	subi	r28,-46
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
	pop	r28
	pop	r29
	ret
.Lc45:
.Le22:
	.size	PFF_ss_PF_OPENDIRsDIRsPCHARssFRESULT, .Le22 - PFF_ss_PF_OPENDIRsDIRsPCHARssFRESULT

.section .text.n_pff_ss_pf_readdirsdirsfilinfossfresult,"ax"
.globl	PFF_ss_PF_READDIRsDIRsFILINFOssFRESULT
PFF_ss_PF_READDIRsDIRsFILINFOssFRESULT:
.Lc48:
# [1592] begin
	push	r29
	push	r28
	push	r7
	push	r6
	push	r5
	push	r4
	push	r3
	push	r2
	in	r28,61
	in	r29,62
	subi	r28,46
	sbci	r29,0
	in	r0,63
	cli
	out	62,r29
	out	63,r0
	out	61,r28
# Var $result located in register r6
# Var res located in register r18
# Var sp located at r28+2, size=OS_NO
# Var dir located at r28+14, size=OS_NO
# Var fs located in register r18
	movw	r2,r24
# Var dj located in register r2
	movw	r4,r22
# Var fno located in register r4
# Var fs located in register r19
	lds	r19,(U_sPFF_ss_IFATFS)
	lds	r18,(U_sPFF_ss_IFATFS+1)
	cp	r19,r1
	cpc	r18,r1
	brne	.Lj284
	ldi	r26,5
	mov	r6,r26
	rjmp	.Lj281
.Lj284:
# [1596] dj.fn := sp;
	ldi	r19,lo8(2)
	ldi	r18,hi8(2)
	add	r19,r28
	adc	r18,r29
	movw	r30,r2
	std	Z+2,r19
	std	Z+3,r18
# [1598] res := dir_read(dj, dir);
	ldi	r22,lo8(14)
	ldi	r23,hi8(14)
	add	r22,r28
	adc	r23,r29
	movw	r24,r2
	call	PFF_ss_DIR_READsDIRsPBYTEssFRESULT
	mov	r7,r24
# Var res located in register r7
# [1599] if res = FR_NO_FILE then
	ldi	r26,3
	cp	r7,r26
	brne	.Lj286
# [1600] res := FR_OK;
	mov	r7,r1
.Lj286:
# [1601] if res = FR_OK then
	cp	r7,r1
	brne	.Lj288
# [1605] get_fileinfo(dj, dir, fno);
	ldi	r22,lo8(14)
	ldi	r23,hi8(14)
	add	r22,r28
	adc	r23,r29
	movw	r20,r4
	movw	r24,r2
	call	PFF_ss_GET_FILEINFOsDIRsPBYTEsFILINFO
# [1607] res := dir_next(dj);
	movw	r24,r2
	call	PFF_ss_DIR_NEXTsDIRssFRESULT
	mov	r7,r24
# [1608] if res = FR_NO_FILE then
	ldi	r26,3
	cp	r7,r26
	brne	.Lj288
# [1609] res := FR_OK;
	mov	r7,r1
.Lj288:
# Var res located in register r7
# [1612] Result := res;
	mov	r6,r7
.Lj281:
# [1613] end;
	mov	r24,r6
	subi	r28,-46
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
	pop	r28
	pop	r29
	ret
.Lc47:
.Le23:
	.size	PFF_ss_PF_READDIRsDIRsFILINFOssFRESULT, .Le23 - PFF_ss_PF_READDIRsDIRsFILINFOssFRESULT

.section .text.n_pff_ss_pf_rewinddirsdirssfresult,"ax"
.globl	PFF_ss_PF_REWINDDIRsDIRssFRESULT
PFF_ss_PF_REWINDDIRsDIRssFRESULT:
.Lc50:
# [1620] begin
	push	r29
	push	r28
	push	r2
	in	r28,61
	in	r29,62
	subi	r28,14
	sbci	r29,0
	in	r0,63
	cli
	out	62,r29
	out	63,r0
	out	61,r28
# Var $result located in register r2
# Var sp located at r28+2, size=OS_NO
# Var fs located in register r18
# Var dj located in register r24
# Var fs located in register r19
	lds	r19,(U_sPFF_ss_IFATFS)
	lds	r18,(U_sPFF_ss_IFATFS+1)
	cp	r19,r1
	cpc	r18,r1
	brne	.Lj294
	ldi	r26,5
	mov	r2,r26
	rjmp	.Lj291
.Lj294:
# [1624] dj.fn := sp;
	ldi	r19,lo8(2)
	ldi	r18,hi8(2)
	add	r19,r28
	adc	r18,r29
	movw	r30,r24
	std	Z+2,r19
	std	Z+3,r18
# [1625] Result := dir_rewind(dj)
	call	PFF_ss_DIR_REWINDsDIRssFRESULT
	mov	r2,r24
.Lj291:
# [1626] end;
	mov	r24,r2
	subi	r28,-14
	sbci	r29,-1
	in	r0,63
	cli
	out	62,r29
	out	63,r0
	out	61,r28
	pop	r2
	pop	r28
	pop	r29
	ret
.Lc49:
.Le24:
	.size	PFF_ss_PF_REWINDDIRsDIRssFRESULT, .Le24 - PFF_ss_PF_REWINDDIRsDIRssFRESULT
# End asmlist al_procedures
# Begin asmlist al_globals

.section .bss.n_u_spff_ss_ifatfs,"aw",%nobits
# [588] iFatFS: PFATFS;
	.size U_sPFF_ss_IFATFS,2
U_sPFF_ss_IFATFS:
	.zero 2
# End asmlist al_globals
# Begin asmlist al_rtti

.section .data.n_RTTI_sPFF_ss_PWCHAR
.globl	RTTI_sPFF_ss_PWCHAR
RTTI_sPFF_ss_PWCHAR:
	.byte	29,6
# [1631] 
	.ascii	"PWCHAR"
	.short	0
	.short	RTTI_sSYSTEM_ss_WORDsindirect
.Le25:
	.size	RTTI_sPFF_ss_PWCHAR, .Le25 - RTTI_sPFF_ss_PWCHAR

.section .data.n_RTTI_sPFF_ss_PUINT
.globl	RTTI_sPFF_ss_PUINT
RTTI_sPFF_ss_PUINT:
	.byte	29,5
	.ascii	"PUINT"
	.short	0
	.short	RTTI_sSYSTEM_ss_LONGWORDsindirect
.Le26:
	.size	RTTI_sPFF_ss_PUINT, .Le26 - RTTI_sPFF_ss_PUINT

.section .data.n_INIT_sPFF_ss_FATFS
.globl	INIT_sPFF_ss_FATFS
INIT_sPFF_ss_FATFS:
	.byte	13,5
	.ascii	"FATFS"
	.short	0,0
	.long	44
	.short	0,0
	.long	0
.Le27:
	.size	INIT_sPFF_ss_FATFS, .Le27 - INIT_sPFF_ss_FATFS

.section .data.n_RTTI_sPFF_ss_FATFS
.globl	RTTI_sPFF_ss_FATFS
RTTI_sPFF_ss_FATFS:
	.byte	13,5
	.ascii	"FATFS"
	.short	0
	.short	INIT_sPFF_ss_FATFS
	.long	44,14
	.short	RTTI_sSYSTEM_ss_BYTEsindirect
	.short	0
	.short	RTTI_sSYSTEM_ss_BYTEsindirect
	.short	1
	.short	RTTI_sSYSTEM_ss_BYTEsindirect
	.short	2
	.short	RTTI_sSYSTEM_ss_BYTEsindirect
	.short	3
	.short	RTTI_sSYSTEM_ss_WORDsindirect
	.short	4
	.short	RTTI_sSYSTEM_ss_LONGWORDsindirect
	.short	8
	.short	RTTI_sSYSTEM_ss_LONGWORDsindirect
	.short	12
	.short	RTTI_sSYSTEM_ss_LONGWORDsindirect
	.short	16
	.short	RTTI_sSYSTEM_ss_LONGWORDsindirect
	.short	20
	.short	RTTI_sSYSTEM_ss_LONGWORDsindirect
	.short	24
	.short	RTTI_sSYSTEM_ss_LONGWORDsindirect
	.short	28
	.short	RTTI_sSYSTEM_ss_LONGWORDsindirect
	.short	32
	.short	RTTI_sSYSTEM_ss_LONGWORDsindirect
	.short	36
	.short	RTTI_sSYSTEM_ss_LONGWORDsindirect
	.short	40
.Le28:
	.size	RTTI_sPFF_ss_FATFS, .Le28 - RTTI_sPFF_ss_FATFS

.section .data.n_RTTI_sPFF_ss_PFATFS
.globl	RTTI_sPFF_ss_PFATFS
RTTI_sPFF_ss_PFATFS:
	.byte	29,6
	.ascii	"PFATFS"
	.short	0
	.short	RTTI_sPFF_ss_FATFSsindirect
.Le29:
	.size	RTTI_sPFF_ss_PFATFS, .Le29 - RTTI_sPFF_ss_PFATFS

.section .data.n_INIT_sPFF_ss_DIR
.globl	INIT_sPFF_ss_DIR
INIT_sPFF_ss_DIR:
	.byte	13,3
	.ascii	"DIR"
	.short	0,0
	.long	16
	.short	0,0
	.long	0
.Le30:
	.size	INIT_sPFF_ss_DIR, .Le30 - INIT_sPFF_ss_DIR

.section .data.n_RTTI_sPFF_ss_DIR
.globl	RTTI_sPFF_ss_DIR
RTTI_sPFF_ss_DIR:
	.byte	13,3
	.ascii	"DIR"
	.short	0
	.short	INIT_sPFF_ss_DIR
	.long	16,5
	.short	RTTI_sSYSTEM_ss_WORDsindirect
	.short	0
	.short	RTTI_sSYSTEM_ss_PBYTEsindirect
	.short	2
	.short	RTTI_sSYSTEM_ss_LONGWORDsindirect
	.short	4
	.short	RTTI_sSYSTEM_ss_LONGWORDsindirect
	.short	8
	.short	RTTI_sSYSTEM_ss_LONGWORDsindirect
	.short	12
.Le31:
	.size	RTTI_sPFF_ss_DIR, .Le31 - RTTI_sPFF_ss_DIR

.section .data.n_RTTI_sPFF_ss_PDIR
.globl	RTTI_sPFF_ss_PDIR
RTTI_sPFF_ss_PDIR:
	.byte	29,4
	.ascii	"PDIR"
	.short	0
	.short	RTTI_sPFF_ss_DIRsindirect
.Le32:
	.size	RTTI_sPFF_ss_PDIR, .Le32 - RTTI_sPFF_ss_PDIR

.section .data.n_INIT_sPFF_ss_FILINFO
.globl	INIT_sPFF_ss_FILINFO
INIT_sPFF_ss_FILINFO:
	.byte	13,7
	.ascii	"FILINFO"
	.short	0,0
	.long	24
	.short	0,0
	.long	0
.Le33:
	.size	INIT_sPFF_ss_FILINFO, .Le33 - INIT_sPFF_ss_FILINFO

.section .data.n_RTTI_sPFF_ss_def00000007
.globl	RTTI_sPFF_ss_def00000007
RTTI_sPFF_ss_def00000007:
	.byte	12,0
	.short	0,13,13
	.short	RTTI_sSYSTEM_ss_CHARsindirect
	.byte	1
	.short	RTTI_sSYSTEM_ss_SHORTINTsindirect
.Le34:
	.size	RTTI_sPFF_ss_def00000007, .Le34 - RTTI_sPFF_ss_def00000007

.section .data.n_RTTI_sPFF_ss_FILINFO
.globl	RTTI_sPFF_ss_FILINFO
RTTI_sPFF_ss_FILINFO:
	.byte	13,7
	.ascii	"FILINFO"
	.short	0
	.short	INIT_sPFF_ss_FILINFO
	.long	24,5
	.short	RTTI_sSYSTEM_ss_LONGWORDsindirect
	.short	0
	.short	RTTI_sSYSTEM_ss_WORDsindirect
	.short	4
	.short	RTTI_sSYSTEM_ss_WORDsindirect
	.short	6
	.short	RTTI_sSYSTEM_ss_BYTEsindirect
	.short	8
	.short	RTTI_sPFF_ss_def00000007sindirect
	.short	9
.Le35:
	.size	RTTI_sPFF_ss_FILINFO, .Le35 - RTTI_sPFF_ss_FILINFO

.section .data.n_RTTI_sPFF_ss_PFILINFO
.globl	RTTI_sPFF_ss_PFILINFO
RTTI_sPFF_ss_PFILINFO:
	.byte	29,8
	.ascii	"PFILINFO"
	.short	0
	.short	RTTI_sPFF_ss_FILINFOsindirect
.Le36:
	.size	RTTI_sPFF_ss_PFILINFO, .Le36 - RTTI_sPFF_ss_PFILINFO

.section .data.n_RTTI_sPFF_ss_FRESULT
.globl	RTTI_sPFF_ss_FRESULT
RTTI_sPFF_ss_FRESULT:
	.byte	3,7
	.ascii	"FRESULT"
	.short	0
	.byte	1
	.long	0,6
	.short	0
	.byte	5
	.ascii	"FR_OK"
	.byte	11
	.ascii	"FR_DISK_ERR"
	.byte	12
	.ascii	"FR_NOT_READY"
	.byte	10
	.ascii	"FR_NO_FILE"
	.byte	13
	.ascii	"FR_NOT_OPENED"
	.byte	14
	.ascii	"FR_NOT_ENABLED"
	.byte	16
	.ascii	"FR_NO_FILESYSTEM"
	.byte	3
	.ascii	"pff"
	.byte	0
.Le37:
	.size	RTTI_sPFF_ss_FRESULT, .Le37 - RTTI_sPFF_ss_FRESULT

.section .data.n_RTTI_sPFF_ss_FRESULT_s2o
	.balign 2
.globl	RTTI_sPFF_ss_FRESULT_s2o
RTTI_sPFF_ss_FRESULT_s2o:
	.long	7,1
	.short	RTTI_sPFF_ss_FRESULT+28
	.long	5
	.short	RTTI_sPFF_ss_FRESULT+78
	.long	4
	.short	RTTI_sPFF_ss_FRESULT+64
	.long	2
	.short	RTTI_sPFF_ss_FRESULT+40
	.long	3
	.short	RTTI_sPFF_ss_FRESULT+53
	.long	6
	.short	RTTI_sPFF_ss_FRESULT+93
	.long	0
	.short	RTTI_sPFF_ss_FRESULT+22
.Le38:
	.size	RTTI_sPFF_ss_FRESULT_s2o, .Le38 - RTTI_sPFF_ss_FRESULT_s2o

.section .data.n_RTTI_sPFF_ss_FRESULT_o2s
	.balign 2
.globl	RTTI_sPFF_ss_FRESULT_o2s
RTTI_sPFF_ss_FRESULT_o2s:
	.long	0
	.short	RTTI_sPFF_ss_FRESULT+22
	.short	RTTI_sPFF_ss_FRESULT+28
	.short	RTTI_sPFF_ss_FRESULT+40
	.short	RTTI_sPFF_ss_FRESULT+53
	.short	RTTI_sPFF_ss_FRESULT+64
	.short	RTTI_sPFF_ss_FRESULT+78
	.short	RTTI_sPFF_ss_FRESULT+93
.Le39:
	.size	RTTI_sPFF_ss_FRESULT_o2s, .Le39 - RTTI_sPFF_ss_FRESULT_o2s
# End asmlist al_rtti
# Begin asmlist al_indirectglobals

.section .data.n_RTTI_sPFF_ss_PWCHAR
	.balign 2
.globl	RTTI_sPFF_ss_PWCHARsindirect
RTTI_sPFF_ss_PWCHARsindirect:
	.short	RTTI_sPFF_ss_PWCHAR
.Le40:
	.size	RTTI_sPFF_ss_PWCHARsindirect, .Le40 - RTTI_sPFF_ss_PWCHARsindirect

.section .data.n_RTTI_sPFF_ss_PUINT
	.balign 2
.globl	RTTI_sPFF_ss_PUINTsindirect
RTTI_sPFF_ss_PUINTsindirect:
	.short	RTTI_sPFF_ss_PUINT
.Le41:
	.size	RTTI_sPFF_ss_PUINTsindirect, .Le41 - RTTI_sPFF_ss_PUINTsindirect

.section .data.n_INIT_sPFF_ss_FATFS
	.balign 2
.globl	INIT_sPFF_ss_FATFSsindirect
INIT_sPFF_ss_FATFSsindirect:
	.short	INIT_sPFF_ss_FATFS
.Le42:
	.size	INIT_sPFF_ss_FATFSsindirect, .Le42 - INIT_sPFF_ss_FATFSsindirect

.section .data.n_RTTI_sPFF_ss_FATFS
	.balign 2
.globl	RTTI_sPFF_ss_FATFSsindirect
RTTI_sPFF_ss_FATFSsindirect:
	.short	RTTI_sPFF_ss_FATFS
.Le43:
	.size	RTTI_sPFF_ss_FATFSsindirect, .Le43 - RTTI_sPFF_ss_FATFSsindirect

.section .data.n_RTTI_sPFF_ss_PFATFS
	.balign 2
.globl	RTTI_sPFF_ss_PFATFSsindirect
RTTI_sPFF_ss_PFATFSsindirect:
	.short	RTTI_sPFF_ss_PFATFS
.Le44:
	.size	RTTI_sPFF_ss_PFATFSsindirect, .Le44 - RTTI_sPFF_ss_PFATFSsindirect

.section .data.n_INIT_sPFF_ss_DIR
	.balign 2
.globl	INIT_sPFF_ss_DIRsindirect
INIT_sPFF_ss_DIRsindirect:
	.short	INIT_sPFF_ss_DIR
.Le45:
	.size	INIT_sPFF_ss_DIRsindirect, .Le45 - INIT_sPFF_ss_DIRsindirect

.section .data.n_RTTI_sPFF_ss_DIR
	.balign 2
.globl	RTTI_sPFF_ss_DIRsindirect
RTTI_sPFF_ss_DIRsindirect:
	.short	RTTI_sPFF_ss_DIR
.Le46:
	.size	RTTI_sPFF_ss_DIRsindirect, .Le46 - RTTI_sPFF_ss_DIRsindirect

.section .data.n_RTTI_sPFF_ss_PDIR
	.balign 2
.globl	RTTI_sPFF_ss_PDIRsindirect
RTTI_sPFF_ss_PDIRsindirect:
	.short	RTTI_sPFF_ss_PDIR
.Le47:
	.size	RTTI_sPFF_ss_PDIRsindirect, .Le47 - RTTI_sPFF_ss_PDIRsindirect

.section .data.n_INIT_sPFF_ss_FILINFO
	.balign 2
.globl	INIT_sPFF_ss_FILINFOsindirect
INIT_sPFF_ss_FILINFOsindirect:
	.short	INIT_sPFF_ss_FILINFO
.Le48:
	.size	INIT_sPFF_ss_FILINFOsindirect, .Le48 - INIT_sPFF_ss_FILINFOsindirect

.section .data.n_RTTI_sPFF_ss_def00000007
	.balign 2
.globl	RTTI_sPFF_ss_def00000007sindirect
RTTI_sPFF_ss_def00000007sindirect:
	.short	RTTI_sPFF_ss_def00000007
.Le49:
	.size	RTTI_sPFF_ss_def00000007sindirect, .Le49 - RTTI_sPFF_ss_def00000007sindirect

.section .data.n_RTTI_sPFF_ss_FILINFO
	.balign 2
.globl	RTTI_sPFF_ss_FILINFOsindirect
RTTI_sPFF_ss_FILINFOsindirect:
	.short	RTTI_sPFF_ss_FILINFO
.Le50:
	.size	RTTI_sPFF_ss_FILINFOsindirect, .Le50 - RTTI_sPFF_ss_FILINFOsindirect

.section .data.n_RTTI_sPFF_ss_PFILINFO
	.balign 2
.globl	RTTI_sPFF_ss_PFILINFOsindirect
RTTI_sPFF_ss_PFILINFOsindirect:
	.short	RTTI_sPFF_ss_PFILINFO
.Le51:
	.size	RTTI_sPFF_ss_PFILINFOsindirect, .Le51 - RTTI_sPFF_ss_PFILINFOsindirect

.section .data.n_RTTI_sPFF_ss_FRESULT
	.balign 2
.globl	RTTI_sPFF_ss_FRESULTsindirect
RTTI_sPFF_ss_FRESULTsindirect:
	.short	RTTI_sPFF_ss_FRESULT
.Le52:
	.size	RTTI_sPFF_ss_FRESULTsindirect, .Le52 - RTTI_sPFF_ss_FRESULTsindirect

.section .data.n_RTTI_sPFF_ss_FRESULT_s2o
	.balign 2
.globl	RTTI_sPFF_ss_FRESULT_s2osindirect
RTTI_sPFF_ss_FRESULT_s2osindirect:
	.short	RTTI_sPFF_ss_FRESULT_s2o
.Le53:
	.size	RTTI_sPFF_ss_FRESULT_s2osindirect, .Le53 - RTTI_sPFF_ss_FRESULT_s2osindirect

.section .data.n_RTTI_sPFF_ss_FRESULT_o2s
	.balign 2
.globl	RTTI_sPFF_ss_FRESULT_o2ssindirect
RTTI_sPFF_ss_FRESULT_o2ssindirect:
	.short	RTTI_sPFF_ss_FRESULT_o2s
.Le54:
	.size	RTTI_sPFF_ss_FRESULT_o2ssindirect, .Le54 - RTTI_sPFF_ss_FRESULT_o2ssindirect
# End asmlist al_indirectglobals
# Begin asmlist al_dwarf_frame

.section .debug_frame
.Lc51:
	.long	.Lc53-.Lc52
.Lc52:
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
.Lc53:
	.long	.Lc55-.Lc54
.Lc54:
	.short	.Lc51
	.short	.Lc2
	.short	.Lc1-.Lc2
	.balign 4,0
.Lc55:
	.long	.Lc58-.Lc57
.Lc57:
	.short	.Lc51
	.short	.Lc4
	.short	.Lc3-.Lc4
	.balign 4,0
.Lc58:
	.long	.Lc61-.Lc60
.Lc60:
	.short	.Lc51
	.short	.Lc6
	.short	.Lc5-.Lc6
	.balign 4,0
.Lc61:
	.long	.Lc64-.Lc63
.Lc63:
	.short	.Lc51
	.short	.Lc8
	.short	.Lc7-.Lc8
	.balign 4,0
.Lc64:
	.long	.Lc67-.Lc66
.Lc66:
	.short	.Lc51
	.short	.Lc10
	.short	.Lc9-.Lc10
	.balign 4,0
.Lc67:
	.long	.Lc70-.Lc69
.Lc69:
	.short	.Lc51
	.short	.Lc12
	.short	.Lc11-.Lc12
	.balign 4,0
.Lc70:
	.long	.Lc73-.Lc72
.Lc72:
	.short	.Lc51
	.short	.Lc14
	.short	.Lc13-.Lc14
	.balign 4,0
.Lc73:
	.long	.Lc76-.Lc75
.Lc75:
	.short	.Lc51
	.short	.Lc16
	.short	.Lc15-.Lc16
	.balign 4,0
.Lc76:
	.long	.Lc79-.Lc78
.Lc78:
	.short	.Lc51
	.short	.Lc18
	.short	.Lc17-.Lc18
	.balign 4,0
.Lc79:
	.long	.Lc82-.Lc81
.Lc81:
	.short	.Lc51
	.short	.Lc20
	.short	.Lc19-.Lc20
	.balign 4,0
.Lc82:
	.long	.Lc85-.Lc84
.Lc84:
	.short	.Lc51
	.short	.Lc22
	.short	.Lc21-.Lc22
	.balign 4,0
.Lc85:
	.long	.Lc88-.Lc87
.Lc87:
	.short	.Lc51
	.short	.Lc24
	.short	.Lc23-.Lc24
	.balign 4,0
.Lc88:
	.long	.Lc91-.Lc90
.Lc90:
	.short	.Lc51
	.short	.Lc26
	.short	.Lc25-.Lc26
	.balign 4,0
.Lc91:
	.long	.Lc94-.Lc93
.Lc93:
	.short	.Lc51
	.short	.Lc28
	.short	.Lc27-.Lc28
	.balign 4,0
.Lc94:
	.long	.Lc97-.Lc96
.Lc96:
	.short	.Lc51
	.short	.Lc30
	.short	.Lc29-.Lc30
	.balign 4,0
.Lc97:
	.long	.Lc100-.Lc99
.Lc99:
	.short	.Lc51
	.short	.Lc32
	.short	.Lc31-.Lc32
	.balign 4,0
.Lc100:
	.long	.Lc103-.Lc102
.Lc102:
	.short	.Lc51
	.short	.Lc34
	.short	.Lc33-.Lc34
	.balign 4,0
.Lc103:
	.long	.Lc106-.Lc105
.Lc105:
	.short	.Lc51
	.short	.Lc36
	.short	.Lc35-.Lc36
	.balign 4,0
.Lc106:
	.long	.Lc109-.Lc108
.Lc108:
	.short	.Lc51
	.short	.Lc38
	.short	.Lc37-.Lc38
	.balign 4,0
.Lc109:
	.long	.Lc112-.Lc111
.Lc111:
	.short	.Lc51
	.short	.Lc40
	.short	.Lc39-.Lc40
	.balign 4,0
.Lc112:
	.long	.Lc115-.Lc114
.Lc114:
	.short	.Lc51
	.short	.Lc42
	.short	.Lc41-.Lc42
	.balign 4,0
.Lc115:
	.long	.Lc118-.Lc117
.Lc117:
	.short	.Lc51
	.short	.Lc44
	.short	.Lc43-.Lc44
	.balign 4,0
.Lc118:
	.long	.Lc121-.Lc120
.Lc120:
	.short	.Lc51
	.short	.Lc46
	.short	.Lc45-.Lc46
	.balign 4,0
.Lc121:
	.long	.Lc124-.Lc123
.Lc123:
	.short	.Lc51
	.short	.Lc48
	.short	.Lc47-.Lc48
	.balign 4,0
.Lc124:
	.long	.Lc127-.Lc126
.Lc126:
	.short	.Lc51
	.short	.Lc50
	.short	.Lc49-.Lc50
	.balign 4,0
.Lc127:
# End asmlist al_dwarf_frame

