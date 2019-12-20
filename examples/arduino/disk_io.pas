{ Low level disk I/O module skeleton for Petit FatFs (C)ChaN, 2014 }
unit disk_io;

{$mode delphi}

interface

const
  { Drive not initialized }
  STA_NOINIT = $01;
  { No medium in the drive }
  STA_NODISK = $02;

type
  DSTATUS = byte;
  DRESULT = (
    { Function succeeded }
    RES_OK = 0,
    { Disk error }
    RES_ERROR,
    { Not ready }
    RES_NOTRDY,
    { Invalid parameter }
    RES_PARERR
    );

{ Initialize Disk Drive }
function disk_initialize(): DSTATUS;

{ Read Partial Sector }
function disk_readp(buff: Pointer; sector: DWORD; offset: DWORD; Count: DWORD): DRESULT;

{ Write Partial Sector }
function disk_writep(buff: Pointer; sc: DWORD): DRESULT;

implementation

uses spi, uart;

const

  CMD0 = $40 + 0;   (* GO_IDLE_STATE *)
  CMD1 = $40 + 1;   (* SEND_OP_COND (MMC) *)
  ACMD41 = $C0 + 41; (* SEND_OP_COND (SDC) *)
  CMD8 = $40 + 8;   (* SEND_IF_COND *)
  CMD16 = $40 + 16; (* SET_BLOCKLEN *)
  CMD17 = $40 + 17; (* READ_SINGLE_BLOCK *)
  CMD24 = $40 + 24; (* WRITE_BLOCK *)
  CMD55 = $40 + 55; (* APP_CMD *)
  CMD58 = $40 + 58; (* READ_OCR *)

  (* Card type flags (CardType) *)
  CT_MMC = $01;   (* MMC ver 3 *)
  CT_SD1 = $02;   (* SD ver 1 *)
  CT_SD2 = $04;   (* SD ver 2 *)
  CT_BLOCK = $08; (* Block addressing *)

  SD_CS_PIN = 10;
// SD_CS_PORT = PORTB;
// SD_CS_DDR = DDRB;
// SD_CS_BIT = SD_CS_PIN - 8;

{$macro on}
{$define SELECT := PORTB := PORTB and (not 4) }
{$define DESELECT := PORTB := PORTB or 4 }
// {$define SELECTING() := (PORTB and 4) }

var
  CardType: byte;

function send_cmd(cmd: byte; arg: DWORD): byte;
var
  n, res: byte;
begin
  // spi_set_divisor(CardType);
  if cmd and $80 <> 0 then
  begin
    cmd := cmd and $7F;
    res := send_cmd(CMD55, 0);
    if res > 1 then
      Exit(res);
  end;
  DESELECT;
  spi_transceiver();
  SELECT;
  spi_transceiver();

  (* Send a command packet *)
  spi_transceiver(cmd);            (* Start + Command index *)
  spi_transceiver(byte(arg shr 24));  (* Argument[31..24] *)
  spi_transceiver(byte(arg shr 16));  (* Argument[23..16] *)
  spi_transceiver(byte(arg shr 8));   (* Argument[15..8] *)
  spi_transceiver(byte(arg));      (* Argument[7..0] *)
  n := $01;                (* Dummy CRC + Stop *)
  if (cmd = CMD0) then
    n := $95;  (* Valid CRC for CMD0(0) *)
  if (cmd = CMD8) then
    n := $87;  (* Valid CRC for CMD8(0x1AA) *)
  spi_transceiver(n);

  for n := 0 to 9 do
  begin
    res := spi_transceiver();
    if res and $80 = 0 then
      break;
  end;
  Result := res;
end;


function disk_initialize(): DSTATUS;
var
  stat: DSTATUS;

  n, cmd, ty: byte;
  ocr: array[0..3] of byte;
  tmr: DWORD;
begin
  (* Put your code here *)
  spi_init_master();
  DESELECT;
  for n := 0 to 9 do
    spi_transceiver();

  ty := 0;
  if send_cmd(CMD0, 0) = 1 then
  begin
    (* GO_IDLE_STATE *)
    if send_cmd(CMD8, $1AA) = 1 then
    begin
      (* SDv2 *)
      for n := 0 to 3 do
        ocr[n] := spi_transceiver();
      if (ocr[2] = $01) and (ocr[3] = $AA) then
      begin
        (* The card can work at vdd range of 2.7-3.6V *)
        for tmr := 10000 downto 0 do
        begin
          if send_cmd(ACMD41, 1 shl 30) = 0 then
            break;
          // dly_100us();
        end;
        if (tmr <> 0) and (send_cmd(CMD58, 0) = 0) then
        begin
          for n := 0 to 3 do
            ocr[n] := spi_transceiver();
          if (ocr[0] and $40) <> 0 then
            ty := CT_SD2 or CT_BLOCK
          else
            ty := CT_SD2;
        end;
      end;
    end
    else
    begin
      (* SDv1 or MMCv3 *)
      if send_cmd(ACMD41, 0) <= 1 then
      begin
        ty := CT_SD1;
        cmd := ACMD41;
      end
      else
      begin
        ty := CT_MMC;
        cmd := CMD1;
      end;

      for tmr := 10000 downto 0 do
      begin
        if send_cmd(cmd, 0) = 0 then
          break;
        // dly_100us();
      end;
      if (tmr = 0) or (send_cmd(CMD16, 512) <> 0) then
        ty := 0;
    end;
  end;
  CardType := ty;
  DESELECT;
  spi_transceiver();

  if ty <> 0 then
  begin
    Result := 0;
  end
  else
    Result := STA_NOINIT;
end;

function disk_readp(buff: Pointer; sector: DWORD; offset: DWORD; Count: DWORD): DRESULT;
var
  res: DRESULT;

  bp: PBYTE;
  rc: byte;
  bc: DWORD;
begin
  (* Put your code here *)

  if CardType and CT_BLOCK = 0 then
    sector := sector * 512;

  res := RES_ERROR;
  if send_cmd(CMD17, sector) = 0 then
  begin
    for bc := 40000 downto 0 do
    begin
      rc := spi_transceiver();
      if rc <> $FF then
        break;
    end;
    if rc = $FE then
    begin
      //bc := 512 + 2 - offset - count;
      bc := 512 - offset - Count;
      while offset > 0 do
      begin
        spi_transceiver();
        Dec(offset);
      end;
      if buff <> nil then
      begin
        bp := PBYTE(buff);
        while Count > 0 do
        begin
          bp^ := spi_transceiver();
          Inc(bp);
          Dec(Count);
        end;
      end
      else
      begin
        (* Forward data to the outgoing stream *)
        while Count > 0 do
        begin
          uart_xputc(spi_transceiver());
          Dec(Count);
        end;
      end;

      while bc > 0 do
      begin
        spi_transceiver();
        Dec(bc);
      end;
      res := RES_OK;
    end;
  end;

  DESELECT;
  spi_transceiver();
  Result := res;
end;

function disk_writep(buff: Pointer; sc: DWORD): DRESULT;
var
  res: DRESULT;
begin
  if buff = nil then
  begin
    if sc <> 0 then
    begin
      (* Initiate write process *)
    end
    else
    begin
      (* Finalize write process *)
    end;
  end
  else
  begin
    (* Send data to the disk *)
  end;

  Result := res;
end;

end.
