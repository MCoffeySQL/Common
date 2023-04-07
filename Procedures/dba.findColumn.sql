USE massCommon;
GO

DROP PROCEDURE IF EXISTS dba.findColumn;
GO

CREATE OR ALTER PROCEDURE dba.findColumn
  @columnnName VARCHAR(60)
AS
BEGIN
  SELECT 
    schemas.[name] AS schemaName,
    tables.[name] AS tableName,
    columns.[name] AS columnName,
    types.[name] AS columnType
  FROM sys.columns 
  JOIN sys.tables
    ON columns.[object_id] = tables.[object_id]
  JOIN sys.schemas
    ON tables.[schema_id] = schemas.[schema_id]
  LEFT JOIN sys.types
    ON columns.user_type_id = types.user_type_id
  WHERE columns.[name] LIKE '%' + @columnnName + '%'
END