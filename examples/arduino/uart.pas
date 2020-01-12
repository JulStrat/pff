unit uart;
// {$mode delphi}
{$mode objfpc}
interface

procedure uart_init();
function uart_getc(): Char;
procedure uart_putc(c: Char);
procedure uart_xputc(b: byte);
procedure uart_puts(s: PChar);

implementation

const
  CPU_Clock = 16000000;
  Baud      = 9600;

procedure uart_init();
begin
  UBRR0  := CPU_Clock div (16 * Baud) - 1;
  UCSR0A := 0;
  UCSR0B := (1 shl TXEN0) or (1 shl RXEN0);
  UCSR0C := (3 shl UCSZ0);
end;

function uart_getc(): Char;
begin
  while UCSR0A and (1 shl RXC0) = 0 do;
  Result := Char(UDR0);          
end;

procedure uart_putc(c: Char);
begin
  while UCSR0A and (1 shl UDRE0) = 0 do;
  UDR0 := Byte(c);                      
end;

procedure uart_xputc(b: byte);
const
  hexbyte: array[0..15] of byte = (
    ord('0'), ord('1'), ord('2'), ord('3'), ord('4'), ord('5'), ord('6'), ord('7'), 
	ord('8'), ord('9'), ord('A'), ord('B'), ord('C'), ord('D'), ord('E'), ord('F'));
begin
  while UCSR0A and (1 shl UDRE0) = 0 do;
  UDR0 := Ord('$');
  while UCSR0A and (1 shl UDRE0) = 0 do;
     
  UDR0 := hexbyte[b shr 4];
  while UCSR0A and (1 shl UDRE0) = 0 do;
     
  UDR0 := hexbyte[b and $0F];
end;

procedure uart_puts(s: PChar);
begin
  while s^ <> #0 do
  begin
    uart_putc(s^);
    Inc(s);
  end;  
end;

end.
