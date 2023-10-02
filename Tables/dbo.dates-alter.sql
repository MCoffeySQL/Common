USE Common;
GO

--Primary Key [ID]
ALTER TABLE dbo.dates DROP CONSTRAINT IF EXISTS pk_dates;
GO

ALTER TABLE dbo.dates 
  ADD CONSTRAINT pk_dates 
  PRIMARY KEY CLUSTERED (aDate);
GO

--Default on [isActive]
ALTER TABLE dbo.dates DROP CONSTRAINT IF EXISTS dv_dates_isActive;
GO

ALTER TABLE dbo.dates 
ADD CONSTRAINT dv_dates_isActive
  DEFAULT 1
  FOR isActive;
GO

--Default on [dateCreated]
ALTER TABLE dbo.dates DROP CONSTRAINT IF EXISTS dv_dates_dateCreated;
GO

ALTER TABLE dbo.dates
ADD CONSTRAINT dv_dates_dateCreated
  DEFAULT SYSDATETIME() 
  FOR dateCreated;
GO

--Default on [dateModified]
ALTER TABLE dbo.dates DROP CONSTRAINT IF EXISTS dv_dates_dateModified;
GO

ALTER TABLE dbo.dates
ADD CONSTRAINT dv_dates_dateModified
  DEFAULT SYSDATETIME()
  FOR dateModified;
GO

--Default on [createdBy]
ALTER TABLE dbo.dates DROP CONSTRAINT IF EXISTS dv_dates_createdBy;
GO

ALTER TABLE dbo.dates
ADD CONSTRAINT dv_dates_createdBy
  DEFAULT SUSER_SNAME()
  FOR createdBy;
GO

--Default on [modifiedBy]
ALTER TABLE dbo.dates DROP CONSTRAINT IF EXISTS dv_dates_modifiedBy;
GO

ALTER TABLE dbo.dates
ADD CONSTRAINT dv_dates_modifiedBy
  DEFAULT SUSER_SNAME()
  FOR modifiedBy;
GO