USE massCommon;
GO

DROP PROCEDURE IF EXISTS dba.tsw21_shrink;
GO

CREATE OR ALTER PROCEDURE dba.tsw21_shrink
AS
BEGIN
  DECLARE
    @sqlStr NVARCHAR(4000)

  SET @sqlStr = 'USE tswdata21 DBCC SHRINKFILE (N''TSWDATA'', 1);'
  EXEC(@sqlStr);
  SET @sqlStr = 'USE tswData21 DBCC SHRINKDATABASE(N''TSWData21'');'
  EXEC(@sqlStr);
END
GO
 
 
 

