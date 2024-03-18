USE Common;
GO

DROP TABLE IF EXISTS dbo.holidays

CREATE TABLE dbo.holidays(
  id INT IDENTITY(1,1) NOT NULL,
  isActive TINYINT NOT NULL,
  [name] VARCHAR(64) NOT NULL,
  occurance VARCHAR(255) NULL,
  shortDescription VARCHAR(255) NULL,
  dateCreated DATETIME NULL,
  dateModified DATETIME NULL,
  createdBy VARCHAR(64) NULL,
  modifiedBy VARCHAR(64) NULL
);
GO