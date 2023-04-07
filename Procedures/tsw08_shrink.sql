USE massCommon;
GO

DROP PROCEDURE IF EXISTS dba.tsw08_shrink;
GO

CREATE OR ALTER PROCEDURE dba.tsw08_shrink
AS
BEGIN
  DECLARE
    @sqlStr NVARCHAR(4000)

  SET @sqlStr = 'USE tswdata08 DBCC SHRINKFILE (N''TSWDATA_Data'', 1);'
  EXEC(@sqlStr);
  SET @sqlStr = 'USE tswData08 DBCC SHRINKDATABASE(N''TSWData08'');'
  EXEC(@sqlStr);
END
GO
 
 
 

