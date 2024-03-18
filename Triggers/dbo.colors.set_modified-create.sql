USE Common;
GO

DROP TRIGGER IF EXISTS dbo.colors_setModified;
GO

CREATE OR ALTER TRIGGER dbo.colors_setModified
ON dbo.colors
AFTER UPDATE
AS 
  UPDATE dbo.colors
  SET modifiedBy = SUSER_SNAME(),
    dateModified = GETDATE()
  FROM dbo.colors
  JOIN inserted AS inserted
    ON colors.id = inserted.id;
GO

ALTER TABLE dbo.colors 
ENABLE TRIGGER colors_setModified;
GO


