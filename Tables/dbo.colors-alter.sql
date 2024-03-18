USE common;
GO

--Primary Key
ALTER TABLE dbo.colors
DROP CONSTRAINT IF EXISTS pk_colors;
GO

ALTER TABLE dbo.colors
ADD CONSTRAINT pk_colors
PRIMARY KEY CLUSTERED (id);
GO

--Unique Key (rgb_red,rgb_green,rgb_blue)
ALTER TABLE dbo.colors
DROP CONSTRAINT IF EXISTS unq_colors_red$green$blue;
GO

ALTER TABLE dbo.colors
ADD CONSTRAINT unq_colors_red$green$blue
UNIQUE(rgb_red,rgb_green,rgb_blue);
GO

--Default on [isActive]
ALTER TABLE dbo.colors 
DROP CONSTRAINT IF EXISTS dv_colors_isActive;
GO

ALTER TABLE dbo.colors
ADD CONSTRAINT dv_colors_isActive
  DEFAULT 1
  FOR isActive;
GO

--Default on [dateCreated]
ALTER TABLE dbo.colors DROP CONSTRAINT IF EXISTS dv_colors_dateCreated;
GO

ALTER TABLE dbo.colors
ADD CONSTRAINT dv_colors_dateCreated
  DEFAULT SYSDATETIME() 
  FOR dateCreated;
GO

--Default on [dateModified]
ALTER TABLE dbo.colors 
DROP CONSTRAINT IF EXISTS dv_colors_dateModified;
GO

ALTER TABLE dbo.colors
ADD CONSTRAINT dv_colors_dateModified
  DEFAULT SYSDATETIME()
  FOR dateModified;
GO

--Default on [createdBy]
ALTER TABLE dbo.colors 
DROP CONSTRAINT IF EXISTS dv_colors_createdBy;
GO

ALTER TABLE dbo.colors
ADD CONSTRAINT dv_colors_createdBy
  DEFAULT SUSER_SNAME()
  FOR createdBy;
GO

--Default on [modifiedBy]
ALTER TABLE dbo.colors 
DROP CONSTRAINT IF EXISTS dv_colors_modifiedBy;
GO

ALTER TABLE dbo.colors
ADD CONSTRAINT dv_colors_modifiedBy
  DEFAULT SUSER_SNAME()
  FOR modifiedBy;
GO