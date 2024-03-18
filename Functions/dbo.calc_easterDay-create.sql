USE Common;
GO

DROP FUNCTION IF EXISTS dbo.calc_easterDay;
GO

CREATE OR ALTER FUNCTION dbo.calc_easterDay
(
    @pYear SMALLINT
)
RETURNS DATE
AS
BEGIN
    /* Declare Variables used */
  DECLARE 
   -- @pYear INT = 2020,
    @a TINYINT,
    @b TINYINT,
    @c TINYINT,
    @d TINYINT,
    @e TINYINT,
    @f TINYINT,
    @g TINYINT,
    @h TINYINT,
    @i TINYINT,
    @k TINYINT,
    @l TINYINT,
    @m TINYINT,
    @date DATE;
  
  /* Calculation steps */
    SET @a = @pYear % 19
    SET @b = FLOOR(1.0 * @pYear / 100)
    SET @c = @pYear % 100;
    SET @d = FLOOR(1.0 * @b / 4)
    SET @e = @b % 4
    SET @f = FLOOR((8.0 + @b) / 25);
    SET @g = FLOOR((1.0 + @b - @f) / 3);
    SET @h = (19 * @a + @b - @d - @g + 15) % 30
    SET @i = FLOOR(1.0 * @c / 4)
    SET @k = @pYear % 4;
    SET @l = (32.0 + 2 * @e+ 2 * @i - @h - @k) % 7;
    SET @m = FLOOR((1.0 * @a + 11 * @h + 22 * @l) / 451);
    SET @date = DATEADD(dd, (@h + @l - 7 * @m + 114) % 31, 
      DATEADD(mm, FLOOR((1.0 * @h + @l - 7 * @m + 114) / 31) - 1, 
      DATEADD(yy, @pYear - 2000, {d '2000-01-01' })));

    /* Return the output date*/
    RETURN  @date;
END;
GO