#include <stdio.h>
#include "pff.h"

char *SD_DEV;

int main() {
    FATFS fs;
    DIR dr;
    FILINFO fi;

    FRESULT fr;
    unsigned char bf[257];
    UINT br;
    
    SD_DEV = "../SD.img";
    // SD_DEV = "/dev/loop0";
    printf("----------------------------------------.\n");
    printf("PetitFS Raspberry Pi test on loop device.\n");
    printf("----------------------------------------.\n");

    fr = pf_mount(&fs);  
    printf("pf_mount() - %d\n", fr);

    fr = pf_opendir(&dr, "");
    printf("pf_opendir("") - %d\n", fr);

    fr = pf_readdir(&dr, &fi);
    printf("pf_readdir() - %d\n", fr);
    printf("%s\n", fi.fname);

    fr = pf_readdir(&dr, &fi);
    printf("pf_readdir() - %d\n", fr);
    printf("%s\n", fi.fname);

    fr = pf_readdir(&dr, &fi);
    printf("pf_readdir() - %d\n", fr);
    printf("%s\n", fi.fname);

    fr = pf_opendir(&dr, "RASPI");
    printf("pf_opendir("") - %d\n", fr);

    fr = pf_readdir(&dr, &fi);
    printf("pf_readdir() - %d\n", fr);
    printf("%s\n", fi.fname);

    fr = pf_open("00README.TXT");
    printf("pf_open(\"00README.TXT\") - %d\n", fr);
    while (!pf_read(bf, 256, &br) && br) {
	bf[br] = '\0';
	printf("%s", bf);
    }
    printf("\n");

    fr = pf_open("LICENSE.TXT");
    printf("pf_open(\"LICENSE.TXT\") - %d\n", fr);
    while (!pf_read(bf, 256, &br) && br) {
	bf[br] = '\0';
	printf("%s", bf);
    }
    printf("\n");

//
//	Raspi SD
//

    SD_DEV = "/dev/mmcblk0p1";
    printf("----------------------------------------.\n");
    printf("PetitFS Raspberry Pi SD test.\n");
    printf("----------------------------------------.\n");
    fr = pf_mount(&fs);  
    printf("pf_mount() - %d\n", fr);

    fr = pf_open("CMDLINE.TXT");
    printf("pf_open(\"CMDLINE.TXT\") - %d\n", fr);
    while (!pf_read(bf, 256, &br) && br) {
	bf[br] = '\0';
	printf("%s", bf);
    }
    printf("\n");

    fr = pf_open("CONFIG.TXT");
    printf("pf_open(\"CONFIG.TXT\") - %d\n", fr);
    while (!pf_read(bf, 256, &br) && br) {
	bf[br] = '\0';
	printf("%s", bf);
    }
    printf("\n");

    fr = pf_open("ISSUE.TXT");
    printf("pf_open(\"ISSUE.TXT\") - %d\n", fr);
    while (!pf_read(bf, 256, &br) && br) {
	bf[br] = '\0';
	printf("%s", bf);
    }
    printf("\n");

    // PF_USE_LLC 1
    printf("PetitFS low case file names test.\n");
    fr = pf_open("cmdline.txt");
    printf("pf_open(\"cmdline.txt\") - %d\n", fr);
    fr = pf_open("config.txt");
    printf("pf_open(\"config.txt\") - %d\n", fr);


    SD_DEV = "/dev/sdb1";
    printf("----------------------------------------.\n");
    printf("PetitFS Raspberry Pi Card Reader FAT32 test.\n");
    printf("----------------------------------------.\n");
    fr = pf_mount(&fs);  
    printf("pf_mount() - %d\n", fr);

    fr = pf_open("00README.TXT");
    printf("pf_open(\"00README.TXT\") - %d\n", fr);
    while (!pf_read(bf, 256, &br) && br) {
	bf[br] = '\0';
	printf("%s", bf);
    }
    printf("\n");

    fr = pf_open("LICENSE.TXT");
    printf("pf_open(\"LICENSE.TXT\") - %d\n", fr);
    while (!pf_read(bf, 256, &br) && br) {
	bf[br] = '\0';
	printf("%s", bf);
    }
    printf("\n");

    return 0;
}