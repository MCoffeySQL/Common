USE massCommon;
GO

DROP PROCEDURE IF EXISTS dba.getDatabases;
GO

CREATE OR ALTER PROCEDURE dba.getDatabases
AS
BEGIN
  SET NOCOUNT ON

  INSERT INTO dba.[databases](
    isActive,
    databaseID,
    databaseName,
    compatibilityLevel,
    recoveryModel,
    databaseOwner
  )
  SELECT
    1,
    database_id,
    [name],
    [compatibility_level],
    CASE recovery_model
      WHEN 1 THEN 'Full'
      WHEN 2 THEN 'Bulk Load'
      WHEN 3 THEN 'Simple'
    END,
    SUSER_SNAME(owner_sid)
  FROM sys.databases
END

