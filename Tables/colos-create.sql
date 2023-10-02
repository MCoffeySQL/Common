USE common;
GO

DROP TABLE IF EXISTS colors;
GO

CREATE TABLE colors(
  id INT IDENTITY(1,1) NOT NULL,
  colorName VARCHAR(60) NOT NULL,
  hex VARCHAR(7) NULL,
  rgb_red INT NOT NULL,
  rgb_green INT NOT NULL,
  rgb_blue INT NOT NULL,
  shortDescription VARCHAR(255) NULL,
  dateCreated DATETIME NOT NULL,
  dateModified DATETIME NOT NULL,
  createdBy VARCHAR(60) NOT NULL,
  modifiedBy VARCHAR(60) NOT NULL
);
GO
