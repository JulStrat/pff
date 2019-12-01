{
  Petit FatFs - FAT file system module for FPC

  Copyright (C) 2019, ChaN, all right reserved.
  Copyright (C) 2019, I. Kakoulidis, all right reserved.

  Petit FatFs module is an open source software. Redistribution and use of
  Petit FatFs in source and binary forms, with or without modification, are
  permitted provided that the following condition is met:

  1. Redistributions of source code must retain the above copyright notice,
     this condition and the following disclaimer.

  This software is provided by the copyright holder and contributors "AS IS"
  and any warranties related to this software are DISCLAIMED.
  The copyright owner or contributors be NOT LIABLE for any damages caused
  by use of this software.
}

{
  @abstract(Petit FatFs is a sub-set of FatFs module for Tiny 8-bit MicroControllers.
  It can be incorporated into the Tiny MicroControllers with limited memory
  even if the RAM size is less than sector size.)
}

unit pff;

{$mode delphi}
{$define PF_USE_READ}
{$define PF_USE_DIR}

{$undef PF_USE_LSEEK}
{$undef PF_USE_WRITE}

{$define PF_FS_FAT12}
{$define PF_FS_FAT16}
{$define PF_FS_FAT32}

interface

uses disk_io;

const
  PF_DEFINED = 8088; (* Revision ID *)

(*
  File status flag (FATFS.flag)
*)
  FA_OPENED = $01;
  FA_WPRT = $02;
  FA__WIP = $40;

(*
  File attribute bits for directory entry
*)

  AM_RDO = $01;  (* Read only *)
  AM_HID = $02;  (* Hidden *)
  AM_SYS = $04;  (* System *)
  AM_VOL = $08;  (* Volume label *)
  AM_LFN = $0F;  (* LFN entry *)
  AM_DIR = $10;  (* Directory *)
  AM_ARC = $20;  (* Archive *)
  AM_MASK = $3F;  (* Mask of defined bits *)

  _FS_32ONLY = 0;

  PF_FS_FAT12 = 1;
  PF_FS_FAT16 = 1;
  PF_FS_FAT32 = 1;

  FS_FAT12 = 1;
  FS_FAT16 = 2;
  FS_FAT32 = 3;

  PF_USE_LCC = 0;

(*
  FatFs refers the members in the FAT structures with byte offset instead
  of structure member because there are incompatibility of the packing option
  between various compilers.
*)

  BS_jmpBoot = 0;
  BS_OEMName = 3;
  BS_DrvNum = 36;
  BS_BootSig = 38;
  BS_VolID = 39;
  BS_VolLab = 43;
  BS_FilSysType = 54;
  BS_DrvNum32 = 64;
  BS_BootSig32 = 66;
  BS_VolID32 = 67;
  BS_VolLab32 = 71;
  BS_FilSysType32 = 82;
  BS_55AA = 510;

  BPB_BytsPerSec = 11;
  BPB_SecPerClus = 13;
  BPB_RsvdSecCnt = 14;
  BPB_NumFATs = 16;
  BPB_RootEntCnt = 17;
  BPB_TotSec16 = 19;
  BPB_Media = 21;
  BPB_FATSz16 = 22;
  BPB_SecPerTrk = 24;
  BPB_NumHeads = 26;
  BPB_HiddSec = 28;
  BPB_TotSec32 = 32;
  BPB_FATSz32 = 36;
  BPB_ExtFlags = 40;
  BPB_FSVer = 42;
  BPB_RootClus = 44;
  BPB_FSInfo = 48;
  BPB_BkBootSec = 50;

  MBR_Table = 446;

  DIR_Name = 0;
  DIR_Attr = 11;
  DIR_NTres = 12;
  DIR_CrtTime = 14;
  DIR_CrtDate = 16;
  DIR_FstClusHI = 20;
  DIR_WrtTime = 22;
  DIR_WrtDate = 24;
  DIR_FstClusLO = 26;
  DIR_FileSize = 28;

type
  PWCHAR = ^WCHAR;
  WCHAR = word;

  PUINT = ^UINT;
  UINT = DWORD;

  //{$ifdef PF_FS_FAT32}
  CLUST = DWORD;
  //{$else}
  //CLUST = WORD;
  //{$endif}

  (* File system object structure *)
  PFATFS = ^FATFS;

  FATFS = record
    fs_type: byte; (* FAT sub type *)
    flag: byte; (* File status flags *)
    csize: byte; (* Number of sectors per cluster *)
    pad1: byte;
    n_rootdir: word; (* Number of root directory entries (0 on FAT32) *)
    n_fatent: CLUST; (* Number of FAT entries (= number of clusters + 2) *)
    fatbase: DWORD; (* FAT start sector *)
    dirbase: DWORD; (* Root directory start sector (Cluster# on FAT32) *)
    database: DWORD; (* Data start sector *)
    fptr: DWORD; (* File R/W pointer *)
    fsize: DWORD; (* File size *)
    org_clust: CLUST; (* File start cluster *)
    curr_clust: CLUST; (* File current cluster *)
    dsect: DWORD; (* File current data sector *)
  end;

  (* Directory object structure *)
  PDIR = ^DIR;

  DIR = record
    index: word; (* Current read/write index number *)
    fn: pBYTE; (* Pointer to the SFN (in/out) {file[8],ext[3],status[1]} *)
    sclust: CLUST; (* Table start cluster (0:Static table) *)
    clust: CLUST; (* Current cluster *)
    sect: DWORD; (* Current sector *)
  end;

  (* File status structure *)
  PFILINFO = ^FILINFO;

  FILINFO = record
    fsize: DWORD; (* File size *)
    fdate: word; (* Last modified date *)
    ftime: word; (* Last modified time *)
    fattrib: byte; (* Attribute *)
    fname: array [0..Pred(13)] of char; (* File name *)
  end;

  (* File function return code (FRESULT) *)
  FRESULT = (
    FR_OK = 0,
    FR_DISK_ERR,
    FR_NOT_READY,
    FR_NO_FILE,
    FR_NOT_OPENED,
    FR_NOT_ENABLED,
    FR_NO_FILESYSTEM);


(* Petit FatFs module application interface *)

{
  Mount/Unmount a logical Drive

  @param(fs Pointer to new file system object)
}
function pf_mount(fs: pFATFS): FRESULT;

{
  Open or Create a file

  @param(path Pointer to the file name)
}
function pf_open(path: PChar): FRESULT;

{$ifdef PF_USE_READ}
{
  Read data from the open file

  @param(buff Pointer to the read buffer (nil: Forward data to the stream))
  @param(btr Number of bytes to read)
  @param(br Pointer to number of bytes read)
}
function pf_read(buff: Pointer; btr: UINT; br: pUINT): FRESULT;
{$endif}

{$ifdef PF_USE_WRITE}
{
  Write data to the open file

  @param(buff Pointer to the data to be written)
  @param(btw Number of bytes to write (0:Finalize the current write operation))
  @param(bw Pointer to number of bytes written)
}
function pf_write(buff: Pointer; btw: UINT; bw: pUINT): FRESULT;
{$endif}

{$ifdef PF_USE_LSEEK}
{
  Move file pointer of the open file
  @param(ofs File pointer from top of file)
}
function pf_lseek(ofs: DWORD): FRESULT;
{$endif}

{$ifdef PF_USE_DIR}
{
  Create a directroy Object

  param(dj Pointer to directory object to create)
  param(path Pointer to the directory path)
}
function pf_opendir(dj: pDIR; path: PChar): FRESULT;

{
  Read a directory item from the open directory

  param(dj Pointer to the open directory object)
  param(fno Pointer to file information to return)
}
function pf_readdir(dj: pDIR; fno: pFILINFO): FRESULT;
{$endif}

implementation

var
  iFatFS: PFATFS;

{$ifdef PF_USE_LCC && !defined(_EXCVT)}
{$ifdef _DF2S}
function IsDBCS1(c: integer): boolean;
begin
  Result := ((BYTE(c) >= _DF1S) and (BYTE(c) <= _DF1E)) or
    ((BYTE(c) >= _DF2S) and (BYTE(c) <= _DF2E));
end;
{$else}
function IsDBCS1(c: integer): boolean;
begin
  Result := (BYTE(c) >= _DF1S) and (BYTE(c) <= _DF1E);
end;
{$endif}
{$ifdef _DS3S}
function IsDBCS2(c: integer): boolean;
begin
  Result := ((BYTE(c) >= _DS1S) and (BYTE(c) <= _DS1E)) or
    ((BYTE(c) >= _DS2S) and (BYTE(c) <= _DS2E)) or ((BYTE(c) >= _DS3S) and (BYTE(c) <= _DS3E));
end;
{$else}
function IsDBCS2(c: integer): boolean;
begin
  Result := ((BYTE(c) >= _DS1S) and (BYTE(c) <= _DS1E)) or
    ((BYTE(c) >= _DS2S) and (BYTE(c) <= _DS2E));
end;
{$endif}
{$else}
(* SBCS configuration *)
function IsDBCS1(c: integer): boolean;
begin
  Result := False;
end;

function IsDBCS2(c: integer): boolean;
begin
  Result := False;
end;
{$endif}

function IsUpper(c: char): boolean;
begin
  Result := (c >= 'A') and (c <= 'Z');
end;

function IsLower(c: char): boolean;
begin
  Result := (c >= 'a') and (c <= 'z');
end;

(*
  Load multi-byte word in the FAT structure
*)
(* Load a 2-byte little-endian word *)
function ld_word(ptr: pBYTE): word;
begin
  Result := (ptr[1] shl 8) or ptr[0];
end;

(* Load a 4-byte little-endian word *)
function ld_dword(ptr: pBYTE): DWORD;
var
  rv: DWORD;
begin
  rv := ptr[3];
  rv := rv shl 8 or ptr[2];
  rv := rv shl 8 or ptr[1];
  rv := rv shl 8 or ptr[0];
  Result := rv;
end;

(* String functions                                                      *)
(* Fill memory block *)
procedure mem_set(dst: pointer; val: integer; cnt: integer);
var
  d: PChar;
begin
  d := dst;
  while cnt > 0 do
  begin
    d^ := char(val);
    Inc(d);
    Dec(cnt);
  end;
end;

(* Compare memory block *)
function mem_cmp(dst: pointer; src: pointer; cnt: integer): integer;
var
  d: PChar;
  s: PChar;
  r: integer;
begin
  d := dst;
  s := src;
  r := 0;
  while (cnt > 0) and (r = 0) do
  begin
    r := Ord(d^) - Ord(s^);
    Inc(d);
    Inc(s);
    Dec(cnt);
  end;
  Result := r;
end;

(*-----------------------------------------------------------------------*)
(* FAT access - Read value of a FAT entry                                *)
(*-----------------------------------------------------------------------*)

(* 1:IO error, Else:Cluster status *)
(* Cluster# to get the link information *)
function get_fat(clst: CLUST): CLUST;
var
  buf: array [0..Pred(4)] of BYTE;
  fs: pFATFS;

{$ifdef PF_FS_FAT12}
  wc: UINT;
  bc: UINT;
  ofs: UINT;
{$endif}

begin
  fs := iFatFs;

  (* Range check *)
  if (clst < 2) or (clst >= fs.n_fatent) then
    Exit(1);

  case fs.fs_type of
    {$ifdef  PF_FS_FAT12}
    FS_FAT12:
    begin

      bc := UINT(clst);
      bc := bc + (bc div 2);
      ofs := bc mod 512;
      bc := bc div (512);
      if ofs <> 511 then
        if disk_readp(@buf, fs.fatbase + bc, ofs, 2) <> RES_OK then
          Exit(1)
        else
        begin
          if disk_readp(@buf, fs.fatbase + bc, 511, 1) <> RES_OK then
            Exit(1);
          if disk_readp(@buf + 1, fs.fatbase + bc + 1, 0, 1) <> RES_OK then
            Exit(1);
        end;
      wc := ld_word(buf);
      if (clst and 1) <> 0 then
        Exit(wc shr 4)
      else
        Exit(wc and $FFF);
    end;
    {$endif}

    {$ifdef PF_FS_FAT16}
    FS_FAT16:
    begin
      if disk_readp(@buf, fs.fatbase + clst div 256, (UINT(clst) mod 256) * 2, 2) <> RES_OK then
        Exit(1);
      Exit(ld_word(buf));
    end;
    {$endif}

    {$ifdef PF_FS_FAT32}
    FS_FAT32:
    begin
      if disk_readp(@buf, fs.fatbase + clst div 128, (UINT(clst) mod 128) * 4, 4) <> RES_OK then
        Exit(1);
      Exit(ld_dword(buf) and $0FFFFFFF);
    end;
    {$endif}
  end;

  (* An error occured at the disk I/O layer *)
  Result := 1;

end;

(*
  Check a sector if it is an FAT boot record
*)
(* 0:The FAT boot record, 1:Valid boot record but not an FAT, 2:Not a boot record, 3:Error *)
(* Working buffer *)
(* Sector# (lba) to check if it is an FAT boot record or not *)
function check_fs(buf: pBYTE; sect: DWORD): byte;
begin
  (* Read the boot record *)
  if disk_readp(buf, sect, 510, 2) <> RES_OK then
    Exit(3);
  (* Check record signature *)
  WriteLn('ld_word: ', Lo(ld_word(buf)), ' - ', Hi(ld_word(buf)));
  if ld_word(buf) <> $AA55 then
    Exit(2);

  (* Check FAT12/16 *)
  if (_FS_32ONLY = 0) and (disk_readp(buf, sect, BS_FilSysType, 2) = RES_OK) then
    if ld_word(buf) = $4146 then
      Exit(0);

  (* Check FAT32 *)
  if (PF_FS_FAT32 <> 0) and (disk_readp(buf, sect, BS_FilSysType32, 2) = RES_OK) then
    if ld_word(buf) = $4146 then
      Exit(0);

  Result := 1;
end;

(*
  Get sector# from cluster# / Get cluster field from directory entry
*)

(* !=0: Sector number, 0: Failed - invalid cluster# *)
(* Cluster# to be converted *)

function clust2sect(clst: CLUST): DWORD;
var
  fs: pFATFS;
begin
  fs := iFatFs;
  clst := clst - 2;
  if clst >= (fs.n_fatent - 2) then
    (* Invalid cluster# *)
    Result := 0
  else
    Result := DWORD(clst * fs.csize + fs.database);
end;

(* Pointer to directory entry *)
function get_clust(dir: pBYTE): CLUST;
var
  fs: pFATFS;
  clst: CLUST;
begin
  fs := iFatFs;
  clst := 0;
  if (_FS_32ONLY <> 0) or ((PF_FS_FAT32 <> 0) and (fs.fs_type = FS_FAT32)) then
  begin
    clst := ld_word(dir + DIR_FstClusHI);
    clst := clst shl 16;
  end;
  clst := clst or (ld_word(dir + DIR_FstClusLO));
  Result := clst;
end;

(*
  Directory handling - Rewind directory index
*)

(* Pointer to directory object *)
function dir_rewind(dj: pDIR): FRESULT;
var
  clst: CLUST;
  fs: pFATFS;
begin
  fs := iFatFs;
  dj.index := 0;
  clst := dj.sclust;
  (* Check start cluster range *)
  if (clst = 1) or (clst >= fs.n_fatent) then
    Exit(FR_DISK_ERR);

  if (PF_FS_FAT32 <> 0) and (0 = clst) and ((_FS_32ONLY <> 0) or
    (fs.fs_type = FS_FAT32)) then
    (* Replace cluster# 0 with root cluster# if in FAT32 *)
    clst := CLUST(fs.dirbase);

  (* Current cluster *)
  dj.clust := clst;
  (* Current sector *)
  if (_FS_32ONLY <> 0) or (clst <> 0) then
    dj.sect := clust2sect(clst)
  else
    dj.sect := fs.dirbase;
  (* Seek succeeded *)
  Result := FR_OK;
end;

(*-----------------------------------------------------------------------*)
(* Directory handling - Move directory index next                        *)
(*-----------------------------------------------------------------------*)

(* FR_OK:Succeeded, FR_NO_FILE:End of table *)
(* Pointer to directory object *)
function dir_next(dj: pDIR): FRESULT;
var
  clst: CLUST;
  i: WORD;
  fs: pFATFS;
begin
  fs := iFatFs;
  i := dj.index + 1;
  if (0 = i) or (0 = dj.sect) then
    Exit(FR_NO_FILE);
  (* Report EOT when index has reached 65535 *)
  if 0 = (i mod 16) then
  begin
    (* Sector changed? *)
    Inc(dj.sect); (* Next sector *)

    if dj.clust = 0 then
      (* Static table *)
      if i >= fs.n_rootdir then
        Exit(FR_NO_FILE)
      (* Report EOT when end of table *)
      else
      (* Dynamic table *)
      if ((i div 16) and (fs.csize - 1)) = 0 then
      begin
        (* Cluster changed? *)
        clst := get_fat(dj.clust); (* Get next cluster *)
        if clst <= 1 then
          Exit(FR_DISK_ERR);
        if clst >= fs.n_fatent then
          Exit(FR_NO_FILE);
        (* Report EOT when it reached end of dynamic table *)
        dj.clust := clst;
        dj.sect := clust2sect(clst);
        (* Initialize data for new cluster *)
      end;
  end;
  dj.index := i;
  Result := FR_OK;
end;

(* Pointer to the directory object *)
function create_name(dj: pDIR; var path: PChar): FRESULT;
var
  p: PBYTE;
{$ifdef PF_USE_LCC}
{$ifdef _EXCVT}
  cvt: array [0..127] of BYTE = _EXCVT;
{$endif}
{$endif}
  c: BYTE;
  d: BYTE;
  ni: BYTE;
  si: BYTE;
  i: BYTE;
  sfn: pBYTE;
begin
  (* Create file name in directory form *)
  sfn := dj.fn;
  mem_set(sfn, Ord(' '), 11);
  si := 0;
  i := 0;
  ni := 8;
  p := PBYTE(path);
  while True do
  begin
    c := p[si];
    Inc(si);
    if (c <= Ord(' ')) or (c = Ord('/')) then
      (* Break on end of segment *)
      break;

    if (c = Ord('.')) or (i >= ni) then
    begin
      if (ni <> 8) or (c <> Ord('.')) then
        break;
      i := 8;
      ni := 11;
      continue;
    end;
    {$ifdef PF_USE_LCC}{$ifdef _EXCVT}
    if c >= $80 then
      (* To upper extended char (SBCS) *)
      c := cvt[c - $80];
    {$endif}
    {$endif}

    (* DBC 1st byte? *)
    if IsDBCS1(c) and (i < ni - 1) then
    begin
      (* Get 2nd byte *)
      d := p[si];
      Inc(si);
      sfn[i] := c;
      Inc(i);
      sfn[i] := d;
      Inc(i);
    end
    else
    begin
      (* Single byte code *)
      if (PF_USE_LCC <> 0) and IsLower(Char(c)) then
        c := c - $20;
      (* toupper *)
      sfn[i] := c;
      Inc(i);
    end;
  end;

  path := @p[si];

  (* Set last segment flag if end of path *)
  sfn[11] := Integer(c <= Ord(' '));

  Result := FR_OK;
end;

(*
  Directory handling - Find an object in the directory
*)

(* Pointer to the directory object linked to the file name *)
(* 32-byte working buffer *)
function dir_find(dj: pDIR; dir: pBYTE): FRESULT;
var
  res: FRESULT;
  c: BYTE;
begin
  res := dir_rewind(dj); (* Rewind directory object *)
  if res <> FR_OK then
    Exit(res);

  repeat
    begin
      (* Read an entry *)
      if disk_readp(dir, dj.sect, (dj.index mod 16) * 32, 32) <> RES_OK then
        Exit(FRESULT.FR_DISK_ERR);
      (* First character *)
      c := dir[DIR_Name];
      if c = 0 then
      begin
        (* Reached to end of table *)
        res := FR_NO_FILE;
        break;
      end;

      (* Is it a valid entry? *)
      if (0 = (dir[DIR_Attr] and AM_VOL)) and (0 = mem_cmp(dir, dj.fn, 11)) then
        break;
      (* Next entry *)
      res := dir_next(dj);
    end
  until not (res = FR_OK);

  Result := res;
end;

{$ifdef PF_USE_DIR}
(*
  Read an object from the directory
*)

(* Pointer to the directory object to store read object name *)
(* 32-byte working buffer *)

function dir_read(dj: pDIR; dir: pBYTE): FRESULT;
var
  res: FRESULT;
  a: BYTE;
  c: BYTE;
begin
  res := FR_NO_FILE;
  while dj.sect <> 0 do
  begin
    (* Read an entry *)
    if disk_readp(dir, dj.sect, (dj.index mod 16) * 32, 32) <> DRESULT.RES_OK then
    begin
      res := FR_DISK_ERR;
      break;
    end
    else
      res := FR_OK;

    c := dir[DIR_Name];
    if c = 0 then
    begin
      (* Reached to end of table *)
      res := FR_NO_FILE;
      break;
    end;
    a := dir[DIR_Attr] and AM_MASK;

    (* Is it a valid entry? *)
    if (c <> $E5) and (c <> Ord('.')) and (0 = (a and AM_VOL)) then
      break;
    (* Next entry *)
    res := dir_next(dj);
    if res <> FR_OK then
      break;
  end;

  if res <> FR_OK then
    dj.sect := 0;
  Result := res;
end;

{$endif}

(*
  Follow a file path
*)

(* FR_OK(0): successful, !=0: error code *)
(* Directory object to return last directory and found object *)
(* 32-byte working buffer *)
(* Full-path string to find a file or directory *)

function follow_path(dj: pDIR; dir: pBYTE; path: PChar): FRESULT;
var
  res: FRESULT;
begin
  (* Strip leading spaces *)
  while path^ = ' ' do
    Inc(path);

  (* Strip heading separator if exist *)
  if path^ = '/' then
    Inc(path);

  (* Set start directory (always root dir) *)
  dj.sclust := 0;

  if path^ < ' ' then
  begin
    (* Null path means the root directory *)
    res := dir_rewind(dj);
    dir[0] := 0;
  end
  else
  begin
    (* Follow path *)
    while True do
    begin
      (* Get a segment *)
      res := create_name(dj, path);
      if res <> FR_OK then
        break;
      (* Find it *)
      res := dir_find(dj, dir);
      if res <> FR_OK then
        (* Could not find the object *)
        break;

      if dj.fn[11] <> 0 then
        (* Last segment match. Function completed. *)
        break;

      if (dir[DIR_Attr] = 0) and (AM_DIR <> 0) then
      begin
        (* Cannot follow path because it is a file *)
        res := FR_NO_FILE;
        break;
      end;
      (* Follow next *)
      dj.sclust := get_clust(dir);
    end;
  end;

  Result := res;
end;

(*-----------------------------------------------------------------------*)
(* Get file information from directory entry                             *)
(*-----------------------------------------------------------------------*)
{$ifdef PF_USE_DIR}
(* No return code *)
(* Pointer to the directory object *)
(* 32-byte working buffer *)
(* Pointer to store the file information *)

procedure get_fileinfo(dj: pDIR; dir: pBYTE; fno: pFILINFO);
var
  i: BYTE;
  c: BYTE;
  p: PChar;
begin
  p := fno.fname;
  if dj.sect <> 0 then
  begin
    for i := 0 to Pred(8) do
    begin
      (* Copy file name body *)
      c := dir[i];
      if c = Ord(' ') then
        break;
      if c = $05 then
        c := $E5;
      p^ := Char(c);
      Inc(p);
    end;
    if dir[8] <> Ord(' ') then
    begin
      (* Copy file name extension *)
      p^ := '.';
      Inc(p);
      for i := 8 to Pred(11) do
      begin
        c := dir[i];
        if c = Ord(' ') then
          break;
        p^ := Char(c);
        Inc(p);
      end;
    end;
    fno.fattrib := dir[DIR_Attr];
    fno.fsize := ld_dword(dir + DIR_FileSize);
    fno.fdate := ld_word(dir + DIR_WrtDate);
    fno.ftime := ld_word(dir + DIR_WrtTime);
  end;
  p^ := Char(0);
end;

{$endif}

function pf_mount(fs: pFATFS): FRESULT;
var
  fmt: byte;
  buf: array [0..Pred(36)] of byte;
  bsect: DWORD;
  fsize: DWORD;
  tsect: DWORD;
  mclst: DWORD;
begin
  iFatFs := nil;
  (* Check if the drive is ready or not *)
  if (disk_initialize() and STA_NOINIT) <> 0 then
    Exit(FR_NOT_READY);

  (* Search FAT partition on the drive *)
  bsect := 0;
  (* Check sector 0 as an SFD format *)
  fmt := check_fs(@buf, bsect);

  WriteLn(fmt);
  (* Not an FAT boot record, it may be FDISK format *)
  if fmt = 1 then
  begin
    (* Check a partition listed in top of the partition table *)
    if disk_readp(@buf, bsect, MBR_Table, 16) = RES_OK then
      (* 1st partition entry *)
      fmt := 3
    else
    if buf[4] <> 0 then
      (* Is the partition existing? *)
    begin
      (* Partition offset in LBA *)
      bsect := ld_dword(@buf[8]);
      (* Check the partition *)
      fmt := check_fs(@buf, bsect);
    end;
  end;
  if fmt = 3 then
    Exit(FR_DISK_ERR);
  (* No valid FAT patition is found *)
  if fmt <> 0 then
    Exit(FR_NO_FILESYSTEM);


  (* Initialize the file system object *)
  if disk_readp(@buf, bsect, 13, sizeof(buf)) <> RES_OK then
    Exit(FR_DISK_ERR);

  fsize := ld_word(@buf + BPB_FATSz16 - 13); (* Number of sectors per FAT *)
  if fsize = 0 then
    fsize := ld_dword(@buf + BPB_FATSz32 - 13);

  (* Number of sectors in FAT area *)
  fsize := fsize * (buf[BPB_NumFATs - 13]);
  (* FAT start sector (lba) *)
  fs.fatbase := bsect + ld_word(@buf + BPB_RsvdSecCnt - 13);
  (* Number of sectors per cluster *)
  fs.csize := buf[BPB_SecPerClus - 13];
  (* Nmuber of root directory entries *)
  fs.n_rootdir := ld_word(@buf + BPB_RootEntCnt - 13);
  (* Number of sectors on the file system *)
  tsect := ld_word(@buf + BPB_TotSec16 - 13);

  if tsect = 0 then
    tsect := ld_dword(@buf + BPB_TotSec32 - 13);

  (* Last cluster# + 1 *)
  mclst := (tsect - ld_word(@buf + BPB_RsvdSecCnt - 13) - fsize -
    fs.n_rootdir div 16) div fs.csize + 2;
  fs.n_fatent := CLUST(mclst);

  fmt := 0;

  (* Determine the FAT sub type *)
  if (PF_FS_FAT12 <> 0) and (mclst < $FF7) then
    fmt := FS_FAT12;
  if (PF_FS_FAT16 <> 0) and (mclst >= $FF8) and (mclst < $FFF7) then
    fmt := FS_FAT16;
  if (PF_FS_FAT32 <> 0) and (mclst >= $FFF7) then
    fmt := FS_FAT32;
  if fmt = 0 then
    Exit(FR_NO_FILESYSTEM);

  fs.fs_type := fmt;
  if (_FS_32ONLY <> 0) or ((PF_FS_FAT32 <> 0) and (fmt = FS_FAT32)) then
    (* Root directory start cluster *)
    fs.dirbase := ld_dword(@buf + (BPB_RootClus - 13))
  else
    (* Root directory start sector (lba) *)
    fs.dirbase := fs.fatbase + fsize;
  (* Data start sector (lba) *)
  fs.database := fs.fatbase + fsize + fs.n_rootdir div 16;

  fs.flag := 0;
  iFatFs := fs;
  Result := FR_OK;
end;

function pf_open(path: PChar): FRESULT;
var
  res: FRESULT;
  dj: DIR;
  sp: array [0..Pred(12)] of BYTE;
  dir: array [0..Pred(32)] of BYTE;
  fs: pFATFS;
begin
  fs := iFatFs;

  (* Check file system *)
  if fs = nil then
    Exit(FR_NOT_ENABLED);

  fs.flag := 0;
  dj.fn := sp;
  (* Follow the file path *)
  res := follow_path(@dj, dir, path);

  (* Follow failed *)
  if res <> FR_OK then
    Exit(res);

  (* It is a directory *)
  if (dir[0] = 0) or ((dir[DIR_Attr] and AM_DIR) <> 0) then
    Exit(FR_NO_FILE);

  (* File start cluster *)
  fs.org_clust := get_clust(dir);
  (* File size *)
  fs.fsize := ld_dword(@dir + DIR_FileSize);
  (* File pointer *)
  fs.fptr := 0;
  fs.flag := FA_OPENED;

  Result := FR_OK;
end;

function pf_read(buff: pointer; btr: UINT; br: pUINT): FRESULT;
var
  dr: DRESULT;
  clst: CLUST;
  sect: DWORD;
  remain: DWORD;
  rcnt: UINT;
  cs: BYTE;
  rbuff: pBYTE;
  fs: pFATFS;
begin
  rbuff := buff;
  fs := iFatFs;

  br^ := 0;
  (* Check file system *)
  if nil = fs then
    Exit(FR_NOT_ENABLED);

  (* Check if opened *)
  if 0 = (fs.flag and FA_OPENED) then
    Exit(FR_NOT_OPENED);

  remain := fs.fsize - fs.fptr;
  if btr > remain then
    (* Truncate btr by remaining bytes *)
    btr := UINT(remain);

  (* Repeat until all data transferred *)
  while btr <> 0 do
  begin
    (* On the sector boundary? *)
    if (fs.fptr mod 512) = 0 then
    begin
      (* Sector offset in the cluster *)
      cs := BYTE((fs.fptr div 512) and (fs.csize - 1));
      (* On the cluster boundary? *)
      if 0 = cs then
      begin
        (* On the top of the file? *)
        if fs.fptr = 0 then
          clst := fs.org_clust
        else
          clst := get_fat(fs.curr_clust);
        if clst <= 1 then
        begin
          fs.flag := 0;
          Exit(FR_DISK_ERR);
        end;

        (* Update current cluster *)
        fs.curr_clust := clst;
      end;
      (* Get current sector *)
      sect := clust2sect(fs.curr_clust);
      if 0 = sect then
      begin
        fs.flag := 0;
        Exit(FR_DISK_ERR);
      end;
      fs.dsect := sect + cs;
    end;
    (* Get partial sector data from sector buffer *)
    rcnt := 512 - UINT(fs.fptr mod 512);
    if rcnt > btr then
      rcnt := btr;
    dr := disk_readp(rbuff, fs.dsect, UINT(fs.fptr) mod 512, rcnt);
    if dr <> RES_OK then
    begin
      fs.flag := 0;
      Exit(FR_DISK_ERR);
    end;
    (* Advances file read pointer *)
    fs.fptr := fs.fptr + (rcnt);
    (* Update read counter *)
    btr := btr - rcnt;
    br^ += rcnt;
    (* Advances the data pointer if destination is memory *)
    if rbuff <> nil then
      rbuff := rbuff + rcnt;

  end;
  Result := FR_OK;
end;

{$ifdef PF_USE_LSEEK}
function pf_lseek(ofs: DWORD): FRESULT;
var
clst: CLUST;
bcs: DWORD;
sect: DWORD;
ifptr: DWORD;
fs: pFATFS;
begin
  fs:=iFatFs;

  (* Check file system *)
  if fs = nil then Exit(FR_NOT_ENABLED);

  (* Check if opened *)
  if (fs.flag and FA_OPENED) = 0 then Exit(FR_NOT_OPENED);

  if ofs>fs.fsize then
    (* Clip offset with the file size *)
    ofs:= fs.fsize;
  ifptr:= fs.fptr;
  fs.fptr:= 0;
  if ofs>0 then
  begin
    (* Cluster size (byte) *)
    bcs:= DWORD(fs.csize)*512;
    if (ifptr>0) and (((ofs-1) div bcs) >= ((ifptr-1) div bcs)) then
    begin
      (* When seek to same or following cluster, *)
      (* start from the current cluster *)
      fs.fptr:= (ifptr-1) and (not (bcs-1));
      ofs:= ofs - fs.fptr;
      clst:= fs.curr_clust;
    end
    else
    begin
      (* When seek to back cluster, *)
      (* start from the first cluster *)
      clst:= fs.org_clust;
      fs.curr_clust:= clst;
    end;
    while ofs>bcs do
    begin
      (* Cluster following loop *)
      (* Follow cluster chain *)
      clst:= get_fat(clst);
      if (clst<=1) or (clst>=fs.n_fatent) then
      begin
        fs.flag := 0;
        Exit(FR_DISK_ERR);
      end;
      fs.curr_clust:= clst;
      fs.fptr:= fs.fptr + bcs;
      ofs:= ofs - bcs;
    end;
    fs.fptr:= fs.fptr + ofs;
    (* Current sector *)
    sect:= clust2sect(clst);
    if sect = 0 then
    begin
      fs.flag := 0;
      Exit(FR_DISK_ERR);
    end;
    fs.dsect:= sect+((fs.fptr div 512) and (fs.csize-1));
  end;
  result:= FR_OK;
end;
{$endif}

{$ifdef PF_USE_WRITE}
function pf_write(buff: pinteger;  btw: UINT;  bw: pUINT): FRESULT;
const
p: pBYTE = buff;
var
clst: CLUST;
sect: DWORD;
remain: DWORD;
cs: BYTE;
wcnt: UINT;
fs: pFATFS;
begin
  fs:=iFatFs;
  (* Check file system *)
  if fs = nil then Exit(FR_NOT_ENABLED);

  bw^:=0;
  (* Check if opened *)
  if (fs.flag and FA_OPENED) = 0 then Exit(FR_NOT_OPENED);

  if btw = 0 then
  begin
    (* Finalize request *)
    if (fs.flag and FA__WIP) and (disk_writep(nil, 0) <> DRESULT.RES_OK) then
    begin
      fs.flag := 0;
      Exit(FR_DISK_ERR);
    end;
    fs.flag:= fs.flag and (not FA__WIP);
    Exit(FR_OK);
  end
  else
    (* Write data request *)
    if (fs.flag and FA__WIP) = 0 then
      (* Round-down fptr to the sector boundary *)
      fs.fptr:= fs.fptr and $FFFFFE00;

  remain:= fs.fsize-fs.fptr;
  if btw>remain then
    btw:= UINT(remain); (* Truncate btw by remaining bytes *)

  while btw <> 0 do
  begin
    (* Repeat until all data transferred *)
    if UINT(fs.fptr) mod 512 = 0 then
    begin
      (* On the sector boundary? *)
      cs:= (BYTE(fs.fptr) div 512) and (fs.csize-1 <> 0); (* Sector offset in the cluster *)
      if cs = 0 then
      begin
        (* On the cluster boundary? *)
        if fs.fptr=0 then
          (* On the top of the file? *)
          clst:= fs.org_clust
        else
          clst:= get_fat(fs.curr_clust);
        if clst<=1 then
        begin
          fs.flag := 0;
          Exit(FR_DISK_ERR);
        end;
        (* Update current cluster *)
        fs.curr_clust:= clst;
      end;
      (* Get current sector *)
      sect:= clust2sect(fs.curr_clust);
      if sect = 0 then
      begin
        fs.flag := 0;
        Exit(FR_DISK_ERR);
      end;
      fs.dsect:= sect+cs;
      if disk_writep(0,fs.dsect) <> DRESULT.RES_OK then
      begin
        (* Initiate a sector write operation *)
        fs.flag := 0;
        Exit(FR_DISK_ERR);
      end;
      fs.flag:= fs.flag or FA__WIP;
    end;
    (* Number of bytes to write to the sector *)
    wcnt:= 512-(UINT(fs.fptr) mod 512);
    if wcnt>btw then wcnt:= btw;
    if disk_writep(p,wcnt) then
    begin
      (* Send data to the sector *)
      fs.flag := 0;
      Exit(FR_DISK_ERR);
    end;
    (* Update pointers and counters *)
    fs.fptr:= fs.fptr + wcnt;
    p:= p + wcnt;
    btw:= btw - wcnt;
    bw^+=wcnt;

    if UINT(fs.fptr) mod 512 = 0 then
    begin
      if disk_writep(0,0) <> DRESULT.RES_OK then
      begin
        (* Finalize the currtent secter write operation *)
        fs.flag := 0;
        Exit(FR_DISK_ERR);
      end;
      fs.flag:= fs.flag and ( not FA__WIP);
    end;
  end;

  result:= FR_OK;
end;
{$endif}

{$ifdef PF_USE_DIR}
function pf_opendir(dj: pDIR; path: PChar): FRESULT;
var
  res: FRESULT;
  sp: array [0..Pred(12)] of BYTE;
  dir: array [0..Pred(32)] of BYTE;
  fs: pFATFS;
begin
  fs := iFatFs;

  if fs = nil then
    (* Check file system *)
    res := FR_NOT_ENABLED
  else
  begin
    dj.fn := sp;
    (* Follow the path to the directory *)
    res := follow_path(dj, dir, path);
    if res = FR_OK then
    begin
      (* Follow completed *)
      if dir[0] <> 0 then
        (* It is not the root dir *)
        if (dir[DIR_Attr] and AM_DIR) <> 0 then
          (* The object is a directory *)
          dj.sclust := get_clust(dir)
        else
          (* The object is not a directory *)
          res := FR_NO_FILE;
      if res = FR_OK then
        (* Rewind dir *)
        res := dir_rewind(dj);
    end;
  end;
  Result := res;
end;

function pf_readdir(dj: pDIR; fno: pFILINFO): FRESULT;
var
  res: FRESULT;
  sp: array [0..Pred(12)] of BYTE;
  dir: array [0..Pred(32)] of BYTE;
  fs: pFATFS;
begin
  fs := iFatFs;

  if fs = nil then
    (* Check file system *)
    res := FR_NOT_ENABLED
  else
  begin
    dj.fn := sp;
    if fno = nil then
      res := dir_rewind(dj)
    else
    begin
      (* Get current directory item *)
      res := dir_read(dj, dir);
      if res = FR_NO_FILE then
        res := FR_OK;
      if res = FR_OK then
      begin
        (* A valid entry is found *)
        (* Get the object information *)
        get_fileinfo(dj, dir, fno);
        (* Increment read index for next *)
        res := dir_next(dj);
        if res = FR_NO_FILE then
          res := FR_OK;
      end;
    end;
  end;
  Result := res;
end;
{$endif}

end.
