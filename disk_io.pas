{ Low level disk I/O module skeleton for Petit FatFs (C)ChaN, 2014 }

unit disk_io;

{$mode delphi}
interface

const
  { Drive not initialized }
  STA_NOINIT = $01;
  { No medium in the drive }
  STA_NODISK = $02;

type
  DSTATUS = byte;
  DRESULT = (
    { Function succeeded }
    RES_OK = 0,
    { Disk error }
    RES_ERROR,
    { Not ready }
    RES_NOTRDY,
    { Invalid parameter }
    RES_PARERR
    );

{ Initialize Disk Drive }
function disk_initialize(): DSTATUS;

{ Read Partial Sector

  @param(buff Pointer to the destination object)
  @param(sector Sector number (LBA))
  @param(offset Offset in the sector)
  @param(count Byte count (bit15:destination)) }
function disk_readp(buff: Pointer; sector: DWORD; offset: DWORD; Count: DWORD): DRESULT;

{ Write Partial Sector

  @param(buff Pointer to the data to be written,
    NULL:Initiate/Finalize write operation)
  @param(sc Sector number (LBA) or Number of bytes to send) }
function disk_writep(buff: Pointer; sc: DWORD): DRESULT;

implementation

function disk_initialize(): DSTATUS;
var
  stat: DSTATUS;
begin
  (* Put your code here *)
end;

function disk_readp(buff: Pointer; sector: DWORD; offset: DWORD; Count: DWORD): DRESULT;
var
  res: DRESULT;
begin
  (* Put your code here *)

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
