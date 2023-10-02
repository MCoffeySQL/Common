USE Common;
GO

DROP TRIGGER IF EXISTS dbo.states_modifiedBy;
GO

CREATE TRIGGER dbo.states_modifiedBy
ON dbo.states
AFTER INSERT, UPDATE
AS 
  UPDATE dbo.states
  SET modifiedBy = SUSER_SNAME()
  FROM dbo.states
  JOIN inserted AS i
    ON states.id = i.id;
GO