USE MassCommon;
GO

DROP TABLE IF EXISTS dbo.dates_holidays;
GO

CREATE TABLE dbo.dates_holidays(
  id INT IDENTITY(1,1) NOT NULL,
  holidayName VARCHAR(60) NOT NULL,
  isStatic BIT NOT NULL,
  staticMonth INT NULL,
  staticDay INT NULL,
  observance VARCHAR(255) 
);
GO
