USE Common;
GO

--Primary Key
ALTER TABLE dbo.holidays
DROP CONSTRAINT IF EXISTS pk_holidays;
GO

ALTER TABLE dbo.holidays
ADD CONSTRAINT pk_holidays
PRIMARY KEY CLUSTERED (id);
GO

--Default on [isActive]
ALTER TABLE dbo.holidays 
DROP CONSTRAINT IF EXISTS dv_holidays_isActive;
GO

ALTER TABLE dbo.holidays
ADD CONSTRAINT dv_holidays_isActive
  DEFAULT 1
  FOR isActive;
GO

--Default on [dateCreated]
ALTER TABLE dbo.holidays 
DROP CONSTRAINT IF EXISTS dv_holidays_dateCreated;
GO

ALTER TABLE dbo.holidays
ADD CONSTRAINT dv_holidays_dateCreated
  DEFAULT SYSDATETIME() 
  FOR dateCreated;
GO

--Default on [dateModified]
ALTER TABLE dbo.holidays 
DROP CONSTRAINT IF EXISTS dv_holidays_dateModified;
GO

ALTER TABLE dbo.holidays
ADD CONSTRAINT dv_holidays_dateModified
  DEFAULT SYSDATETIME()
  FOR dateModified;
GO

--Default on [createdBy]
ALTER TABLE dbo.holidays 
DROP CONSTRAINT IF EXISTS dv_holidays_createdBy;
GO

ALTER TABLE dbo.holidays
ADD CONSTRAINT dv_holidays_createdBy
  DEFAULT SUSER_SNAME()
  FOR createdBy;
GO

--Default on [modifiedBy]
ALTER TABLE dbo.holidays 
DROP CONSTRAINT IF EXISTS dv_holidays_modifiedBy;
GO

ALTER TABLE dbo.holidays
ADD CONSTRAINT dv_holidays_modifiedBy
  DEFAULT SUSER_SNAME()
  FOR modifiedBy;
GO
