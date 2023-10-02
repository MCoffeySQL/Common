USE common;
GO

DROP TABLE IF EXISTS dbo.dates;
GO

CREATE TABLE dates(
  aDate DATE NOT NULL,
  aYear INT NOT NULL,
  aMonth INT NOT NULL,
  aDay INT NOT NULL,
  dDay INT NOT NULL,
  monthShortName VARCHAR(3) NOT NULL,
  monthFullName VARCHAR(12) NOT NULL,
  dayShortName VARCHAR(3) NOT NULL,
  dayFullName VARCHAR(12) NOT NULL,
  quarter_year INT NOT NULL,
  day_week INT NOT NULL,
  day_year INT NOT NULL,
  week_month INT NOT NULL,
  week_year INT NOT NULL,
  isWeekend BIT NOT NULL,
  isHoliday BIT NULL,
  epochDate BIGINT NULL,
  suffixShort VARCHAR(2) NULL,
  shortDescription VARCHAR(255) NULL,
  dateCreated DATETIME NOT NULL,
  dateModified DATETIME NOT NULL,
  createdBy VARCHAR(60) NOT NULL,
  modifiedBy VARCHAR(60) NOT NULL
);
GO

