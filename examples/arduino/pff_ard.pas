program pff_ard;

{$mode delphi}

uses
  pff,
  uart;

var
  fs: FATFS;
  dr: DIR;
  fi: FILINFO;
  fr: FRESULT;
  bf: array[0..Pred(256)] of char;
  br: UINT;

begin
  {$info PetitFS test}
  uart_init();
  uart_puts('*** PetitFS test. ***'#13#10);
  fr := pf_mount(fs);

  fr := pf_opendir(dr, '');
  uart_puts('*** List root directory'#13#10);

  repeat
    begin
      fr := pf_readdir(dr, fi);
      uart_puts(fi.fname);
      uart_puts(''#13#10);
    end;
  until fi.fname[0] = char(#0);

  fr := pf_rewinddir(dr);
  uart_puts('*** Rewind and read ... '#13#10);

  repeat
    begin
      fr := pf_readdir(dr, fi);
      uart_puts(fi.fname);
      uart_puts(''#13#10);
    end;
  until fi.fname[0] = char(#0);

  fr := pf_opendir(dr, 'RASPI');
  uart_puts('*** List RASPI directory - '#13#10);
  repeat
    begin
      fr := pf_readdir(dr, fi);
      uart_puts(fi.fname);
      uart_puts(''#13#10);
    end;
  until fi.fname[0] = char(#0);

  fr := pf_open('00README.TXT');
  while pf_read(@bf, 128, br) = FR_OK do
  begin
    if (br = 0) then
      break;
    bf[br] := #0;
    uart_puts(bf);
  end;

  uart_puts(''#13#10);

  fr := pf_open('LICENSE.TXT');
  while pf_read(@bf, 128, br) = FR_OK do
  begin
    if (br = 0) then
      break;
    bf[br] := #0;
    uart_puts(bf);
  end;

end.
