# Petit FATFS Free Pascal port
  
  Petit FatFs is a sub-set of FatFs module for Tiny 8-bit MicroControllers.
  It can be incorporated into the Tiny MicroControllers with limited memory
  even if the RAM size is less than sector size.

## Testing

### Windows

ex_fpc output

```
PetitFS test.
ld_word: 85 - 170
0
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
FatFs License

FatFs and Petit-FatFs have being developped as a personal project of the author,
 ChaN. It is free from the code anyone else wrote at current release. Following
code block shows a copy of the FatFs license document that heading the source fi
les.

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

Therefore FatFs license is one of the BSD-style licenses but there is a signific
ant feature. FatFs is mainly intended for embedded systems. In order to extend t
he usability for commercial products, the redistributions of FatFs in binary for
m, such as embedded code, binary library and any forms without source code, does
 not need to include about FatFs in the documentations. This is equivalent to th
e 1-clause BSD license. Of course FatFs is compatible with the most of open sour
ce software licenses including GNU GPL. When you redistribute the FatFs source c
ode with any changes or create a fork, the license can also be changed to GNU GP
L, BSD-style license or any open source software license that not conflict with
FatFs license.

```

## Links

http://elm-chan.org/fsw/ff/00index_p.html

http://ww1.microchip.com/downloads/en/Appnotes/Petit-Fat-File-System-00002799A.pdf

http://ww1.microchip.com/downloads/en/AppNotes/00002543B.pdf
