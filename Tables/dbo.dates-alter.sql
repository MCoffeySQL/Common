USE MassCommon;
GO

--//-- Primary Key - Clustered
ALTER TABLE dbo.dates DROP CONSTRAINT IF EXISTS pk_dates;

ALTER TABLE dbo.dates
ADD CONSTRAINT pk_dates
PRIMARY KEY CLUSTERED (cDate);
GO

