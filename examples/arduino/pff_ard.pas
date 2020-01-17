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
  bf: array[0..Pred(512)] of char;
  br: UINT;
  cnt: DWORD;
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
  
  uart_puts('Try read RW.TXT (1M)...'#13#10);
  fr := pf_open('RW.TXT');
  cnt := 0;
  while pf_read(@bf, 512, br) = FR_OK do
  begin
    if (br <= 0) then
      break;
    cnt := cnt + br;  
  end;
  if (cnt = fs.fsize) and (fr = FR_OK)then
    uart_puts('Done reading RW.TXT!'#13#10)
  else  
    uart_puts('Error reading RW.TXT.'#13#10);
    
  uart_puts('Try read RW2.TXT (2M)...'#13#10);
  fr := pf_open('RW2.TXT');
  cnt := 0;
  while pf_read(@bf, 512, br) = FR_OK do
  begin
    if (br <= 0) then
      break;
    cnt := cnt + br;  
  end;
  if (cnt = fs.fsize) and (fr = FR_OK)then
    uart_puts('Done reading RW2.TXT!'#13#10)
  else  
    uart_puts('Error reading RW2.TXT.'#13#10);

  uart_puts('Try read RW4.TXT (4M)...'#13#10);
  fr := pf_open('RW4.TXT');
  cnt := 0;
  while pf_read(@bf, 512, br) = FR_OK do
  begin
    if (br <= 0) then
      break;
    cnt := cnt + br;  
  end;
  if (cnt = fs.fsize) and (fr = FR_OK) then
    uart_puts('Done reading RW4.TXT!'#13#10)
  else  
    uart_puts('Error reading RW4.TXT.'#13#10);
    
end.
