USE Common;
GO

DROP TABLE IF EXISTS dbo.states;
GO

CREATE TABLE dbo.states(
  ID INT IDENTITY(1,1) NOT NULL,
  isActive TINYINT NOT NULL,
  postal NVARCHAR(8) NOT NULL,
  [name] NVARCHAR(60) NOT NULL,
  shortDescription NVARCHAR(255) NULL,
  dateCreated DATETIME NOT NULL,
  dateModified DATETIME NOT NULL,
  createdBy NVARCHAR(60) NOT NULL,
  modifiedBy NVARCHAR(60) NOT NULL
);
GO
