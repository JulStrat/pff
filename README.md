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
