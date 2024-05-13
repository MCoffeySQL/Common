USE Common;
GO

DROP TABLE IF EXISTS dbo.people;
GO

CREATE TABLE dbo.people(
  id INT IDENTITY(1,1) NOT NULL,
  isActive TINYINT NULL,
  nameFirst VARCHAR(64) NULL,
  nameLast VARCHAR(64) NULL,
  gender VARCHAR(2) NULL,
  streetAddress VARCHAR(128) NULL,
  city VARCHAR(64) NULL,
  [state] VARCHAR(2) NULL,
  zipCode INT NULL,
  telephone VARCHAR(15) NULL,
  email VARCHAR(64) NULL,
  ssn VARCHAR(12) NULL,
  cardNumber VARCHAR(16) NULL,
  shortDescription VARCHAR(255) NULL,
  dateCreated DATETIME NULL,
  dateModified DATETIME NULL,
  createdBy VARCHAR(64) NULL,
  modifiedBy VARCHAR(64) NULL
);
GO