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

function t_cat(fname: PChar): boolean;
var
  bfl: array[0..Pred(513)] of char;
  brl: UINT; 
  cntl: DWORD;  
begin
  if pf_open(fname) <> FR_OK then
    Exit(false);

  cntl := 0;	
  while pf_read(@bfl, 512, brl) = FR_OK do
  begin
    bfl[brl] := #0;
	cntl := cntl + brl;
    uart_puts(bfl);
  end;
  
  if cntl = fs.fsize then
    Result := true
  else  
    Result := false;
end;  

function t_read(fname: PChar; sig: Byte): boolean;
var
  bfl: array[0..Pred(513)] of char;
  brl: UINT; 
  cntl: DWORD;  
begin
  if pf_open(fname) <> FR_OK then
    Exit(false);

  cntl := 0;	
  while pf_read(@bfl, 512, brl) = FR_OK do
  begin
	cntl := cntl + brl;
  end;
  
  if cntl = fs.fsize then
    Result := true
  else  
    Result := false;
end;  
  
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

  t_cat('00README.TXT');
  uart_puts(''#13#10);

  t_cat('LICENSE.TXT');
  uart_puts(''#13#10);
  
  uart_puts('Try read RW.TXT (1M)...'#13#10);
  if t_read('RW.TXT', Ord('A')) then
    uart_puts('Done reading RW.TXT!'#13#10)
  else  
    uart_puts('Error reading RW.TXT.'#13#10);
    
  uart_puts('Try read RW2.TXT (2M)...'#13#10);
  if t_read('RW2.TXT', Ord('B')) then
    uart_puts('Done reading RW2.TXT!'#13#10)
  else  
    uart_puts('Error reading RW2.TXT.'#13#10);

  uart_puts('Try read RW4.TXT (4M)...'#13#10);
  if t_read('RW4.TXT', Ord('C')) then
    uart_puts('Done reading RW4.TXT!'#13#10)
  else  
    uart_puts('Error reading RW4.TXT.'#13#10);
    
end.
