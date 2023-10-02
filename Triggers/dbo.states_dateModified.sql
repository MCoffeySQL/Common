USE Common;
GO

CREATE TRIGGER dbo.states_dateModified
ON dbo.states
AFTER INSERT, UPDATE
AS 
  UPDATE dbo.states
  SET dateModified = GETDATE()
  FROM dbo.states
  JOIN inserted AS i
    ON states.id = i.id;
GO