#!/bin/sh

# make SD image file

dd if=/dev/zero of=SD.img bs=1K count=50
mkdosfs SD.img
mkdir /tmp/SD
mount -o loop SD.img /tmp/SD/
mkdir /tmp/SD/raspi
cp ../source/00readme.txt /tmp/SD
cp ../LICENSE.txt /tmp/SD
cp raspi/ex_c.c /tmp/SD/raspi
cp rootdns.cdb /tmp/SD
dd if=/dev/zero of=/tmp/SD/rw.txt bs=512 count=3
dd if=/dev/zero of=/tmp/SD/raspi/rw.txt bs=512 count=4
umount /tmp/SD
rmdir /tmp/SD
