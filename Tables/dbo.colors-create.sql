USE common;
GO

DROP TABLE IF EXISTS colors;
GO

CREATE TABLE colors(
  id INT IDENTITY(1,1) NOT NULL,
  isActive INT NOT NULL,
  colorName VARCHAR(60) NOT NULL,
  hex VARCHAR(7) NULL,
  rgb_red INT NOT NULL,
  rgb_green INT NOT NULL,
  rgb_blue INT NOT NULL,
  cymk_cyan INT NULL,
  cymk_magenta INT NULL,
  cymk_yellow INT NULL,
  cymk_key INT NULL,
  hsb_hue INT NULL,
  hsb_saturation INT NULL,
  hsb_brightness INT NULL,
  hsl_hue INT NULL,
  hsl_saturation INT NULL,
  hsl_light INT NULL,
  lch_lightness INT NULL,
  lch_chroma INT NULL,
  lch_hue INT NULL,
  hwb_hue INT NULL,
  hwb_whiteness INT NULL,
  hwb_blackness INT NULL,
  shortDescription VARCHAR(255) NULL,
  dateCreated DATETIME NOT NULL,
  dateModified DATETIME NOT NULL,
  createdBy VARCHAR(60) NOT NULL,
  modifiedBy VARCHAR(60) NOT NULL
);
GO
