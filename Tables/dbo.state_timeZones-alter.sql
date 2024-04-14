USE Common;
GO

--Primary Key
ALTER TABLE dbo.state_timeZones
DROP CONSTRAINT IF EXISTS pk_state_timeZones;
GO

ALTER TABLE dbo.state_timeZones
ADD CONSTRAINT pk_state_timeZones
PRIMARY KEY CLUSTERED (id);
GO

--Default on [isActive]
ALTER TABLE dbo.state_timeZones 
DROP CONSTRAINT IF EXISTS dv_state_timeZones_isActive;
GO

ALTER TABLE dbo.state_timeZones
ADD CONSTRAINT dv_state_timeZones_isActive
  DEFAULT 1
  FOR isActive;
GO

----//--Foreign Key [postal]
--ALTER TABLE dbo.state_timeZones 
--DROP CONSTRAINT IF EXISTS fk_state_timeZones#postal;
--GO

--ALTER TABLE dbo.state_timeZones
--ADD CONSTRAINT fk_state_timeZones#postal
--  FOREIGN KEY ([postal])
--  REFERENCES dbo.states([postal])
--  ON DELETE CASCADE
--GO

----//--Foreign Key [zone]
--ALTER TABLE dbo.state_timeZones 
--DROP CONSTRAINT IF EXISTS fk_state_timeZones#zone;
--GO

--ALTER TABLE dbo.state_timeZones
--ADD CONSTRAINT fk_state_timeZones#zone
--  FOREIGN KEY ([zone])
--  REFERENCES dbo.timeZones(zone)
--  ON DELETE CASCADE
--GO
--Default on [dateModified]
ALTER TABLE dbo.state_timeZones 
DROP CONSTRAINT IF EXISTS dv_state_timeZones_dateModified;
GO

ALTER TABLE dbo.state_timeZones
ADD CONSTRAINT dv_state_timeZones_dateModified
  DEFAULT SYSDATETIME()
  FOR dateModified;
GO

--Default on [createdBy]
ALTER TABLE dbo.state_timeZones 
DROP CONSTRAINT IF EXISTS dv_state_timeZones_createdBy;
GO

ALTER TABLE dbo.state_timeZones
ADD CONSTRAINT dv_state_timeZones_createdBy
  DEFAULT SUSER_SNAME()
  FOR createdBy;
GO

--Default on [modifiedBy]
ALTER TABLE dbo.state_timeZones 
DROP CONSTRAINT IF EXISTS dv_state_timeZones_modifiedBy;
GO

ALTER TABLE dbo.state_timeZones
ADD CONSTRAINT dv_state_timeZones_modifiedBy
  DEFAULT SUSER_SNAME()
  FOR modifiedBy;
GO
