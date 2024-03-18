USE Common;
GO

DROP TRIGGER IF EXISTS dbo.holidays_setModified;
GO

CREATE OR ALTER TRIGGER dbo.holidays_setModified
ON dbo.holidays
AFTER UPDATE
AS 
  UPDATE dbo.holidays
  SET modifiedBy = SUSER_SNAME(),
    dateModified = GETDATE()
  FROM dbo.holidays
  JOIN inserted AS inserted
    ON holidays.id = inserted.id;
GO

ALTER TABLE dbo.holidays 
ENABLE TRIGGER holidays_setModified;
GO


