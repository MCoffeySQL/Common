USE Common;
GO

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
GO
  TRUNCATE TABLE dbo.holidays;

INSERT INTO dbo.holidays(
  isActive,
  [name],
  occurance
)
VALUES (1,'New Years Eve','Every 31st of December'),
  (1,'New Years Day','Every 1st of January'),
  (1,'Christmas Eve','Every 24th of December'),
  (1,'Christmas Day','Every 25th of December'),
  (1,'Memorial Day','Monday Between 25th and 31st of May'),
  (1,'Independence Day','Every July 4th'),
  (1,'Labor Day','Monday Between 1st and 7th of September'),
  (1,'Thanksgiving Day','Thursday Between 22nd and 28th of November'),
  (1,'Martin Luther King Day','Monday Between 15th and 21st day of January'),
  (1,'Washingtons Birthday','Monday Between 15th and 21st day of February'),
  (1,'Juneteenth','Every 19 of June'),
  (1,'Columbus Day','Monday Between 8th and 14th of October'),
  (1,'Veterans Day','Every 11th of November'),
  (1,'Groundhog Day','Every 2nd of February'),
  (1,'Valentines Day','Every 14th of February'),
  (1,'Saint Patricks Day','Every 17th of March'),
  (1,'April Fools Day','Every 1st of April'),
  (1,'Patriots Day','Every 15th of April'),
  (1,'Earth Day','Every 22nd of April'),
  (1,'Arbor Day','Friday Between 24th and 30th of April'),
  (1,'May Day','Every 1st of May'),
  (1,'Cinco de Mayo','Every 5th of May'),
  (1,'Mothers Day','Sunday Between 9th and 14th of May'),
  (1,'Flag Day','Every 14th of June'),
  (1,'Helen Keller Day','Every 27th of June'),
  (1,'Fathers Day','Sunday Between 15th and 21st of June'),
  (1,'Pioneer Day','Every 24th of July'),
  (1,'Womans Equality Day','Every 26th of August'),
  (1,'Halloween','Every 31st of October'),
  (1,'Black Friday','Friday Between 23rd and 29th of November'),
  (1,'Cyber Monday','Monday Between 26th of November and 1st of December'),
  (1,'Election Day','Tuesday Between 2nd and 8th of November')

--//-- New Years Eve
UPDATE dbo.dates
  SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'New Years Eve')
WHERE [month] = 12 
  AND [day] = 31

--//-- New Years Day
UPDATE dbo.dates
  SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'New Years Day')
WHERE [month] = 1
  AND [day] = 1

--//-- Christmas Eve
UPDATE dbo.dates
  SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Christmas Eve')
WHERE [month] = 12
  AND [day] = 24

--//-- Christmas Day
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Christmas Day')
WHERE [month] = 12
  AND [day] = 25

--//-- Independence Day
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Independence Day')
WHERE [month] = 7
  AND [day] = 4

--//-- Independence Day
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Juneteenth')
WHERE [month] = 6
  AND [day] = 19

--//-- Veterans Day
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Veterans Day')
WHERE [month] = 11
  AND [day] = 11

--//-- Groundhog Day
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Groundhog Day')
WHERE [month] = 2
  AND [day] = 2

--//-- Valentines Day
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Valentines Day')
WHERE [month] = 2
  AND [day] = 2

--//-- Saint Patricks Day
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Saint Patricks Day')
WHERE [month] = 3
  AND [day] = 17

--//-- April Fools Day
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'April Fools Day')
WHERE [month] = 4
  AND [day] = 1

--//-- Eath Day
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Earth Day')
WHERE [month] = 4
  AND [day] = 22

--//-- Patriots Day
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Patriots Day')
WHERE [month] = 4
  AND [day] = 15

--//-- May Day
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'May Day')
WHERE [month] = 5
  AND [day] = 1

  --//-- Cinco de Mayo
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Cinco de Mayo')
WHERE [month] = 5
  AND [day] = 5

--//-- Flag Day
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Flag Day')
WHERE [month] = 6
  AND [day] = 14

--//-- Helen Keller Day
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Helen Keller Day')
WHERE [month] = 6
  AND [day] = 27

--//-- Pioneer Day
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Pioneer Day')
WHERE [month] = 7
  AND [day] = 24

--//-- Womans Equality Day
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Womans Equality Day')
WHERE [month] = 8
  AND [day] = 26

--//-- Halloween Day
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Halloween')
WHERE [month] = 10
  AND [day] = 31

--//-- Memorial Day
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Memorial Day')
WHERE [month] = 9
  AND [day] >= 1 
  AND [day] <= 7
  AND day_week = 2

--//-- Thanksgiving Day
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Thanksgiving Day')
WHERE [month] = 11
  AND [day] >= 22 
  AND [day] <= 28
  AND day_week = 5

--//-- Martin Luther King  Day
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Martin Luther King Day')
WHERE [month] = 1
  AND [day] >= 15 
  AND [day] <= 21
  AND day_week = 2

--//-- Washingtons Birthday
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Washingtons Birthday')
WHERE [month] = 2
  AND [day] >= 15 
  AND [day] <= 21
  AND day_week = 2

--//-- Columbus Day
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Columbus Day')
WHERE [month] = 10
  AND [day] >= 8 
  AND [day] <= 14
  AND day_week = 2

--//-- Arbor Day
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Arbor Day')
WHERE [month] = 4
  AND [day] >= 24 
  AND [day] <= 30
  AND day_week = 6

--//-- Mothers Day
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Mothers Day')
WHERE [month] = 5
  AND [day] >= 9 
  AND [day] <= 14
  AND day_week = 1

--//-- Fathers Day
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Fathers Day')
WHERE [month] = 6
  AND [day] >= 15 
  AND [day] <= 21
  AND day_week = 1

--//-- Election Day
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Election Day')
WHERE [month] = 11
  AND [day] >= 2 
  AND [day] <= 8
  AND day_week = 3

--//-- Black Friday
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Black Friday')
WHERE [month] = 11
  AND [day] >= 2 
  AND [day] <= 8
  AND day_week = 3

--//-- Cyber Monday
UPDATE dbo.dates
   SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Cyber Monday')
WHERE [month] = 11
  AND [day] >= 26 
  AND [day] <= 31
  AND day_week = 2

--//-- Easter
DROP TABLE IF EXISTS #easter;

CREATE TABLE #easter (
   id INT IDENTITY(1,1) NOT NULL,
   [year] INT NOT NULL,
   easterDay DATE NULL,
   processed INT NULL
  );

INSERT INTO #easter(
  [year]
)
SELECT DISTINCT [year]
FROM dbo.dates;

UPDATE #easter
SET easterDay = dbo.calc_easterDay([year]);

SELECT * FROM #easter;

UPDATE dbo.dates
  SET holiday = (SELECT id FROM dbo.holidays WHERE [name] = 'Easter Day')
FROM dbo.dates
JOIN #easter AS easter
  ON dates.[date] = easter.easterDay

DROP TABLE IF EXISTS #easter
