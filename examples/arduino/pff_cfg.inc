
const 
  PF_DEFINED = 8088; (* Revision ID *)

  {$define PF_USE_READ}
  {$define PF_USE_DIR}
  {$undef PF_USE_LSEEK}
  {$undef PF_USE_WRITE}

  PF_FS_FAT12 = False;
  PF_FS_FAT16 = False;
  PF_FS_FAT32 = True;

  PF_USE_LCC = False;
  PF_CODE_PAGE = 857;

