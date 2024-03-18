USE Common;
GO

DROP TABLE IF EXISTS dbo.timeZones;
GO

CREATE TABLE dbo.timeZones(
  id INT IDENTITY(1,1) NOT NULL,
  isActive TINYINT NOT NULL,
  [name] VARCHAR(64) NOT NULL,
  [zone] VARCHAR(8) NOT NULL,
  offset INT NULL,
  [location] VARCHAR(64) NULL,
  shortDescription VARCHAR(255) NULL,
  dateCreated DATETIME NULL,
  dateModified DATETIME NULL,
  createdBy VARCHAR(64) NULL,
  modifiedBy VARCHAR(64) NULL
);
GO
