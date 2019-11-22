#include <stdio.h>
#include "pff.h"

int main() {
    FATFS fs;
    FRESULT fr;
    unsigned char bf[256];
    UINT br;
    
    printf("PetitFS test.\n");
    fr = pf_mount(&fs);  
    printf("pf_mount() - %d\n", fr);

    fr = pf_open("00README.TXT");
    printf("pf_open(\"00README.TXT\") - %d\n", fr);
    while (!pf_read(bf, 128, &br) && br) {
	bf[br] = '\0';
	printf("%s", bf);
    }
    printf("\n");

    fr = pf_open("LICENSE.TXT");
    printf("pf_open(\"LICENSE.TXT\") - %d\n", fr);
    while (!pf_read(bf, 128, &br) && br) {
	bf[br] = '\0';
	printf("%s", bf);
    }
    printf("\n");


    return 0;
}