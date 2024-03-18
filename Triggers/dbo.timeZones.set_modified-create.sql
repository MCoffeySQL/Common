USE Common;
GO

DROP TRIGGER IF EXISTS dbo.timeZones_setModified;
GO

CREATE TRIGGER dbo.timeZones_setModified
ON dbo.timeZones
AFTER UPDATE
AS 
  UPDATE dbo.timeZones
  SET modifiedBy = USER_NAME(),
    dateModified = GETDATE()
  FROM dbo.timeZones
  JOIN inserted AS inserted
    ON timeZones.id = inserted.id;
GO

ALTER TABLE dbo.timeZones 
ENABLE TRIGGER timeZones_setModified
GO


