USE Common;
GO

DROP TRIGGER IF EXISTS dbo.dates_setModified;
GO

CREATE OR ALTER TRIGGER dbo.dates_setModified
ON dbo.dates
AFTER UPDATE
AS 
  UPDATE dbo.dates
  SET modifiedBy = SUSER_SNAME(),
    dateModified = GETDATE()
  FROM dbo.dates
  JOIN inserted AS inserted
    ON dates.id = inserted.id;
GO

ALTER TABLE dbo.dates 
ENABLE TRIGGER dates_setModified;
GO


