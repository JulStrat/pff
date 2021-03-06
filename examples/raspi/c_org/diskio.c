/*-----------------------------------------------------------------------*/
/* Low level disk I/O module skeleton for Petit FatFs (C)ChaN, 2014      */
/*-----------------------------------------------------------------------*/

#include "diskio.h"

#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <unistd.h>

static int GDH = 0;
extern char *SD_DEV;

/*-----------------------------------------------------------------------*/
/* Initialize Disk Drive                                                 */
/*-----------------------------------------------------------------------*/

DSTATUS disk_initialize (void)
{
	DSTATUS stat;

	// Put your code here
        if (GDH) close(GDH);

	GDH = open(SD_DEV, O_RDWR);
	if (GDH == -1)
	    stat = STA_NOINIT;
	else
	    stat = 0;
	return stat;
}

/*-----------------------------------------------------------------------*/
/* Read Partial Sector                                                   */
/*-----------------------------------------------------------------------*/

DRESULT disk_readp (
	BYTE* buff,		/* Pointer to the destination object */
	DWORD sector,	/* Sector number (LBA) */
	UINT offset,	/* Offset in the sector */
	UINT count		/* Byte count (bit15:destination) */
)
{
	DRESULT res;
	size_t br;

	// Put your code here
	lseek(GDH, sector*512+offset, SEEK_SET);
	br = read(GDH, buff, count);
	if (br == count)
	    res = 0;
	else
	    res = 1;
	

	return res;
}



/*-----------------------------------------------------------------------*/
/* Write Partial Sector                                                  */
/*-----------------------------------------------------------------------*/

DRESULT disk_writep (
	const BYTE* buff,	/* Pointer to the data to be written, NULL:Initiate/Finalize write operation */
	DWORD sc		/* Sector number (LBA) or Number of bytes to send */
)
{
	DRESULT res;


	if (!buff) {
		if (sc) {
			// Initiate write process
			lseek(GDH, 512*sc, SEEK_SET);

		} else {
			// Finalize write process
		}
		res = 0;
	} else {

		// Send data to the disk
		if (write(GDH, buff, sc) == sc)
		    res = 0;
		else
		    res = 1;
                sync();            
	}

	return res;
}

