USE common;
GO

SET NOCOUNT ON
SET STATISTICS IO OFF
SET STATISTICS TIME OFF

SET DATEFIRST 7 -- Sunday will be first day of week.

DECLARE
  @i INT = 0,
  @d INT = 1,
  @startDate DATE = CAST('03/01/1873' AS DATE),
  @endDate DATE = CAST('03/01/2173' AS DATE),
  @aDate DATE


WHILE DATEADD(DAY,@i,@startDate) >= @startDate 
  AND DATEADD(DAY,@i,@startDate) <= @endDate
BEGIN
  
  INSERT INTO dbo.dates(
    aDate,
    aDay,
    aMonth,
    aYear,
    dDay,
    monthShortName,
    monthFullName,
    dayShortName,
    dayFullName,
    quarter_year,
    day_week,
    day_year,
    week_month,
    week_year,
    isWeekend,
    isHoliday,
    epochDate,
    suffixShort,
    shortDescription,
    dateCreated,
    dateModified,
    createdBy,
    modifiedBy
  )
  SELECT
    DATEADD(DAY,@i,@startDate) AS aDate,
    DAY(DATEADD(DAY,@i,@startDate)) AS aDay,
    MONTH(DATEADD(DAY,@i,@startDate)) AS aMonth,
    YEAR(DATEADD(DAY,@i,@startDate)) AS aYear,
    CASE
      WHEN DATEADD(DAY,@i,@startDate) >= CAST('3/2/2020' AS DATE)
      THEN @d
      ELSE 0
    END AS dDay,
    LEFT(DATENAME(MONTH,MONTH(DATEADD(DAY,@i,@startDate))),3) AS monthShortName,
    DATENAME(MONTH,MONTH(DATEADD(DAY,@i,@startDate))) AS monthLongName,
    LEFT(DATENAME(MONTH,DAY(DATEADD(DAY,@i,@startDate))),3) AS dayShortName,
    DATENAME(MONTH,DAY(DATEADD(DAY,@i,@startDate))) AS dayLongName,
    DATEPART(QUARTER,DATEADD(DAY,@i,@startDate)) AS quarter_year,
    DATEPART(DAY,DATEADD(DAY,@i,@startDate)) AS day_week,
    DATEPART(DAYOFYEAR,DATEADD(DAY,@i,@startDate)) AS day_year,
    1,
    DATEPART(ISO_WEEK,DATEADD(DAY,@i,@startDate)) AS week_year,
    CASE
      WHEN DAY(DATEADD(DAY,@i,@startDate)) IN (1,7)
      THEN 1
      ELSE 0
    END AS isWeekend,
    9 AS isHoliday,
    NULL,--DATEDIFF(SECOND,CAST('1/1/1970' AS DATETIME),DATEADD(DAY,@i,@startDate)) AS epochDate,
    CASE
      WHEN LEFT(DATEPART(DAY,DATEADD(DAY,@i,@startDate)),1) = 1 AND LEFT(DATEPART(DAY,DATEADD(DAY,@i,@startDate)),2) != 11
      THEN 'st'
      WHEN LEFT(DATEPART(DAY,DATEADD(DAY,@i,@startDate)),1) = 2 
      THEN 'nd'
      WHEN LEFT(DATEPART(DAY,DATEADD(DAY,@i,@startDate)),1) = 3
      THEN 'rd'
      ELSE 'th'
    END AS suffixShort,
    'Initial Import [' + CAST(@i AS VARCHAR) + ']' AS shortDescription,
    GETDATE(),
    GETDATE(),
    'System',
    'System';

  IF DATEADD(DAY,@i,@startDate) >= CAST('3/2/2020' AS DATE)
    SET @d += 1;

  SET @i += 1;

  ;

END
