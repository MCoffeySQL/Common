USE massCommon;
GO

DROP PROCEDURE IF EXISTS dba.tsw08_checkDB;
GO

CREATE OR ALTER PROCEDURE dba.tsw08_checkDB
AS
BEGIN
  DECLARE
    @sqlStr NVARCHAR(4000)

  SET @sqlStr = 'USE tswData08 DBCC CHECKDB;'
  EXEC(@sqlStr);
END
GO


 
 
 

