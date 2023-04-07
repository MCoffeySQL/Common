USE massCommon;
GO

DROP PROCEDURE IF EXISTS dba.tsw08cc_changeServiceOwner;
GO

CREATE OR ALTER PROCEDURE dba.tsw08cc_changeServiceOwner
AS
BEGIN
  --Switch Ownership before removing user accounts
  ALTER AUTHORIZATION ON Service::[SqlQueryNotificationService-d6d92dc6-eb27-4597-8ff7-8f468cd23c5e] TO [dbo] 
END