USE massCommon;
GO

DROP PROCEDURE IF EXISTS dba.tsw08cc_checkDB;
GO

CREATE OR ALTER PROCEDURE dba.tsw08cc_checkDB
AS
BEGIN
  DECLARE
    @sqlStr NVARCHAR(4000)

  SET @sqlStr = 'USE tswData08_clientCustom DBCC CHECKDB;'
  EXEC(@sqlStr);
END
GO


 
 
 

