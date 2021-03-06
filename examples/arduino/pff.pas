{ Petit FatFs - FAT file system module for FPC

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
  by use of this software.}

{ @abstract(Petit FatFs is a sub-set of FatFs module for Tiny 8-bit MicroControllers.
  It can be incorporated into the Tiny MicroControllers with limited memory
  even if the RAM size is less than sector size.)}

unit pff;

{$mode delphi}
{$optimization noloopunroll}

interface

uses disk_io;

{$I pff_cfg.inc}

const
  {$if (not PF_FS_FAT12)
     and (not PF_FS_FAT16)
     and (not PF_FS_FAT32)}
    {$error Wrong PF_FS_FATxx configuration.}
  {$else}
    {$if PF_FS_FAT32 
      and (not PF_FS_FAT12)
      and (not PF_FS_FAT16)}
  _FS_32ONLY = True;
    {$else}
  _FS_32ONLY = False;
    {$endif}
  {$endif}

  (*  File status flag (FATFS.flag)  *)
  FA_OPENED = $01;
  FA_WPRT = $02;
  FA__WIP = $40;

  (*  File attribute bits for directory entry  *)
  (* Read only *)
  AM_RDO = $01;
  (* Hidden *)
  AM_HID = $02;
  (* System *)
  AM_SYS = $04;
  (* Volume label *)
  AM_VOL = $08;
  (* LFN entry *)
  AM_LFN = $0F;
  (* Directory *)
  AM_DIR = $10;
  (* Archive *)
  AM_ARC = $20;
  (* Mask of defined bits *)
  AM_MASK = $3F;

  FS_FAT12 = 1;
  FS_FAT16 = 2;
  FS_FAT32 = 3;

{ @exclude(FatFs refers the members in the FAT structures with byte offset instead
  of structure member because there are incompatibility of the packing option
  between various compilers.) }

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

  PUINT = ^UINT;
  UINT = NativeUInt;

  {$if PF_FS_FAT32}
  CLUST = DWORD;
  {$else}
  CLUST = word;
  {$endif}

  (* File system object structure *)
  FATFS = record
    (* FAT sub type *)
    fs_type: byte;
    (* File status flags *)
    flag: byte;
    (* Number of sectors per cluster *)
    csize: byte;
    pad1: byte;
    (* Number of root directory entries (0 on FAT32) *)
    n_rootdir: word;
    (* Number of FAT entries (= number of clusters + 2) *)
    n_fatent: CLUST;
    (* FAT start sector *)
    fatbase: DWORD;
    (* Root directory start sector (Cluster# on FAT32) *)
    dirbase: DWORD;
    (* Data start sector *)
    database: DWORD;
    (* File R/W pointer *)
    fptr: DWORD;
    (* File size *)
    fsize: DWORD;
    (* File start cluster *)
    org_clust: CLUST;
    (* File current cluster *)
    curr_clust: CLUST;
    (* File current data sector *)
    dsect: DWORD;
  end;
  PFATFS = ^FATFS;

  (* Directory object structure *)
  DIR = record
    (* Current read/write index number *)
    index: word;
    (* Pointer to the SFN (in/out) {file[8],ext[3],status[1]} *)
    fn: PByte;
    (* Table start cluster (0:Static table) *)
    sclust: CLUST;
    (* Current cluster *)
    clust: CLUST;
    (* Current sector *)
    sect: DWORD;
  end;
  PDIR = ^DIR;

  (* File status structure *)
  FILINFO = record
    (* File size *)
    fsize: DWORD;
    (* Last modified date *)
    fdate: word;
    (* Last modified time *)
    ftime: word;
    (* Attribute *)
    fattrib: byte;
    (* File name *)
    fname: array [0..Pred(13)] of char;
  end;
  PFILINFO = ^FILINFO;

  (* File function return code *)
  FRESULT = (
    FR_OK = 0,
    FR_DISK_ERR,
    FR_NOT_READY,
    FR_NO_FILE,
    FR_NOT_OPENED,
    FR_NOT_ENABLED,
    FR_NO_FILESYSTEM);

(* Petit FatFs module application interface *)

{ Mount/Unmount a logical Drive
 
  The pf_mount() function registers a work area to the Petit FatFs module.
  The volume is mounted on registration. The volume must be mounted 
  with this function prior to use any file function and after every media changes.  

  @param(fs Pointer to the work area (file system object) to be registered.)

  @returns(@link(FR_OK) The function succeeded.

    @link(FR_NOT_READY) The storage device could not be initialized
    due to a hard error or no medium.

    @link(FR_DISK_ERR) An error occured in the disk read function.

    @link(FR_NO_FILESYSTEM) There is no valid FAT partition on the drive.) }
function pf_mount(var fs: FATFS): FRESULT;

{ Opens an existing file

  The file must be opend prior to use @link(pf_read) and @link(pf_lseek) function.
  The open file is valid until next open.

  @param(path Pointer to a null-terminated string that specifies the file name to open.)

  @returns(@link(FR_OK) The function succeeded.

    @link(FR_NO_FILE) Could not find the file or path.

    @link(FR_DISK_ERR) The function failed due to a hard error in the disk function,
      a wrong FAT structure or an internal error.

    @link(FR_NOT_ENABLED) The volume has not been mounted.) }
function pf_open(path: PChar): FRESULT;

{$ifdef PF_USE_READ}
{$info PF_USE_READ enabled}
{ Read data from the open file.
  
  The file read/write pointer in the file system object advances in number of bytes read. 
  After the function succeeded, @code(br) should be checked to detect end of file. 
  In case of @code(br) is less than @code(btr), it means the read pointer has reached end 
  of the file during read operation.
  If a null pointer is given to the buff, the read data bytes are forwarded to the outgoing stream 
  instead of the memory. 
  The streaming function depends on each project will be typically built-in the @link(disk_readp) function.  

  @param(buff Pointer to the read buffer (nil: Forward data to the stream))
  @param(btr Number of bytes to read)
  @param(br Pointer to number of bytes read)

  @returns(FRESULT) }
function pf_read(buff: Pointer; btr: UINT; var br: UINT): FRESULT;
{$endif}

{$ifdef PF_USE_WRITE}
{$info PF_USE_WRITE enabled}
{ Write data to the open file.
  The write function has some restrictions listed below:

    Cannot create file. Only existing file can be written.
    Cannot expand file size.
    Cannot update time stamp of the file.
    Write operation can start/stop on the sector boundary only.
    Read-only attribute of the file cannot block write operation.

  The read/write pointer in the file system object advances in number of bytes written. 
  After the function succeeded, @code(bw) should be checked to detect end of file. 
  In case of @code(bw) is less than @code(btw), it means the read/write pointer reached end of file 
  during the write operation. Once a write operation is initiated, 
  it must be finalized properly, or the written data can be lost.  

  @param(buff Pointer to the data to be written)
  @param(btw Number of bytes to write (0:Finalize the current write operation))
  @param(bw Pointer to number of bytes written)

  @returns(FRESULT) }
function pf_write(buff: Pointer; btw: UINT; var bw: UINT): FRESULT;
{$endif}

{$ifdef PF_USE_LSEEK}
{$info PF_USE_LSEEK enabled}
{ Move file pointer of the open file
  
  The pf_lseek() function moves the file read/write pointer of the open file.
  The ofs can be specified in only origin from top of the file.
  
  @param(ofs File pointer from top of file)

  @returns(FRESULT) }
function pf_lseek(ofs: DWORD): FRESULT;
{$endif}

{$ifdef PF_USE_DIR}
{$info PF_USE_DIR enabled}
{ Create a directory Object.

  The pf_opendir() function opens an exsisting directory and 
  creates the directory object for subsequent calls. 
  The directory object structure can be discarded at any time without any procedure.  

  @param(dj Directory object)
  @param(path Directory path)

  @returns(FRESULT) }
function pf_opendir(var dj: DIR; path: PChar): FRESULT;

{ Read a directory item from the open directory.

  The pf_readdir() function reads directory entries in sequence. 
  All items in the directory can be read by calling this function repeatedly.
  When all directory entries have been read and no item to read, 
  the function returns a null string into member f_name[] 
  in the file information structure without error. 

  @param(dj Open directory object)
  @param(fno Pointer to file information to return)

  @returns(FRESULT) }
function pf_readdir(var dj: DIR; var fno: FILINFO): FRESULT;

{ Directory rewind.

  @param(dj Open directory object)

  @returns(FRESULT) }
function pf_rewinddir(var dj: DIR): FRESULT;
{$endif}

implementation

{$I cvt.inc}

var
  iFatFS: PFATFS;

{$MACRO ON}
{$define ABORT_DISK_ERR := begin iFatFs.flag := 0; Exit(FR_DISK_ERR); end}
{$define CHECK_FS_ENABLED := begin if iFatFs = nil then Exit(FR_NOT_ENABLED); end}

{$if PF_USE_LCC and (not declared(_EXCVT))}
{$info PF_USE_LCC and (not declared(_EXCVT))}
{$if declared(_DF2S)}
function IsDBCS1(c: integer): boolean;
begin
  Result := ((byte(c) >= _DF1S) and (byte(c) <= _DF1E)) or
    ((byte(c) >= _DF2S) and (byte(c) <= _DF2E));
end;

{$else}
function IsDBCS1(c: integer): boolean;
begin
  Result := (byte(c) >= _DF1S) and (byte(c) <= _DF1E);
end;

{$endif}
{$if declared(_DS3S)}
function IsDBCS2(c: integer): boolean;
begin
  Result := ((byte(c) >= _DS1S) and (byte(c) <= _DS1E)) or
    ((byte(c) >= _DS2S) and (byte(c) <= _DS2E)) or
    ((byte(c) >= _DS3S) and (byte(c) <= _DS3E));
end;

{$else}
function IsDBCS2(c: integer): boolean;
begin
  Result := ((byte(c) >= _DS1S) and (byte(c) <= _DS1E)) or
    ((byte(c) >= _DS2S) and (byte(c) <= _DS2E));
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

{ Load a 2-byte little-endian word }
function ld_word(ptr: PByte): word;
begin
{$IFDEF ENDIAN_LITTLE}
{$info ENDIAN_LITTLE}
  Result := PWord(ptr)^;
{$ELSE}
{$info NOT ENDIAN_LITTLE}
  Result := (ptr[1] shl 8) or ptr[0];
{$ENDIF}
end;

{ Load a 4-byte little-endian double word }
function ld_dword(ptr: PByte): DWORD;
begin
  {$IFDEF ENDIAN_LITTLE}
  {$info ENDIAN_LITTLE}
  Result := PDWord(ptr)^;
  {$ELSE}
  {$info NOT ENDIAN_LITTLE}
  Result := (ptr[3] shl 8) or ptr[2];
  Result := (Result shl 8) or ptr[1];
  Result := (Result shl 8) or ptr[0];
  {$ENDIF}
end;

(* String functions  *)
(* Fill memory block *)
procedure mem_set(dst: PChar; val: Char; cnt: integer);
begin
  while cnt > 0 do
  begin
    dst^ := val;
    Inc(dst); Dec(cnt);
  end;
end;

(* Compare memory block *)
function mem_cmp(dst: PChar; src: PChar; cnt: integer): integer;
begin
  Result := 0;
  while (cnt > 0) and (Result = 0) do
  begin
    Result := Ord(dst^) - Ord(src^);
    Inc(dst); Inc(src);
    Dec(cnt);
  end;
end;

{ FAT access - Read value of a FAT entry

  @param(clst Cluster# to get the link information)
  @returns(1:IO error, Else:Cluster status) }
function get_fat(clst: CLUST): CLUST;
var
  buf: array [0..Pred(4)] of byte;
{$if PF_FS_FAT12}
  wc, bc, ofs: UINT;
{$endif}
begin
  { Range check }
  if (clst < 2) or (clst >= iFatFs.n_fatent) then
    Exit(1);
  { Default - An error occured at the disk I/O layer }
  Result := 1;

  case iFatFs.fs_type of
    {$if PF_FS_FAT12}
    FS_FAT12:
    begin
      bc := UINT(clst);
      bc := bc + (bc shr 1);

      ofs := bc and (SECTOR_SIZE - 1);
      bc := bc shr SECTOR_SIZE_BP;

      if ofs <> (SECTOR_SIZE - 1) then
      begin
        if disk_readp(@buf, iFatFs.fatbase + bc, ofs, 2) = DRESULT.RES_OK then
          Result := 0;
      end
      else
      if (disk_readp(@buf, iFatFs.fatbase + bc, (SECTOR_SIZE - 1), 1) =
        DRESULT.RES_OK) and (disk_readp(PByte(@buf) + 1, iFatFs.fatbase + bc + 1, 0, 1) =
        DRESULT.RES_OK) then
        Result := 0;

      if Result = 0 then
      begin
        wc := ld_word(buf);
        if (clst and 1) <> 0 then
          Result := wc shr 4
        else
          Result := wc and $FFF;
      end;
    end;
    {$endif}

    {$if PF_FS_FAT16}
    FS_FAT16:
      if disk_readp(@buf, iFatFs.fatbase + clst div 256, (UINT(clst) mod 256) * 2, 2) =
        RES_OK then
        Result := ld_word(buf);
    {$endif}

    {$if PF_FS_FAT32}
    FS_FAT32:
      if disk_readp(@buf, iFatFs.fatbase + clst div 128, (UINT(clst) mod 128) * 4, 4) =
        RES_OK then
        Result := ld_dword(buf) and $0FFFFFFF;
    {$endif}
  end;

end;

{ Get sector# from cluster#

  @param(clst Cluster# to be converted)
  @returns(!=0: Sector number, 0: Failed - invalid cluster# }
function clust2sect(clst: CLUST): DWORD;
begin
  clst := clst - 2;
  if clst >= (iFatFs.n_fatent - 2) then
    { Invalid cluster# }
    Result := 0
  else
    Result := DWORD(clst * iFatFs.csize + iFatFs.database);
end;

{ Get cluster field from directory entry

  @param(dir Pointer to directory entry)
  @returns(Cluster# }
function get_clust(dir: PByte): CLUST;
begin
  Result := 0;
  if _FS_32ONLY or (PF_FS_FAT32 and (iFatFs.fs_type = FS_FAT32)) then
  begin
    Result := CLUST(ld_word(dir + DIR_FstClusHI)) shl 16;
  end;
  Result := Result or ld_word(dir + DIR_FstClusLO);
end;

{ Directory handling - Rewind directory index

  @param(dj Pointer to directory object)
  @reaturns(FRESULT) }
function dir_rewind(var dj: DIR): FRESULT;
var
  clst: CLUST;
begin
  dj.index := 0;
  clst := dj.sclust;
  { Check start cluster range }
  if (clst = 1) or (clst >= iFatFs.n_fatent) then
    Exit(FR_DISK_ERR);

  if PF_FS_FAT32 and (clst = 0) and (_FS_32ONLY or (iFatFs.fs_type = FS_FAT32)) then
    { Replace cluster# 0 with root cluster# if in FAT32 }
    clst := CLUST(iFatFs.dirbase);

  { Current cluster }
  dj.clust := clst;
  { Current sector }
  if _FS_32ONLY or (clst <> 0) then
    dj.sect := clust2sect(clst)
  else
    dj.sect := iFatFs.dirbase;
  { Seek succeeded }
  Result := FR_OK;
end;

{ Directory handling - Move directory index next

  @param(dj Pointer to directory object)
  @returns(FRESULT)
}
function dir_next(var dj: DIR): FRESULT;
var
  clst: CLUST;
  i: word;
begin
  i := dj.index + 1;
  if (i = 0) or (dj.sect = 0) then
    { Report EOT when index has reached 65535 }
    Exit(FR_NO_FILE);
  { Sector changed? }
  if (i mod 16) = 0 then
  begin
    { Next sector }
    Inc(dj.sect);
    { Static table }
    if dj.clust = 0 then
      if i >= iFatFs.n_rootdir then
        { Report EOT when end of table }
        Exit(FR_NO_FILE)
      else
      { Dynamic table }
      if ((i div 16) and (iFatFs.csize - 1)) = 0 then
      begin
        { Cluster changed?
          Get next cluster }
        clst := get_fat(dj.clust);
        if clst <= 1 then
          Exit(FR_DISK_ERR);
        if clst >= iFatFs.n_fatent then
          { Report EOT when it reached end of dynamic table }
          Exit(FR_NO_FILE);
        { Initialize data for new cluster }
        dj.clust := clst;
        dj.sect := clust2sect(clst);
      end;
  end;
  dj.index := i;
  Result := FR_OK;
end;

{ Directory handling - Find an object in the directory

  @param(dj Pointer to the directory object linked to the file name)
  @param(dir 32-byte working buffer)
  @returns(FRESULT) }
function dir_find(var dj: DIR; dir: PByte): FRESULT;
var
  c: byte;
begin
  { Rewind directory object }
  Result := dir_rewind(dj);
  if Result <> FR_OK then
    Exit(Result);

  repeat
    begin
      { Read an entry }
      if disk_readp(dir, dj.sect, (dj.index mod 16) * 32, 32) <> RES_OK then
        Exit(FRESULT.FR_DISK_ERR);
      { First character }
      c := dir[DIR_Name];
      if c = 0 then
      begin
        { Reached to end of table }
        Result := FR_NO_FILE;
        break;
      end;

      { Is it a valid entry? }
      if ((dir[DIR_Attr] and AM_VOL) = 0) and (mem_cmp(PChar(dir), PChar(dj.fn), 11) = 0) then
        break;
      { Next entry }
      Result := dir_next(dj);
    end
  until Result <> FR_OK;
end;

{$ifdef PF_USE_DIR}
{ Read an object from the directory

  @param(dj Pointer to the directory object to store read object name)
  @param(dir 32-byte working buffer)
  @returns(FRESULT) }
function dir_read(var dj: DIR; dir: PByte): FRESULT;
var
  a, c: byte;
begin
  Result := FR_NO_FILE;
  while dj.sect <> 0 do
  begin
    { Read an entry }
    if disk_readp(dir, dj.sect, (dj.index mod 16) * 32, 32) <> DRESULT.RES_OK then
    begin
      Result := FR_DISK_ERR;
      break;
    end
    else
      Result := FR_OK;

    c := dir[DIR_Name];
    if c = 0 then
    begin
      { Reached to end of table }
      Result := FR_NO_FILE;
      break;
    end;
    a := dir[DIR_Attr] and AM_MASK;

    { Is it a valid entry? }
    if (c <> $E5) and (c <> Ord('.')) and ((a and AM_VOL) = 0) then
      break;
    { Next entry }
    Result := dir_next(dj);
    if Result <> FR_OK then
      break;
  end; (* while end *)

  if Result <> FR_OK then
    dj.sect := 0;
end;

{$endif}

{ Pick a segment and create the object name in directory form

  @param(dj Pointer to the directory object)
  @param(path Pointer to pointer to the segment in the path string)
  @returns(FRESULT) }
function create_name(var dj: DIR; var path: PChar): FRESULT;
var
  p: PByte;
  c, d, ni, si, i: byte;
  sfn: PByte;
begin
  { Create file name in directory form }
  sfn := dj.fn;
  mem_set(PChar(sfn), ' ', 11);
  si := 0;
  i := 0;
  ni := 8;
  p := PByte(path);
  while True do
  begin
    c := p[si];
    Inc(si);
    if (c <= Ord(' ')) or (c = Ord('/')) then
      { Break on end of segment }
      break;

    if (c = Ord('.')) or (i >= ni) then
    begin
      if (ni <> 8) or (c <> Ord('.')) then
        break;
      i := 8;
      ni := 11;
      continue;
    end;
    {$if PF_USE_LCC and declared(_EXCVT)}
    if c >= $80 then
      { To upper extended char (SBCS) }
      c := _EXCVT[c - $80];
    {$endif}

    { DBC 1st byte? }
    if IsDBCS1(c) and (i < ni - 1) then
    begin
      { Get 2nd byte }
      d := p[si];
      Inc(si);
      sfn[i] := c;
      Inc(i);
      sfn[i] := d;
      Inc(i);
    end
    else
    begin
      { Single byte code }
      if PF_USE_LCC and IsLower(char(c)) then
        { to upper }
        c := c - $20;
      sfn[i] := c;
      Inc(i);
    end;
  end;
  { Return pointer to the next segment }
  path := @p[si];
  { Set last segment flag if end of path }
  sfn[11] := byte(c <= Ord(' '));
  Result := FR_OK;
end;

{$ifdef PF_USE_DIR}
{ Get file information from directory entry

  @param(dj Pointer to the directory object)
  @param(dir 32-byte working buffer)
  @param(fno Pointer to store the file information) }
procedure get_fileinfo(var dj: DIR; dir: PByte; var fno: FILINFO);
var
  i, c: byte;
  p: PChar;
begin
  p := fno.fname;
  if dj.sect <> 0 then
  begin
    { Copy file name body }
    for i := 0 to Pred(8) do
    begin
      c := dir[i];
      if c = Ord(' ') then
        break;
      if c = $05 then
        c := $E5;
      p^ := char(c);
      Inc(p);
    end; (* for end *)
    if dir[8] <> Ord(' ') then
    begin
      { Copy file name extension }
      p^ := '.';
      Inc(p);
      for i := 8 to Pred(11) do
      begin
        c := dir[i];
        if c = Ord(' ') then
          break;
        p^ := char(c);
        Inc(p);
      end; (* for end *)
    end;
    { Attribute }
    fno.fattrib := dir[DIR_Attr];
    { Size }
    fno.fsize := ld_dword(dir + DIR_FileSize);
    { Date }
    fno.fdate := ld_word(dir + DIR_WrtDate);
    { Time }
    fno.ftime := ld_word(dir + DIR_WrtTime);
  end;
  p^ := char(0);
end;

{$endif}

{ Follow a file path

  @param(dj Directory object to return last directory and found object)
  @param(dir 32-byte working buffer)
  @param(path Full-path string to find a file or directory)
  @returns(FRESULT) }
function follow_path(var dj: DIR; dir: PByte; path: PChar): FRESULT;
begin
  { Strip leading spaces }
  while path^ = ' ' do
    Inc(path);
  { Strip heading separator if exist }
  if path^ = '/' then
    Inc(path);
  { Set start directory (always root dir) }
  dj.sclust := 0;

  if path^ < ' ' then
  begin
    { Null path means the root directory }
    Result := dir_rewind(dj);
    dir[0] := 0;
  end
  else
  begin
    { Follow path }
    while True do
    begin
      { Get a segment }
      Result := create_name(dj, path);
      if Result <> FR_OK then
        break;
      { Find it }
      Result := dir_find(dj, dir);
      if Result <> FR_OK then
        { Could not find the object }
        break;
      if dj.fn[11] <> 0 then
        { Last segment match. Function completed. }
        break;
      if (dir[DIR_Attr] = 0) and (AM_DIR <> 0) then
      begin
        { Cannot follow path because it is a file }
        Result := FR_NO_FILE;
        break;
      end;
      { Follow next }
      dj.sclust := get_clust(dir);
    end; (* while end *)
  end;
end;

{ Check a sector if it is an FAT boot record

 @param(buf Working buffer)
 @param(sect Sector# (lba) to check
   if it is an FAT boot record or not)
 @returns(0:The FAT boot record,
   1:Valid boot record but not an FAT,
   2:Not a boot record, 3:Error) }
function check_fs(buf: PByte; sect: DWORD): byte;
begin
  { Read the boot record }
  if disk_readp(buf, sect, 510, 2) <> RES_OK then
    Exit(3);
  { Check record signature }
  if (buf[0] <> $55) or (buf[1] <> $AA) then
    Exit(2);
  { Check FAT12/16 }
  if (not _FS_32ONLY) and (disk_readp(buf, sect, BS_FilSysType, 2) = RES_OK) then
    if (buf[0] = $46) and (buf[1] = $41) then
      Exit(0);
  { Check FAT32 }
  if PF_FS_FAT32 and (disk_readp(buf, sect, BS_FilSysType32, 2) = RES_OK) then
    if (buf[0] = $46) and (buf[1] = $41) then
      Exit(0);

  Result := 1;
end;

function pf_mount(var fs: FATFS): FRESULT;
var
  fmt: byte;
  buf: array [0..Pred(36)] of byte;
  bsect, fsize, tsect, mclst: DWORD;
begin
  iFatFs := nil;
  { Check if the drive is ready or not }
  if (disk_initialize() and STA_NOINIT) <> 0 then
    Exit(FR_NOT_READY);

  { Search FAT partition on the drive }
  bsect := 0;
  { Check sector 0 as an SFD format }
  fmt := check_fs(@buf, bsect);
  if fmt = 1 then
  begin
    { Not an FAT boot record, it may be FDISK format }
    { Check a partition listed in top of the partition table }
    if disk_readp(@buf, bsect, MBR_Table, 16) <> RES_OK then
      { 1st partition entry }
      fmt := 3
    else
    { Is the partition existing? }
    if buf[4] <> 0 then
    begin
      { Partition offset in LBA }
      bsect := ld_dword(@buf[8]);
      { Check the partition }
      fmt := check_fs(@buf, bsect);
    end;
  end;
  if fmt = 3 then
    Exit(FR_DISK_ERR);
  if fmt <> 0 then
    { No valid FAT patition is found }
    Exit(FR_NO_FILESYSTEM);

  { Initialize the file system object }
  if disk_readp(@buf, bsect, 13, sizeof(buf)) <> RES_OK then
    Exit(FR_DISK_ERR);

  { Number of sectors per FAT }
  fsize := ld_word(PByte(@buf) + (BPB_FATSz16 - 13));
  if fsize = 0 then
    fsize := ld_dword(PByte(@buf) + (BPB_FATSz32 - 13));

  { Number of sectors in FAT area }
  fsize := fsize * (buf[BPB_NumFATs - 13]);
  { FAT start sector (lba) }
  fs.fatbase := bsect + ld_word(PByte(@buf) + (BPB_RsvdSecCnt - 13));
  { Number of sectors per cluster }
  fs.csize := buf[BPB_SecPerClus - 13];
  { Nmuber of root directory entries }
  fs.n_rootdir := ld_word(PByte(@buf) + (BPB_RootEntCnt - 13));
  { Number of sectors on the file system }
  tsect := ld_word(PByte(@buf) + (BPB_TotSec16 - 13));

  if tsect = 0 then
    tsect := ld_dword(PByte(@buf) + (BPB_TotSec32 - 13));

  { Last cluster# + 1 }
  mclst := (tsect - ld_word(PByte(@buf) + (BPB_RsvdSecCnt - 13)) -
    fsize - fs.n_rootdir div 16) div fs.csize + 2;
  fs.n_fatent := CLUST(mclst);

  fmt := 0;

  { Determine the FAT sub type }
  if PF_FS_FAT12 and (mclst < $FF7) then
    fmt := FS_FAT12;
  if PF_FS_FAT16 and (mclst >= $FF8) and (mclst < $FFF7) then
    fmt := FS_FAT16;
  if PF_FS_FAT32 and (mclst >= $FFF7) then
    fmt := FS_FAT32;
  if fmt = 0 then
    Exit(FR_NO_FILESYSTEM);

  fs.fs_type := fmt;
  if _FS_32ONLY or (PF_FS_FAT32 and (fmt = FS_FAT32)) then
    { Root directory start cluster }
    fs.dirbase := ld_dword(PByte(@buf) + (BPB_RootClus - 13))
  else
    { Root directory start sector (lba) }
    fs.dirbase := fs.fatbase + fsize;
  { Data start sector (lba) }
  fs.database := fs.fatbase + fsize + fs.n_rootdir div 16;

  fs.flag := 0;
  iFatFs := @fs;
  Result := FR_OK;
end;

function pf_open(path: PChar): FRESULT;
var
  dj: DIR;
  sp: array [0..Pred(12)] of byte;
  dir: array [0..Pred(32)] of byte;
begin
  { Check file system }
  CHECK_FS_ENABLED;

  iFatFs.flag := 0;
  dj.fn := sp;
  { Follow the file path }
  Result := follow_path(dj, dir, path);
  { Follow failed }
  if Result <> FR_OK then
    Exit(Result);
  { It is a directory }
  if (dir[0] = 0) or ((dir[DIR_Attr] and AM_DIR) <> 0) then
    Exit(FR_NO_FILE);

  { File start cluster }
  iFatFs.org_clust := get_clust(dir);
  { File size }
  iFatFs.fsize := ld_dword(PByte(@dir) + DIR_FileSize);
  { File pointer }
  iFatFs.fptr := 0;
  iFatFs.flag := FA_OPENED;
  Result := FR_OK;
end;

function pf_read(buff: pointer; btr: UINT; var br: UINT): FRESULT;
var
  dr: DRESULT;
  clst: CLUST;
  sect: DWORD;
  remain: DWORD;
  rcnt: UINT;
  cs: byte;
  rbuff: PByte;
begin
  { Check file system }
  CHECK_FS_ENABLED;

  rbuff := buff;
  br := 0;
  { Check if opened }
  if (iFatFs.flag and FA_OPENED) = 0 then
    Exit(FR_NOT_OPENED);

  remain := iFatFs.fsize - iFatFs.fptr;
  if btr > remain then
    { Truncate btr by remaining bytes }
    btr := UINT(remain);

  { Repeat until all data transferred }
  while btr <> 0 do
  begin
    { On the sector boundary? }
    if (iFatFs.fptr and (SECTOR_SIZE - 1)) = 0 then
    begin
      { Sector offset in the cluster }
      cs := byte((iFatFs.fptr shr SECTOR_SIZE_BP) and (iFatFs.csize - 1));
      { On the cluster boundary? }
      if cs = 0 then
      begin
        { On the top of the file? }
        if iFatFs.fptr = 0 then
          clst := iFatFs.org_clust
        else
          clst := get_fat(iFatFs.curr_clust);
        if clst <= 1 then
          ABORT_DISK_ERR;
        { Update current cluster }
        iFatFs.curr_clust := clst;
      end;
      { Get current sector }
      sect := clust2sect(iFatFs.curr_clust);
      if sect = 0 then
        ABORT_DISK_ERR;
      iFatFs.dsect := sect + cs;
    end;
    { Get partial sector data from sector buffer }
    rcnt := SECTOR_SIZE - UINT(iFatFs.fptr and (SECTOR_SIZE - 1));
    if rcnt > btr then
      rcnt := btr;
    dr := disk_readp(rbuff, iFatFs.dsect, UINT(iFatFs.fptr and (SECTOR_SIZE - 1)), rcnt);
    if dr <> RES_OK then
      ABORT_DISK_ERR;
    { Advances file read pointer }
    iFatFs.fptr := iFatFs.fptr + rcnt;
    { Update read counter }
    btr := btr - rcnt;
    br := br + rcnt;
    { Advances the data pointer if destination is memory }
    if rbuff <> nil then
      rbuff := rbuff + rcnt;
  end;
  Result := FR_OK;
end;

{$ifdef PF_USE_LSEEK}
function pf_lseek(ofs: DWORD): FRESULT;
var
  clst: CLUST;
  bcs, sect, ifptr: DWORD;
begin
  { Check file system }
  CHECK_FS_ENABLED;
  { Check if file is opened }
  if (iFatFs.flag and FA_OPENED) = 0 then
    Exit(FR_NOT_OPENED);

  if ofs > iFatFs.fsize then
    { Clip offset with the file size }
    ofs := iFatFs.fsize;
  ifptr := iFatFs.fptr;
  iFatFs.fptr := 0;
  if ofs > 0 then
  begin
    { Cluster size (byte) }
    bcs := DWORD(iFatFs.csize) shl SECTOR_SIZE_BP;
    if (ifptr > 0) and (((ofs - 1) div bcs) >= ((ifptr - 1) div bcs)) then
    begin
      { When seek to same or following cluster, }
      { start from the current cluster }
      iFatFs.fptr := (ifptr - 1) and (not (bcs - 1));
      ofs := ofs - iFatFs.fptr;
      clst := iFatFs.curr_clust;
    end
    else
    begin
      { When seek to back cluster, }
      { start from the first cluster }
      clst := iFatFs.org_clust;
      iFatFs.curr_clust := clst;
    end;
    while ofs > bcs do
    begin
      { Cluster following loop }
      { Follow cluster chain }
      clst := get_fat(clst);
      if (clst <= 1) or (clst >= iFatFs.n_fatent) then
        ABORT_DISK_ERR;
      iFatFs.curr_clust := clst;
      iFatFs.fptr := iFatFs.fptr + bcs;
      ofs := ofs - bcs;
    end;
    iFatFs.fptr := iFatFs.fptr + ofs;
    { Current sector }
    sect := clust2sect(clst);
    if sect = 0 then
      ABORT_DISK_ERR;
    iFatFs.dsect := sect + ((iFatFs.fptr shr SECTOR_SIZE_BP) and (iFatFs.csize - 1));
  end;
  Result := FR_OK;
end;

{$endif}

{$ifdef PF_USE_WRITE}
function pf_write(buff: Pointer; btw: UINT; var bw: UINT): FRESULT;
var
  p: PByte;
  clst: CLUST;
  sect: DWORD;
  remain: DWORD;
  cs: byte;
  wcnt: UINT;
begin
  { Check file system }
  CHECK_FS_ENABLED;

  p := buff;
  bw := 0;
  { Check if opened }
  if (iFatFs.flag and FA_OPENED) = 0 then
    Exit(FR_NOT_OPENED);

  if btw = 0 then
  begin
    { Finalize request }
    if ((iFatFs.flag and FA__WIP) <> 0) and (disk_writep(nil, 0) <> DRESULT.RES_OK) then
      ABORT_DISK_ERR;
    iFatFs.flag := iFatFs.flag and (not FA__WIP);
    Exit(FR_OK);
  end
  else
  { Write data request }
  if (iFatFs.flag and FA__WIP) = 0 then
    { Round-down fptr to the sector boundary }
    iFatFs.fptr := iFatFs.fptr and $FFFFFE00;

  remain := iFatFs.fsize - iFatFs.fptr;
  if btw > remain then
    btw := UINT(remain); { Truncate btw by remaining bytes }

  while btw <> 0 do
  begin
    { Repeat until all data transferred }
    if UINT(iFatFs.fptr) and (SECTOR_SIZE - 1) = 0 then
    begin
      { On the sector boundary? }
      { Sector offset in the cluster }
      cs := byte((iFatFs.fptr shr SECTOR_SIZE_BP) and (iFatFs.csize - 1));
      { Sector offset in the cluster }
      if cs = 0 then
      begin
        { On the cluster boundary? }
        if iFatFs.fptr = 0 then
          { On the top of the file? }
          clst := iFatFs.org_clust
        else
          clst := get_fat(iFatFs.curr_clust);
        if clst <= 1 then
          ABORT_DISK_ERR;
        { Update current cluster }
        iFatFs.curr_clust := clst;
      end;
      { Get current sector }
      sect := clust2sect(iFatFs.curr_clust);
      if sect = 0 then
        ABORT_DISK_ERR;
      iFatFs.dsect := sect + cs;

      { Initiate a sector write operation }
      if disk_writep(nil, iFatFs.dsect) <> DRESULT.RES_OK then
        ABORT_DISK_ERR;
      iFatFs.flag := iFatFs.flag or FA__WIP;
    end;
    { Number of bytes to write to the sector }
    wcnt := SECTOR_SIZE - (UINT(iFatFs.fptr) and (SECTOR_SIZE - 1));
    if wcnt > btw then
      wcnt := btw;

    { Send data to the sector }
    if disk_writep(p, wcnt) <> DRESULT.RES_OK then
      ABORT_DISK_ERR;

    { Update pointers and counters }
    iFatFs.fptr := iFatFs.fptr + wcnt;
    p := p + wcnt;
    btw := btw - wcnt;
    bw := bw + wcnt;

    if UINT(iFatFs.fptr) and (SECTOR_SIZE - 1) = 0 then
    begin
      { Finalize the current sector write operation }
      if disk_writep(nil, 0) <> DRESULT.RES_OK then
        ABORT_DISK_ERR;
      iFatFs.flag := iFatFs.flag and (not FA__WIP);
    end;
  end;

  Result := FR_OK;
end;

{$endif}

{$ifdef PF_USE_DIR}
function pf_opendir(var dj: DIR; path: PChar): FRESULT;
var
  sp: array [0..Pred(12)] of byte;
  dir: array [0..Pred(32)] of byte;
begin
  { Check file system }
  CHECK_FS_ENABLED;

  dj.fn := sp;
  { Follow the path to the directory }
  Result := follow_path(dj, dir, path);
  if Result = FR_OK then
  begin
    { Follow completed }
    if dir[0] <> 0 then
      { It is not the root dir }
      if (dir[DIR_Attr] and AM_DIR) <> 0 then
        { The object is a directory }
        dj.sclust := get_clust(dir)
      else
        { The object is not a directory }
        Result := FR_NO_FILE;
    if Result = FR_OK then
      { Rewind dir }
      Result := dir_rewind(dj);
  end;
end;

function pf_readdir(var dj: DIR; var fno: FILINFO): FRESULT;
var
  sp: array [0..Pred(12)] of byte;
  dir: array [0..Pred(32)] of byte;
begin
  { Check file system }
  CHECK_FS_ENABLED;

  dj.fn := sp;
  { Get current directory item }
  Result := dir_read(dj, dir);
  if Result = FR_NO_FILE then
    Result := FR_OK;
  if Result = FR_OK then
  begin
    { A valid entry is found }
    { Get the object information }
    get_fileinfo(dj, dir, fno);
    { Increment read index for next }
    Result := dir_next(dj);
    if Result = FR_NO_FILE then
      Result := FR_OK;
  end;
end;

function pf_rewinddir(var dj: DIR): FRESULT;
var
  sp: array [0..Pred(12)] of byte;
begin
  { Check file system }
  CHECK_FS_ENABLED;

  dj.fn := sp;
  Result := dir_rewind(dj);
end;

{$endif}

end.
