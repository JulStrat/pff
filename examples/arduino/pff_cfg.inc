
const
  SECTOR_SIZE_BP = 9;                   (* 512 = 2**9 *)
  SECTOR_SIZE = (1 shl SECTOR_SIZE_BP); (* 512, 1024, ... *)
  PF_DEFINED = 8088;                    (* Revision ID *)

  {$define PF_USE_READ}
  {$define PF_USE_DIR}
  {$define PF_USE_LSEEK}
  {$define PF_USE_WRITE}

  PF_FS_FAT12 = False;
  PF_FS_FAT16 = False;
  PF_FS_FAT32 = True;

  PF_USE_LCC = False;
  PF_CODE_PAGE = 857;


