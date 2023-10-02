USE Common;
GO

DROP TRIGGER IF EXISTS dbo.dates_modifiedBy;
GO

CREATE TRIGGER dbo.dates_modifiedBy
ON dbo.dates
AFTER INSERT, UPDATE
AS 
  UPDATE dbo.dates
  SET modifiedBy = SUSER_SNAME()
  FROM dbo.dates
  JOIN inserted AS i
    ON dates.id = i.id;
GO