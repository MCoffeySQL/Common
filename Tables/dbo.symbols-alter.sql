USE Common;
GO

--Primary Key
ALTER TABLE dbo.symbols
DROP CONSTRAINT pk_symbols;

ALTER TABLE dbo.symbols
ADD CONSTRAINT pk_symbols
PRIMARY KEY CLUSTERED (id);

--Unique Constraint
ALTER TABLE dbo.symbols
DROP CONSTRAINT IF EXISTS unq_symbol;
ALTER TABLE dbo.symbols
ADD CONSTRAINT unq_symbol
UNIQUE (symbol);
