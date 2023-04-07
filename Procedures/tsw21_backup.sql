USE massCommon;
GO

DROP PROCEDURE IF EXISTS dba.tsw21_backup;
GO

CREATE OR ALTER PROCEDURE dba.tsw21_backup
AS
BEGIN
  BACKUP DATABASE [TSWData21] 
  TO DISK = N'V:\SQLServer\Backup\TSWData21.bak' 
  WITH  
    --COPY_ONLY,
    DESCRIPTION = N'Full Database Backup', 
    NOFORMAT, 
    NOINIT,  
    NAME = N'TSWData21-Full Database Backup', 
    SKIP, 
    NOREWIND, 
    NOUNLOAD, 
    COMPRESSION, 
    --CHECKSUM,
    STATS = 10;
END
GO