unit uart;
{$mode delphi}
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
var
  t: Byte;
begin
  while UCSR0A and (1 shl UDRE0) = 0 do;
  UDR0 := Ord('$');
  
  while UCSR0A and (1 shl UDRE0) = 0 do;
  t := b shr 4;
  if t < 10 then
    UDR0 := t + Ord('0')
  else
    UDR0 := t - (10 - Ord('A'));
	
  while UCSR0A and (1 shl UDRE0) = 0 do;
  t := b and $0F;
  if t < 10 then
    UDR0 := t + Ord('0')
  else
    UDR0 := t - (10 - Ord('A'));
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
