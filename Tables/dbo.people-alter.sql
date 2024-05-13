USE Common;
GO

--Primary Key
ALTER TABLE dbo.people
DROP CONSTRAINT IF EXISTS pk_people;
GO

ALTER TABLE dbo.people
ADD CONSTRAINT pk_people
PRIMARY KEY CLUSTERED (id);
GO

--Default on [isActive]
ALTER TABLE dbo.people 
DROP CONSTRAINT IF EXISTS dv_people_isActive;
GO

ALTER TABLE dbo.people
ADD CONSTRAINT dv_people_isActive
  DEFAULT 1
  FOR isActive;
GO

--Default on [dateCreated]
ALTER TABLE dbo.people 
DROP CONSTRAINT IF EXISTS dv_people_dateCreated;
GO

ALTER TABLE dbo.people
ADD CONSTRAINT dv_people_dateCreated
  DEFAULT SYSDATETIME() 
  FOR dateCreated;
GO

--Default on [dateModified]
ALTER TABLE dbo.people 
DROP CONSTRAINT IF EXISTS dv_people_dateModified;
GO

ALTER TABLE dbo.people
ADD CONSTRAINT dv_people_dateModified
  DEFAULT SYSDATETIME()
  FOR dateModified;
GO

--Default on [createdBy]
ALTER TABLE dbo.people 
DROP CONSTRAINT IF EXISTS dv_people_createdBy;
GO

ALTER TABLE dbo.people
ADD CONSTRAINT dv_people_createdBy
  DEFAULT SUSER_SNAME()
  FOR createdBy;
GO

--Default on [modifiedBy]
ALTER TABLE dbo.people 
DROP CONSTRAINT IF EXISTS dv_people_modifiedBy;
GO

ALTER TABLE dbo.people
ADD CONSTRAINT dv_people_modifiedBy
  DEFAULT SUSER_SNAME()
  FOR modifiedBy;
GO
