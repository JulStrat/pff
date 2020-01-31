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

7.86GB SD card content (FAT32) - 
```
root@raspberrypi:/mnt/SD# ls -al
total 7200
drwxr-xr-x 4 root root    4096 Jan 31 11:40 .
drwxr-xr-x 5 root root    4096 Dec 19 12:07 ..
-rwxr-xr-x 1 root root    2078 Jan 30  2019 00readme.txt
-rwxr-xr-x 1 root root    1961 Dec  4 12:48 LICENSE.txt
drwxr-xr-x 2 root root    4096 Dec 11 13:01 RASPI
-rwxr-xr-x 1 root root    2749 Jan 31 11:40 rootdns.cdb
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
Cross compiler built with disabled EXCEPTIONS, CLASSES, EXITCODE.
```
$ ppcrossavr.exe -Tembedded -Cpavr5 -Wpatmega328p -vi -aln -Xm -B -O3 pff_ard.pas
```

#### Upload
```
$ /E/Arduino/hardware/tools/avr/bin/avrdude.exe -C/E/Arduino/hardware/tools/avr/etc/avrdude.conf -v -patmega328p -carduino -PCOM5 -b115200 -D -Uflash:w:pff_ard.hex:i
```

#### Connect putty to COM5 (your Arduino COM port)
```pff-ard``` output - 

```
<<< PetitFS TEST >>>
DIR list -
> SYSTEM~1
> TEST.TXT
> RASPI
> 00README.TXT
> LICENSE.TXT
> RW.TXT
> RW2.TXT
> RW4.TXT
> ROOTDNS.CDB
>
DIR - OK
DIR list - RASPI
> MKSDIMG.SH
>
DIR - OK
...
READ file - RW.TXT
READ - OK
READ file - RW2.TXT
READ - OK
READ file - RW4.TXT
READ - OK
WRITE file - RW.TXT
WRITE - OK
WRITE file - RW2.TXT
WRITE - OK
WRITE file - RW4.TXT
WRITE - OK
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
