USE Common;
GO

--Primary Key
ALTER TABLE dbo.timeZones
DROP CONSTRAINT IF EXISTS pk_timeZones;
GO

ALTER TABLE dbo.timeZones
ADD CONSTRAINT pk_timeZones
PRIMARY KEY CLUSTERED (id);
GO

--Default on [isActive]
ALTER TABLE dbo.timeZones 
DROP CONSTRAINT IF EXISTS dv_timeZones_isActive;
GO

ALTER TABLE dbo.timeZones
ADD CONSTRAINT dv_timeZones_isActive
  DEFAULT 1
  FOR isActive;
GO

--Default on [dateCreated]
ALTER TABLE dbo.timeZones 
DROP CONSTRAINT IF EXISTS dv_timeZones_dateCreated;
GO

ALTER TABLE dbo.timeZones
ADD CONSTRAINT dv_timeZones_dateCreated
  DEFAULT SYSDATETIME() 
  FOR dateCreated;
GO

--Default on [dateModified]
ALTER TABLE dbo.timeZones 
DROP CONSTRAINT IF EXISTS dv_timeZones_dateModified;
GO

ALTER TABLE dbo.timeZones
ADD CONSTRAINT dv_timeZones_dateModified
  DEFAULT SYSDATETIME()
  FOR dateModified;
GO

--Default on [createdBy]
ALTER TABLE dbo.timeZones 
DROP CONSTRAINT IF EXISTS dv_timeZones_createdBy;
GO

ALTER TABLE dbo.timeZones
ADD CONSTRAINT dv_timeZones_createdBy
  DEFAULT SUSER_SNAME()
  FOR createdBy;
GO

--Default on [modifiedBy]
ALTER TABLE dbo.timeZones 
DROP CONSTRAINT IF EXISTS timeZones_modifiedBy;
GO

ALTER TABLE dbo.timeZones
ADD CONSTRAINT dv_timeZones_modifiedBy
  DEFAULT SUSER_SNAME()
  FOR modifiedBy;
GO
