USE massCommon;
GO

DROP PROCEDURE IF EXISTS dba.tsw21_removeUsers;
GO

CREATE OR ALTER PROCEDURE dba.tsw21_removeUsers
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE 
    @id INT,
    @sqlStr VARCHAR(60)

  DROP TABLE IF EXISTS #thisTable;

  CREATE TABLE #thisTable(
    id INT IDENTITY(1,1) NOT NULL,
    userName VARCHAR(60) NOT NULL,
    processed TINYINT NULL
  );

  INSERT INTO #thisTable(
    userName,
    processed
  )
  SELECT
    [name],
    0
  FROM tswdata.sys.database_principals
  WHERE LOWER([name]) NOT IN (
      'dbo',
      'guest',
      'information_schema',
      'sys',
      'ssrsAgent',
      'ssisAgent',
      'mcoffey',
      'massone\mcoffey'
    ) 
  AND [type] IN ('U','S');

  WHILE EXISTS (SELECT 1 FROM #thisTable WHERE processed = 0)
  BEGIN
    SELECT TOP 1
      @id = id,
      @sqlStr = 'USE tswData; DROP USER [' + userName + '];'
    FROM #thisTable
    WHERE processed = 0
    ORDER BY processed,userName;

    RAISERROR(@sqlStr,0,1)WITH NOWAIT;         --//--Debugging
    EXEC(@sqlStr);

    UPDATE #thisTable 
    SET processed = 1 
    WHERE id = @id;
  END
END