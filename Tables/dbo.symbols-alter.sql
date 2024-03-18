USE Common;
GO

--Primary Key
ALTER TABLE dbo.symbols
DROP CONSTRAINT IF EXISTS pk_symbols;
GO

ALTER TABLE dbo.symbols
ADD CONSTRAINT pk_symbols
PRIMARY KEY CLUSTERED (id);
GO

--Default on [isActive]
ALTER TABLE dbo.symbols 
DROP CONSTRAINT IF EXISTS dv_symbols_isActive;
GO

ALTER TABLE dbo.symbols
ADD CONSTRAINT dv_symbols_isActive
  DEFAULT 1
  FOR isActive;
GO

--Default on [dateCreated]
ALTER TABLE dbo.symbols 
DROP CONSTRAINT IF EXISTS dv_symbols_dateCreated;
GO

ALTER TABLE dbo.symbols
ADD CONSTRAINT dv_symbols_dateCreated
  DEFAULT SYSDATETIME() 
  FOR dateCreated;
GO

--Default on [dateModified]
ALTER TABLE dbo.symbols 
DROP CONSTRAINT IF EXISTS dv_symbols_dateModified;
GO

ALTER TABLE dbo.symbols
ADD CONSTRAINT dv_symbols_dateModified
  DEFAULT SYSDATETIME()
  FOR dateModified;
GO

--Default on [createdBy]
ALTER TABLE dbo.symbols 
DROP CONSTRAINT IF EXISTS dv_symbols_createdBy;
GO

ALTER TABLE dbo.symbols
ADD CONSTRAINT dv_symbols_createdBy
  DEFAULT SUSER_SNAME()
  FOR createdBy;
GO

--Default on [modifiedBy]
ALTER TABLE dbo.symbols 
DROP CONSTRAINT IF EXISTS dv_symbols_modifiedBy;
GO

ALTER TABLE dbo.symbols
ADD CONSTRAINT dv_symbols_modifiedBy
  DEFAULT SUSER_SNAME()
  FOR modifiedBy;
GO
