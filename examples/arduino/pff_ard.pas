program pff_ard;
{$mode delphi}

uses
  pff,
  uart;

{$I pff_cfg.inc}

const
  DIR_F: PChar = 'DIR list - '; 
  DIR_OK: PChar = 'DIR - OK'#13#10;
  DIR_ERR: PChar = 'DIR - ERR'#13#10;

  CAT_F: PChar = 'CAT file - '; 
  CAT_OK: PChar = 'CAT - OK'#13#10;
  CAT_ERR: PChar = 'CAT - ERR'#13#10;

  READ_F: PChar = 'READ file - ';
  READ_OK: PChar = 'READ - OK'#13#10; 
  READ_ERR: PChar = 'READ - ERR'#13#10; 
  
  WRITE_F: PChar = 'WRITE file - ';
  WRITE_OK: PChar = 'WRITE - OK'#13#10;
  WRITE_ERR: PChar = 'WRITE - ERR'#13#10;
  
  WRITE_PATTERN: PChar = '_0123456789ABCDEF';
  
var
  fs: FATFS;
  dr: DIR;
  fi: FILINFO;
  fr: FRESULT;

function t_dir(fname: PChar): boolean;
var
  bfl: array[0..Pred(513)] of char;
  brl: UINT; 
  cntl: DWORD;  
begin
  uart_puts(DIR_F); uart_puts(fname); uart_puts(''#13#10);
  if pf_opendir(dr, fname) <> FR_OK then
  begin
    uart_puts(DIR_ERR);
    Exit(false);
  end;
  
  repeat
  begin
    fr := pf_readdir(dr, fi);
    uart_puts('> '); uart_puts(fi.fname); uart_puts(''#13#10);
  end;
  until fi.fname[0] = char(#0);
  uart_puts(DIR_OK);
  Result := true
end;  

function t_cat(fname: PChar; off: DWORD = 0): boolean;
var
  bfl: array[0..Pred(513)] of char;
  brl: UINT; 
  cntl: DWORD;  
begin
  uart_puts(CAT_F); uart_puts(fname); uart_puts(''#13#10);
  if pf_open(fname) <> FR_OK then
  begin
    uart_puts(CAT_ERR);  
    Exit(false);
  end;  

  cntl := 0;
  if pf_lseek(off) <> FR_OK then
  begin  
    uart_puts(CAT_ERR);    
    Exit(false);
  end;  

  cntl := cntl + fs.fptr;
  while pf_read(@bfl, 512, brl) = FR_OK do
  begin
    cntl := cntl + brl;  
    bfl[brl] := #0;
    uart_puts(bfl);
    if brl < 512 then break;    
  end;
  
  if cntl = fs.fsize then 
  begin
    uart_puts(CAT_OK);    
    Result := true
  end  
  else
  begin 
    uart_puts(CAT_ERR);    
    Result := false;
  end
end;  

function t_read(fname: PChar): boolean;
var
  bfl: array[0..Pred(513)] of char;
  brl: UINT; 
  cntl: DWORD;  
begin
  uart_puts(READ_F); uart_puts(fname); uart_puts(''#13#10);
  if pf_open(fname) <> FR_OK then
  begin
    uart_puts(READ_ERR);
    Exit(false);
  end;
  
  cntl := 0;
  while pf_read(@bfl, 512, brl) = FR_OK do
  begin
    cntl := cntl + brl;  
    if brl < 512 then break;  
  end;
  
  if cntl = fs.fsize then 
  begin
    uart_puts(READ_OK);  
    Result := true
  end
  else
  begin
    uart_puts(READ_ERR);  
    Result := false;
  end
end;  

{$ifdef PF_USE_WRITE}
function t_write(fname: PChar): boolean;
var
  bfl: PChar;
  bwl: UINT; 
  cntl: DWORD;  
begin
  uart_puts(WRITE_F); uart_puts(fname); uart_puts(''#13#10);
  if pf_open(fname) <> FR_OK then
  begin
    uart_puts(WRITE_ERR);    
    Exit(false);
  end;  

  bfl := WRITE_PATTERN;
  cntl := 0;
  while pf_write(bfl, StrLen(bfl), bwl) = FR_OK do
  begin
    cntl := cntl + bwl;  
    if bwl < StrLen(bfl) then
    begin
      pf_write(nil, 0, bwl);
      break;      
    end;
  end;
  
  if cntl = fs.fsize then 
  begin
    uart_puts(WRITE_OK);    
    Result := true
  end
  else
  begin
    uart_puts(WRITE_ERR);    
    Result := false;
  end
end;  
{$endif}
  
begin
  {$info PetitFS test}
  uart_init();
  uart_puts('<<< PetitFS TEST >>>'#13#10);

  fr := pf_mount(fs);
  t_dir('');
  t_dir('RASPI');

  t_cat('00README.TXT');
  uart_puts(''#13#10);

  t_cat('LICENSE.TXT');
  uart_puts(''#13#10);

  t_read('RW.TXT');
  t_read('RW2.TXT');
  t_read('RW4.TXT');

(*
  t_cat('TEST.TXT');
  t_cat('TEST.TXT', 1);
  t_cat('TEST.TXT', 2);
*)  

{$ifdef PF_USE_WRITE}
  t_write('RW.TXT');
  t_write('RW2.TXT');
  t_write('RW4.TXT');
{$endif}  

  uart_puts('<<< FINISH >>>');
end.
