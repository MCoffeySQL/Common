USE Common;
GO

DROP TRIGGER IF EXISTS dbo.colors_dateModified;
GO

CREATE TRIGGER dbo.colors_dateModified
ON dbo.colors
AFTER INSERT, UPDATE
AS 
  UPDATE dbo.colors
  SET dateModified = GETDATE()
  FROM dbo.colors
  JOIN inserted AS i
    ON colors.id = i.id;
GO