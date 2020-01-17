# Petit FatFS Free Pascal port
  
  Petit FatFS is a sub-set of FatFS module for Tiny 8-bit MicroControllers.
  It can be incorporated into the Tiny MicroControllers with limited memory
  even if the RAM size is less than sector size.

## Features

  1. FAT12, FAT16 and FAT32.
  2. Single volume and single file.
  3. Streaming file read.
  4. File write function with some restrictions.
  
## API documentation

https://julstrat.github.io/pff/

## Usage example

On Windows for development and testing 
I use tiny (50KB) FAT12 file image ```examples/SD.img``` created on RASPI.
Script - ```examples/mksdimg.sh```.

```
uses
  pff;

var
  fs: FATFS;
  dr: DIR;
  fi: FILINFO;
  bf: array[0..Pred(256)] of char;  
  fr: FRESULT;
  br: UINT;  

begin
  {* Mount ... *)
  fr := pf_mount(fs);

  (* List root directory *)
  fr := pf_opendir(dr, '');
  repeat
  begin
    fr := pf_readdir(dr, @fi);
    WriteLn(fi.fname);
  end;
  until fi.fname[0] = Char(#0);

  ...
  
  (* Cat text file - 00README.TXT *)
  fr := pf_open('00README.TXT');
  while pf_read(@bf, 128, br) = FR_OK do
  begin
    if (br = 0) then break;
    bf[br] := #0;
    Write(bf);
  end;
```

## Built With

* [Lazarus](https://www.lazarus-ide.org/) - The professional Free Pascal RAD IDE.
* [PasDoc](https://github.com/pasdoc/pasdoc) - Documentation tool for ObjectPascal (Free Pascal, Lazarus, Delphi).

## Testing

7.86GB SD card content - 
```
root@raspberrypi:/mnt/SD# ls -al
total 7196
drwxr-xr-x 4 root root    4096 Jan  1  1970 .
drwxr-xr-x 5 root root    4096 Dec 19 12:07 ..
-rwxr-xr-x 1 root root    2078 Jan 30  2019 00readme.txt
-rwxr-xr-x 1 root root    1961 Dec  4 12:48 LICENSE.txt
drwxr-xr-x 2 root root    4096 Dec 11 13:01 RASPI
-rwxr-xr-x 1 root root 2097152 Jan 16 15:32 RW2.TXT
-rwxr-xr-x 1 root root 4194304 Jan 16 15:32 RW4.TXT
-rwxr-xr-x 1 root root 1048576 Jan 16 15:28 RW.TXT
drwxr-xr-x 2 root root    4096 Dec 11 13:02 System Volume Information
-rwxr-xr-x 1 root root      22 Dec 10 15:31 TEST.TXT
```

### Arduino UNO R3

#### Connectar

```
PIN 4: CS     <---  Arduino DIO 10 PB2 SS
PIN 5: MOSI   <---  Arduino DIO 11 PB3 MOSI
PIN 6: SCLK   <---  Arduino DIO 13 PB5 SCK
PIN 7: MISO   --->  Arduino DIO 12 PB4 MISO
```

#### Build
```
$ ppcrossavr.exe -Tembedded -Cpavr5 -Wpatmega328p -vi -aln -Xm -B -O3 pff_ard.pas
Target OS: Embedded
Compiling pff_ard.pas
Compiling pff.pas
Compiling disk_io.pas
Compiling spi.pas
Assembling spi
Compiling uart.pas
Assembling uart
Assembling disk_io
User defined: PF_USE_READ enabled
User defined: PF_USE_DIR enabled
User defined: ENDIAN_LITTLE
User defined: ENDIAN_LITTLE
Assembling pff
User defined: PetitFS test
Assembling pff_ard
Linking pff_ard
2066 lines compiled, 0.3 sec, 8276 bytes code, 410 bytes data
```

#### Upload
```
$ /E/Arduino/hardware/tools/avr/bin/avrdude.exe -C/E/Arduino/hardware/tools/avr/etc/avrdude.conf -v -patmega328p -carduino -PCOM5 -b115200 -D -Uflash:w:pff_ard.hex:i

avrdude.exe: Version 6.3-20190619
             Copyright (c) 2000-2005 Brian Dean, http://www.bdmicro.com/
             Copyright (c) 2007-2014 Joerg Wunsch

             System wide configuration file is "E:/Arduino/hardware/tools/avr/etc/avrdude.conf"

             Using Port                    : COM5
             Using Programmer              : arduino
             Overriding Baud Rate          : 115200
             AVR Part                      : ATmega328P
             Chip Erase delay              : 9000 us
             PAGEL                         : PD7
             BS2                           : PC2
             RESET disposition             : dedicated
             RETRY pulse                   : SCK
             serial program mode           : yes
             parallel program mode         : yes
             Timeout                       : 200
             StabDelay                     : 100
             CmdexeDelay                   : 25
             SyncLoops                     : 32
             ByteDelay                     : 0
             PollIndex                     : 3
             PollValue                     : 0x53
             Memory Detail                 :

                                      Block Poll               Page                       Polled
               Memory Type Mode Delay Size  Indx Paged  Size   Size #Pages MinW  MaxW   ReadBack
               ----------- ---- ----- ----- ---- ------ ------ ---- ------ ----- ----- ---------
               eeprom        65    20     4    0 no       1024    4      0  3600  3600 0xff 0xff
               flash         65     6   128    0 yes     32768  128    256  4500  4500 0xff 0xff
               lfuse          0     0     0    0 no          1    0      0  4500  4500 0x00 0x00
               hfuse          0     0     0    0 no          1    0      0  4500  4500 0x00 0x00
               efuse          0     0     0    0 no          1    0      0  4500  4500 0x00 0x00
               lock           0     0     0    0 no          1    0      0  4500  4500 0x00 0x00
               calibration    0     0     0    0 no          1    0      0     0     0 0x00 0x00
               signature      0     0     0    0 no          3    0      0     0     0 0x00 0x00

             Programmer Type : Arduino
             Description     : Arduino
             Hardware Version: 3
             Firmware Version: 4.4
             Vtarget         : 0.3 V
             Varef           : 0.3 V
             Oscillator      : 28.800 kHz
             SCK period      : 3.3 us

avrdude.exe: AVR device initialized and ready to accept instructions

Reading | ################################################## | 100% 0.00s

avrdude.exe: Device signature = 0x1e950f (probably m328p)
avrdude.exe: reading input file "pff_ard.hex"
avrdude.exe: writing flash (8458 bytes):

Writing | ################################################## | 100% 1.39s

avrdude.exe: 8458 bytes of flash written
avrdude.exe: verifying flash memory against pff_ard.hex:
avrdude.exe: load data flash data from input file pff_ard.hex:
avrdude.exe: input file pff_ard.hex contains 8458 bytes
avrdude.exe: reading on-chip flash data:

Reading | ################################################## | 100% 1.09s

avrdude.exe: verifying ...
avrdude.exe: 8458 bytes of flash verified

avrdude.exe done.  Thank you.
```

#### Connect putty to COM5 (your Arduino COM port)

pff-ard output - 

```
*** PetitFS test. ***
*** List root directory
SYSTEM~1
TEST.TXT
RASPI
00README.TXT
LICENSE.TXT
RW.TXT
RW2.TXT
RW4.TXT

*** Rewind and read ...
SYSTEM~1
TEST.TXT
RASPI
00README.TXT
LICENSE.TXT
RW.TXT
RW2.TXT
RW4.TXT

*** List RASPI directory -
MKSDIMG.SH

...

Try read RW.TXT (1M)...
Done reading RW.TXT!
Try read RW2.TXT (2M)...
Done reading RW2.TXT!
Try read RW4.TXT (4M)...
Done reading RW4.TXT!
``` 

### RASPI

ex_fpc output - 
```
PetitFS test.
pf_mount() - FR_OK
pf_open("RW.TXT") - FR_OK
RW.TXT size - 1536
Bytes writed - 1536
*** Test pf_opendir, pf_readdir ***
pf_opendir("") - FR_OK
pf_readdir() - FR_OK
RASPI
pf_readdir() - FR_OK
00README.TXT
pf_readdir() - FR_OK
LICENSE.TXT
pf_opendir("RASPI") - FR_OK
pf_readdir() - FR_OK
EX_C.C
pf_open("00README.TXT") - FR_OK
Petit FatFs Module Source Files R0.03a               (C)ChaN, 2019


FILES

  pff.h      Common include file for Petit FatFs and application module.
  pff.c      Petit FatFs module.
  diskio.h   Common include file for Petit FatFs and disk I/O module.
  diskio.c   Skeleton of low level disk I/O module.

...
```

### Windows

ex_fpc output - 
```
PetitFS test.
pf_mount() - FR_OK
pf_opendir("") - FR_OK
pf_readdir() - FR_OK
RASPI
pf_readdir() - FR_OK
00README.TXT
pf_readdir() - FR_OK
LICENSE.TXT
pf_opendir("RASPI") - FR_OK
pf_readdir() - FR_OK
EX_C.C
pf_open("00README.TXT") - FR_OK
Petit FatFs Module Source Files R0.03a               (C)ChaN, 2019


FILES

  pff.h      Common include file for Petit FatFs and application module.
  pff.c      Petit FatFs module.

...  
```

## Links

http://elm-chan.org/fsw/ff/00index_p.html

http://ww1.microchip.com/downloads/en/Appnotes/Petit-Fat-File-System-00002799A.pdf

http://ww1.microchip.com/downloads/en/AppNotes/00002543B.pdf
