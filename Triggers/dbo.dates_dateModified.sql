USE Common;
GO

DROP TRIGGER IF EXISTS dbo.dates_dateModified;
GO

CREATE TRIGGER dbo.dates_dateModified
ON dbo.dates
AFTER INSERT, UPDATE
AS 
  UPDATE dbo.dates
  SET dateModified = GETDATE()
  FROM dbo.dates
  JOIN inserted AS i
    ON dates.id = i.id;
GO