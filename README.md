# Petit FatFS Free Pascal port
  
  Petit FatFS is a sub-set of FatFS module for Tiny 8-bit MicroControllers.
  It can be incorporated into the Tiny MicroControllers with limited memory
  even if the RAM size is less than sector size.

## Features

  1. Small RAM consumption (44 bytes work area + certain stack).
  2. Small code size (2K - 4K bytes).
  3. FAT12, FAT16 and FAT32.
  4. Single volume and single file.
  5. Streaming file read.
  6. File write function with some restrictions.
  
## API documentation

https://julstrat.github.io/pff/

## Usage example
  
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

### Arduino UNO R3

Build
```
$  ppcrossavr.exe -Tembedded -Cpavr5 -Wpatmega328p -vi -B -O3 pff_ard.pas
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
2078 lines compiled, 0.3 sec, 10016 bytes code, 539 bytes data
```

Upload
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
avrdude.exe: writing flash (10198 bytes):

Writing | ################################################## | 100% 1.64s

avrdude.exe: 10198 bytes of flash written
avrdude.exe: verifying flash memory against pff_ard.hex:
avrdude.exe: load data flash data from input file pff_ard.hex:
avrdude.exe: input file pff_ard.hex contains 10198 bytes
avrdude.exe: reading on-chip flash data:

Reading | ################################################## | 100% 1.31s

avrdude.exe: verifying ...
avrdude.exe: 10198 bytes of flash verified

avrdude.exe done.  Thank you.
```
Connect putty to COM5
```
*** PetitFS test. ***
*** List root directory
SYSTEM~1
TEST.TXT
RASPI
00README.TXT
LICENSE.TXT

*** Rewind and read ...
SYSTEM~1
TEST.TXT
RASPI
00README.TXT
LICENSE.TXT

*** List RASPI directory -
MKSDIMG.SH

Petit FatFs Module Source Files R0.03a               (C)ChaN, 2019


FILES

  pff.h      Common include file for Petit FatFs and application module.
  pff.c      Petit FatFs module.
  diskio.h   Common include file for Petit FatFs and disk I/O module.
  diskio.c   Skeleton of low level disk I/O module.

  Low level disk I/O module is not included in this archive because the Petit
  FatFs module is only a generic file system layer and not depend on any
  specific storage device. You have to provide a low level disk I/O module that
  written to control your storage device.



AGREEMENTS

 Petit FatFs module is an open source software to implement FAT file system to
 small embedded systems. This is a free software and is opened for education,
 research and commercial developments under license policy of following trems.

  Copyright (C) 2019, ChaN, all right reserved.

 * The Petit FatFs module is a free software and there is NO WARRANTY.
 * No restriction on use. You can use, modify and redistribute it for
   personal, non-profit or commercial use UNDER YOUR RESPONSIBILITY.
 * Redistributions of source code must retain the above copyright notice.



REVISION HISTORY

  Jun 15, 2009  R0.01a  First release (Branched from FatFs R0.07b)

  Dec 14, 2009  R0.02   Added multiple code page support.
                        Added write funciton.
                        Changed stream read mode interface.

  Dec 07,'2010  R0.02a  Added some configuration options.
                        Fixed fails to open objects with DBCS character.

  Jun 10, 2014  R0.03   Separated out configuration options to pffconf.h.
                        Added _USE_LCC option.
                        Added _FS_FAT16 option.

  Jan 30, 2019  R0.03a  Supported stdint.h for C99 and later.
                        Removed _WORD_ACCESS option.
                        Changed prefix of configuration options, _ to PF_.
                        Added some code pages.
                        Removed some code pages actually not valid.


FatFs License

FatFs and Petit-FatFs have being developped as a personal project of the author, ChaN. It is free from the code anyone else wrote at current release. Following code block shows a copy of the FatFs license document that heading the source files.

/*----------------------------------------------------------------------------/
/  FatFs - Generic FAT Filesystem Module  Rx.xx                               /
/-----------------------------------------------------------------------------/
/
/ Copyright (C) 20xx, ChaN, all right reserved.
/
/ FatFs module is an open source software. Redistribution and use of FatFs in
/ source and binary forms, with or without modification, are permitted provided
/ that the following condition is met:
/
/ 1. Redistributions of source code must retain the above copyright notice,
/    this condition and the following disclaimer.
/
/ This software is provided by the copyright holder and contributors "AS IS"
/ and any warranties related to this software are DISCLAIMED.
/ The copyright owner or contributors be NOT LIABLE for any damages caused
/ by use of this software.
/----------------------------------------------------------------------------*/

Therefore FatFs license is one of the BSD-style licenses but there is a significant feature. FatFs is mainly intended for embedded systems. In order to extend the usability for commercial products, the redistributions of FatFs in binary form, such as embedded code, binary library and any forms without source code, does not need to include about FatFs in the documentations. This is equivalent to the 1-clause BSD license. Of course FatFs is compatible with the most of open source software licenses including GNU GPL. When you redistribute the FatFs source code with any changes or create a fork, the license can also be changed to GNU GPL, BSD-style license or any open source software license that not conflict with FatFs license.
``` 


### RASPI

ex_fpc output

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

  Low level disk I/O module is not included in this archive because the Petit
  FatFs module is only a generic file system layer and not depend on any
  specific storage device. You have to provide a low level disk I/O module that
  written to control your storage device.



AGREEMENTS

 Petit FatFs module is an open source software to implement FAT file system to
 small embedded systems. This is a free software and is opened for education,
 research and commercial developments under license policy of following trems.

  Copyright (C) 2019, ChaN, all right reserved.

 * The Petit FatFs module is a free software and there is NO WARRANTY.
 * No restriction on use. You can use, modify and redistribute it for
   personal, non-profit or commercial use UNDER YOUR RESPONSIBILITY.
 * Redistributions of source code must retain the above copyright notice.



REVISION HISTORY

  Jun 15, 2009  R0.01a  First release (Branched from FatFs R0.07b)

  Dec 14, 2009  R0.02   Added multiple code page support.
                        Added write funciton.
                        Changed stream read mode interface.

  Dec 07,'2010  R0.02a  Added some configuration options.
                        Fixed fails to open objects with DBCS character.

  Jun 10, 2014  R0.03   Separated out configuration options to pffconf.h.
                        Added _USE_LCC option.
                        Added _FS_FAT16 option.

  Jan 30, 2019  R0.03a  Supported stdint.h for C99 and later.
                        Removed _WORD_ACCESS option.
                        Changed prefix of configuration options, _ to PF_.
                        Added some code pages.
                        Removed some code pages actually not valid.


pf_open("LICENSE.TXT") - FR_OK
  Petit FatFs - FAT file system module for FPC

  Copyright (C) 2019, ChaN, all right reserved.
  Copyright (C) 2019, I. Kakoulidis, all right reserved.

  Petit FatFs module is an open source software. Redistribution and use of
  Petit FatFs in source and binary forms, with or without modification, are
  permitted provided that the following condition is met:

  1. Redistributions of source code must retain the above copyright notice,
     this condition and the following disclaimer.

  This software is provided by the copyright holder and contributors "AS IS"
  and any warranties related to this software are DISCLAIMED.
  The copyright owner or contributors be NOT LIABLE for any damages caused
  by use of this software.
pf_lseek(13) - FR_OK
 - FAT file system module for FPC

  Copyright (C) 2019, ChaN, all right reserved.
  Copyright (C) 2019, I. Kakoulidis, all right reserved.

  Petit FatFs module is an open source software. Redistribution and use of
  Petit FatFs in source and binary forms, with or without modification, are
  permitted provided that the following condition is met:

  1. Redistributions of source code must retain the above copyright notice,
     this condition and the following disclaimer.

  This software is provided by the copyright holder and contributors "AS IS"
  and any warranties related to this software are DISCLAIMED.
  The copyright owner or contributors be NOT LIABLE for any damages caused
  by use of this software.

```

### Windows

ex_fpc output

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
  diskio.h   Common include file for Petit FatFs and disk I/O module.
  diskio.c   Skeleton of low level disk I/O module.

  Low level disk I/O module is not included in this archive because the Petit
  FatFs module is only a generic file system layer and not depend on any
  specific storage device. You have to provide a low level disk I/O module that
  written to control your storage device.



AGREEMENTS

 Petit FatFs module is an open source software to implement FAT file system to
 small embedded systems. This is a free software and is opened for education,
 research and commercial developments under license policy of following trems.

  Copyright (C) 2019, ChaN, all right reserved.

 * The Petit FatFs module is a free software and there is NO WARRANTY.
 * No restriction on use. You can use, modify and redistribute it for
   personal, non-profit or commercial use UNDER YOUR RESPONSIBILITY.
 * Redistributions of source code must retain the above copyright notice.



REVISION HISTORY

  Jun 15, 2009  R0.01a  First release (Branched from FatFs R0.07b)

  Dec 14, 2009  R0.02   Added multiple code page support.
                        Added write funciton.
                        Changed stream read mode interface.

  Dec 07,'2010  R0.02a  Added some configuration options.
                        Fixed fails to open objects with DBCS character.

  Jun 10, 2014  R0.03   Separated out configuration options to pffconf.h.
                        Added _USE_LCC option.
                        Added _FS_FAT16 option.

  Jan 30, 2019  R0.03a  Supported stdint.h for C99 and later.
                        Removed _WORD_ACCESS option.
                        Changed prefix of configuration options, _ to PF_.
                        Added some code pages.
                        Removed some code pages actually not valid.


pf_open("LICENSE.TXT") - FR_OK
  Petit FatFs - FAT file system module for FPC

  Copyright (C) 2019, ChaN, all right reserved.
  Copyright (C) 2019, I. Kakoulidis, all right reserved.

  Petit FatFs module is an open source software. Redistribution and use of
  Petit FatFs in source and binary forms, with or without modification, are
  permitted provided that the following condition is met:

  1. Redistributions of source code must retain the above copyright notice,
     this condition and the following disclaimer.

  This software is provided by the copyright holder and contributors "AS IS"
  and any warranties related to this software are DISCLAIMED.
  The copyright owner or contributors be NOT LIABLE for any damages caused
  by use of this software.
```

## Links

http://elm-chan.org/fsw/ff/00index_p.html

http://ww1.microchip.com/downloads/en/Appnotes/Petit-Fat-File-System-00002799A.pdf

http://ww1.microchip.com/downloads/en/AppNotes/00002543B.pdf
