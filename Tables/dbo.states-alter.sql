USE Common;
GO

--Primary Key [ID]
ALTER TABLE dbo.states DROP CONSTRAINT IF EXISTS pk_states;
GO

ALTER TABLE dbo.states 
  ADD CONSTRAINT pk_states 
  PRIMARY KEY CLUSTERED (id);
GO

--Unique [stateAbbr]
ALTER TABLE dbo.states DROP CONSTRAINT IF EXISTS unk_states_stateAbbr;
GO

ALTER TABLE dbo.states
  ADD CONSTRAINT unk_states_stateAbbr
  UNIQUE (stateAbbr);
GO

--Default on [isActive]
ALTER TABLE dbo.states DROP CONSTRAINT IF EXISTS dv_states_isActive;
GO

ALTER TABLE dbo.states 
ADD CONSTRAINT dv_states_isActive
  DEFAULT 1
  FOR isActive;
GO

--Default on [dateCreated]
ALTER TABLE dbo.states DROP CONSTRAINT IF EXISTS dv_states_dateCreated;
GO

ALTER TABLE dbo.states
ADD CONSTRAINT dv_states_dateCreated
  DEFAULT SYSDATETIME() 
  FOR dateCreated;
GO

--Default on [dateModified]
ALTER TABLE dbo.states DROP CONSTRAINT IF EXISTS dv_states_dateModified;
GO

ALTER TABLE dbo.states
ADD CONSTRAINT dv_states_dateModified
  DEFAULT SYSDATETIME()
  FOR dateModified;
GO

--Default on [createdBy]
ALTER TABLE dbo.states DROP CONSTRAINT IF EXISTS dv_states_createdBy;
GO

ALTER TABLE dbo.states
ADD CONSTRAINT dv_states_createdBy
  DEFAULT SUSER_SNAME()
  FOR createdBy;
GO

--Default on [modifiedBy]
ALTER TABLE dbo.states DROP CONSTRAINT IF EXISTS dv_states_modifiedBy;
GO

ALTER TABLE dbo.states
ADD CONSTRAINT dv_states_modifiedBy
  DEFAULT SUSER_SNAME()
  FOR modifiedBy;
GO
