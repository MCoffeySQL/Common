USE massCommon;
GO

-- TRUNCATE TABLE dbo.dates

SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
SET NOCOUNT ON
SET STATISTICS IO OFF
SET STATISTICS TIME OFF

DECLARE
  @minDate DATE = CAST('1/1/1980' AS DATE),
	@maxDate DATE = CAST('1/1/2300' AS DATE),
	@iDate DATE,
	@ichinese INT,
	@iCount INT = 0

SET @iDate = @minDate;

WHILE @iDate >= @minDate
	AND @iDate <= @maxDate
BEGIN
  SET @ichinese = YEAR(@idate) % 12;

  INSERT INTO massCommon.dbo.dates(
		serialDate,
		dateType01,
		dateType02,
		dateType03,
		dateType04,
		dateType09,
		intYear,
		intMonth,
		intDay,
		charYear ,
		charMonth,
		charDay,
		monthNameFull,
		monthNameShort,
		dayNameFull,
		dayNameShort,
		dayLetter,
		quarterNumber,
		weekNumberofYear,
		weekNumberofYear_iso,
		--epochDate ,
		dayNumberofWeek,
		dayNumberofYear,
		isWeekend,
		isHoliday,
		astrologicalSign,
		chineseYear,
		moonPhase
	)
	SELECT
	  CAST(CAST(YEAR(@iDate) AS VARCHAR) + 
			RIGHT('0' + CAST(MONTH(@iDate) AS VARCHAR),2) + 
			RIGHT('0' + CAST(DAY(@iDate) AS VARCHAR),2) AS INT) AS SerialDate,
		CAST(YEAR(@iDate) AS VARCHAR) + '-' + 
			RIGHT('0' + CAST(MONTH(@iDate) AS VARCHAR),2) + '-' + 
			RIGHT('0' + CAST(DAY(@iDate) AS VARCHAR),2) AS DateType01,
		RIGHT('0' + CAST(MONTH(@iDate) AS VARCHAR),2) + '/' +  
			RIGHT('0' + CAST(DAY(@iDate) AS VARCHAR),2) + '/' + 
			CAST(YEAR(@iDate) AS VARCHAR) AS DateType02,
		RIGHT('0' + CAST(MONTH(@iDate) AS VARCHAR),2) + '/' + 
			CAST(YEAR(@iDate) AS VARCHAR) AS DateType03,
		NULL AS DateType04,
		NULL AS DateType99,
		YEAR(@iDate) AS IntYear,
		MONTH(@iDate) AS IntMonth,
		DAY(@iDate) AS IntDay,
		CAST(YEAR(@iDate) AS VARCHAR) AS CharYear,
		RIGHT('0' + CAST(MONTH(@iDate) AS VARCHAR),2) AS CharMonth,
		RIGHT('0' + CAST(DAY(@iDate) AS VARCHAR),2) AS CharDay,
		DATENAME(MONTH,DATEADD(MONTH,MONTH(@iDate),-1)) AS MonthNameFull,
		LEFT(DATENAME(MONTH,DATEADD(MONTH,MONTH(@iDate),-1)),3) AS MonthNameShort,
		DATENAME(DW,@idate) AS DayNameFull,
		LEFT(DATENAME(DW,@idate),3) AS DayNameShort,
		LEFT(DATENAME(DW,@idate),1) AS DayNameLetter, 
		DATEPART(QUARTER,@idate) AS Quarter,
		DATEPART(WEEK,@idate) AS WeekNumberofYear,
		DATEPART(ISO_WEEK,@idate) AS WeekNumberofYear_Iso,		
		--DATEDIFF(SECOND,'1/1/1970',@idate) AS Epoch,
		DATEPART(WEEKDAY,@idate) AS DayNumberofWeek,
		DATEPART(DAYOFYEAR,GETDATE()) AS DayNumberofYear,
		CASE
		  WHEN DATEPART(WEEKDAY,@iDate) IN(1,7)
			THEN 1
			ELSE 0
		END AS isWeekend,
	  NULL AS isHoliday,  --isHoliday
		NULL AS AstrologicalSign,
		CASE
			WHEN @ichinese = 0 THEN 'Monkey'
		  WHEN @ichinese = 1 THEN 'Rooster'
			WHEN @ichinese = 2 THEN 'Dog'
			WHEN @ichinese = 3 THEN 'Pig'
			WHEN @ichinese = 4 THEN 'Rat'
			WHEN @ichinese = 5 THEN 'Ox'
			WHEN @ichinese = 6 THEN 'Tiger'
			WHEN @ichinese = 7 THEN 'Rabbit'
			WHEN @ichinese = 8 THEN 'Dragon'
			WHEN @ichinese = 9 THEN 'Snake'
			WHEN @ichinese = 10 THEN 'Horse'
			WHEN @ichinese = 11 THEN 'Sheep'
		  ELSE NULL
		END AS ChineseYear,
		NULL AS MoonPhase;

		SET @iDate = DATEADD(DAY,1,@iDate);

END	
