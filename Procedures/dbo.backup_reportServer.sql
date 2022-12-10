USE Common;
GO

DROP PROCEDURE IF EXISTS dbo.backup_reportServer;
GO

CREATE OR ALTER PROCEDURE dbo.backup_reportServer
  @backupType NVARCHAR(24)
AS
BEGIN
  --Usage Example:
  --  EXEC dbo.backup_reportServer 'Full'
  --  EXEC dbo.backup_reportserver 'Differential'

  DECLARE 
    @databaseName NVARCHAR(128) = 'reportSerrver',
    @destinationPath NVARCHAR(128) = 'D:\SQL Server\Backup\',
    @destinationFileName NVARCHAR(128),
    @destinationPathFileName NVARCHAR(255),
    @backupName NVARCHAR(128)

  SET @destinationFileName = @databaseName + '_' + @backupType + '_' + CAST(YEAR(GETDATE()) AS NVARCHAR(4)) + RIGHT('0' + CAST(MONTH(GETDATE()) AS NVARCHAR(2)),2) + RIGHT('0' + CAST(DAY(GETDATE()) AS NVARCHAR(2)),2) + '.bak'
  SET @destinationPathFileName = @destinationPath + @destinationFileName
  SET @backupName = @databaseName + '-' + @backupType + ' Database Backup'

  IF @backupType = 'Full'
  BEGIN
    BACKUP DATABASE @databaseName
     TO  DISK = @destinationPathFileName
    WITH 
      NOFORMAT, 
      NOINIT,  
      NAME = @backupName, 
      SKIP, 
      NOREWIND,
      NOUNLOAD,  
      STATS = 10
  END 

  IF @backupType = 'Differential'
  BEGIN
    BACKUP DATABASE @databaseName
    TO DISK = @destinationPathFileName
    WITH DIFFERENTIAL,
      NOFORMAT, 
      NOINIT,
      NAME = @backupName,
      SKIP,
      NOREWIND,
      NOUNLOAD,
      STATS = 10

  END
END
GO
