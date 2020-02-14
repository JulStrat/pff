{ Petit CDB - Constant DataBase
  https://cr.yp.to/cdb.html
}
unit cdb;
{$mode delphi}

interface

const
  MAX_KEY_SIZE = 64;

PUINT = ^UINT;
UINT = NativeUInt;

function cdb_open(cdb: PChar): boolean;
function cdb_find_key(key: PByte; keyLen: UINT; var valLen: UINT): boolean;
function cdb_get_val(val: PByte; valLen: UINT): boolean;

implementation
uses pff;
  
type
  TCDB = record
    //chash: DWORD;
    //first: DWORD;
    //last: DWORD;
    valLen: DWORD; // datum length 
    status: byte;
  end;

const
  CDB_OPENED = 1;
  KEY_READY = 2;

var
  iCDB: TCDB;
  cdb_status: byte;
  
{ Load a 4-byte little-endian double word }
function ld_dword(ptr: PByte): DWORD;
begin
  {$IFDEF ENDIAN_LITTLE}
  Result := PDWord(ptr)^;
  {$ELSE}
  Result := (ptr[3] shl 8) or ptr[2];
  Result := (Result shl 8) or ptr[1];
  Result := (Result shl 8) or ptr[0];
  {$ENDIF}
end;

(* Compare memory *)
function mem_eq(dst: PByte; src: PByte; cnt: UINT): Boolean;
begin
  Result := True;
  while cnt > 0 do
  begin
    if dst^ <> src^ then
    begin
      Result := False;
      Break;
    end;
    Inc(dst); Inc(src);
    Dec(cnt);
  end;
end;

function check_key(off: DWORD; key: PByte; keyLen: UINT): boolean;
var
  bf: array[0..MAX_KEY_SIZE+7] of byte;
  br: UINT;
begin
  valLen := 0;
  if keyLen > MAX_KEY_SIZE then Exit(False);
  if pf_lseek(off) <> FRESULT.FR_OK then Exit(False);
  pf_read(@bf, keyLen+8, br) <> FRESULT.FR_OK then Exit(False);
  if br <> keyLen+8 then Exit(False);
  if ld_dword(@bf) <> keyLen then Exit(False);
  if mem_eq(key, @bf+8, keyLen) then
  begin
    iCDB.valLen := ld_dword(@bf+4);
    Result := True;
  end  
  else
    Result := False;
end;

{ DJB hash }
function djb_hash(key: PByte; keyLen: UINT): DWORD;
begin
  Result := 5381;
  while keyLen > 0 do
  begin
    {$OVERFLOWCHECKS OFF}
    Result := Result + (Result shl 5);
    {$OVERFLOWCHECKS ON}
    Result := Result xor key^;
    Inc(key); Dec(keyLen);
  end;
end;

function cdb_open(cdb: PChar): boolean;
begin
  iCDB.status := 0;
  Result := false;  
  if pf_open(cdb) = FRESULT.FR_OK then
  begin
    iCDB.status := CDB_OPENED;
    Result := true;
  end
end;

function cdb_find_key(key: PByte; keyLen: UINT; var valLen: UINT): boolean;
var
  h: DWORD;
  bf: array[0..7] of byte;
  tab_start, tab_size: DWORD;
  tab_curr, tab_end, offset: DWORD;
  br: UINT;  
  seek: boolean;
begin
  if (iCDB.status and CDB_OPENED) = 0 then Exit(False);
  iCDB.status := CDB_OPENED; // clear KEY_READY flag
  valLen := 0;
  iCDB.valLen := 0;
  
  h := djb_hash(key, keyLen);
  //WriteLn('hash - ', h, ', E - ', Byte(h));
  if pf_lseek(Byte(h) shl 3) <> FRESULT.FR_OK then Exit(False);
  { Read TOC entry }
  if pf_read(@bf, 8, br) <> FRESULT.FR_OK then Exit(False);
  if br <> 8 then Exit(False);
  
  tab_start := ld_dword(@bf);
  tab_size := ld_dword(@bf+4);
  if tab_size = 0 then Exit(False);
  
  tab_end := tab_start + ((tab_size-1) shl 3);
  tab_curr := tab_start + (((h shr 8) mod tab_size) shl 3);
  seek := true;
  
  //WriteLn('Tab start  - ', tab_start);
  //WriteLn('Tab size   - ', tab_size);

  while tab_size > 0 do
  begin
    if seek then
      if pf_lseek(tab_curr) <> FRESULT.FR_OK then Exit(False);;
    if pf_read(@bf, 8, br) <> FRESULT.FR_OK then Exit(False);
    if br <> 8 then Exit(False);
    offset := ld_dword(@bf+4);
    if offset = 0 then Esit(false);
    //WriteLn('Hash      val - ', ld_dword(@toce));
    //WriteLn('Record offset - ', ld_dword(@toce+4));
    if ld_dword(@bf) = h then
    begin
      seek := true;
      if check_key(offset, key, keyLen) then
      begin
        //WriteLn('check_key - true');
        iCDB.status := iCDB.status or KEY_READY;
        valLen := iCDB.valLen;
        Exit(True);
      end
      else
      begin
        //WriteLn('check_key - false');
      end;
    end
    else
      seek := false;

    if tab_curr = tab_end then
    begin
      tab_curr := tab_start;
      seek := true;
    end
    else
    begin
      tab_curr := tab_curr + 8;
    end;

    Dec(tab_size);
  end;
  Result := false;
end;

// Call after cdb_find_key = True
function cdb_get_val(val: PByte; valLen: UINT): boolean;
var 
  br: UINT;
begin
  Result := false;
  if iCDB.status and (CDB_OPENED or KEY_READY) = (CDB_OPENED or KEY_READY) then
  begin
    iCDB.status := iCDB.status and (not KEY_READY);      
    if pf_read(val, valLen, br) = FRESULT.FR_OK then 
      if valLen = br then 
        Result := true;
  end
end;

end.
