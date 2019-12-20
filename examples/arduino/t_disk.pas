program t_disk;
{$mode delphi}

uses
  disk_io, uart, pff;
var
  res: Byte;
  fs: FATFS;
  fr: FRESULT;
  bf: array[0..Pred(256)] of char; 
  br: DWORD;  
begin
  {$info PetitFS test}
  uart_init();

  disk_initialize();
  uart_puts(#13#10);  
  disk_readp(nil, 0, 0, 512);
  uart_puts(#13#10);
  disk_readp(nil, 0, 0, 512);  

  fr := pf_mount(fs);
  uart_puts(#13#10);  
  uart_xputc(BYTE(fr));

  fr := pf_open('00README.TXT');
  while pf_read(@bf, 128, br) = FR_OK do
  begin
    if (br = 0) then
      break;
    bf[br] := #0;
    uart_puts(bf);
  end;
  

end.
