USE Common;
GO

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON;
GO
  TRUNCATE TABLE dbo.dates;

  DECLARE 
    @date DATE,
    @minDate DATE = '1/1/1900',
    @maxDate DATE = '1/1/2050'

  SET @date = @minDate

  WHILE @date >= @minDate
    AND @date < @maxDate
  BEGIN
    INSERT INTO dbo.dates(
      isActive,
      [date],
      [year],
      [month],
      [day],
      dDay,
      monthShortName,
      monthFullName,
      dayShortName,
      dayFullName,
      [quarter],
      day_week,
      day_year,
      week_month,
      week_year,
      isWeekend,
      isHoliday,
      epochDate,
      suffixShort,
      shortDescription
    )
    SELECT
      1 AS isActive,
      @date AS [date],
      YEAR(@date) AS [year],
      MONTH(@date) AS [month],
      DAY(@date) AS [day],
      CASE 
        WHEN @date < CAST('3/1/2020' AS DATE) 
        THEN 0
        ELSE DATEDIFF(DAY,CAST('3/2/2020' AS DATE),@Date)
      END AS dDay,
      LEFT(DATENAME(MONTH,@date), 3) AS monthShortName,
      DATENAME(MONTH,@date) AS monthFullName,
      LEFT(DATENAME(WEEKDAY,@date), 3) AS dayShortName,
      DATENAME(WEEKDAY,@date) AS dayFullName,
      DATEPART(QUARTER,@date) AS [quarter],
      DATEPART(WEEKDAY,@date) AS day_week,
      DATENAME(DAYOFYEAR,@date) AS day_year,
      DATEPART(WEEK, @date) - DATEPART(WEEK, DATEADD(MONTH, DATEDIFF(MONTH, 0, @date),0))+1 AS week_month,
      DATENAME(WEEK,@date) AS week_year,
      CASE
        WHEN DATEPART(WEEKDAY,@date) IN (1,7) 
        THEN 1
        ELSE 0
      END AS isWeekend,
      NULL AS isHoliday,
      NULL AS epochTime, --CAST(DATEDIFF(SECOND,CAST('1/1/1970' AS DATE),@date) AS BIGINT)
      NULL AS suffixShort,
      NULL AS shortDescription
    SET @date = DATEADD(DAY,1,@date)
END
  GO