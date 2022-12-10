USE Common;
GO

DROP TABLE IF EXISTS dbo.timeZone;
GO

CREATE TABLE dbo.timeZone (
  ID INT IDENTITY(1,1) NOT NULL,
  isActive INT NOT NULL,
  zoneAbbr NVARCHAR(5) NOT NULL,
  zoneName NVARCHAR(60) NOT NULL,
  [location] NVARCHAR(60) NULL,
  offset INT NOT NULL,
  shortDescription NVARCHAR(255) NULL,
  dateCreated DATETIME NOT NULL,
  dateModified DATETIME NOT NULL,
  createdBy NVARCHAR(60) NOT NULL,
  modifiedBy NVARCHAR(60) NOT NULL
);
GO
