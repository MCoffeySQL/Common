 USE massCommon;
 GO

 DROP PROCEDURE IF EXISTS dba.insert_databaseUsers;
 GO

 CREATE OR ALTER PROCEDURE dba.insert_databaseUsers
  @databaseName VARCHAR(128),
  @userName VARCHAR(60)
 AS
 BEGIN

   SET NOCOUNT ON;

   --DECLARE
   -- @databaseName VARCHAR(128) = 'tswdata08',
   -- @userName VARCHAR(60) = 'INFORMATION_SCHEMA'

    INSERT INTO massCommon.dba.restore_databaseUsers(
      isActive,
      userID,
      databaseName,
      userName,
      shortDescription
    )
    VALUES (
      1,
      NULL,
      @databaseName,
      @userName,
      'proc dba.insert_databaseUsers'
    );
END
GO