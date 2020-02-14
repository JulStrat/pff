program pff_cdb;
{$mode delphi}
uses cdb, pff;

var
  fs: FATFS;
  fr: FRESULT;

  k: PChar;
  vl: integer;

begin
  fr := pf_mount(fs);
  WriteLn('pf_mount() - ', fr);
  WriteLn('cdb_open("ROOTDNS.CDB") - ', cdb_open('ROOTDNS.CDB'));
  k := 'b.root-servers.net';
  cdb_find_key(PByte(k), StrLen(k), vl);
  ReadLn;
end.

