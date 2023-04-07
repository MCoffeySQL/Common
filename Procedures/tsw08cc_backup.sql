USE massCommon;
GO

DROP PROCEDURE IF EXISTS dba.tsw08cc_backup;
GO

CREATE OR ALTER PROCEDURE dba.tsw08cc_backup
AS
BEGIN
  BACKUP DATABASE [TSWData08cc] 
  TO DISK = N'V:\SQLServer\Backup\TSWData08cc.bak' 
  WITH  
    --COPY_ONLY,
    DESCRIPTION = N'Full Database Backup', 
    NOFORMAT, 
    NOINIT,  
    NAME = N'TSWData08_ClientCommon-Full Database Backup', 
    SKIP, 
    NOREWIND, 
    NOUNLOAD, 
    COMPRESSION, 
    --CHECKSUM,
    STATS = 10;
END
GO