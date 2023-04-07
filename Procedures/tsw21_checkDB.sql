USE massCommon;
GO

DROP PROCEDURE IF EXISTS dba.tsw21_checkDB;
GO

CREATE OR ALTER PROCEDURE dba.tsw21_checkDB
AS
BEGIN
  DECLARE
    @sqlStr NVARCHAR(4000)

  SET @sqlStr = 'USE tswData DBCC CHECKDB;'
  EXEC(@sqlStr);
END
GO


 
 
 

