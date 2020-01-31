	.file "pff.pas"
# Begin asmlist al_procedures

.section .text.n_pff_ss_isdbcs1ssmallintssboolean,"ax"
PFF_ss_ISDBCS1sSMALLINTssBOOLEAN:
.Lc2:
# Var $result located in register r18
# Var c located in register r24
# [pff.pas]
# [384] begin
# Var $result located in register r24
# [385] Result := False;
	mov	r24,r1
# [386] end;
	ret
.Lc1:
.Le0:
	.size	PFF_ss_ISDBCS1sSMALLINTssBOOLEAN, .Le0 - PFF_ss_ISDBCS1sSMALLINTssBOOLEAN

.section .text.n_pff_ss_isdbcs2ssmallintssboolean,"ax"
PFF_ss_ISDBCS2sSMALLINTssBOOLEAN:
.Lc4:
# Var $result located in register r18
# Var c located in register r24
# [389] begin
# Var $result located in register r24
# [390] Result := False;
	mov	r24,r1
# [391] end;
	ret
.Lc3:
.Le1:
	.size	PFF_ss_ISDBCS2sSMALLINTssBOOLEAN, .Le1 - PFF_ss_ISDBCS2sSMALLINTssBOOLEAN

.section .text.n_pff_ss_isupperscharssboolean,"ax"
PFF_ss_ISUPPERsCHARssBOOLEAN:
.Lc6:
# Var $result located in register r18
# Var c located in register r24
# [396] begin
# [397] Result := (c >= 'A') and (c <= 'Z');
	subi	r24,65
	ldi	r18,25
	cp	r18,r24
# Var $result located in register r24
	ldi	r24,1
	brsh	.Lj9
	mov	r24,r1
.Lj9:
# [398] end;
	ret
.Lc5:
.Le2:
	.size	PFF_ss_ISUPPERsCHARssBOOLEAN, .Le2 - PFF_ss_ISUPPERsCHARssBOOLEAN

.section .text.n_pff_ss_islowerscharssboolean,"ax"
PFF_ss_ISLOWERsCHARssBOOLEAN:
.Lc8:
# Var $result located in register r18
# Var c located in register r24
# [401] begin
# [402] Result := (c >= 'a') and (c <= 'z');
	subi	r24,97
	ldi	r18,25
	cp	r18,r24
# Var $result located in register r24
	ldi	r24,1
	brsh	.Lj12
	mov	r24,r1
.Lj12:
# [403] end;
	ret
.Lc7:
.Le3:
	.size	PFF_ss_ISLOWERsCHARssBOOLEAN, .Le3 - PFF_ss_ISLOWERsCHARssBOOLEAN

.section .text.n_pff_ss_ld_wordspbytessword,"ax"
PFF_ss_LD_WORDsPBYTEssWORD:
.Lc10:
# Var $result located in register r18
# Var ptr located in register r24
# [407] begin
# Var ptr located in register r24
# Var $result located in register r24
# [410] Result := PWord(ptr)^;
	movw	r30,r24
	ld	r24,Z
	ldd	r25,Z+1
# [415] end;
	ret
.Lc9:
.Le4:
	.size	PFF_ss_LD_WORDsPBYTEssWORD, .Le4 - PFF_ss_LD_WORDsPBYTEssWORD

.section .text.n_pff_ss_ld_dwordspbytesslongword,"ax"
PFF_ss_LD_DWORDsPBYTEssLONGWORD:
.Lc12:
# Var $result located in register r18
# Var ptr located in register r24
# [419] begin
# Var ptr located in register r24
# Var $result located in register r22
# [422] Result := PDWord(ptr)^;
	movw	r30,r24
	ld	r22,Z
	ldd	r23,Z+1
	ldd	r24,Z+2
	ldd	r25,Z+3
# [429] end;
	ret
.Lc11:
.Le5:
	.size	PFF_ss_LD_DWORDsPBYTEssLONGWORD, .Le5 - PFF_ss_LD_DWORDsPBYTEssLONGWORD

.section .text.n_pff_ss_mem_setspcharscharssmallint,"ax"
PFF_ss_MEM_SETsPCHARsCHARsSMALLINT:
.Lc14:
# [434] begin
	mov	r18,r24
# Var dst located in register r18
# Var val located in register r22
# Var cnt located in register r20
# [435] while cnt > 0 do
	rjmp	.Lj20
.Lj19:
# [437] dst^ := val;
	mov	r30,r18
	mov	r31,r25
	st	Z,r22
# [438] Inc(dst); Dec(cnt);
	ldi	r19,1
	add	r18,r19
	adc	r25,r1
	subi	r20,1
	sbc	r21,r1
.Lj20:
	cp	r1,r20
	cpc	r1,r21
	brlt	.Lj19
# [440] end;
	ret
.Lc13:
.Le6:
	.size	PFF_ss_MEM_SETsPCHARsCHARsSMALLINT, .Le6 - PFF_ss_MEM_SETsPCHARsCHARsSMALLINT

.section .text.n_pff_ss_mem_cmpspcharspcharssmallintsssmallint,"ax"
PFF_ss_MEM_CMPsPCHARsPCHARsSMALLINTssSMALLINT:
.Lc16:
# [444] begin
	push	r5
	push	r4
	push	r3
	push	r2
# Var $result located in register r18
	movw	r2,r24
# Var dst located in register r2
# Var src located in register r22
# Var cnt located in register r20
# Var $result located in register r24
# [445] Result := 0;
	mov	r24,r1
	mov	r25,r1
# [446] while (cnt > 0) and (Result = 0) do
	rjmp	.Lj25
.Lj24:
# [448] Result := Ord(dst^) - Ord(src^);
	movw	r30,r2
	ld	r4,Z
	mov	r19,r1
	movw	r30,r22
	ld	r5,Z
	sub	r4,r5
	sbc	r19,r1
	mov	r24,r4
	mov	r25,r19
# [449] Inc(dst); Inc(src);
	ldi	r18,1
	add	r2,r18
	adc	r3,r1
	ldi	r18,1
	add	r22,r18
	adc	r23,r1
# [450] Dec(cnt);
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
# [452] end;
	pop	r2
	pop	r3
	pop	r4
	pop	r5
	ret
.Lc15:
.Le7:
	.size	PFF_ss_MEM_CMPsPCHARsPCHARsSMALLINTssSMALLINT, .Le7 - PFF_ss_MEM_CMPsPCHARsPCHARsSMALLINTssSMALLINT

.section .text.n_pff_ss_get_fatslongwordsslongword,"ax"
PFF_ss_GET_FATsLONGWORDssLONGWORD:
.Lc18:
# [464] begin
	push	r29
	push	r28
	push	r17
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
# Var $result located in register r5
# Var buf located at r28+2, size=OS_32
	movw	r20,r22
	movw	r22,r24
# Var clst located in register r20
# [466] if (clst < 2) or (clst >= iFatFS.n_fatent) then
	cpi	r20,2
	cpc	r21,r1
	cpc	r22,r1
	cpc	r23,r1
	brlo	.Lj32
	lds	r19,(U_sPFF_ss_IFATFS)
	lds	r18,(U_sPFF_ss_IFATFS+1)
	mov	r30,r19
	mov	r31,r18
	ldd	r18,Z+8
	ldd	r19,Z+9
	ldd	r24,Z+10
	ldd	r25,Z+11
	cp	r20,r18
	cpc	r21,r19
	cpc	r22,r24
	cpc	r23,r25
	brlo	.Lj34
.Lj32:
# [467] Exit(1);
	ldi	r26,1
	mov	r5,r26
	mov	r2,r1
	mov	r3,r1
	mov	r4,r1
	rjmp	.Lj30
.Lj34:
# [469] Result := 1;
	ldi	r26,1
	mov	r5,r26
	mov	r2,r1
	mov	r3,r1
	mov	r4,r1
# [471] case iFatFS.fs_type of
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ld	r18,Z
	cpi	r18,3
	breq	.Lj40
# [518] end;
	rjmp	.Lj30
.Lj40:
# [512] if disk_readp(@buf, iFatFS.fatbase + clst div 128, (UINT(clst) mod 128) * 4, 4) =
	movw	r18,r20
	andi	r18,127
	mov	r19,r1
	mov	r24,r1
	mov	r25,r1
	lsl	r18
	rol	r19
	rol	r24
	rol	r25
	lsl	r18
	rol	r19
	rol	r24
	rol	r25
	lds	r24,(U_sPFF_ss_IFATFS)
	lds	r25,(U_sPFF_ss_IFATFS+1)
	ldi	r26,7
	mov	r6,r26
.Lj37:
	lsr	r23
	ror	r22
	ror	r21
	ror	r20
	dec	r6
	brne	.Lj37
	movw	r30,r24
	ldd	r24,Z+12
	ldd	r25,Z+13
	ldd	r6,Z+14
	ldd	r7,Z+15
	add	r20,r24
	adc	r21,r25
	adc	r22,r6
	adc	r23,r7
	ldi	r24,lo8(2)
	ldi	r25,hi8(2)
	add	r24,r28
	adc	r25,r29
	ldi	r16,4
	mov	r17,r1
	call	DISK_IO_ss_DISK_READPsPBYTEsLONGWORDsNATIVEUINTsNATIVEUINTssDRESULT
	cp	r24,r1
	brne	.Lj30
# [514] Result := ld_dword(buf) and $0FFFFFFF;
	ldi	r24,lo8(2)
	ldi	r25,hi8(2)
	add	r24,r28
	adc	r25,r29
	call	PFF_ss_LD_DWORDsPBYTEssLONGWORD
	andi	r25,15
	mov	r5,r22
	mov	r2,r23
	mov	r3,r24
	mov	r4,r25
.Lj30:
	mov	r22,r5
	mov	r23,r2
	mov	r24,r3
	mov	r25,r4
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
# [525] begin
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
# Var $result located in register r2
# Var clst located in register r22
# [526] clst := clst - 2;
	subi	r22,2
	sbc	r23,r1
	sbc	r24,r1
	sbc	r25,r1
# [527] if clst >= (iFatFS.n_fatent - 2) then
	lds	r19,(U_sPFF_ss_IFATFS)
	lds	r18,(U_sPFF_ss_IFATFS+1)
	mov	r30,r19
	mov	r31,r18
	ldd	r6,Z+8
	ldd	r7,Z+9
	ldd	r8,Z+10
	ldd	r9,Z+11
	mov	r21,r1
	mov	r2,r1
	mov	r3,r1
	mov	r4,r1
	ldi	r26,2
	sub	r6,r26
	sbc	r7,r1
	sbc	r8,r1
	sbc	r9,r1
	sbc	r21,r1
	sbc	r2,r1
	sbc	r3,r1
	sbc	r4,r1
	cp	r22,r6
	cpc	r23,r7
	cpc	r24,r8
	cpc	r25,r9
	cpc	r1,r21
	cpc	r1,r2
	cpc	r1,r3
	cpc	r1,r4
	brlt	.Lj44
# [529] Result := 0
	mov	r2,r1
	mov	r3,r1
	mov	r4,r1
	mov	r5,r1
	rjmp	.Lj45
.Lj44:
# [531] Result := DWORD(clst * iFatFS.csize + iFatFS.database);
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r18,Z+2
	mov	r19,r1
	mov	r20,r1
	mov	r21,r1
	call	fpc_mul_dword
	lds	r19,(U_sPFF_ss_IFATFS)
	lds	r18,(U_sPFF_ss_IFATFS+1)
	mov	r30,r19
	mov	r31,r18
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
# [532] end;
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
	pop	r13
	ret
.Lc19:
.Le9:
	.size	PFF_ss_CLUST2SECTsLONGWORDssLONGWORD, .Le9 - PFF_ss_CLUST2SECTsLONGWORDssLONGWORD

.section .text.n_pff_ss_get_clustspbytesslongword,"ax"
PFF_ss_GET_CLUSTsPBYTEssLONGWORD:
.Lc22:
# [539] begin
	push	r7
	push	r6
	push	r5
	push	r4
	push	r3
	push	r2
# Var $result located in register r18
	movw	r2,r24
# Var dir located in register r2
# Var $result located in register r18
# [543] Result := CLUST(ld_word(dir + DIR_FstClusHI)) shl 16;
	movw	r24,r2
	ldi	r18,20
	add	r24,r18
	adc	r25,r1
	call	PFF_ss_LD_WORDsPBYTEssWORD
	movw	r4,r24
	mov	r6,r1
	mov	r7,r1
# Var $result located in register r6
# [545] Result := Result or ld_word(dir + DIR_FstClusLO);
	movw	r24,r2
	ldi	r18,26
	add	r24,r18
	adc	r25,r1
	call	PFF_ss_LD_WORDsPBYTEssWORD
	or	r6,r24
	or	r7,r25
	or	r4,r1
	or	r5,r1
# [546] end;
	movw	r22,r6
	movw	r24,r4
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
# [555] begin
	push	r4
	push	r3
	push	r2
# Var $result located in register r4
# Var clst located in register r18
	movw	r2,r24
# Var dj located in register r2
# [556] dj.index := 0;
	movw	r30,r2
	st	Z,r1
	std	Z+1,r1
# Var clst located in register r22
# [557] clst := dj.sclust;
	movw	r30,r2
	ldd	r22,Z+4
	ldd	r23,Z+5
	ldd	r24,Z+6
	ldd	r25,Z+7
# [559] if (clst = 1) or (clst >= iFatFS.n_fatent) then
	cpi	r22,1
	cpc	r23,r1
	cpc	r24,r1
	cpc	r25,r1
	breq	.Lj50
	lds	r19,(U_sPFF_ss_IFATFS)
	lds	r18,(U_sPFF_ss_IFATFS+1)
	mov	r30,r19
	mov	r31,r18
	ldd	r21,Z+8
	ldd	r18,Z+9
	ldd	r19,Z+10
	ldd	r20,Z+11
	cp	r22,r21
	cpc	r23,r18
	cpc	r24,r19
	cpc	r25,r20
	brlo	.Lj52
.Lj50:
# [560] Exit(FR_DISK_ERR);
	ldi	r26,1
	mov	r4,r26
	rjmp	.Lj48
.Lj52:
# [562] if PF_FS_FAT32 and (clst = 0) and (_FS_32ONLY or (iFatFS.fs_type = FS_FAT32)) then
	cp	r22,r1
	cpc	r23,r1
	cpc	r24,r1
	cpc	r25,r1
	brne	.Lj54
# [564] clst := CLUST(iFatFS.dirbase);
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r22,Z+16
	ldd	r23,Z+17
	ldd	r24,Z+18
	ldd	r25,Z+19
.Lj54:
# Var clst located in register r22
# [567] dj.clust := clst;
	movw	r30,r2
	std	Z+8,r22
	std	Z+9,r23
	std	Z+10,r24
	std	Z+11,r25
# Var clst located in register r22
# [570] dj.sect := clust2sect(clst)
	call	PFF_ss_CLUST2SECTsLONGWORDssLONGWORD
# [569] if _FS_32ONLY or (clst <> 0) then
	movw	r30,r2
	std	Z+12,r22
	std	Z+13,r23
	std	Z+14,r24
	std	Z+15,r25
# [574] Result := FR_OK;
	mov	r4,r1
.Lj48:
# [575] end;
	mov	r24,r4
	pop	r2
	pop	r3
	pop	r4
	ret
.Lc23:
.Le11:
	.size	PFF_ss_DIR_REWINDsDIRssFRESULT, .Le11 - PFF_ss_DIR_REWINDsDIRssFRESULT

.section .text.n_pff_ss_dir_nextsdirssfresult,"ax"
PFF_ss_DIR_NEXTsDIRssFRESULT:
.Lc26:
# [586] begin
	push	r6
	push	r5
	push	r4
	push	r3
	push	r2
# Var $result located in register r6
# Var clst located in register r22
# Var i located in register r18
	mov	r5,r24
	mov	r2,r25
# Var dj located in register r5
# [587] i := dj.index + 1;
	mov	r30,r5
	mov	r31,r2
	ld	r4,Z
	ldd	r3,Z+1
	mov	r18,r1
	mov	r19,r1
	ldi	r20,1
	add	r4,r20
	adc	r3,r1
	adc	r18,r1
	adc	r19,r1
# Var i located in register r4
# [588] if (i = 0) or (dj.sect = 0) then
	cp	r4,r1
	cpc	r3,r1
	breq	.Lj57
	mov	r30,r5
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
# [590] Exit(FR_NO_FILE);
	ldi	r26,3
	mov	r6,r26
	rjmp	.Lj55
.Lj59:
# [592] if (i mod 16) = 0 then
	mov	r18,r4
	mov	r19,r3
	andi	r18,15
	cp	r18,r1
	cpc	r1,r1
	breq	.Lj74
# [620] end;
	rjmp	.Lj61
.Lj74:
# [595] Inc(dj.sect);
	mov	r30,r5
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
	mov	r30,r5
	mov	r31,r2
	std	Z+12,r20
	std	Z+13,r21
	std	Z+14,r22
	std	Z+15,r19
# [597] if dj.clust = 0 then
	mov	r30,r5
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
# [598] if i >= iFatFS.n_rootdir then
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r19,Z+4
	ldd	r18,Z+5
	cp	r4,r19
	cpc	r3,r18
	brlo	.Lj65
# [601] else
	ldi	r26,3
	mov	r6,r26
# [600] Exit(FR_NO_FILE)
	rjmp	.Lj55
.Lj65:
# [603] if ((i div 16) and (iFatFS.csize - 1)) = 0 then
	lds	r19,(U_sPFF_ss_IFATFS)
	lds	r18,(U_sPFF_ss_IFATFS+1)
	mov	r30,r19
	mov	r31,r18
	ldd	r19,Z+2
	mov	r18,r1
	subi	r19,1
	sbc	r18,r1
	mov	r20,r4
	mov	r21,r3
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
# [607] clst := get_fat(dj.clust);
	mov	r30,r5
	mov	r31,r2
	ldd	r22,Z+8
	mov	r30,r5
	mov	r31,r2
	ldd	r23,Z+9
	mov	r30,r5
	mov	r31,r2
	ldd	r24,Z+10
	mov	r30,r5
	mov	r31,r2
	ldd	r25,Z+11
	call	PFF_ss_GET_FATsLONGWORDssLONGWORD
# [608] if clst <= 1 then
	ldi	r21,1
	cp	r21,r22
	cpc	r1,r23
	cpc	r1,r24
	cpc	r1,r25
	brlo	.Lj71
# [609] Exit(FR_DISK_ERR);
	ldi	r26,1
	mov	r6,r26
	rjmp	.Lj55
.Lj71:
# [610] if clst >= iFatFS.n_fatent then
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r21,Z+8
	ldd	r18,Z+9
	ldd	r19,Z+10
	ldd	r20,Z+11
	cp	r22,r21
	cpc	r23,r18
	cpc	r24,r19
	cpc	r25,r20
	brlo	.Lj73
# [612] Exit(FR_NO_FILE);
	ldi	r26,3
	mov	r6,r26
	rjmp	.Lj55
.Lj73:
# [614] dj.clust := clst;
	mov	r30,r5
	mov	r31,r2
	std	Z+8,r22
	std	Z+9,r23
	std	Z+10,r24
	std	Z+11,r25
# [615] dj.sect := clust2sect(clst);
	call	PFF_ss_CLUST2SECTsLONGWORDssLONGWORD
	mov	r30,r5
	mov	r31,r2
	std	Z+12,r22
	std	Z+13,r23
	std	Z+14,r24
	std	Z+15,r25
.Lj61:
# Var i located in register r4
# [618] dj.index := i;
	mov	r30,r5
	mov	r31,r2
	st	Z,r4
	std	Z+1,r3
# [619] Result := FR_OK;
	mov	r6,r1
.Lj55:
	mov	r24,r6
	pop	r2
	pop	r3
	pop	r4
	pop	r5
	pop	r6
	ret
.Lc25:
.Le12:
	.size	PFF_ss_DIR_NEXTsDIRssFRESULT, .Le12 - PFF_ss_DIR_NEXTsDIRssFRESULT

.section .text.n_pff_ss_dir_findsdirspbytessfresult,"ax"
PFF_ss_DIR_FINDsDIRsPBYTEssFRESULT:
.Lc28:
# [630] begin
	push	r17
	push	r16
	push	r7
	push	r6
	push	r5
	push	r4
	push	r3
	push	r2
# Var $result located in register r18
# Var c located in register r7
	movw	r2,r24
# Var dj located in register r2
	movw	r4,r22
# Var dir located in register r4
# [632] Result := dir_rewind(dj);
	movw	r24,r2
	call	PFF_ss_DIR_REWINDsDIRssFRESULT
	mov	r6,r24
# Var $result located in register r6
# [633] if Result <> FR_OK then
	cp	r6,r1
	breq	.Lj92
# [657] end;
	rjmp	.Lj77
.Lj92:
.Lj81:
# [639] if disk_readp(dir, dj.sect, (dj.index mod 16) * 32, 32) <> RES_OK then
	movw	r30,r2
	ld	r18,Z
	ldd	r19,Z+1
	andi	r18,15
	mov	r19,r1
	mov	r21,r1
	mov	r20,r1
	ldi	r22,5
.Lj84:
	lsl	r18
	rol	r19
	rol	r21
	rol	r20
	dec	r22
	brne	.Lj84
	movw	r30,r2
	ldd	r20,Z+12
	movw	r30,r2
	ldd	r21,Z+13
	movw	r30,r2
	ldd	r22,Z+14
	movw	r30,r2
	ldd	r23,Z+15
	ldi	r16,32
	mov	r17,r1
	movw	r24,r4
	call	DISK_IO_ss_DISK_READPsPBYTEsLONGWORDsNATIVEUINTsNATIVEUINTssDRESULT
	cp	r24,r1
	breq	.Lj86
# [640] Exit(FRESULT.FR_DISK_ERR);
	ldi	r26,1
	mov	r6,r26
	rjmp	.Lj77
.Lj86:
# [642] c := dir[DIR_Name];
	movw	r30,r4
	ld	r7,Z
# [643] if c = 0 then
	cp	r7,r1
	brne	.Lj88
# [646] Result := FR_NO_FILE;
	ldi	r26,3
	mov	r6,r26
# [647] break;
	rjmp	.Lj77
.Lj88:
# [651] if ((dir[DIR_Attr] and AM_VOL) = 0) and (mem_cmp(PChar(dir), PChar(dj.fn), 11) = 0) then
	movw	r30,r4
	ldd	r18,Z+11
	andi	r18,8
	brne	.Lj90
	movw	r30,r2
	ldd	r22,Z+2
	movw	r30,r2
	ldd	r23,Z+3
	ldi	r20,11
	mov	r21,r1
	movw	r24,r4
	call	PFF_ss_MEM_CMPsPCHARsPCHARsSMALLINTssSMALLINT
	cp	r24,r1
	cpc	r25,r1
	breq	.Lj77
.Lj90:
# [654] Result := dir_next(dj);
	movw	r24,r2
	call	PFF_ss_DIR_NEXTsDIRssFRESULT
	mov	r6,r24
# [656] until Result <> FR_OK;
	cp	r6,r1
	brne	.Lj93
	rjmp	.Lj81
.Lj93:
.Lj77:
	mov	r24,r6
	pop	r2
	pop	r3
	pop	r4
	pop	r5
	pop	r6
	pop	r7
	pop	r16
	pop	r17
	ret
.Lc27:
.Le13:
	.size	PFF_ss_DIR_FINDsDIRsPBYTEssFRESULT, .Le13 - PFF_ss_DIR_FINDsDIRsPBYTEssFRESULT

.section .text.n_pff_ss_dir_readsdirspbytessfresult,"ax"
PFF_ss_DIR_READsDIRsPBYTEssFRESULT:
.Lc30:
# [668] begin
	push	r17
	push	r16
	push	r8
	push	r7
	push	r6
	push	r5
	push	r4
	push	r3
	push	r2
# Var $result located in register r18
# Var a located in register r7
# Var c located in register r6
	mov	r4,r24
	mov	r2,r25
# Var dj located in register r4
	mov	r8,r22
	mov	r5,r23
# Var dir located in register r8
# Var $result located in register r3
# [669] Result := FR_NO_FILE;
	ldi	r26,3
	mov	r3,r26
# [670] while dj.sect <> 0 do
	rjmp	.Lj97
.Lj96:
# [673] if disk_readp(dir, dj.sect, (dj.index mod 16) * 32, 32) <> DRESULT.RES_OK then
	mov	r30,r4
	mov	r31,r2
	ld	r18,Z
	ldd	r19,Z+1
	andi	r18,15
	mov	r19,r1
	mov	r21,r1
	mov	r20,r1
	ldi	r22,5
.Lj99:
	lsl	r18
	rol	r19
	rol	r21
	rol	r20
	dec	r22
	brne	.Lj99
	mov	r30,r4
	mov	r31,r2
	ldd	r20,Z+12
	mov	r30,r4
	mov	r31,r2
	ldd	r21,Z+13
	mov	r30,r4
	mov	r31,r2
	ldd	r22,Z+14
	mov	r30,r4
	mov	r31,r2
	ldd	r23,Z+15
	ldi	r16,32
	mov	r17,r1
	mov	r24,r8
	mov	r25,r5
	call	DISK_IO_ss_DISK_READPsPBYTEsLONGWORDsNATIVEUINTsNATIVEUINTssDRESULT
	cp	r24,r1
	breq	.Lj101
# [675] Result := FR_DISK_ERR;
	ldi	r26,1
	mov	r3,r26
# [676] break;
	rjmp	.Lj98
.Lj101:
# [679] Result := FR_OK;
	mov	r3,r1
# [681] c := dir[DIR_Name];
	mov	r30,r8
	mov	r31,r5
	ld	r6,Z
# [682] if c = 0 then
	cp	r6,r1
	brne	.Lj104
# [685] Result := FR_NO_FILE;
	ldi	r26,3
	mov	r3,r26
# [686] break;
	rjmp	.Lj98
.Lj104:
# [688] a := dir[DIR_Attr] and AM_MASK;
	mov	r30,r8
	mov	r31,r5
	ldd	r18,Z+11
	andi	r18,63
	mov	r7,r18
# [691] if (c <> $E5) and (c <> Ord('.')) and ((a and AM_VOL) = 0) then
	ldi	r26,-27
	cp	r6,r26
	breq	.Lj106
	ldi	r26,46
	cp	r6,r26
	breq	.Lj106
	mov	r18,r7
	andi	r18,8
	breq	.Lj98
.Lj106:
# [694] Result := dir_next(dj);
	mov	r24,r4
	mov	r25,r2
	call	PFF_ss_DIR_NEXTsDIRssFRESULT
	mov	r3,r24
# [695] if Result <> FR_OK then
	cp	r3,r1
	brne	.Lj98
.Lj97:
	mov	r30,r4
	mov	r31,r2
	ldd	r18,Z+12
	ldd	r19,Z+13
	ldd	r20,Z+14
	ldd	r21,Z+15
	cp	r18,r1
	cpc	r19,r1
	cpc	r20,r1
	cpc	r21,r1
	breq	.Lj113
# [701] end;
	rjmp	.Lj96
.Lj113:
.Lj98:
# [699] if Result <> FR_OK then
	cp	r3,r1
	breq	.Lj112
# [700] dj.sect := 0;
	mov	r30,r4
	mov	r31,r2
	std	Z+12,r1
	std	Z+13,r1
	std	Z+14,r1
	std	Z+15,r1
.Lj112:
	mov	r24,r3
	pop	r2
	pop	r3
	pop	r4
	pop	r5
	pop	r6
	pop	r7
	pop	r8
	pop	r16
	pop	r17
	ret
.Lc29:
.Le14:
	.size	PFF_ss_DIR_READsDIRsPBYTEssFRESULT, .Le14 - PFF_ss_DIR_READsDIRsPBYTEssFRESULT

.section .text.n_pff_ss_create_namesdirspcharssfresult,"ax"
PFF_ss_CREATE_NAMEsDIRsPCHARssFRESULT:
.Lc32:
# [715] begin
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
# [717] sfn := dj.fn;
	movw	r30,r24
	ldd	r18,Z+2
	ldd	r19,Z+3
# [718] mem_set(PChar(sfn), ' ', 11);
	ldi	r20,11
	mov	r21,r1
	ldi	r22,32
	movw	r2,r18
# Var sfn located in register r2
	movw	r24,r2
	call	PFF_ss_MEM_SETsPCHARsCHARsSMALLINT
# Var si located in register r4
# [719] si := 0;
	mov	r4,r1
# Var i located in register r5
# [720] i := 0;
	mov	r5,r1
# Var ni located in register r6
# [721] ni := 8;
	ldi	r26,8
	mov	r6,r26
# Var p located in register r7
# [722] p := PByte(path);
	mov	r30,r12
	mov	r31,r11
	ld	r7,Z
	ldd	r8,Z+1
.Lj116:
# [725] c := p[si];
	mov	r30,r7
	mov	r31,r8
	add	r30,r4
	adc	r31,r1
	ld	r9,Z
# [726] Inc(si);
	inc	r4
# [727] if (c <= Ord(' ')) or (c = Ord('/')) then
	ldi	r18,32
	cp	r18,r9
	brlo	.Lj136
# [771] end;
	rjmp	.Lj118
.Lj136:
	ldi	r26,47
	cp	r9,r26
	brne	.Lj137
	rjmp	.Lj118
.Lj137:
# [731] if (c = Ord('.')) or (i >= ni) then
	ldi	r26,46
	cp	r9,r26
	breq	.Lj122
	cp	r5,r6
	brlo	.Lj124
.Lj122:
# [733] if (ni <> 8) or (c <> Ord('.')) then
	ldi	r26,8
	cp	r6,r26
	breq	.Lj138
	rjmp	.Lj118
.Lj138:
	ldi	r26,46
	cp	r9,r26
	breq	.Lj139
	rjmp	.Lj118
.Lj139:
# [735] i := 8;
	ldi	r26,8
	mov	r5,r26
# [736] ni := 11;
	ldi	r26,11
	mov	r6,r26
# [737] continue;
	rjmp	.Lj116
.Lj124:
# [746] if IsDBCS1(c) and (i < ni - 1) then
	mov	r24,r9
	mov	r25,r1
	call	PFF_ss_ISDBCS1sSMALLINTssBOOLEAN
	cp	r24,r1
	breq	.Lj133
	mov	r20,r6
	mov	r18,r1
	subi	r20,1
	sbc	r18,r1
	cp	r5,r20
	cpc	r1,r18
	brge	.Lj133
# [749] d := p[si];
	mov	r30,r7
	mov	r31,r8
	add	r30,r4
	adc	r31,r1
	ld	r10,Z
# [750] Inc(si);
	inc	r4
# [751] sfn[i] := c;
	movw	r30,r2
	add	r30,r5
	adc	r31,r1
	st	Z,r9
# [752] Inc(i);
	inc	r5
# [753] sfn[i] := d;
	movw	r30,r2
	add	r30,r5
	adc	r31,r1
	st	Z,r10
# [754] Inc(i);
	inc	r5
	rjmp	.Lj116
.Lj133:
# [762] sfn[i] := c;
	movw	r30,r2
	add	r30,r5
	adc	r31,r1
	st	Z,r9
# [763] Inc(i);
	inc	r5
# [723] while True do
	rjmp	.Lj116
.Lj118:
# [767] path := @p[si];
	mov	r20,r7
	mov	r21,r8
	add	r20,r4
	adc	r21,r1
	mov	r30,r12
	mov	r31,r11
	st	Z,r20
	std	Z+1,r21
# [769] sfn[11] := byte(c <= Ord(' '));
	ldi	r18,32
	cp	r18,r9
	ldi	r18,1
	brsh	.Lj135
	mov	r18,r1
.Lj135:
	movw	r30,r2
	std	Z+11,r18
# Var $result located in register r24
# [770] Result := FR_OK;
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
# [783] begin
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
# [784] p := fno.fname;
	ldi	r18,lo8(9)
	ldi	r19,hi8(9)
	add	r18,r7
	adc	r19,r6
# Var p located in register r2
	movw	r2,r18
# [785] if dj.sect <> 0 then
	movw	r30,r24
	ldd	r18,Z+12
	ldd	r19,Z+13
	ldd	r20,Z+14
	ldd	r21,Z+15
	cp	r18,r1
	cpc	r19,r1
	cpc	r20,r1
	cpc	r21,r1
	brne	.Lj158
# [822] end;
	rjmp	.Lj143
.Lj158:
# [788] for i := 0 to Pred(8) do
	ldi	r19,-1
.Lj144:
	inc	r19
# [790] c := dir[i];
	movw	r30,r4
	add	r30,r19
	adc	r31,r1
	ld	r21,Z
# [791] if c = Ord(' ') then
	cpi	r21,32
	breq	.Lj146
# [793] if c = $05 then
	cpi	r21,5
	brne	.Lj150
# [794] c := $E5;
	ldi	r21,-27
.Lj150:
# [795] p^ := char(c);
	movw	r30,r2
	st	Z,r21
# [796] Inc(p);
	ldi	r18,1
	add	r2,r18
	adc	r3,r1
	cpi	r19,7
	brlo	.Lj144
.Lj146:
# [798] if dir[8] <> Ord(' ') then
	movw	r30,r4
	ldd	r18,Z+8
	cpi	r18,32
	breq	.Lj152
# [801] p^ := '.';
	ldi	r18,46
	movw	r30,r2
	st	Z,r18
# [802] Inc(p);
	ldi	r18,1
	add	r2,r18
	adc	r3,r1
# [803] for i := 8 to Pred(11) do
	ldi	r19,7
.Lj153:
	inc	r19
# [805] c := dir[i];
	movw	r30,r4
	add	r30,r19
	adc	r31,r1
	ld	r21,Z
# [806] if c = Ord(' ') then
	cpi	r21,32
	breq	.Lj152
# [808] p^ := char(c);
	movw	r30,r2
	st	Z,r21
# [809] Inc(p);
	ldi	r18,1
	add	r2,r18
	adc	r3,r1
	cpi	r19,10
	brlo	.Lj153
.Lj152:
# [813] fno.fattrib := dir[DIR_Attr];
	movw	r30,r4
	adiw	r30,11
	ldi	r18,lo8(8)
	ldi	r19,hi8(8)
	add	r18,r7
	adc	r19,r6
	movw	r26,r18
	ld	r0,Z
	st	X,r0
# [815] fno.fsize := ld_dword(dir + DIR_FileSize);
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
# [817] fno.fdate := ld_word(dir + DIR_WrtDate);
	movw	r24,r4
	ldi	r18,24
	add	r24,r18
	adc	r25,r1
	call	PFF_ss_LD_WORDsPBYTEssWORD
	mov	r30,r7
	mov	r31,r6
	std	Z+4,r24
	std	Z+5,r25
# [819] fno.ftime := ld_word(dir + DIR_WrtTime);
	movw	r24,r4
	ldi	r18,22
	add	r24,r18
	adc	r25,r1
	call	PFF_ss_LD_WORDsPBYTEssWORD
	mov	r30,r7
	mov	r31,r6
	std	Z+6,r24
	std	Z+7,r25
.Lj143:
# Var p located in register r2
# [821] p^ := char(0);
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
# [833] begin
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
# Var $result located in register r6
	movw	r2,r24
# Var dj located in register r2
	movw	r4,r22
# Var dir located in register r4
	std	Y+2,r20
	std	Y+3,r21
# [835] while path^ = ' ' do
	rjmp	.Lj162
.Lj161:
# [836] Inc(path);
	ldd	r20,Y+2
	ldd	r19,Y+3
	ldi	r18,1
	add	r20,r18
	adc	r19,r1
	std	Y+2,r20
	std	Y+3,r19
.Lj162:
	ldd	r18,Y+2
	ldd	r19,Y+3
	movw	r30,r18
	ld	r18,Z
	cpi	r18,32
	breq	.Lj161
# [838] if path^ = '/' then
	ldd	r18,Y+2
	ldd	r19,Y+3
	movw	r30,r18
	ld	r18,Z
	cpi	r18,47
	brne	.Lj165
# [839] Inc(path);
	ldd	r19,Y+2
	ldd	r20,Y+3
	ldi	r18,1
	add	r19,r18
	adc	r20,r1
	std	Y+2,r19
	std	Y+3,r20
.Lj165:
# [841] dj.sclust := 0;
	movw	r30,r2
	std	Z+4,r1
	std	Z+5,r1
	std	Z+6,r1
	std	Z+7,r1
# [843] if path^ < ' ' then
	ldd	r18,Y+2
	ldd	r19,Y+3
	movw	r30,r18
	ld	r18,Z
	cpi	r18,32
	brsh	.Lj169
# [846] Result := dir_rewind(dj);
	movw	r24,r2
	call	PFF_ss_DIR_REWINDsDIRssFRESULT
	mov	r6,r24
# [847] dir[0] := 0;
	movw	r30,r4
	st	Z,r1
	rjmp	.Lj168
.Lj169:
# [855] Result := create_name(dj, path);
	ldi	r22,lo8(2)
	ldi	r23,hi8(2)
	add	r22,r28
	adc	r23,r29
	movw	r24,r2
	call	PFF_ss_CREATE_NAMEsDIRsPCHARssFRESULT
	mov	r6,r24
# [856] if Result <> FR_OK then
	cp	r6,r1
	breq	.Lj180
# [876] end;
	rjmp	.Lj168
.Lj180:
# [859] Result := dir_find(dj, dir);
	movw	r24,r2
	movw	r22,r4
	call	PFF_ss_DIR_FINDsDIRsPBYTEssFRESULT
	mov	r6,r24
# [860] if Result <> FR_OK then
	cp	r6,r1
	brne	.Lj168
# [863] if dj.fn[11] <> 0 then
	movw	r30,r2
	ldd	r18,Z+2
	ldd	r19,Z+3
	movw	r30,r18
	ldd	r18,Z+11
	cp	r18,r1
	brne	.Lj168
# [866] if (dir[DIR_Attr] = 0) and (AM_DIR <> 0) then
	movw	r30,r4
	ldd	r18,Z+11
	cp	r18,r1
	brne	.Lj179
# [869] Result := FR_NO_FILE;
	ldi	r26,3
	mov	r6,r26
# [870] break;
	rjmp	.Lj168
.Lj179:
# [873] dj.sclust := get_clust(dir);
	movw	r24,r4
	call	PFF_ss_GET_CLUSTsPBYTEssLONGWORD
	movw	r30,r2
	std	Z+4,r22
	std	Z+5,r23
	std	Z+6,r24
	std	Z+7,r25
# [852] while True do
	rjmp	.Lj169
.Lj168:
	mov	r24,r6
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
# [887] begin
	push	r17
	push	r16
	push	r8
	push	r7
	push	r6
	push	r5
	push	r4
	push	r3
	push	r2
# Var $result located in register r8
	movw	r2,r24
# Var buf located in register r2
	movw	r4,r20
	movw	r6,r22
# Var sect located in register r4
# [889] if disk_readp(buf, sect, 510, 2) <> RES_OK then
	ldi	r16,2
	mov	r17,r1
	ldi	r18,-2
	ldi	r19,1
	movw	r20,r4
	movw	r22,r6
	movw	r24,r2
	call	DISK_IO_ss_DISK_READPsPBYTEsLONGWORDsNATIVEUINTsNATIVEUINTssDRESULT
	cp	r24,r1
	breq	.Lj184
# [890] Exit(3);
	ldi	r26,3
	mov	r8,r26
	rjmp	.Lj181
.Lj184:
# [892] if (buf[0] <> $55) or (buf[1] <> $AA) then
	movw	r30,r2
	ld	r18,Z
	cpi	r18,85
	brne	.Lj185
	movw	r30,r2
	ldd	r18,Z+1
	cpi	r18,-86
	breq	.Lj189
.Lj185:
# [893] Exit(2);
	ldi	r26,2
	mov	r8,r26
	rjmp	.Lj181
.Lj189:
# [899] if PF_FS_FAT32 and (disk_readp(buf, sect, BS_FilSysType32, 2) = RES_OK) then
	ldi	r16,2
	mov	r17,r1
	ldi	r18,82
	mov	r19,r1
	movw	r20,r4
	movw	r22,r6
	movw	r24,r2
	call	DISK_IO_ss_DISK_READPsPBYTEsLONGWORDsNATIVEUINTsNATIVEUINTssDRESULT
	cp	r24,r1
	brne	.Lj195
# [900] if (buf[0] = $46) and (buf[1] = $41) then
	movw	r30,r2
	ld	r18,Z
	cpi	r18,70
	brne	.Lj195
	movw	r30,r2
	ldd	r18,Z+1
	cpi	r18,65
	brne	.Lj195
# [901] Exit(0);
	mov	r8,r1
	rjmp	.Lj181
.Lj195:
# [903] Result := 1;
	ldi	r26,1
	mov	r8,r26
.Lj181:
# [904] end;
	mov	r24,r8
	pop	r2
	pop	r3
	pop	r4
	pop	r5
	pop	r6
	pop	r7
	pop	r8
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
# Temps allocated between r28+38 and r28+40
# [911] begin
	push	r29
	push	r28
	push	r17
	push	r16
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
	subi	r28,40
	sbci	r29,0
	in	r0,63
	cli
	out	62,r29
	out	63,r0
	out	61,r28
# Var $result located in register r14
# Var fmt located in register r18
# Var buf located at r28+2, size=OS_NO
# Var bsect located in register r18
# Var fsize located in register r18
# Var tsect located in register r18
# Var mclst located in register r18
	std	Y+38,r24
	std	Y+39,r25
# Var fs located in register r18
# [912] iFatFs := nil;
	sts	(U_sPFF_ss_IFATFS),r1
	sts	(U_sPFF_ss_IFATFS+1),r1
# [914] if (disk_initialize() and STA_NOINIT) <> 0 then
	call	DISK_IO_ss_DISK_INITIALIZEssBYTE
	andi	r24,1
	breq	.Lj203
# [915] Exit(FR_NOT_READY);
	ldi	r26,2
	mov	r14,r26
	rjmp	.Lj200
.Lj203:
# Var bsect located in register r18
# [920] fmt := check_fs(@buf, bsect);
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
# [921] if fmt = 1 then
	ldi	r26,1
	cp	r2,r26
	breq	.Lj227
# [997] end;
	rjmp	.Lj205
.Lj227:
# [925] if disk_readp(@buf, bsect, MBR_Table, 16) <> RES_OK then
	ldi	r24,lo8(2)
	ldi	r25,hi8(2)
	add	r24,r28
	adc	r25,r29
	ldi	r16,16
	mov	r17,r1
	ldi	r18,-66
	ldi	r19,1
	mov	r20,r9
	mov	r21,r8
	mov	r22,r7
	mov	r23,r6
	call	DISK_IO_ss_DISK_READPsPBYTEsLONGWORDsNATIVEUINTsNATIVEUINTssDRESULT
	cp	r24,r1
	breq	.Lj207
# [927] fmt := 3
	ldi	r26,3
	mov	r2,r26
	rjmp	.Lj205
.Lj207:
# [930] if buf[4] <> 0 then
	ldd	r18,Y+6
	cp	r18,r1
	breq	.Lj205
# [933] bsect := ld_dword(@buf[8]);
	ldi	r24,lo8(10)
	ldi	r25,hi8(10)
	add	r24,r28
	adc	r25,r29
	call	PFF_ss_LD_DWORDsPBYTEssLONGWORD
	mov	r9,r22
	mov	r8,r23
	mov	r7,r24
	mov	r6,r25
# [935] fmt := check_fs(@buf, bsect);
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
.Lj205:
# [938] if fmt = 3 then
	ldi	r26,3
	cp	r2,r26
	brne	.Lj212
# [939] Exit(FR_DISK_ERR);
	ldi	r26,1
	mov	r14,r26
	rjmp	.Lj200
.Lj212:
# [940] if fmt <> 0 then
	cp	r2,r1
	breq	.Lj214
# [942] Exit(FR_NO_FILESYSTEM);
	ldi	r26,6
	mov	r14,r26
	rjmp	.Lj200
.Lj214:
# [945] if disk_readp(@buf, bsect, 13, sizeof(buf)) <> RES_OK then
	ldi	r24,lo8(2)
	ldi	r25,hi8(2)
	add	r24,r28
	adc	r25,r29
	ldi	r16,36
	mov	r17,r1
	ldi	r18,13
	mov	r19,r1
	mov	r20,r9
	mov	r21,r8
	mov	r22,r7
	mov	r23,r6
	call	DISK_IO_ss_DISK_READPsPBYTEsLONGWORDsNATIVEUINTsNATIVEUINTssDRESULT
	cp	r24,r1
	breq	.Lj216
# [946] Exit(FR_DISK_ERR);
	ldi	r26,1
	mov	r14,r26
	rjmp	.Lj200
.Lj216:
# [949] fsize := ld_word(PByte(@buf) + (BPB_FATSz16 - 13));
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
# [950] if fsize = 0 then
	cp	r5,r1
	cpc	r4,r1
	cpc	r3,r1
	cpc	r2,r1
	brne	.Lj218
# [951] fsize := ld_dword(PByte(@buf) + (BPB_FATSz32 - 13));
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
.Lj218:
# [954] fsize := fsize * (buf[BPB_NumFATs - 13]);
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
# Var fsize located in register r13
	mov	r13,r22
	mov	r12,r23
	mov	r11,r24
	mov	r10,r25
# [956] fs.fatbase := bsect + ld_word(PByte(@buf) + (BPB_RsvdSecCnt - 13));
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
# [958] fs.csize := buf[BPB_SecPerClus - 13];
	ldd	r18,Y+38
	mov	r30,r18
	ldd	r18,Y+39
	mov	r31,r18
	adiw	r30,2
	ldd	r0,Y+2
	st	Z,r0
# [960] fs.n_rootdir := ld_word(PByte(@buf) + (BPB_RootEntCnt - 13));
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
# [962] tsect := ld_word(PByte(@buf) + (BPB_TotSec16 - 13));
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
# [964] if tsect = 0 then
	cp	r5,r1
	cpc	r4,r1
	cpc	r3,r1
	cpc	r2,r1
	brne	.Lj220
# [965] tsect := ld_dword(PByte(@buf) + (BPB_TotSec32 - 13));
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
.Lj220:
# [968] mclst := (tsect - ld_word(PByte(@buf) + (BPB_RsvdSecCnt - 13)) -
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
	sub	r18,r13
	sbc	r19,r12
	sbc	r20,r11
	sbc	r21,r10
# [969] fsize - fs.n_rootdir div 16) div fs.csize + 2;
	ldd	r22,Y+38
	mov	r30,r22
	ldd	r22,Y+39
	mov	r31,r22
	ldd	r24,Z+4
	ldd	r25,Z+5
	ldi	r22,4
.Lj221:
	lsr	r25
	ror	r24
	dec	r22
	brne	.Lj221
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
# [970] fs.n_fatent := CLUST(mclst);
	ldd	r18,Y+38
	mov	r30,r18
	ldd	r18,Y+39
	mov	r31,r18
	std	Z+8,r22
	std	Z+9,r23
	std	Z+10,r24
	std	Z+11,r25
# Var fmt located in register r18
# [972] fmt := 0;
	mov	r18,r1
# [979] if PF_FS_FAT32 and (mclst >= $FFF7) then
	cpi	r22,-9
	ldi	r19,-1
	cpc	r23,r19
	cpc	r24,r1
	cpc	r25,r1
	brlo	.Lj223
# [980] fmt := FS_FAT32;
	ldi	r18,3
.Lj223:
# [981] if fmt = 0 then
	cp	r18,r1
	brne	.Lj225
# [982] Exit(FR_NO_FILESYSTEM);
	ldi	r26,6
	mov	r14,r26
	rjmp	.Lj200
.Lj225:
# Var fmt located in register r18
# [984] fs.fs_type := fmt;
	ldd	r19,Y+38
	mov	r30,r19
	ldd	r19,Y+39
	mov	r31,r19
	st	Z,r18
# [987] fs.dirbase := ld_dword(PByte(@buf) + (BPB_RootClus - 13))
	ldi	r24,lo8(2)
	ldi	r25,hi8(2)
	add	r24,r28
	adc	r25,r29
	ldi	r18,31
	add	r24,r18
	adc	r25,r1
	call	PFF_ss_LD_DWORDsPBYTEssLONGWORD
# [985] if _FS_32ONLY or (PF_FS_FAT32 and (fmt = FS_FAT32)) then
	ldd	r18,Y+38
	mov	r30,r18
	ldd	r18,Y+39
	mov	r31,r18
	std	Z+16,r22
	std	Z+17,r23
	std	Z+18,r24
	std	Z+19,r25
# [992] fs.database := fs.fatbase + fsize + fs.n_rootdir div 16;
	ldd	r18,Y+38
	mov	r30,r18
	ldd	r18,Y+39
	mov	r31,r18
	ldd	r19,Z+4
	ldd	r25,Z+5
	ldi	r18,4
.Lj226:
	lsr	r25
	ror	r19
	dec	r18
	brne	.Lj226
	ldd	r18,Y+38
	mov	r30,r18
	ldd	r18,Y+39
	mov	r31,r18
	ldd	r20,Z+12
	ldd	r21,Z+13
	ldd	r18,Z+14
	ldd	r22,Z+15
	mov	r2,r13
	mov	r3,r12
	mov	r4,r11
	mov	r5,r10
	add	r2,r20
	adc	r3,r21
	adc	r4,r18
	adc	r5,r22
	add	r2,r19
	adc	r3,r25
	adc	r4,r1
	adc	r5,r1
	ldd	r18,Y+38
	mov	r30,r18
	ldd	r18,Y+39
	mov	r31,r18
	std	Z+20,r2
	std	Z+21,r3
	std	Z+22,r4
	std	Z+23,r5
# [994] fs.flag := 0;
	ldd	r18,Y+38
	mov	r30,r18
	ldd	r18,Y+39
	mov	r31,r18
	std	Z+1,r1
# [995] iFatFs := @fs;
	ldd	r18,Y+38
	sts	(U_sPFF_ss_IFATFS),r18
	ldd	r18,Y+39
	sts	(U_sPFF_ss_IFATFS+1),r18
# [996] Result := FR_OK;
	mov	r14,r1
.Lj200:
	mov	r24,r14
	subi	r28,-40
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
# [1004] begin
	push	r29
	push	r28
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
# Var $result located in register r2
# Var dj located at r28+2, size=OS_NO
# Var sp located at r28+18, size=OS_NO
# Var dir located at r28+30, size=OS_NO
	movw	r20,r24
# Var path located in register r20
# [347] {$define CHECK_FS_ENABLED := begin if iFatFs = nil then Exit(FR_NOT_ENABLED); end}
	lds	r19,(U_sPFF_ss_IFATFS)
	lds	r18,(U_sPFF_ss_IFATFS+1)
	cp	r19,r1
	cpc	r18,r1
	brne	.Lj231
	ldi	r26,5
	mov	r2,r26
	rjmp	.Lj228
.Lj231:
# [1008] iFatFS.flag := 0;
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	std	Z+1,r1
# [1009] dj.fn := sp;
	ldi	r19,lo8(18)
	ldi	r18,hi8(18)
	add	r19,r28
	adc	r18,r29
	std	Y+4,r19
	std	Y+5,r18
# [1011] Result := follow_path(dj, dir, path);
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
	mov	r2,r24
# [1013] if Result <> FR_OK then
	cp	r2,r1
	breq	.Lj237
# [1027] end;
	rjmp	.Lj228
.Lj237:
# [1016] if (dir[0] = 0) or ((dir[DIR_Attr] and AM_DIR) <> 0) then
	ldd	r18,Y+30
	cp	r18,r1
	breq	.Lj234
	ldd	r18,Y+41
	andi	r18,16
	breq	.Lj236
.Lj234:
# [1017] Exit(FR_NO_FILE);
	ldi	r26,3
	mov	r2,r26
	rjmp	.Lj228
.Lj236:
# [1020] iFatFS.org_clust := get_clust(dir);
	ldi	r24,lo8(30)
	ldi	r25,hi8(30)
	add	r24,r28
	adc	r25,r29
	call	PFF_ss_GET_CLUSTsPBYTEssLONGWORD
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	std	Z+32,r22
	std	Z+33,r23
	std	Z+34,r24
	std	Z+35,r25
# [1022] iFatFS.fsize := ld_dword(PByte(@dir) + DIR_FileSize);
	ldi	r24,lo8(30)
	ldi	r25,hi8(30)
	add	r24,r28
	adc	r25,r29
	ldi	r18,28
	add	r24,r18
	adc	r25,r1
	call	PFF_ss_LD_DWORDsPBYTEssLONGWORD
	lds	r19,(U_sPFF_ss_IFATFS)
	lds	r18,(U_sPFF_ss_IFATFS+1)
	mov	r30,r19
	mov	r31,r18
	std	Z+28,r22
	std	Z+29,r23
	std	Z+30,r24
	std	Z+31,r25
# [1024] iFatFS.fptr := 0;
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r23,(U_sPFF_ss_IFATFS+1)
	mov	r30,r18
	mov	r31,r23
	std	Z+24,r1
	std	Z+25,r1
	std	Z+26,r1
	std	Z+27,r1
# [1025] iFatFS.flag := FA_OPENED;
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	ldi	r20,1
	movw	r30,r18
	std	Z+1,r20
# [1026] Result := FR_OK;
	mov	r2,r1
.Lj228:
	mov	r24,r2
	subi	r28,-62
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
.Lc41:
.Le20:
	.size	PFF_ss_PF_OPENsPCHARssFRESULT, .Le20 - PFF_ss_PF_OPENsPCHARssFRESULT

.section .text.n_pff_ss_pf_readspointersnativeuintsnativeuintssfresult,"ax"
.globl	PFF_ss_PF_READsPOINTERsNATIVEUINTsNATIVEUINTssFRESULT
PFF_ss_PF_READsPOINTERsNATIVEUINTsNATIVEUINTssFRESULT:
.Lc44:
# Temps allocated between r28+2 and r28+9
# [1038] begin
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
	subi	r28,9
	sbci	r29,0
	in	r0,63
	cli
	out	62,r29
	out	63,r0
	out	61,r28
# Var $result located in register r18
# Var dr located in register r4
# Var clst located in register r13
# Var sect located in register r9
# Var remain located in register r18
# Var rcnt located in register r3
# Var cs located in register r5
# Var rbuff located in register r18
# Var buff located in register r24
	std	Y+5,r22
	std	Y+6,r23
# Var btr located in register r18
	std	Y+3,r20
	std	Y+4,r21
# Var br located in register r18
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	cp	r18,r1
	cpc	r19,r1
	brne	.Lj241
	ldi	r26,5
	std	Y+2,r26
	rjmp	.Lj238
.Lj241:
# [1043] if (iFatFS.flag and FA_OPENED) = 0 then
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r18,Z+1
	andi	r18,1
	brne	.Lj243
# [1044] Exit(FR_NOT_OPENED);
	ldi	r26,4
	std	Y+2,r26
	rjmp	.Lj238
.Lj243:
# Var rbuff located in register r18
# Var buff located in register r24
# [1046] rbuff := buff;
	std	Y+7,r24
	std	Y+8,r25
# [1047] br := 0;
	ldd	r18,Y+3
	mov	r30,r18
	ldd	r18,Y+4
	mov	r31,r18
	st	Z,r1
	std	Z+1,r1
# [1049] remain := iFatFS.fsize - iFatFS.fptr;
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	lds	r20,(U_sPFF_ss_IFATFS)
	lds	r21,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r22,Z+28
	ldd	r25,Z+29
	ldd	r23,Z+30
	ldd	r24,Z+31
	movw	r30,r20
	ldd	r18,Z+24
	ldd	r21,Z+25
	ldd	r19,Z+26
	ldd	r20,Z+27
	sub	r22,r18
	sbc	r25,r21
	sbc	r23,r19
	sbc	r24,r20
# Var remain located in register r22
# [1050] if btr > remain then
	ldd	r18,Y+5
	mov	r21,r18
	ldd	r18,Y+6
	cp	r22,r21
	cpc	r25,r18
	cpc	r23,r1
	cpc	r24,r1
	brlo	.Lj269
# [1102] end;
	rjmp	.Lj247
.Lj269:
# [1052] btr := UINT(remain);
	std	Y+5,r22
	std	Y+6,r25
# [1055] while btr <> 0 do
	rjmp	.Lj247
.Lj246:
# [1058] if (iFatFS.fptr and (SECTOR_SIZE - 1)) = 0 then
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
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
	breq	.Lj270
	rjmp	.Lj250
.Lj270:
# [1061] cs := byte((iFatFS.fptr shr SECTOR_SIZE_BP) and (iFatFS.csize - 1));
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r19,Z+2
	mov	r18,r1
	subi	r19,1
	sbc	r18,r1
	mov	r21,r19
	mov	r22,r18
	mov	r20,r1
	sbrc	r18,7
	com	r20
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r18,Z+24
	ldd	r18,Z+25
	ldd	r19,Z+26
	ldd	r25,Z+27
	mov	r24,r18
	mov	r18,r25
	lsr	r18
	ror	r19
	ror	r24
	mov	r14,r24
	mov	r24,r19
	mov	r19,r18
	mov	r18,r1
	and	r14,r21
	and	r24,r22
	and	r19,r20
	and	r18,r20
	mov	r5,r14
# [1063] if cs = 0 then
	cp	r5,r1
	breq	.Lj271
	rjmp	.Lj252
.Lj271:
# [1066] if iFatFS.fptr = 0 then
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r18,Z+24
	ldd	r21,Z+25
	ldd	r19,Z+26
	ldd	r20,Z+27
	cp	r18,r1
	cpc	r21,r1
	cpc	r19,r1
	cpc	r20,r1
	brne	.Lj254
# [1067] clst := iFatFS.org_clust
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r13,Z+32
	ldd	r12,Z+33
	ldd	r11,Z+34
	ldd	r10,Z+35
	rjmp	.Lj255
.Lj254:
# [1069] clst := get_fat(iFatFS.curr_clust);
	lds	r19,(U_sPFF_ss_IFATFS)
	lds	r18,(U_sPFF_ss_IFATFS+1)
	mov	r30,r19
	mov	r31,r18
	ldd	r22,Z+36
	mov	r30,r19
	mov	r31,r18
	ldd	r23,Z+37
	mov	r30,r19
	mov	r31,r18
	ldd	r24,Z+38
	mov	r30,r19
	mov	r31,r18
	ldd	r25,Z+39
	call	PFF_ss_GET_FATsLONGWORDssLONGWORD
	mov	r13,r22
	mov	r12,r23
	mov	r11,r24
	mov	r10,r25
.Lj255:
# [1070] if clst <= 1 then
	ldi	r21,1
	cp	r21,r13
	cpc	r1,r12
	cpc	r1,r11
	cpc	r1,r10
	brlo	.Lj257
# [346] {$define ABORT_DISK_ERR := begin Result := FR_DISK_ERR; break; end}
	ldi	r26,1
	std	Y+2,r26
	rjmp	.Lj248
.Lj257:
# [1073] iFatFS.curr_clust := clst;
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	std	Z+36,r13
	std	Z+37,r12
	std	Z+38,r11
	std	Z+39,r10
.Lj252:
# [1076] sect := clust2sect(iFatFS.curr_clust);
	lds	r19,(U_sPFF_ss_IFATFS)
	lds	r18,(U_sPFF_ss_IFATFS+1)
	mov	r30,r19
	mov	r31,r18
	ldd	r22,Z+36
	mov	r30,r19
	mov	r31,r18
	ldd	r23,Z+37
	mov	r30,r19
	mov	r31,r18
	ldd	r24,Z+38
	mov	r30,r19
	mov	r31,r18
	ldd	r25,Z+39
	call	PFF_ss_CLUST2SECTsLONGWORDssLONGWORD
	mov	r9,r22
	mov	r8,r23
	mov	r7,r24
	mov	r6,r25
# [1077] if sect = 0 then
	cp	r9,r1
	cpc	r8,r1
	cpc	r7,r1
	cpc	r6,r1
	brne	.Lj259
	ldi	r26,1
	std	Y+2,r26
	rjmp	.Lj248
.Lj259:
# [1079] iFatFS.dsect := sect + cs;
	mov	r22,r9
	mov	r23,r8
	mov	r24,r7
	mov	r25,r6
	add	r22,r5
	adc	r23,r1
	adc	r24,r1
	adc	r25,r1
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	std	Z+40,r22
	std	Z+41,r23
	std	Z+42,r24
	std	Z+43,r25
.Lj250:
# [1082] rcnt := SECTOR_SIZE - UINT(iFatFS.fptr and (SECTOR_SIZE - 1));
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r18,Z+24
	ldd	r19,Z+25
	ldd	r22,Z+26
	ldd	r23,Z+27
	mov	r21,r18
	mov	r20,r19
	mov	r19,r22
	mov	r18,r23
	andi	r20,1
	mov	r25,r20
	ldi	r20,2
	mov	r19,r1
	mov	r22,r1
	mov	r18,r1
	sub	r22,r21
	sbc	r20,r25
	sbc	r19,r1
	sbc	r18,r1
	mov	r3,r22
	mov	r2,r20
# [1083] if rcnt > btr then
	ldd	r18,Y+5
	cp	r18,r3
	ldd	r18,Y+6
	cpc	r18,r2
	brsh	.Lj261
# [1084] rcnt := btr;
	ldd	r18,Y+5
	mov	r3,r18
	ldd	r18,Y+6
	mov	r2,r18
.Lj261:
# [1085] dr := disk_readp(rbuff, iFatFS.dsect, UINT(iFatFS.fptr and (SECTOR_SIZE - 1)), rcnt);
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r18,Z+24
	ldd	r19,Z+25
	ldd	r21,Z+26
	ldd	r23,Z+27
	mov	r20,r18
	mov	r22,r19
	mov	r19,r21
	mov	r18,r23
	andi	r22,1
	mov	r18,r20
	mov	r19,r22
	lds	r24,(U_sPFF_ss_IFATFS)
	lds	r23,(U_sPFF_ss_IFATFS+1)
	mov	r30,r24
	mov	r31,r23
	ldd	r20,Z+40
	mov	r30,r24
	mov	r31,r23
	ldd	r21,Z+41
	mov	r30,r24
	mov	r31,r23
	ldd	r22,Z+42
	mov	r30,r24
	mov	r31,r23
	ldd	r23,Z+43
	mov	r16,r3
	mov	r17,r2
	ldd	r25,Y+7
	mov	r24,r25
	ldd	r14,Y+8
	mov	r25,r14
	call	DISK_IO_ss_DISK_READPsPBYTEsLONGWORDsNATIVEUINTsNATIVEUINTssDRESULT
	mov	r4,r24
# [1086] if dr <> RES_OK then
	cp	r4,r1
	breq	.Lj263
	ldi	r26,1
	std	Y+2,r26
	rjmp	.Lj248
.Lj263:
# [1089] iFatFS.fptr := iFatFS.fptr + rcnt;
	lds	r23,(U_sPFF_ss_IFATFS)
	lds	r22,(U_sPFF_ss_IFATFS+1)
	mov	r30,r23
	mov	r31,r22
	ldd	r20,Z+24
	ldd	r21,Z+25
	ldd	r15,Z+26
	ldd	r18,Z+27
	add	r20,r3
	adc	r21,r2
	adc	r15,r1
	adc	r18,r1
	mov	r30,r23
	mov	r31,r22
	std	Z+24,r20
	std	Z+25,r21
	std	Z+26,r15
	std	Z+27,r18
# [1091] btr := btr - rcnt;
	ldd	r18,Y+5
	sub	r18,r3
	std	Y+5,r18
	ldd	r18,Y+6
	sbc	r18,r2
	std	Y+6,r18
# [1092] br := br + rcnt;
	ldd	r18,Y+3
	mov	r30,r18
	ldd	r18,Y+4
	mov	r31,r18
	ld	r20,Z
	ldd	r19,Z+1
	add	r20,r3
	adc	r19,r2
	ldd	r18,Y+3
	mov	r30,r18
	ldd	r18,Y+4
	mov	r31,r18
	st	Z,r20
	std	Z+1,r19
# [1094] if rbuff <> nil then
	ldd	r18,Y+7
	cp	r18,r1
	ldd	r18,Y+8
	cpc	r18,r1
	breq	.Lj247
# [1095] rbuff := rbuff + rcnt;
	ldd	r18,Y+7
	add	r18,r3
	ldd	r18,Y+8
	adc	r18,r2
	std	Y+7,r18
	std	Y+8,r18
.Lj247:
	ldd	r18,Y+5
	cp	r18,r1
	ldd	r18,Y+6
	cpc	r18,r1
	breq	.Lj272
	rjmp	.Lj246
.Lj272:
.Lj248:
# [1098] if Result = FR_DISK_ERR then
	ldd	r18,Y+2
	cpi	r18,1
	brne	.Lj267
# [1099] iFatFS.flag := 0
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	std	Z+1,r1
	rjmp	.Lj238
.Lj267:
# [1101] Result := FR_OK;
	std	Y+2,r1
.Lj238:
	ldd	r18,Y+2
	mov	r24,r18
	subi	r28,-9
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
	.size	PFF_ss_PF_READsPOINTERsNATIVEUINTsNATIVEUINTssFRESULT, .Le21 - PFF_ss_PF_READsPOINTERsNATIVEUINTsNATIVEUINTssFRESULT

.section .text.n_pff_ss_pf_lseekslongwordssfresult,"ax"
.globl	PFF_ss_PF_LSEEKsLONGWORDssFRESULT
PFF_ss_PF_LSEEKsLONGWORDssFRESULT:
.Lc46:
# Temps allocated between r28+2 and r28+15
# [1109] begin
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
	subi	r28,15
	sbci	r29,0
	in	r0,63
	cli
	out	62,r29
	out	63,r0
	out	61,r28
# Var $result located in register r18
# Var clst located in register r3
# Var bcs located in register r18
# Var sect located in register r22
# Var ifptr located in register r18
	std	Y+3,r22
	std	Y+4,r23
	std	Y+5,r24
	std	Y+6,r25
# Var ofs located in register r18
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	cp	r18,r1
	cpc	r19,r1
	brne	.Lj276
	ldi	r26,5
	std	Y+2,r26
	rjmp	.Lj273
.Lj276:
# [1114] if (iFatFS.flag and FA_OPENED) = 0 then
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r18,Z+1
	andi	r18,1
	brne	.Lj278
# [1115] Exit(FR_NOT_OPENED);
	ldi	r26,4
	std	Y+2,r26
	rjmp	.Lj273
.Lj278:
# [1117] if ofs > iFatFS.fsize then
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r19,Z+28
	ldd	r20,Z+29
	ldd	r21,Z+30
	ldd	r22,Z+31
	ldd	r18,Y+3
	cp	r19,r18
	ldd	r18,Y+4
	cpc	r20,r18
	ldd	r18,Y+5
	cpc	r21,r18
	ldd	r18,Y+6
	cpc	r22,r18
	brsh	.Lj280
# [1119] ofs := iFatFS.fsize;
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r18,Z+28
	std	Y+3,r18
	ldd	r18,Z+29
	std	Y+4,r18
	ldd	r18,Z+30
	std	Y+5,r18
	ldd	r18,Z+31
	std	Y+6,r18
.Lj280:
# [1120] ifptr := iFatFS.fptr;
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
# Var ifptr located in register r18
	movw	r30,r18
	ldd	r18,Z+24
	std	Y+14,r18
	ldd	r18,Z+25
	std	Y+13,r18
	ldd	r18,Z+26
	std	Y+12,r18
	ldd	r18,Z+27
	std	Y+11,r18
# [1121] iFatFS.fptr := 0;
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	std	Z+24,r1
	std	Z+25,r1
	std	Z+26,r1
	std	Z+27,r1
# [1122] if ofs > 0 then
	ldd	r18,Y+3
	cp	r1,r18
	ldd	r18,Y+4
	cpc	r1,r18
	ldd	r18,Y+5
	cpc	r1,r18
	ldd	r18,Y+6
	cpc	r1,r18
	brlo	.Lj295
# [1160] end;
	rjmp	.Lj282
.Lj295:
# [1125] bcs := DWORD(iFatFS.csize) shl SECTOR_SIZE_BP;
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r20,Z+2
	mov	r21,r1
	mov	r22,r1
	lsl	r20
	rol	r21
	rol	r22
	std	Y+7,r1
	std	Y+8,r20
	std	Y+9,r21
	std	Y+10,r22
# [1126] if (ifptr > 0) and (((ofs - 1) div bcs) >= ((ifptr - 1) div bcs)) then
	ldd	r18,Y+14
	cp	r1,r18
	ldd	r18,Y+13
	cpc	r1,r18
	ldd	r18,Y+12
	cpc	r1,r18
	ldd	r18,Y+11
	cpc	r1,r18
	brlo	.Lj296
	rjmp	.Lj284
.Lj296:
	ldd	r18,Y+3
	mov	r24,r18
	ldd	r18,Y+4
	mov	r20,r18
	ldd	r18,Y+5
	mov	r21,r18
	ldd	r18,Y+6
	mov	r19,r18
	mov	r18,r1
	mov	r25,r1
	mov	r2,r1
	mov	r23,r20
	mov	r20,r19
	mov	r19,r1
	subi	r24,1
	sbc	r23,r1
	sbc	r21,r1
	sbc	r20,r1
	sbc	r18,r1
	sbc	r19,r1
	sbc	r25,r1
	sbc	r2,r1
	movw	r14,r18
	mov	r16,r25
	mov	r17,r2
	mov	r10,r24
	mov	r11,r23
	mov	r12,r21
	mov	r13,r20
	ldd	r19,Y+7
	mov	r18,r19
	ldd	r20,Y+8
	mov	r19,r20
	ldd	r21,Y+9
	mov	r20,r21
	ldd	r22,Y+10
	mov	r21,r22
	mov	r22,r1
	mov	r23,r1
	mov	r24,r1
	mov	r25,r1
	call	fpc_div_int64
	mov	r9,r18
	mov	r8,r19
	mov	r7,r20
	mov	r6,r21
	mov	r5,r22
	mov	r4,r23
	mov	r3,r24
	mov	r2,r25
	ldd	r18,Y+14
	mov	r20,r18
	ldd	r18,Y+13
	mov	r21,r18
	ldd	r18,Y+12
	mov	r22,r18
	ldd	r18,Y+11
	mov	r23,r20
	mov	r20,r22
	mov	r19,r1
	mov	r22,r1
	mov	r24,r1
	mov	r25,r1
	subi	r23,1
	sbc	r21,r1
	sbc	r20,r1
	sbc	r18,r1
	sbc	r19,r1
	sbc	r22,r1
	sbc	r24,r1
	sbc	r25,r1
	mov	r14,r19
	mov	r15,r22
	movw	r16,r24
	mov	r10,r23
	mov	r11,r21
	mov	r12,r20
	mov	r13,r18
	ldd	r19,Y+7
	mov	r18,r19
	ldd	r20,Y+8
	mov	r19,r20
	ldd	r21,Y+9
	mov	r20,r21
	ldd	r22,Y+10
	mov	r21,r22
	mov	r22,r1
	mov	r23,r1
	mov	r24,r1
	mov	r25,r1
	call	fpc_div_int64
	cp	r9,r18
	cpc	r8,r19
	cpc	r7,r20
	cpc	r6,r21
	cpc	r5,r22
	cpc	r4,r23
	cpc	r3,r24
	cpc	r2,r25
	brge	.Lj297
	rjmp	.Lj284
.Lj297:
# [1130] iFatFS.fptr := (ifptr - 1) and (not (bcs - 1));
	ldd	r18,Y+7
	mov	r25,r18
	ldd	r18,Y+8
	mov	r2,r18
	ldd	r18,Y+9
	mov	r20,r18
	ldd	r18,Y+10
	mov	r19,r18
	mov	r22,r1
	mov	r24,r1
	mov	r18,r1
	mov	r21,r1
	subi	r25,1
	sbc	r2,r1
	sbc	r20,r1
	sbc	r19,r1
	sbc	r24,r1
	sbc	r18,r1
	sbc	r22,r1
	sbc	r21,r1
	mov	r3,r25
	com	r3
	mov	r4,r2
	com	r4
	mov	r5,r20
	com	r5
	mov	r6,r19
	com	r6
	mov	r8,r24
	com	r8
	mov	r2,r18
	com	r2
	mov	r7,r22
	com	r7
	mov	r24,r21
	com	r24
	ldd	r18,Y+14
	mov	r25,r18
	ldd	r18,Y+13
	mov	r21,r18
	ldd	r18,Y+12
	mov	r20,r18
	ldd	r18,Y+11
	mov	r23,r1
	mov	r9,r1
	mov	r10,r21
	mov	r11,r20
	mov	r12,r18
	mov	r13,r1
	mov	r14,r1
	subi	r25,1
	sbc	r10,r1
	sbc	r11,r1
	sbc	r12,r1
	sbc	r13,r1
	sbc	r14,r1
	sbc	r23,r1
	sbc	r9,r1
	mov	r22,r3
	mov	r3,r5
	mov	r5,r6
	mov	r21,r8
	mov	r20,r2
	mov	r19,r7
	mov	r18,r24
	and	r22,r25
	and	r4,r10
	and	r3,r11
	and	r5,r12
	and	r21,r13
	and	r20,r14
	and	r19,r23
	and	r18,r9
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	std	Z+24,r22
	std	Z+25,r4
	std	Z+26,r3
	std	Z+27,r5
# [1131] ofs := ofs - iFatFS.fptr;
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r19,Z+24
	ldd	r20,Z+25
	ldd	r21,Z+26
	ldd	r22,Z+27
	ldd	r18,Y+3
	sub	r18,r19
	std	Y+3,r18
	ldd	r18,Y+4
	sbc	r18,r20
	std	Y+4,r18
	ldd	r18,Y+5
	sbc	r18,r21
	std	Y+5,r18
	ldd	r18,Y+6
	sbc	r18,r22
	std	Y+6,r18
# [1132] clst := iFatFS.curr_clust;
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r3,Z+36
	ldd	r2,Z+37
	ldd	r4,Z+38
	ldd	r5,Z+39
	rjmp	.Lj288
.Lj284:
# [1138] clst := iFatFS.org_clust;
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r3,Z+32
	ldd	r2,Z+33
	ldd	r4,Z+34
	ldd	r5,Z+35
# [1139] iFatFS.curr_clust := clst;
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	std	Z+36,r3
	std	Z+37,r2
	std	Z+38,r4
	std	Z+39,r5
# [1141] while ofs > bcs do
	rjmp	.Lj288
.Lj287:
# [1145] clst := get_fat(clst);
	mov	r22,r3
	mov	r23,r2
	movw	r24,r4
	call	PFF_ss_GET_FATsLONGWORDssLONGWORD
	mov	r3,r22
	mov	r2,r23
	movw	r4,r24
# [1146] if (clst <= 1) or (clst >= iFatFS.n_fatent) then
	ldi	r21,1
	cp	r21,r3
	cpc	r1,r2
	cpc	r1,r4
	cpc	r1,r5
	brsh	.Lj290
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r20,Z+8
	ldd	r18,Z+9
	ldd	r19,Z+10
	ldd	r21,Z+11
	cp	r3,r20
	cpc	r2,r18
	cpc	r4,r19
	cpc	r5,r21
	brlo	.Lj292
.Lj290:
# [1147] begin iFatFS.flag := 0; Exit(FR_DISK_ERR); end;
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	std	Z+1,r1
	ldi	r26,1
	std	Y+2,r26
	rjmp	.Lj273
.Lj292:
# [1148] iFatFS.curr_clust := clst;
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	std	Z+36,r3
	std	Z+37,r2
	std	Z+38,r4
	std	Z+39,r5
# [1149] iFatFS.fptr := iFatFS.fptr + bcs;
	lds	r24,(U_sPFF_ss_IFATFS)
	lds	r20,(U_sPFF_ss_IFATFS+1)
	mov	r30,r24
	mov	r31,r20
	ldd	r21,Z+24
	ldd	r22,Z+25
	ldd	r23,Z+26
	ldd	r19,Z+27
	ldd	r18,Y+7
	add	r21,r18
	ldd	r18,Y+8
	adc	r22,r18
	ldd	r18,Y+9
	adc	r23,r18
	ldd	r18,Y+10
	adc	r19,r18
	mov	r30,r24
	mov	r31,r20
	std	Z+24,r21
	std	Z+25,r22
	std	Z+26,r23
	std	Z+27,r19
# [1150] ofs := ofs - bcs;
	ldd	r18,Y+3
	ldd	r19,Y+7
	sub	r18,r19
	std	Y+3,r18
	ldd	r19,Y+4
	ldd	r18,Y+8
	sbc	r19,r18
	std	Y+4,r19
	ldd	r18,Y+5
	ldd	r19,Y+9
	sbc	r18,r19
	std	Y+5,r18
	ldd	r19,Y+6
	ldd	r18,Y+10
	sbc	r19,r18
	std	Y+6,r19
.Lj288:
	ldd	r18,Y+7
	ldd	r19,Y+3
	cp	r18,r19
	ldd	r19,Y+8
	ldd	r18,Y+4
	cpc	r19,r18
	ldd	r18,Y+9
	ldd	r19,Y+5
	cpc	r18,r19
	ldd	r18,Y+10
	ldd	r19,Y+6
	cpc	r18,r19
	brsh	.Lj298
	rjmp	.Lj287
.Lj298:
# [1152] iFatFS.fptr := iFatFS.fptr + ofs;
	lds	r19,(U_sPFF_ss_IFATFS)
	lds	r23,(U_sPFF_ss_IFATFS+1)
	mov	r30,r19
	mov	r31,r23
	ldd	r24,Z+24
	ldd	r22,Z+25
	ldd	r20,Z+26
	ldd	r21,Z+27
	ldd	r18,Y+3
	add	r24,r18
	ldd	r18,Y+4
	adc	r22,r18
	ldd	r18,Y+5
	adc	r20,r18
	ldd	r18,Y+6
	adc	r21,r18
	mov	r30,r19
	mov	r31,r23
	std	Z+24,r24
	std	Z+25,r22
	std	Z+26,r20
	std	Z+27,r21
# [1154] sect := clust2sect(clst);
	mov	r22,r3
	mov	r23,r2
	movw	r24,r4
	call	PFF_ss_CLUST2SECTsLONGWORDssLONGWORD
# [1155] if sect = 0 then
	cp	r22,r1
	cpc	r23,r1
	cpc	r24,r1
	cpc	r25,r1
	brne	.Lj294
# [1156] begin iFatFS.flag := 0; Exit(FR_DISK_ERR); end;
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	std	Z+1,r1
	ldi	r26,1
	std	Y+2,r26
	rjmp	.Lj273
.Lj294:
# [1157] iFatFS.dsect := sect + ((iFatFS.fptr shr SECTOR_SIZE_BP) and (iFatFS.csize - 1));
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r3,Z+2
	mov	r20,r1
	ldi	r26,1
	sub	r3,r26
	sbc	r20,r1
	mov	r19,r1
	sbrc	r20,7
	com	r19
	lds	r21,(U_sPFF_ss_IFATFS)
	lds	r2,(U_sPFF_ss_IFATFS+1)
	mov	r30,r21
	mov	r31,r2
	ldd	r21,Z+24
	ldd	r5,Z+25
	ldd	r4,Z+26
	ldd	r2,Z+27
	lsr	r2
	ror	r4
	ror	r5
	mov	r21,r1
	and	r5,r3
	and	r4,r20
	and	r2,r19
	and	r21,r19
	add	r22,r5
	adc	r23,r4
	adc	r24,r2
	adc	r25,r21
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	std	Z+40,r22
	std	Z+41,r23
	std	Z+42,r24
	std	Z+43,r25
.Lj282:
# [1159] Result := FR_OK;
	std	Y+2,r1
.Lj273:
	ldd	r18,Y+2
	mov	r24,r18
	subi	r28,-15
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
.Lc45:
.Le22:
	.size	PFF_ss_PF_LSEEKsLONGWORDssFRESULT, .Le22 - PFF_ss_PF_LSEEKsLONGWORDssFRESULT

.section .text.n_pff_ss_pf_writespointersnativeuintsnativeuintssfresult,"ax"
.globl	PFF_ss_PF_WRITEsPOINTERsNATIVEUINTsNATIVEUINTssFRESULT
PFF_ss_PF_WRITEsPOINTERsNATIVEUINTsNATIVEUINTssFRESULT:
.Lc48:
# Temps allocated between r28+2 and r28+6
# [1173] begin
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
	subi	r28,6
	sbci	r29,0
	in	r0,63
	cli
	out	62,r29
	out	63,r0
	out	61,r28
# Var $result located in register r18
# Var p located in register r18
# Var clst located in register r12
# Var sect located in register r8
# Var remain located in register r18
# Var cs located in register r4
# Var wcnt located in register r3
# Var buff located in register r24
	std	Y+5,r22
	mov	r17,r23
# Var btw located in register r18
	std	Y+3,r20
	std	Y+4,r21
# Var bw located in register r18
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	cp	r18,r1
	cpc	r19,r1
	brne	.Lj302
	ldi	r26,5
	std	Y+2,r26
	rjmp	.Lj299
.Lj302:
# Var p located in register r16
# Var buff located in register r24
# [1177] p := buff;
	mov	r16,r24
	mov	r13,r25
# [1178] bw := 0;
	ldd	r18,Y+3
	mov	r30,r18
	ldd	r18,Y+4
	mov	r31,r18
	st	Z,r1
	std	Z+1,r1
# [1180] if (iFatFS.flag and FA_OPENED) = 0 then
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r18,Z+1
	andi	r18,1
	brne	.Lj304
# [1181] Exit(FR_NOT_OPENED);
	ldi	r26,4
	std	Y+2,r26
	rjmp	.Lj299
.Lj304:
# [1183] if btw = 0 then
	ldd	r18,Y+5
	cp	r18,r1
	cpc	r17,r1
	breq	.Lj342
# [1262] end;
	rjmp	.Lj306
.Lj342:
# [1186] if ((iFatFS.flag and FA__WIP) <> 0) and (disk_writep(nil, 0) <> DRESULT.RES_OK) then
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r18,Z+1
	andi	r18,64
	breq	.Lj308
	mov	r20,r1
	mov	r21,r1
	mov	r22,r1
	mov	r23,r1
	mov	r24,r1
	mov	r25,r1
	call	DISK_IO_ss_DISK_WRITEPsPOINTERsLONGWORDssDRESULT
	cp	r24,r1
	breq	.Lj308
# [1187] begin iFatFS.flag := 0; Exit(FR_DISK_ERR); end;
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	std	Z+1,r1
	ldi	r26,1
	std	Y+2,r26
	rjmp	.Lj299
.Lj308:
# [1188] iFatFS.flag := iFatFS.flag and (not FA__WIP);
	lds	r20,(U_sPFF_ss_IFATFS)
	lds	r18,(U_sPFF_ss_IFATFS+1)
	mov	r30,r20
	mov	r31,r18
	ldd	r19,Z+1
	andi	r19,-65
	mov	r30,r20
	mov	r31,r18
	std	Z+1,r19
# [1189] Exit(FR_OK);
	std	Y+2,r1
	rjmp	.Lj299
.Lj306:
# [1193] if (iFatFS.flag and FA__WIP) = 0 then
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r18,Z+1
	andi	r18,64
	brne	.Lj312
# [1195] iFatFS.fptr := iFatFS.fptr and $FFFFFE00;
	lds	r22,(U_sPFF_ss_IFATFS)
	lds	r21,(U_sPFF_ss_IFATFS+1)
	mov	r30,r22
	mov	r31,r21
	ldd	r23,Z+24
	ldd	r18,Z+25
	ldd	r20,Z+26
	ldd	r19,Z+27
	andi	r18,-2
	mov	r30,r22
	mov	r31,r21
	std	Z+24,r1
	std	Z+25,r18
	std	Z+26,r20
	std	Z+27,r19
.Lj312:
# [1197] remain := iFatFS.fsize - iFatFS.fptr;
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	lds	r21,(U_sPFF_ss_IFATFS)
	lds	r20,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r22,Z+28
	ldd	r23,Z+29
	ldd	r24,Z+30
	ldd	r25,Z+31
	mov	r30,r21
	mov	r31,r20
	ldd	r20,Z+24
	ldd	r19,Z+25
	ldd	r18,Z+26
	ldd	r21,Z+27
	sub	r22,r20
	sbc	r23,r19
	sbc	r24,r18
	sbc	r25,r21
# Var remain located in register r22
# [1198] if btw > remain then
	ldd	r18,Y+5
	cp	r22,r18
	cpc	r23,r17
	cpc	r24,r1
	cpc	r25,r1
	brlo	.Lj343
	rjmp	.Lj316
.Lj343:
# [1199] btw := UINT(remain); { Truncate btw by remaining bytes }
	std	Y+5,r22
	mov	r17,r23
# [1201] while btw <> 0 do
	rjmp	.Lj316
.Lj315:
# [1204] if UINT(iFatFS.fptr) and (SECTOR_SIZE - 1) = 0 then
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r18,Z+24
	ldd	r19,Z+25
	andi	r19,1
	cp	r18,r1
	cpc	r19,r1
	breq	.Lj344
	rjmp	.Lj319
.Lj344:
# [1208] cs := byte((iFatFS.fptr shr SECTOR_SIZE_BP) and (iFatFS.csize - 1));
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r19,Z+2
	mov	r18,r1
	subi	r19,1
	sbc	r18,r1
	mov	r21,r19
	mov	r22,r18
	mov	r20,r1
	sbrc	r18,7
	com	r20
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r18,Z+24
	ldd	r18,Z+25
	ldd	r19,Z+26
	ldd	r24,Z+27
	mov	r15,r19
	mov	r19,r24
	lsr	r19
	ror	r15
	ror	r18
	mov	r14,r18
	mov	r24,r15
	mov	r18,r1
	and	r14,r21
	and	r24,r22
	and	r19,r20
	and	r18,r20
	mov	r4,r14
# [1210] if cs = 0 then
	cp	r4,r1
	breq	.Lj345
	rjmp	.Lj321
.Lj345:
# [1213] if iFatFS.fptr = 0 then
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r21,Z+24
	ldd	r20,Z+25
	ldd	r18,Z+26
	ldd	r19,Z+27
	cp	r21,r1
	cpc	r20,r1
	cpc	r18,r1
	cpc	r19,r1
	brne	.Lj323
# [1215] clst := iFatFS.org_clust
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r12,Z+32
	ldd	r11,Z+33
	ldd	r10,Z+34
	ldd	r9,Z+35
	rjmp	.Lj324
.Lj323:
# [1217] clst := get_fat(iFatFS.curr_clust);
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r22,Z+36
	movw	r30,r18
	ldd	r23,Z+37
	movw	r30,r18
	ldd	r24,Z+38
	movw	r30,r18
	ldd	r25,Z+39
	call	PFF_ss_GET_FATsLONGWORDssLONGWORD
	mov	r12,r22
	mov	r11,r23
	mov	r10,r24
	mov	r9,r25
.Lj324:
# [1218] if clst <= 1 then
	ldi	r21,1
	cp	r21,r12
	cpc	r1,r11
	cpc	r1,r10
	cpc	r1,r9
	brlo	.Lj326
	ldi	r26,1
	std	Y+2,r26
	rjmp	.Lj317
.Lj326:
# [1221] iFatFS.curr_clust := clst;
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	std	Z+36,r12
	std	Z+37,r11
	std	Z+38,r10
	std	Z+39,r9
.Lj321:
# [1224] sect := clust2sect(iFatFS.curr_clust);
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r22,Z+36
	movw	r30,r18
	ldd	r23,Z+37
	movw	r30,r18
	ldd	r24,Z+38
	movw	r30,r18
	ldd	r25,Z+39
	call	PFF_ss_CLUST2SECTsLONGWORDssLONGWORD
	mov	r8,r22
	mov	r7,r23
	mov	r6,r24
	mov	r5,r25
# [1225] if sect = 0 then
	cp	r8,r1
	cpc	r7,r1
	cpc	r6,r1
	cpc	r5,r1
	brne	.Lj328
	ldi	r26,1
	std	Y+2,r26
	rjmp	.Lj317
.Lj328:
# [1227] iFatFS.dsect := sect + cs;
	mov	r22,r8
	mov	r23,r7
	mov	r20,r6
	mov	r21,r5
	add	r22,r4
	adc	r23,r1
	adc	r20,r1
	adc	r21,r1
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	std	Z+40,r22
	std	Z+41,r23
	std	Z+42,r20
	std	Z+43,r21
# [1230] if disk_writep(nil, iFatFS.dsect) <> DRESULT.RES_OK then
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r20,Z+40
	movw	r30,r18
	ldd	r21,Z+41
	movw	r30,r18
	ldd	r22,Z+42
	movw	r30,r18
	ldd	r23,Z+43
	mov	r24,r1
	mov	r25,r1
	call	DISK_IO_ss_DISK_WRITEPsPOINTERsLONGWORDssDRESULT
	cp	r24,r1
	breq	.Lj330
	ldi	r26,1
	std	Y+2,r26
	rjmp	.Lj317
.Lj330:
# [1232] iFatFS.flag := iFatFS.flag or FA__WIP;
	lds	r19,(U_sPFF_ss_IFATFS)
	lds	r20,(U_sPFF_ss_IFATFS+1)
	mov	r30,r19
	mov	r31,r20
	ldd	r18,Z+1
	ori	r18,64
	mov	r30,r19
	mov	r31,r20
	std	Z+1,r18
.Lj319:
# [1235] wcnt := SECTOR_SIZE - (UINT(iFatFS.fptr) and (SECTOR_SIZE - 1));
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r18,Z+24
	ldd	r19,Z+25
	andi	r19,1
	mov	r21,r18
	mov	r22,r19
	ldi	r25,2
	mov	r19,r1
	mov	r14,r1
	mov	r18,r1
	sub	r14,r21
	sbc	r25,r22
	sbc	r19,r1
	sbc	r18,r1
	mov	r3,r14
	mov	r2,r25
# [1236] if wcnt > btw then
	ldd	r18,Y+5
	cp	r18,r3
	cpc	r17,r2
	brsh	.Lj332
# [1237] wcnt := btw;
	ldd	r18,Y+5
	mov	r3,r18
	mov	r2,r17
.Lj332:
# [1240] if disk_writep(p, wcnt) <> DRESULT.RES_OK then
	mov	r20,r3
	mov	r23,r1
	mov	r21,r2
	mov	r22,r1
	mov	r24,r16
	mov	r25,r13
	call	DISK_IO_ss_DISK_WRITEPsPOINTERsLONGWORDssDRESULT
	cp	r24,r1
	breq	.Lj334
	ldi	r26,1
	std	Y+2,r26
	rjmp	.Lj317
.Lj334:
# [1244] iFatFS.fptr := iFatFS.fptr + wcnt;
	lds	r15,(U_sPFF_ss_IFATFS)
	lds	r18,(U_sPFF_ss_IFATFS+1)
	mov	r30,r15
	mov	r31,r18
	ldd	r23,Z+24
	ldd	r24,Z+25
	ldd	r25,Z+26
	ldd	r14,Z+27
	add	r23,r3
	adc	r24,r2
	adc	r25,r1
	adc	r14,r1
	mov	r30,r15
	mov	r31,r18
	std	Z+24,r23
	std	Z+25,r24
	std	Z+26,r25
	std	Z+27,r14
# [1245] p := p + wcnt;
	add	r16,r3
	adc	r13,r2
# [1246] btw := btw - wcnt;
	ldd	r18,Y+5
	sub	r18,r3
	std	Y+5,r18
	sbc	r17,r2
# [1247] bw := bw + wcnt;
	ldd	r18,Y+3
	mov	r30,r18
	ldd	r18,Y+4
	mov	r31,r18
	ld	r20,Z
	ldd	r19,Z+1
	add	r20,r3
	adc	r19,r2
	ldd	r18,Y+3
	mov	r30,r18
	ldd	r18,Y+4
	mov	r31,r18
	st	Z,r20
	std	Z+1,r19
# [1249] if UINT(iFatFS.fptr) and (SECTOR_SIZE - 1) = 0 then
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	ldd	r18,Z+24
	ldd	r19,Z+25
	andi	r19,1
	cp	r18,r1
	cpc	r19,r1
	brne	.Lj316
# [1252] if disk_writep(nil, 0) <> DRESULT.RES_OK then
	mov	r20,r1
	mov	r21,r1
	mov	r22,r1
	mov	r23,r1
	mov	r24,r1
	mov	r25,r1
	call	DISK_IO_ss_DISK_WRITEPsPOINTERsLONGWORDssDRESULT
	cp	r24,r1
	breq	.Lj338
	ldi	r26,1
	std	Y+2,r26
	rjmp	.Lj317
.Lj338:
# [1254] iFatFS.flag := iFatFS.flag and (not FA__WIP);
	lds	r20,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	mov	r30,r20
	mov	r31,r19
	ldd	r18,Z+1
	andi	r18,-65
	mov	r30,r20
	mov	r31,r19
	std	Z+1,r18
.Lj316:
	ldd	r18,Y+5
	cp	r18,r1
	cpc	r17,r1
	breq	.Lj346
	rjmp	.Lj315
.Lj346:
.Lj317:
# [1258] if Result = FR_DISK_ERR then
	ldd	r18,Y+2
	cpi	r18,1
	brne	.Lj340
# [1259] iFatFS.flag := 0
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	movw	r30,r18
	std	Z+1,r1
	rjmp	.Lj299
.Lj340:
# [1261] Result := FR_OK;
	std	Y+2,r1
.Lj299:
	ldd	r18,Y+2
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
.Lc47:
.Le23:
	.size	PFF_ss_PF_WRITEsPOINTERsNATIVEUINTsNATIVEUINTssFRESULT, .Le23 - PFF_ss_PF_WRITEsPOINTERsNATIVEUINTsNATIVEUINTssFRESULT

.section .text.n_pff_ss_pf_opendirsdirspcharssfresult,"ax"
.globl	PFF_ss_PF_OPENDIRsDIRsPCHARssFRESULT
PFF_ss_PF_OPENDIRsDIRsPCHARssFRESULT:
.Lc50:
# [1271] begin
	push	r29
	push	r28
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
# Var sp located at r28+2, size=OS_NO
# Var dir located at r28+14, size=OS_NO
	movw	r2,r24
# Var dj located in register r2
	movw	r20,r22
# Var path located in register r20
	lds	r18,(U_sPFF_ss_IFATFS)
	lds	r19,(U_sPFF_ss_IFATFS+1)
	cp	r18,r1
	cpc	r19,r1
	brne	.Lj350
	ldi	r26,5
	mov	r4,r26
	rjmp	.Lj347
.Lj350:
# [1275] dj.fn := sp;
	ldi	r19,lo8(2)
	ldi	r18,hi8(2)
	add	r19,r28
	adc	r18,r29
	movw	r30,r2
	std	Z+2,r19
	std	Z+3,r18
# [1277] Result := follow_path(dj, dir, path);
	ldi	r22,lo8(14)
	ldi	r23,hi8(14)
	add	r22,r28
	adc	r23,r29
	movw	r24,r2
# Var path located in register r20
	call	PFF_ss_FOLLOW_PATHsDIRsPBYTEsPCHARssFRESULT
	mov	r4,r24
# [1278] if Result = FR_OK then
	cp	r4,r1
	brne	.Lj347
# [1281] if dir[0] <> 0 then
	ldd	r18,Y+14
	cp	r18,r1
	breq	.Lj354
# [1283] if (dir[DIR_Attr] and AM_DIR) <> 0 then
	ldd	r18,Y+25
	andi	r18,16
	breq	.Lj356
# [1285] dj.sclust := get_clust(dir)
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
	rjmp	.Lj354
.Lj356:
# [1288] Result := FR_NO_FILE;
	ldi	r26,3
	mov	r4,r26
.Lj354:
# [1289] if Result = FR_OK then
	cp	r4,r1
	brne	.Lj347
# [1291] Result := dir_rewind(dj);
	movw	r24,r2
	call	PFF_ss_DIR_REWINDsDIRssFRESULT
	mov	r4,r24
.Lj347:
# [1293] end;
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
	pop	r28
	pop	r29
	ret
.Lc49:
.Le24:
	.size	PFF_ss_PF_OPENDIRsDIRsPCHARssFRESULT, .Le24 - PFF_ss_PF_OPENDIRsDIRsPCHARssFRESULT

.section .text.n_pff_ss_pf_readdirsdirsfilinfossfresult,"ax"
.globl	PFF_ss_PF_READDIRsDIRsFILINFOssFRESULT
PFF_ss_PF_READDIRsDIRsFILINFOssFRESULT:
.Lc52:
# [1299] begin
	push	r29
	push	r28
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
# Var sp located at r28+2, size=OS_NO
# Var dir located at r28+14, size=OS_NO
	movw	r2,r24
# Var dj located in register r2
	movw	r4,r22
# Var fno located in register r4
	lds	r19,(U_sPFF_ss_IFATFS)
	lds	r18,(U_sPFF_ss_IFATFS+1)
	cp	r19,r1
	cpc	r18,r1
	brne	.Lj363
	ldi	r26,5
	mov	r6,r26
	rjmp	.Lj360
.Lj363:
# [1303] dj.fn := sp;
	ldi	r19,lo8(2)
	ldi	r18,hi8(2)
	add	r19,r28
	adc	r18,r29
	movw	r30,r2
	std	Z+2,r19
	std	Z+3,r18
# [1305] Result := dir_read(dj, dir);
	ldi	r22,lo8(14)
	ldi	r23,hi8(14)
	add	r22,r28
	adc	r23,r29
	movw	r24,r2
	call	PFF_ss_DIR_READsDIRsPBYTEssFRESULT
	mov	r6,r24
# [1306] if Result = FR_NO_FILE then
	ldi	r26,3
	cp	r6,r26
	brne	.Lj365
# [1307] Result := FR_OK;
	mov	r6,r1
.Lj365:
# [1308] if Result = FR_OK then
	cp	r6,r1
	brne	.Lj360
# [1312] get_fileinfo(dj, dir, fno);
	ldi	r22,lo8(14)
	ldi	r23,hi8(14)
	add	r22,r28
	adc	r23,r29
	movw	r20,r4
	movw	r24,r2
	call	PFF_ss_GET_FILEINFOsDIRsPBYTEsFILINFO
# [1314] Result := dir_next(dj);
	movw	r24,r2
	call	PFF_ss_DIR_NEXTsDIRssFRESULT
	mov	r6,r24
# [1315] if Result = FR_NO_FILE then
	ldi	r26,3
	cp	r6,r26
	brne	.Lj360
# [1316] Result := FR_OK;
	mov	r6,r1
.Lj360:
# [1318] end;
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
	pop	r28
	pop	r29
	ret
.Lc51:
.Le25:
	.size	PFF_ss_PF_READDIRsDIRsFILINFOssFRESULT, .Le25 - PFF_ss_PF_READDIRsDIRsFILINFOssFRESULT

.section .text.n_pff_ss_pf_rewinddirsdirssfresult,"ax"
.globl	PFF_ss_PF_REWINDDIRsDIRssFRESULT
PFF_ss_PF_REWINDDIRsDIRssFRESULT:
.Lc54:
# [1323] begin
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
# Var dj located in register r24
	lds	r19,(U_sPFF_ss_IFATFS)
	lds	r18,(U_sPFF_ss_IFATFS+1)
	cp	r19,r1
	cpc	r18,r1
	brne	.Lj373
	ldi	r26,5
	mov	r2,r26
	rjmp	.Lj370
.Lj373:
# [1327] dj.fn := sp;
	ldi	r19,lo8(2)
	ldi	r18,hi8(2)
	add	r19,r28
	adc	r18,r29
	movw	r30,r24
	std	Z+2,r19
	std	Z+3,r18
# [1328] Result := dir_rewind(dj);
	call	PFF_ss_DIR_REWINDsDIRssFRESULT
	mov	r2,r24
.Lj370:
# [1329] end;
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
.Lc53:
.Le26:
	.size	PFF_ss_PF_REWINDDIRsDIRssFRESULT, .Le26 - PFF_ss_PF_REWINDDIRsDIRssFRESULT
# End asmlist al_procedures
# Begin asmlist al_globals

.section .bss.n_u_spff_ss_ifatfs,"aw",%nobits
# [343] iFatFS: PFATFS;
	.size U_sPFF_ss_IFATFS,2
U_sPFF_ss_IFATFS:
	.zero 2
# End asmlist al_globals
# Begin asmlist al_rtti

.section .data.n_RTTI_sPFF_ss_PUINT
.globl	RTTI_sPFF_ss_PUINT
RTTI_sPFF_ss_PUINT:
	.byte	29,5
# [1334] 
	.ascii	"PUINT"
	.short	0
	.short	RTTI_sSYSTEM_ss_NATIVEUINTsindirect
.Le27:
	.size	RTTI_sPFF_ss_PUINT, .Le27 - RTTI_sPFF_ss_PUINT

.section .data.n_INIT_sPFF_ss_FATFS
.globl	INIT_sPFF_ss_FATFS
INIT_sPFF_ss_FATFS:
	.byte	13,5
	.ascii	"FATFS"
	.short	0,0
	.long	44
	.short	0,0
	.long	0
.Le28:
	.size	INIT_sPFF_ss_FATFS, .Le28 - INIT_sPFF_ss_FATFS

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
.Le29:
	.size	RTTI_sPFF_ss_FATFS, .Le29 - RTTI_sPFF_ss_FATFS

.section .data.n_RTTI_sPFF_ss_PFATFS
.globl	RTTI_sPFF_ss_PFATFS
RTTI_sPFF_ss_PFATFS:
	.byte	29,6
	.ascii	"PFATFS"
	.short	0
	.short	RTTI_sPFF_ss_FATFSsindirect
.Le30:
	.size	RTTI_sPFF_ss_PFATFS, .Le30 - RTTI_sPFF_ss_PFATFS

.section .data.n_INIT_sPFF_ss_DIR
.globl	INIT_sPFF_ss_DIR
INIT_sPFF_ss_DIR:
	.byte	13,3
	.ascii	"DIR"
	.short	0,0
	.long	16
	.short	0,0
	.long	0
.Le31:
	.size	INIT_sPFF_ss_DIR, .Le31 - INIT_sPFF_ss_DIR

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
.Le32:
	.size	RTTI_sPFF_ss_DIR, .Le32 - RTTI_sPFF_ss_DIR

.section .data.n_RTTI_sPFF_ss_PDIR
.globl	RTTI_sPFF_ss_PDIR
RTTI_sPFF_ss_PDIR:
	.byte	29,4
	.ascii	"PDIR"
	.short	0
	.short	RTTI_sPFF_ss_DIRsindirect
.Le33:
	.size	RTTI_sPFF_ss_PDIR, .Le33 - RTTI_sPFF_ss_PDIR

.section .data.n_INIT_sPFF_ss_FILINFO
.globl	INIT_sPFF_ss_FILINFO
INIT_sPFF_ss_FILINFO:
	.byte	13,7
	.ascii	"FILINFO"
	.short	0,0
	.long	24
	.short	0,0
	.long	0
.Le34:
	.size	INIT_sPFF_ss_FILINFO, .Le34 - INIT_sPFF_ss_FILINFO

.section .data.n_RTTI_sPFF_ss_def00000006
.globl	RTTI_sPFF_ss_def00000006
RTTI_sPFF_ss_def00000006:
	.byte	12,0
	.short	0,13,13
	.short	RTTI_sSYSTEM_ss_CHARsindirect
	.byte	1
	.short	RTTI_sSYSTEM_ss_SHORTINTsindirect
.Le35:
	.size	RTTI_sPFF_ss_def00000006, .Le35 - RTTI_sPFF_ss_def00000006

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
	.short	RTTI_sPFF_ss_def00000006sindirect
	.short	9
.Le36:
	.size	RTTI_sPFF_ss_FILINFO, .Le36 - RTTI_sPFF_ss_FILINFO

.section .data.n_RTTI_sPFF_ss_PFILINFO
.globl	RTTI_sPFF_ss_PFILINFO
RTTI_sPFF_ss_PFILINFO:
	.byte	29,8
	.ascii	"PFILINFO"
	.short	0
	.short	RTTI_sPFF_ss_FILINFOsindirect
.Le37:
	.size	RTTI_sPFF_ss_PFILINFO, .Le37 - RTTI_sPFF_ss_PFILINFO

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
.Le38:
	.size	RTTI_sPFF_ss_FRESULT, .Le38 - RTTI_sPFF_ss_FRESULT

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
.Le39:
	.size	RTTI_sPFF_ss_FRESULT_s2o, .Le39 - RTTI_sPFF_ss_FRESULT_s2o

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
.Le40:
	.size	RTTI_sPFF_ss_FRESULT_o2s, .Le40 - RTTI_sPFF_ss_FRESULT_o2s
# End asmlist al_rtti
# Begin asmlist al_indirectglobals

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

.section .data.n_RTTI_sPFF_ss_def00000006
	.balign 2
.globl	RTTI_sPFF_ss_def00000006sindirect
RTTI_sPFF_ss_def00000006sindirect:
	.short	RTTI_sPFF_ss_def00000006
.Le49:
	.size	RTTI_sPFF_ss_def00000006sindirect, .Le49 - RTTI_sPFF_ss_def00000006sindirect

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
.Lc55:
	.long	.Lc57-.Lc56
.Lc56:
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
.Lc57:
	.long	.Lc59-.Lc58
.Lc58:
	.short	.Lc55
	.short	.Lc2
	.short	.Lc1-.Lc2
	.balign 4,0
.Lc59:
	.long	.Lc62-.Lc61
.Lc61:
	.short	.Lc55
	.short	.Lc4
	.short	.Lc3-.Lc4
	.balign 4,0
.Lc62:
	.long	.Lc65-.Lc64
.Lc64:
	.short	.Lc55
	.short	.Lc6
	.short	.Lc5-.Lc6
	.balign 4,0
.Lc65:
	.long	.Lc68-.Lc67
.Lc67:
	.short	.Lc55
	.short	.Lc8
	.short	.Lc7-.Lc8
	.balign 4,0
.Lc68:
	.long	.Lc71-.Lc70
.Lc70:
	.short	.Lc55
	.short	.Lc10
	.short	.Lc9-.Lc10
	.balign 4,0
.Lc71:
	.long	.Lc74-.Lc73
.Lc73:
	.short	.Lc55
	.short	.Lc12
	.short	.Lc11-.Lc12
	.balign 4,0
.Lc74:
	.long	.Lc77-.Lc76
.Lc76:
	.short	.Lc55
	.short	.Lc14
	.short	.Lc13-.Lc14
	.balign 4,0
.Lc77:
	.long	.Lc80-.Lc79
.Lc79:
	.short	.Lc55
	.short	.Lc16
	.short	.Lc15-.Lc16
	.balign 4,0
.Lc80:
	.long	.Lc83-.Lc82
.Lc82:
	.short	.Lc55
	.short	.Lc18
	.short	.Lc17-.Lc18
	.balign 4,0
.Lc83:
	.long	.Lc86-.Lc85
.Lc85:
	.short	.Lc55
	.short	.Lc20
	.short	.Lc19-.Lc20
	.balign 4,0
.Lc86:
	.long	.Lc89-.Lc88
.Lc88:
	.short	.Lc55
	.short	.Lc22
	.short	.Lc21-.Lc22
	.balign 4,0
.Lc89:
	.long	.Lc92-.Lc91
.Lc91:
	.short	.Lc55
	.short	.Lc24
	.short	.Lc23-.Lc24
	.balign 4,0
.Lc92:
	.long	.Lc95-.Lc94
.Lc94:
	.short	.Lc55
	.short	.Lc26
	.short	.Lc25-.Lc26
	.balign 4,0
.Lc95:
	.long	.Lc98-.Lc97
.Lc97:
	.short	.Lc55
	.short	.Lc28
	.short	.Lc27-.Lc28
	.balign 4,0
.Lc98:
	.long	.Lc101-.Lc100
.Lc100:
	.short	.Lc55
	.short	.Lc30
	.short	.Lc29-.Lc30
	.balign 4,0
.Lc101:
	.long	.Lc104-.Lc103
.Lc103:
	.short	.Lc55
	.short	.Lc32
	.short	.Lc31-.Lc32
	.balign 4,0
.Lc104:
	.long	.Lc107-.Lc106
.Lc106:
	.short	.Lc55
	.short	.Lc34
	.short	.Lc33-.Lc34
	.balign 4,0
.Lc107:
	.long	.Lc110-.Lc109
.Lc109:
	.short	.Lc55
	.short	.Lc36
	.short	.Lc35-.Lc36
	.balign 4,0
.Lc110:
	.long	.Lc113-.Lc112
.Lc112:
	.short	.Lc55
	.short	.Lc38
	.short	.Lc37-.Lc38
	.balign 4,0
.Lc113:
	.long	.Lc116-.Lc115
.Lc115:
	.short	.Lc55
	.short	.Lc40
	.short	.Lc39-.Lc40
	.balign 4,0
.Lc116:
	.long	.Lc119-.Lc118
.Lc118:
	.short	.Lc55
	.short	.Lc42
	.short	.Lc41-.Lc42
	.balign 4,0
.Lc119:
	.long	.Lc122-.Lc121
.Lc121:
	.short	.Lc55
	.short	.Lc44
	.short	.Lc43-.Lc44
	.balign 4,0
.Lc122:
	.long	.Lc125-.Lc124
.Lc124:
	.short	.Lc55
	.short	.Lc46
	.short	.Lc45-.Lc46
	.balign 4,0
.Lc125:
	.long	.Lc128-.Lc127
.Lc127:
	.short	.Lc55
	.short	.Lc48
	.short	.Lc47-.Lc48
	.balign 4,0
.Lc128:
	.long	.Lc131-.Lc130
.Lc130:
	.short	.Lc55
	.short	.Lc50
	.short	.Lc49-.Lc50
	.balign 4,0
.Lc131:
	.long	.Lc134-.Lc133
.Lc133:
	.short	.Lc55
	.short	.Lc52
	.short	.Lc51-.Lc52
	.balign 4,0
.Lc134:
	.long	.Lc137-.Lc136
.Lc136:
	.short	.Lc55
	.short	.Lc54
	.short	.Lc53-.Lc54
	.balign 4,0
.Lc137:
# End asmlist al_dwarf_frame

