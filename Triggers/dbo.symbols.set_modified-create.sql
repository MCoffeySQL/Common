USE Common;
GO

DROP TRIGGER IF EXISTS dbo.symbols_setModified;
GO

CREATE OR ALTER TRIGGER dbo.symbols_setModified
ON dbo.symbols
AFTER UPDATE
AS 
  UPDATE dbo.symbols
  SET modifiedBy = SUSER_SNAME(),
    dateModified = GETDATE()
  FROM dbo.symbols
  JOIN inserted AS inserted
    ON symbols.id = inserted.id;
GO

ALTER TABLE dbo.symbols 
ENABLE TRIGGER symbols_setModified;
GO


