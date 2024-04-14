USE Common;
GO

DROP TABLE IF EXISTS dbo.state_timeZones;
GO

CREATE TABLE dbo.state_timeZones(
  ID INT IDENTITY(1,1) NOT NULL,
  isActive TINYINT NOT NULL,
  postal VARCHAR(3) NOT NULL,
  [zone] VARCHAR(8) NOT NULL,
  shortDescription VARCHAR(255) NULL,
  dateCreated DATETIME NULL,
  dateModified DATETIME NULL,
  createdBy VARCHAR(64) NULL,
  modifiedBY VARCHAR(64) NULL
  );
GO