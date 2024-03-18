USE Common;
GO

DROP TRIGGER IF EXISTS dbo.states_setModified;
GO

CREATE TRIGGER dbo.states_setModified
ON dbo.states
AFTER UPDATE
AS 
  UPDATE dbo.states
  SET modifiedBy = SUSER_SNAME(),
    dateModified = GETDATE()
  FROM dbo.states
  JOIN inserted AS inserted
    ON states.id = inserted.id;
GO

ALTER TABLE dbo.states
ENABLE TRIGGER states_setModified
GO


