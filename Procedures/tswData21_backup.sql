--GKWillie Full Copy Only Backup

BACKUP DATABASE [TSWDATA] 
  TO  DISK = N'D:\Transfer\tswData21.bak' 
  WITH  
    COPY_ONLY, 
    NOFORMAT, 
    NOINIT,  
    NAME = N'TSWData21_Replication', 
    SKIP, 
    NOREWIND, 
    NOUNLOAD, 
    COMPRESSION,  
    STATS = 10
GO
