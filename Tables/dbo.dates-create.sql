USE MAssCommon;
GO

DROP TABLE IF EXISTS dbo.dates;
GO

CREATE TABLE dbo.dates(
  SerialDate INT NOT NULL,
	DateType01 VARCHAR(24) NOT NULL,
	DateType02 VARCHAR(24) NOT NULL,
	DateType03 VARCHAR(24) NULL,
	DateType04 VARCHAR(24) NULL,
	DateType09 INT NULL,
	intYear INT NOT NULL,
	intMonth INT NOT NULL,
	intDay INT NOT NULL,
	charYear VARCHAR(8) NOT NULL,
	charMonth VARCHAR(8) NOT NULL,
	charDay VARCHAR(8) NOT NULL,
	monthNameFull VARCHAR(24) NOT NULL,
	monthNameShort VARCHAR(8) NOT NULL,
	dayNameFull VARCHAR(24) NOT NULL,
	dayNameShort VARCHAR(8) NOT NULL,
	dayLetter VARCHAR(8) NOT NULL,
	quarterNumber TINYINT NULL,
	weekNumberofYear INT NULL,
	weekNumberofYear_iso INT NULL,
	epochDate INT NULL,
	dayNumberofWeek TINYINT NULL,
	dayNumberofYear INT NULL,
	isWeekend BIT,
	isHoliday INT,
	astrologicalSign VARCHAR(24) NULL,
	chineseYear VARCHAR(24) NULL,
	moonPhase VARCHAR(24) NULL
);
GO