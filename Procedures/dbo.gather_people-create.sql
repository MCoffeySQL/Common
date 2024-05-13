USE Common;
GO

DROP PROCEDURE IF EXISTS dbo.gather_people;
GO

CREATE OR ALTER PROCEDURE dbo.gather_people
AS
BEGIN
  TRUNCATE TABLE dbo.people;

  INSERT INTO dbo.people(
    isActive,
    nameFirst,
    nameLast,
    gender,
    streetAddress,
    city,
    [state],
    zipCode,
    telephone,
    email,
    ssn,
    cardNumber
  )
  SELECT 
    1 AS isActive,
    nameFirst,
    nameLast,
    gender,
    streetAddress,
    city,
    [state],
    zip,
    telephone,
    email,
    ssn,
    cardNumber
  FROM dbo.stage_people;
END
