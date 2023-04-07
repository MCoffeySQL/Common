USE massCommon;
GO

DROP PROCEDURE IF EXISTS dba.tsw08cc_shrink;
GO

CREATE OR ALTER PROCEDURE dba.tsw08cc_shrink
AS
BEGIN
  DECLARE
    @sqlStr NVARCHAR(4000)

  SET @sqlStr = 'USE tswData08_ClientCustom DBCC SHRINKFILE (N''TSWData08_ClientCustom'', 1);'
  EXEC(@sqlStr);
  SET @sqlStr = 'USE tswData08_ClientCustom DBCC SHRINKDATABASE(N''TSWData08_ClientCustom'');'
  EXEC(@sqlStr);
END
GO


 
 
 

