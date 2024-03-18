USE common;
GO

DROP TABLE IF EXISTS dbo.symbols;
GO

CREATE TABLE dbo.symbols(
  id INT NOT NULL,
  isActive TINYINT NOT NULL,
  symbol VARCHAR(24) NOT NULL,
  hex VARCHAR(4) NULL,
  html VARCHAR(8) NULL,
  morse VARCHAR(24) NULL,
  shortDescription VARCHAR(255) NULL,
  dateCreated DATETIME NOT NULL,
  dateModified DATETIME NOT NULL,
  createdBy VARCHAR(60) NOT NULL,
  modifiedBy VARCHAR(60) NOT NULL
  );
GO

