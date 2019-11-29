unit disk_io;

{$mode delphi}
(*
  Low level disk I/O module skeleton for Petit FatFs (C)ChaN, 2014
*)
interface

{$ifdef LINUX}
uses baseunix;

{$endif}

const
  STA_NOINIT = $01;  (* Drive not initialized  *)
  STA_NODISK = $02;  (* No medium in the drive *)

type
  DSTATUS = byte;
  DRESULT = (
    RES_OK = 0,     (* 0: Function succeeded  *)
    RES_ERROR,      (* 1: Disk error          *)
    RES_NOTRDY,  (* 2: Not ready           *)
    RES_PARERR  (* 3: Invalid parameter   *)
    );

(*
  Initialize Disk Drive
*)
function disk_initialize(): DSTATUS;

(*
  Read Partial Sector

  Pointer to the destination object
  Sector number (LBA)
  Offset in the sector
  Byte count (bit15:destination)
*)
function disk_readp(buff: Pointer; sector: DWORD; offset: DWORD; Count: DWORD): DRESULT;

(*
  Write Partial Sector

  Pointer to the data to be written, NULL:Initiate/Finalize write operation
  Sector number (LBA) or Number of bytes to send
*)
function disk_writep(buff: Pointer; sc: DWORD): DRESULT;

implementation

{$ifdef LINUX}
var
  GDH: integer;

{$endif}

function disk_initialize(): DSTATUS;
var
  stat: DSTATUS;
begin
  (* Put your code here *)
{$ifdef LINUX}
  GDH := fpopen('../../SD.img', O_RDONLY);
  if GDH = -1 then
    stat := STA_NOINIT
  else
    stat := 0;
{$endif}
  Result := stat;
end;

function disk_readp(buff: Pointer; sector: DWORD; offset: DWORD; Count: DWORD): DRESULT;
var
  res: DRESULT;
{$ifdef LINUX}
  br: integer;
{$endif}
begin
  (* Put your code here *)
{$ifdef LINUX}
  fplseek(GDH, sector*512+offset, SEEK_SET);
  br := fpread(GDH, buff, Count);
  if br <> -1 then
    res := RES_OK
  else
    res := RES_ERROR;
{$endif}
  Result := res;
end;

function disk_writep(buff: Pointer; sc: DWORD): DRESULT;
var
  res: DRESULT;
begin
  if buff = nil then
  begin
    if sc <> 0 then
    begin
      (* Initiate write process *)
    end
    else
    begin
      (* Finalize write process *)
    end;
  end
  else
  begin
    (* Send data to the disk *)
  end;

  Result := res;
end;

end.
