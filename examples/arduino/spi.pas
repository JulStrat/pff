unit spi;
{$mode objfpc}

interface

procedure spi_init_master();
function spi_transceiver(d: byte = $FF): byte;

implementation
(* Current SD card connection
PIN 1: GND    <-->  Arduino GND
PIN 2: +3.3V  <---  Arduino 3V
PIN 3: +5V    <---  Arduino 5V
PIN 4: CS     <---  Arduino DIO 10 PB2 SS
PIN 5: MOSI   <---  Arduino DIO 11 PB3 MOSI
PIN 6: SCLK   <---  Arduino DIO 13 PB5 SCK
PIN 7: MISO   --->  Arduino DIO 12 PB4 MISO
PIN 8: GND          N/A
*)

procedure spi_init_master();
begin
  (* Set output SS, MOSI, SCK *)
  DDRB := DDRB or ((1 shl 2) or (1 shl 3) or (1 shl 5));
  SPCR := (1 shl SPE) or (1 shl MSTR);
end;

function spi_transceiver(d: byte = $FF): byte;
begin
  SPDR := d;
  while (SPSR and (1 shl SPIF)) = 0 do ;
  Result := SPDR;
end;

end.
