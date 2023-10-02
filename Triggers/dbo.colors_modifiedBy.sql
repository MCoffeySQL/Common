USE Common;
GO

DROP TRIGGER IF EXISTS dbo.colors_modifiedBy;
GO

CREATE TRIGGER dbo.colors_modifiedBy
ON dbo.colors
AFTER INSERT, UPDATE
AS 
  UPDATE dbo.colors
  SET modifiedBy = SUSER_SNAME()
  FROM dbo.colors
  JOIN inserted AS i
    ON colors.id = i.id;
GO