USE massCommon;
GO

DROP PROCEDURE IF EXISTS dba.tsw08_restore;
GO

--Restore Database TSWData08

CREATE OR ALTER PROCEDURE dba.tsw08_restore
AS
BEGIN

DECLARE
  @sourceFile NVARCHAR(128) = N'V:\Junk\_Share\Replication\tswData08.bak',
  @databaseName NVARCHAR(128) = 'TSWData08',
  @datafilePath NVARCHAR(128) = 'V:\SQLServer\MSSQL15.MSSQLSERVER\MSSQL\DATA\',
  @logfilePath NVARCHAR(128) = 'V:\SQLServer\MSSQL15.MSSQLSERVER\MSSQL\Log\',
  @datafilePathName NVARCHAR(255),
  @logfilePathName NVARCHAR(255),
  @sqlStr NVARCHAR(4000)
  --,@message NVARCHAR(255)
  
  SET @datafilePathName = LOWER(@datafilePath + @databaseName + '.mdf')
  SET @logfilePathName = LOWER(@logfilePAth + @databaseName + '_log.ldf')

SET @sqlStr = 'ALTER DATABASE [' + @databaseName + '] SET OFFLINE WITH ROLLBACK IMMEDIATE;'
EXEC(@sqlStr); 

RESTORE DATABASE @databaseName
FROM DISK = @sourceFile
WITH  
  FILE = 1,  
  MOVE N'TSWDATA_Data'  TO @datafilePathName,  
  MOVE N'TSWDATA_log' TO @logfilePathName,  
  NOUNLOAD,  
  STATS = 10,
  REPLACE;
END
GO