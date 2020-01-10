{ DBCS code ranges and SBCS extend char conversion table }
type
  _TEXCVT = array [0..127] of byte;
{$if PF_USE_LCC}
{$if PF_CODE_PAGE = 932}(* Japanese Shift-JIS *)
{$info Code page - Japanese Shift-JIS}
const
  (* DBC 1st byte range 1 start *)
  _DF1S = $81;
  (* DBC 1st byte range 1 end *)
  _DF1E = $9F;
  (* DBC 1st byte range 2 start *)
  _DF2S = $E0;
  (* DBC 1st byte range 2 end *)
  _DF2E = $FC;
  (* DBC 2nd byte range 1 start *)
  _DS1S = $40;
  (* DBC 2nd byte range 1 end *)
  _DS1E = $7E;
  (* DBC 2nd byte range 2 start *)
  _DS2S = $80;
  (* DBC 2nd byte range 2 end *)
  _DS2E = $FC;
{$elseif PF_CODE_PAGE = 936}(* Simplified Chinese GBK *)
{$info Code page - Simplified Chinese GBK}
const
  _DF1S = $81;
  _DF1E = $FE;
  _DS1S = $40;
  _DS1E = $7E;
  _DS2S = $80;
  _DS2E = $FE;
{$elseif PF_CODE_PAGE = 949}(* Korean *)
{$info Code page - Korean}
const
  _DF1S = $81;
  _DF1E = $FE;
  _DS1S = $41;
  _DS1E = $5A;
  _DS2S = $61;
  _DS2E = $7A;
  _DS3S = $81;
  _DS3E = $FE;
{$elseif PF_CODE_PAGE = 950}(* Traditional Chinese Big5 *)
{$info Code page - Traditional Chinese Big5}
const
  _DF1S = $81;
  _DF1E = $FE;
  _DS1S = $40;
  _DS1E = $7E;
  _DS2S = $A1;
  _DS2E = $FE;
{$elseif PF_CODE_PAGE = 437}(* U.S. *)
{$info Code page - U.S.}
const
  _EXCVT: _TEXCVT = (
    $80, $9A, $45, $41, $8E, $41, $8F, $80, $45, $45, $45, $49, $49, $49, $8E, $8F, 
	$90, $92, $92, $4F, $99, $4F, $55, $55, $59, $99, $9A, $9B, $9C, $9D, $9E, $9F, 
	$41, $49, $4F, $55, $A5, $A5, $A6, $A7, $A8, $A9, $AA, $AB, $AC, $AD, $AE, $AF,
    $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD, $BE, $BF,
	$C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CB, $CC, $CD, $CE, $CF, 
	$D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7, $D8, $D9, $DA, $DB, $DC, $DD, $DE, $DF, 
	$E0, $E1, $E2, $E3, $E4, $E5, $E6, $E7, $E8, $E9, $EA, $EB, $EC, $ED, $EE, $EF, 
	$F0, $F1, $F2, $F3, $F4, $F5, $F6, $F7, $F8, $F9, $FA, $FB, $FC, $FD, $FE, $FF);
{$elseif PF_CODE_PAGE = 720}(* Arabic *)
{$info Code page - Arabic}
const
  _EXCVT: _TEXCVT = (
    $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8A, $8B, $8C, $8D, $8E, $8F, 
	$90, $91, $92, $93, $94, $95, $96, $97, $98, $99, $9A, $9B, $9C, $9D, $9E, $9F, 
	$A0, $A1, $A2, $A3, $A4, $A5, $A6, $A7, $A8, $A9, $AA, $AB, $AC, $AD, $AE, $AF,
    $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD, $BE, $BF,
	$C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CB, $CC, $CD, $CE, $CF, 
	$D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7, $D8, $D9, $DA, $DB, $DC, $DD, $DE, $DF, 
	$E0, $E1, $E2, $E3, $E4, $E5, $E6, $E7, $E8, $E9, $EA, $EB, $EC, $ED, $EE, $EF, 
	$F0, $F1, $F2, $F3, $F4, $F5, $F6, $F7, $F8, $F9, $FA, $FB, $FC, $FD, $FE, $FF);
{$elseif PF_CODE_PAGE = 737}(* Greek *)
{$info Code page - Greek}
const
  _EXCVT: _TEXCVT = (
    $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8A, $8B, $8C, $8D, $8E, $8F, 
	$90, $92, $92, $93, $94, $95, $96, $97, $80, $81, $82, $83, $84, $85, $86, $87, 
	$88, $89, $8A, $8B, $8C, $8D, $8E, $8F, $90, $91, $AA, $92, $93, $94, $95, $96,
    $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD, $BE, $BF,
	$C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CB, $CC, $CD, $CE, $CF, 
	$D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7, $D8, $D9, $DA, $DB, $DC, $DD, $DE, $DF, 
	$97, $EA, $EB, $EC, $E4, $ED, $EE, $EF, $F5, $F0, $EA, $EB, $EC, $ED, $EE, $EF, 
	$F0, $F1, $F2, $F3, $F4, $F5, $F6, $F7, $F8, $F9, $FA, $FB, $FC, $FD, $FE, $FF);
{$elseif PF_CODE_PAGE = 771}(* KBL *)
{$info Code page - KBL}
const
  _EXCVT: _TEXCVT = (
    $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8A, $8B, $8C, $8D, $8E, $8F, 
	$90, $91, $92, $93, $94, $95, $96, $97, $98, $99, $9A, $9B, $9C, $9D, $9E, $9F, 
	$80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8A, $8B, $8C, $8D, $8E, $8F,
    $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD, $BE, $BF,
	$C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CB, $CC, $CD, $CE, $CF, 
	$D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7, $D8, $D9, $DA, $DB, $DC, $DC, $DE, $DE, 
	$90, $91, $92, $93, $94, $95, $96, $97, $98, $99, $9A, $9B, $9C, $9D, $9E, $9F,
	$F0, $F0, $F2, $F2, $F4, $F4, $F6, $F6, $F8, $F8, $FA, $FA, $FC, $FC, $FE, $FF);
{$elseif PF_CODE_PAGE = 775}(* Baltic *)
{$info Code page - Baltic}
const
  _EXCVT: _TEXCVT = (
    $80, $9A, $91, $A0, $8E, $95, $8F, $80, $AD, $ED, $8A, $8A, $A1, $8D, $8E, $8F, 
	$90, $92, $92, $E2, $99, $95, $96, $97, $97, $99, $9A, $9D, $9C, $9D, $9E, $9F,
	$A0, $A1, $E0, $A3, $A3, $A5, $A6, $A7, $A8, $A9, $AA, $AB, $AC, $AD, $AE, $AF,
    $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD, $BE, $BF,
	$C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CB, $CC, $CD, $CE, $CF, 
	$B5, $B6, $B7, $B8, $BD, $BE, $C6, $C7, $A5, $D9, $DA, $DB, $DC, $DD, $DE, $DF, 
	$E0, $E1, $E2, $E3, $E5, $E5, $E6, $E3, $E8, $E8, $EA, $EA, $EE, $ED, $EE, $EF, 
	$F0, $F1, $F2, $F3, $F4, $F5, $F6, $F7, $F8, $F9, $FA, $FB, $FC, $FD, $FE, $FF);
{$elseif PF_CODE_PAGE = 850}(* Latin 1 *)
{$info Code page - Latin 1}
const
  _EXCVT: _TEXCVT = (
    $43, $55, $45, $41, $41, $41, $41, $43, $45, $45, $45, $49, $49, $49, $41, $41, 
	$45, $92, $92, $4F, $4F, $4F, $55, $55, $59, $4F, $55, $4F, $9C, $4F, $9E, $9F, 
	$41, $49, $4F, $55, $A5, $A5, $A6, $A7, $A8, $A9, $AA, $AB, $AC, $AD, $AE, $AF,
    $B0, $B1, $B2, $B3, $B4, $41, $41, $41, $B8, $B9, $BA, $BB, $BC, $BD, $BE, $BF,
	$C0, $C1, $C2, $C3, $C4, $C5, $41, $41, $C8, $C9, $CA, $CB, $CC, $CD, $CE, $CF, 
	$D1, $D1, $45, $45, $45, $49, $49, $49, $49, $D9, $DA, $DB, $DC, $DD, $49, $DF, 
	$4F, $E1, $4F, $4F, $4F, $4F, $E6, $E8, $E8, $55, $55, $55, $59, $59, $EE, $EF, 
	$F0, $F1, $F2, $F3, $F4, $F5, $F6, $F7, $F8, $F9, $FA, $FB, $FC, $FD, $FE, $FF);
{$elseif PF_CODE_PAGE = 852}(* Latin 2 *)
{$info Code page - Latin 2}
const
  _EXCVT: _TEXCVT = (
    $80, $9A, $90, $B6, $8E, $DE, $8F, $80, $9D, $D3, $8A, $8A, $D7, $8D, $8E, $8F, 
	$90, $91, $91, $E2, $99, $95, $95, $97, $97, $99, $9A, $9B, $9B, $9D, $9E, $AC, 
	$B5, $D6, $E0, $E9, $A4, $A4, $A6, $A6, $A8, $A8, $AA, $8D, $AC, $B8, $AE, $AF,
    $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD, $BD, $BF,
	$C0, $C1, $C2, $C3, $C4, $C5, $C6, $C6, $C8, $C9, $CA, $CB, $CC, $CD, $CE, $CF, 
	$D1, $D1, $D2, $D3, $D2, $D5, $D6, $D7, $B7, $D9, $DA, $DB, $DC, $DD, $DE, $DF, 
	$E0, $E1, $E2, $E3, $E3, $D5, $E6, $E6, $E8, $E9, $E8, $EB, $ED, $ED, $DD, $EF, 
	$F0, $F1, $F2, $F3, $F4, $F5, $F6, $F7, $F8, $F9, $FA, $EB, $FC, $FC, $FE, $FF);
{$elseif PF_CODE_PAGE = 855}(* Cyrillic *)
{$info Code page - Cyrillic}
const
  _EXCVT: _TEXCVT = (
    $81, $81, $83, $83, $85, $85, $87, $87, $89, $89, $8B, $8B, $8D, $8D, $8F, $8F, 
	$91, $91, $93, $93, $95, $95, $97, $97, $99, $99, $9B, $9B, $9D, $9D, $9F, $9F, 
	$A1, $A1, $A3, $A3, $A5, $A5, $A7, $A7, $A9, $A9, $AB, $AB, $AD, $AD, $AE, $AF,
    $B0, $B1, $B2, $B3, $B4, $B6, $B6, $B8, $B8, $B9, $BA, $BB, $BC, $BE, $BE, $BF,
	$C0, $C1, $C2, $C3, $C4, $C5, $C7, $C7, $C8, $C9, $CA, $CB, $CC, $CD, $CE, $CF, 
	$D1, $D1, $D3, $D3, $D5, $D5, $D7, $D7, $DD, $D9, $DA, $DB, $DC, $DD, $E0, $DF, 
	$E0, $E2, $E2, $E4, $E4, $E6, $E6, $E8, $E8, $EA, $EA, $EC, $EC, $EE, $EE, $EF, 
	$F0, $F2, $F2, $F4, $F4, $F6, $F6, $F8, $F8, $FA, $FA, $FC, $FC, $FD, $FE, $FF);
{$elseif PF_CODE_PAGE = 857}(* Turkish *)
{$info Code page - Turkish}
const
  _EXCVT: _TEXCVT = (
    $80, $9A, $90, $B6, $8E, $B7, $8F, $80, $D2, $D3, $D4, $D8, $D7, $98, $8E, $8F, 
	$90, $92, $92, $E2, $99, $E3, $EA, $EB, $98, $99, $9A, $9D, $9C, $9D, $9E, $9E,
    $B5, $D6, $E0, $E9, $A5, $A5, $A6, $A6, $A8, $A9, $AA, $AB, $AC, $21, $AE, $AF,
    $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD, $BE, $BF,
    $C0, $C1, $C2, $C3, $C4, $C5, $C7, $C7, $C8, $C9, $CA, $CB, $CC, $CD, $CE, $CF,
    $D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7, $D8, $D9, $DA, $DB, $DC, $DD, $DE, $DF,
    $E0, $E1, $E2, $E3, $E5, $E5, $E6, $E7, $E8, $E9, $EA, $EB, $DE, $59, $EE, $EF,
    $F0, $F1, $F2, $F3, $F4, $F5, $F6, $F7, $F8, $F9, $FA, $FB, $FC, $FD, $FE, $FF);
{$elseif PF_CODE_PAGE = 860}(* Portuguese *)
{$info Code page - Portuguese}
const
  _EXCVT: _TEXCVT = (
    $80, $9A, $90, $8F, $8E, $91, $86, $80, $89, $89, $92, $8B, $8C, $98, $8E, $8F, 
	$90, $91, $92, $8C, $99, $A9, $96, $9D, $98, $99, $9A, $9B, $9C, $9D, $9E, $9F,
	$86, $8B, $9F, $96, $A5, $A5, $A6, $A7, $A8, $A9, $AA, $AB, $AC, $AD, $AE, $AF,
    $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD, $BE, $BF,
	$C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CB, $CC, $CD, $CE, $CF, 
	$D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7, $D8, $D9, $DA, $DB, $DC, $DD, $DE, $DF, 
	$E0, $E1, $E2, $E3, $E4, $E5, $E6, $E7, $E8, $E9, $EA, $EB, $EC, $ED, $EE, $EF, 
	$F0, $F1, $F2, $F3, $F4, $F5, $F6, $F7, $F8, $F9, $FA, $FB, $FC, $FD, $FE, $FF);
{$elseif PF_CODE_PAGE = 861}(* Icelandic *)
{$info Code page - Icelandic}
const
  _EXCVT: _TEXCVT = (
    $80, $9A, $90, $41, $8E, $41, $8F, $80, $45, $45, $45, $8B, $8B, $8D, $8E, $8F, 
	$90, $92, $92, $4F, $99, $8D, $55, $97, $97, $99, $9A, $9D, $9C, $9D, $9E, $9F, 
	$A4, $A5, $A6, $A7, $A4, $A5, $A6, $A7, $A8, $A9, $AA, $AB, $AC, $AD, $AE, $AF,
    $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD, $BE, $BF, 
	$C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CB, $CC, $CD, $CE, $CF, 
	$D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7, $D8, $D9, $DA, $DB, $DC, $DD, $DE, $DF, 
	$E0, $E1, $E2, $E3, $E4, $E5, $E6, $E7, $E8, $E9, $EA, $EB, $EC, $ED, $EE, $EF, 
	$F0, $F1, $F2, $F3, $F4, $F5, $F6, $F7, $F8, $F9, $FA, $FB, $FC, $FD, $FE, $FF);
{$elseif PF_CODE_PAGE = 862}(* Hebrew *)
{$info Code page - Hebrew}
const
  _EXCVT: _TEXCVT = (
    $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8A, $8B, $8C, $8D, $8E, $8F, 
	$90, $91, $92, $93, $94, $95, $96, $97, $98, $99, $9A, $9B, $9C, $9D, $9E, $9F, 
	$41, $49, $4F, $55, $A5, $A5, $A6, $A7, $A8, $A9, $AA, $AB, $AC, $AD, $AE, $AF,
    $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD, $BE, $BF,
	$C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CB, $CC, $CD, $CE, $CF, 
	$D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7, $D8, $D9, $DA, $DB, $DC, $DD, $DE, $DF, 
	$E0, $E1, $E2, $E3, $E4, $E5, $E6, $E7, $E8, $E9, $EA, $EB, $EC, $ED, $EE, $EF, 
	$F0, $F1, $F2, $F3, $F4, $F5, $F6, $F7, $F8, $F9, $FA, $FB, $FC, $FD, $FE, $FF);
{$elseif PF_CODE_PAGE = 863}(* Canadian French *)
{$info Code page - Canadian French}
const
  _EXCVT: _TEXCVT = (
    $43, $55, $45, $41, $41, $41, $86, $43, $45, $45, $45, $49, $49, $8D, $41, $8F, 
	$45, $45, $45, $4F, $45, $49, $55, $55, $98, $4F, $55, $9B, $9C, $55, $55, $9F, 
	$A0, $A1, $4F, $55, $A4, $A5, $A6, $A7, $49, $A9, $AA, $AB, $AC, $AD, $AE, $AF,
    $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD, $BE, $BF,
	$C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CB, $CC, $CD, $CE, $CF,
	$D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7, $D8, $D9, $DA, $DB, $DC, $DD, $DE, $DF, 
	$E0, $E1, $E2, $E3, $E4, $E5, $E6, $E7, $E8, $E9, $EA, $EB, $EC, $ED, $EE, $EF, 
	$F0, $F1, $F2, $F3, $F4, $F5, $F6, $F7, $F8, $F9, $FA, $FB, $FC, $FD, $FE, $FF);
{$elseif PF_CODE_PAGE = 864}(* Arabic *)
{$info Code page - Arabic}
const
  _EXCVT: _TEXCVT = (
    $80, $9A, $45, $41, $8E, $41, $8F, $80, $45, $45, $45, $49, $49, $49, $8E, $8F, 
	$90, $92, $92, $4F, $99, $4F, $55, $55, $59, $99, $9A, $9B, $9C, $9D, $9E, $9F,
	$41, $49, $4F, $55, $A5, $A5, $A6, $A7, $A8, $A9, $AA, $AB, $AC, $AD, $AE, $AF,
    $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD, $BE, $BF,
	$C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CB, $CC, $CD, $CE, $CF,
	$D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7, $D8, $D9, $DA, $DB, $DC, $DD, $DE, $DF,
	$E0, $E1, $E2, $E3, $E4, $E5, $E6, $E7, $E8, $E9, $EA, $EB, $EC, $ED, $EE, $EF,
	$F0, $F1, $F2, $F3, $F4, $F5, $F6, $F7, $F8, $F9, $FA, $FB, $FC, $FD, $FE, $FF);
{$elseif PF_CODE_PAGE = 865}(* Nordic *)
{$info Code page - Nordic}
const
  _EXCVT: _TEXCVT = (
    $80, $9A, $90, $41, $8E, $41, $8F, $80, $45, $45, $45, $49, $49, $49, $8E, $8F, 
	$90, $92, $92, $4F, $99, $4F, $55, $55, $59, $99, $9A, $9B, $9C, $9D, $9E, $9F,
	$41, $49, $4F, $55, $A5, $A5, $A6, $A7, $A8, $A9, $AA, $AB, $AC, $AD, $AE, $AF,
    $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD, $BE, $BF, 
	$C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CB, $CC, $CD, $CE, $CF, 
	$D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7, $D8, $D9, $DA, $DB, $DC, $DD, $DE, $DF, 
	$E0, $E1, $E2, $E3, $E4, $E5, $E6, $E7, $E8, $E9, $EA, $EB, $EC, $ED, $EE, $EF, 
	$F0, $F1, $F2, $F3, $F4, $F5, $F6, $F7, $F8, $F9, $FA, $FB, $FC, $FD, $FE, $FF);
{$elseif PF_CODE_PAGE = 866}(* Russian *)
{$info Code page - Russian}
const
  _EXCVT: _TEXCVT = (
    $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8A, $8B, $8C, $8D, $8E, $8F, 
	$90, $91, $92, $93, $94, $95, $96, $97, $98, $99, $9A, $9B, $9C, $9D, $9E, $9F, 
	$80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8A, $8B, $8C, $8D, $8E, $8F,
    $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD, $BE, $BF,
	$C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CB, $CC, $CD, $CE, $CF,
	$D0, $D1, $D2, $D3, $D4, $D5, $D6, $D7, $D8, $D9, $DA, $DB, $DC, $DD, $DE, $DF,
	$90, $91, $92, $93, $94, $95, $96, $97, $98, $99, $9A, $9B, $9C, $9D, $9E, $9F, 
	$F0, $F0, $F2, $F2, $F4, $F4, $F6, $F6, $F8, $F9, $FA, $FB, $FC, $FD, $FE, $FF);
{$elseif PF_CODE_PAGE = 869}(* Greek 2 *)
{$info Code page - Greek 2}
const
  _EXCVT: _TEXCVT = (
    $80, $81, $82, $83, $84, $85, $86, $87, $88, $89, $8A, $8B, $8C, $8D, $8E, $8F, 
	$90, $91, $92, $93, $94, $95, $96, $97, $98, $99, $9A, $86, $9C, $8D, $8F, $90,
	$91, $90, $92, $95, $A4, $A5, $A6, $A7, $A8, $A9, $AA, $AB, $AC, $AD, $AE, $AF,
    $B0, $B1, $B2, $B3, $B4, $B5, $B6, $B7, $B8, $B9, $BA, $BB, $BC, $BD, $BE, $BF, 
	$C0, $C1, $C2, $C3, $C4, $C5, $C6, $C7, $C8, $C9, $CA, $CB, $CC, $CD, $CE, $CF, 
	$D0, $D1, $D2, $D3, $D4, $D5, $A4, $A5, $A6, $D9, $DA, $DB, $DC, $A7, $A8, $DF, 
	$A9, $AA, $AC, $AD, $B5, $B6, $B7, $B8, $BD, $BE, $C6, $C7, $CF, $CF, $D0, $EF, 
	$F0, $F1, $D1, $D2, $D3, $F5, $D4, $F7, $F8, $F9, $D5, $96, $95, $98, $FE, $FF);
{$else}
{$error Unknown code page.}
{$endif}
{$endif}
