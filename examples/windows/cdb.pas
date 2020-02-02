{ Petit CDB - Constant DataBase
  https://cr.yp.to/cdb.html
}
unit cdb;
{$mode delphi}

interface

function cdb_open(cdb: PChar): boolean;
function cdb_find_key(key: PByte; keyLen: Integer; var valLen: Integer): boolean;
function cdb_get_val(val: PByte; valLen: Integer): boolean;

implementation
uses pff;

type
  TCDB = record
    chash: DWORD;
    first: DWORD;
    last: DWORD;
  end;

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

(* Compare keys *)
function key_eq(fk: PByte; sk: PByte; kl: Integer): Boolean;
begin
  Result := True;
  while kl > 0 do
  begin
    if fk^ <> sk^ then
    begin
      Result := False;
      Break;
    end;
    Inc(fk); Inc(sk);
    Dec(kl);
  end;
end;

function check_key(off: DWORD; key: PByte; keyLen: Integer): boolean;
var
  rl: array[0..7] of byte;
  br: UINT;
  keybuf: array[0..511] of byte;  // MAX KEY BUFF
begin
  if keyLen > 512 then Exit(False);

  pf_lseek(off);
  pf_read(@rl, 8, br);

  if keyLen <> ld_dword(@rl) then
    Exit(False);
  pf_read(@keybuf, keyLen, br);
  if key_eq(key, @keybuf, keyLen) then
    Result := True
  else
    Result := False;
end;

{ DJB hash }
function djb_hash(key: PByte; keyLen: Integer): DWORD;
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
  if pf_open(cdb) = FRESULT.FR_OK then
  begin
    Result := true;
  end
  else
  begin
    Result := false;
  end;
end;

function cdb_find_key(key: PByte; keyLen: Integer; var valLen: Integer): boolean;
var
  h: DWORD;
  toce: array[0..15] of byte;
  br: UINT;
  tab_start: DWORD;
  tab_size: DWORD;
  tab_end: DWORD;
  entry: DWORD;
  seek: boolean;
begin
  h := djb_hash(key, keyLen);
  WriteLn('hash - ', h, ', E - ', Byte(h));
  pf_lseek(Byte(h) shl 3);
  pf_read(@toce, 8, br);
  tab_start := ld_dword(@toce);
  tab_size := ld_dword(@toce+4);
  tab_end := tab_start + ((tab_size-1) shl 3);
  WriteLn('Tab start  - ', tab_start);
  WriteLn('Tab size   - ', tab_size);

  entry := tab_start + (((h shr 8) mod tab_size) shl 3);
  seek := true;
  while tab_size > 0 do
  begin
    if seek then
      pf_lseek(entry);
    pf_read(@toce, 8, br);
    WriteLn('Hash      val - ', ld_dword(@toce));
    WriteLn('Record offset - ', ld_dword(@toce+4));
    if ld_dword(@toce) = h then
    begin
      seek := true;
      if check_key(ld_dword(@toce+4), key, keyLen) then
      begin
        WriteLn('check_key - true');
      end
      else
      begin
        WriteLn('check_key - false');
      end;
    end;

    if entry = tab_end then
    begin
      entry := tab_start;
      seek := true;
    end
    else
    begin
      entry := entry + 8;
    end;

    Dec(tab_size);
  end;
end;

// Call after cdb_find_key = True
function cdb_get_val(val: PByte; valLen: Integer): boolean;
begin
end;

end.
