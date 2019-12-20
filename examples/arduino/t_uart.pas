program t_uart;
{$mode delphi}
uses uart;

const
  XOFF = 32;

var
  bf: array[0..511] of byte;
  bp: PByte;
  x: WORD;  

begin
  x := x * 8;
  x := x shr 3;
  bp := @bf + (XOFF - 13);

  uart_init();
  uart_putc(Char(bp^));  
  
  while True do
    if uart_getc() = #32 then
      uart_puts('Hello from Arduino UNO R3!'#13#10); 
end.
  