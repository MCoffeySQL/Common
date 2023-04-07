
USE massCommon;
GO

DROP PROCEDURE IF EXISTS dba.tsw08cc_correctSynonyms;
GO

CREATE OR ALTER PROCEDURE dba.tsw08cc_correctSynonyms
AS
BEGIN
  SET NOCOUNT ON

  DECLARE
    @sqlStr NVARCHAR(4000),
    @schemaName NVARCHAR(128),
    @synonymName NVARCHAR(128),
    @baseObjectName NVARCHAR(128),
    @message NVARCHAR(255)

  DROP TABLE IF EXISTS #scratch;

  CREATE TABLE #scratch(
    id INT IDENTITY(1,1) NOT NULL,
    schemaName NVARCHAR(128) NOT NULL,
    synonymName NVARCHAR(128) NOT NULL,
    baseObjectName NVARCHAR(128) NOT NULL,
    processed TINYINT NULL
  );

  INSERT INTO #scratch(
    schemaName,
    synonymName,
    baseObjectName,
    processed
  )
  SELECT
    schemas.[name],
    synonyms.[name],
    REPLACE(REPLACE(LOWER(synonyms.base_object_name),']',''),'[',''),
    0
  FROM tswData08_clientCustom.sys.synonyms
  INNER JOIN tswData08_clientCustom.sys.schemas
    ON synonyms.[schema_id] = schemas.[schema_id]
  WHERE synonyms.is_ms_shipped = 0;

  UPDATE #scratch
  SET baseObjectName = REPLACE(baseObjectName,'tswdata.','tswdata08.');


  WHILE EXISTS(SELECT 1 FROM #scratch WHERE processed = 0)
  BEGIN
    SELECT TOP 1
      @schemaName = schemaName,
      @synonymName = synonymName,
      @baseObjectName = baseObjectName
    FROM #scratch
    WHERE ISNULL(processed ,0) = 0
		ORDER BY schemaName, synonymName

    SET @sqlStr = 'USE tswdata08_clientCustom '
    SET @sqlStr = @sqlStr + 'DROP SYNONYM IF EXISTS ['+ @schemaName + '].[' + @synonymName + ']; '
    SET @sqlStr = @sqlStr + 'CREATE SYNONYM [' + @schemaName + '].[' + @synonymName + '] FOR ' + @baseObjectName + ';'

    SET @message = 'Processing: ' + @schemaName + '.' + @synonymName + ';'
    RAISERROR(@message,0,1)WITH NOWAIT;

    EXEC (@sqlStr)
    UPDATE #scratch
    SET processed = 1
    WHERE schemaName = @schemaName AND synonymName = @synonymName;
  END
END

