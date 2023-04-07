USE massCommon;
GO

--Restore Database TSWData21

CREATE OR ALTER PROCEDURE dba.tsw21_restore
AS
BEGIN

DECLARE
  @sourceFile NVARCHAR(128) = N'V:\Junk\_Share\Replication\TSWData21.bak',
  @databaseName NVARCHAR(128) = 'TSWData',
  @datafilePath NVARCHAR(128) = 'V:\SQLServer\MSSQL15.MSSQLSERVER\MSSQL\DATA\',
  @logfilePath NVARCHAR(128) = 'V:\SQLServer\MSSQL15.MSSQLSERVER\MSSQL\Log\',
  @datafilePathName NVARCHAR(255),
  @logfilePathName NVARCHAR(255),
  @sqlStr NVARCHAR(4000)
  --,@message NVARCHAR(255)
  
  SET @datafilePathName = LOWER(@datafilePath + @databaseName + '.mdf')
  SET @logfilePathName = LOWER(@logfilePAth + @databaseName + '_log.ldf')

  IF EXISTS(SELECT 1 FROM sys.databases WHERE [name] = 'tswData21')
  BEGIN
    SET @sqlStr = 'ALTER DATABASE [' + @databaseName + '] SET OFFLINE WITH ROLLBACK IMMEDIATE;'
    EXEC(@sqlStr);
  END

RESTORE DATABASE @databaseName
FROM DISK = @sourceFile
WITH  
  FILE = 1,  
  MOVE N'TSWDATA' TO @datafilePathName,  
  MOVE N'TSWDATA_log' TO @logfilePathName,  
  NOUNLOAD,  
  STATS = 10,
  REPLACE
END
GO