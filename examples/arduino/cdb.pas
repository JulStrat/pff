{ CDB - Constant DataBase
  https://cr.yp.to/cdb.html
}
unit cdb;
{$mode delphi}

interface

function cdb_open(cdb: PChar): boolean;
function cdb_find_key(key: PByte; keyLen: Integer; var valLen: Integer): boolean;
function cdb_get_val(val: PByte; valLen: Integer); boolean;

implementation

function hash(key: PByte; keyLen: Integer): DWORD;
begin
  Result := 5381;
  while keyLen > 0 do
  begin
    Result := Result + (Result shl 5);
    Result := Result xor key^;
    Inc(key); Dec(keyLen);
  end;
end;

function cdb_open(cdb: PChar): boolean;
begin
end;

function cdb_find_key(key: PByte; keyLen: Integer; var valLen: Integer): boolean;
begin
end;

function cdb_get_val(val: PByte; valLen: Integer); boolean;
begin
end;

end.
