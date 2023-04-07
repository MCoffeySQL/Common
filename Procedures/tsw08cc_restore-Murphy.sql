USE massCommon;
GO

--Restore Database TSWData08_clientCustom

CREATE OR ALTER PROCEDURE dba.tsw08cc_restore
AS
BEGIN

DECLARE
  @sourceFile NVARCHAR(128) = N'D:\Transfer\tswData08_clientCustom.bak',
  @databaseName NVARCHAR(128) = 'TSWData08_ClientCustom',
  @datafilePath NVARCHAR(128) = 'd:\program files\microsoft sql server\mssql15.mssqlserver\mssql\data\',
  @logfilePath NVARCHAR(128) = 'd:\program files\microsoft sql server\mssql15.mssqlserver\mssql\log\',
  @datafilePathName NVARCHAR(255),
  @logfilePathName NVARCHAR(255),
  @sqlStr NVARCHAR(4000)
  --,@message NVARCHAR(255)
  
  SET @datafilePathName = LOWER(@datafilePath + @databaseName + '.mdf')
  SET @logfilePathName = LOWER(@logfilePAth + @databaseName + '_log.ldf')
 
IF EXISTS(SELECT 1 FROM sys.databases WHERE [name] = 'tswData08_clientCustom')
BEGIN
  SET @sqlStr = 'ALTER DATABASE [' + @databaseName + '] SET OFFLINE WITH ROLLBACK IMMEDIATE;'
  EXEC(@sqlStr)
END;

RESTORE DATABASE @databaseName
FROM DISK = @sourceFile
WITH  
  FILE = 1,  
  MOVE N'TSWDATA_ClientCustom' TO @datafilePathName,  
  MOVE N'TSWDATA_ClientCustom_log' TO @logfilePathName,  
  NOUNLOAD, 
  STATS = 10,
  REPLACE;
END
GO