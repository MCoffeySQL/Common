USE Common;
GO

--Primary Key
ALTER TABLE dbo.symbols
DROP CONSTRAINT pk_symbols;

ALTER TABLE dbo.symbols
ADD CONSTRAINT pk_symbols
PRIMARY KEY CLUSTERED (id);

