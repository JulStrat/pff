program ex_pff_rasp;
{$mode delphi}

uses
  pff;

var
  fs: FATFS;
  dr: DIR;
  fi: FILINFO;
  fr: FRESULT;
  bf: array[0..Pred(256)] of char;
  br: UINT;
  bwc: UINT;
  tstr: PChar;
  i: DWORD;

begin
  WriteLn('PetitFS test.');
  fr := pf_mount(@fs);
  WriteLn('pf_mount() - ', fr);

  fr := pf_open('RW.TXT');
  WriteLn('pf_open("RW.TXT") - ', fr);
  WriteLn('RW.TXT size - ', fs.fsize);

  tstr := 'B';
  bwc := 0;
  (* Try over ... *)
  for i := 1 to fs.fsize + 20  do
  begin
    fr := pf_write(Pointer(tstr), 1, @br);
    if (fr = FR_OK) and (br = 1) then
      Inc(bwc)
    else
      break;
  end;
  WriteLn('Bytes writed - ', bwc);    
 
  WriteLn('*** Test pf_opendir, pf_readdir ***');
  fr := pf_opendir(@dr, '');
  WriteLn('pf_opendir("") - ', fr);
  fr := pf_readdir(@dr, @fi);
  WriteLn('pf_readdir() - ', fr);
  WriteLn(fi.fname);
  fr := pf_readdir(@dr, @fi);
  WriteLn('pf_readdir() - ', fr);
  WriteLn(fi.fname);
  fr := pf_readdir(@dr, @fi);
  WriteLn('pf_readdir() - ', fr);
  WriteLn(fi.fname);
  fr := pf_opendir(@dr, 'RASPI');
  WriteLn('pf_opendir("RASPI") - ', fr);
  fr := pf_readdir(@dr, @fi);
  WriteLn('pf_readdir() - ', fr);
  WriteLn(fi.fname);

  fr := pf_open('00README.TXT');
  WriteLn('pf_open("00README.TXT") - ', fr);
  while pf_read(@bf, 128, @br) = FR_OK do
  begin
    if (br = 0) then break;
    bf[br] := #0;
    Write(bf);
  end;
  WriteLn;

  fr := pf_open('LICENSE.TXT');
  WriteLn('pf_open("LICENSE.TXT") - ', fr);
  while pf_read(@bf, 128, @br) = FR_OK do
  begin
    if (br = 0) then break;
    bf[br] := #0;
    Write(bf);
  end;

  fr := pf_lseek(13);
  WriteLn('pf_lseek(13) - ', fr);
  while pf_read(@bf, 128, @br) = FR_OK do
  begin
    if (br = 0) then break;
    bf[br] := #0;
    Write(bf);
  end;

  WriteLn;

end.
