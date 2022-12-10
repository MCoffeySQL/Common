USE common;
GO

DROP TABLE IF EXISTS dbo.symbols;
GO

CREATE TABLE dbo.symbols(
  id SMALLINT NOT NULL,
  symbol VARCHAR(24) NULL,
  hex VARCHAR(4) NULL,
  html VARCHAR(8) NULL,
  morse VARCHAR(24) NULL,
  shortDescription VARCHAR(64)
  );
GO

