USE Common;
GO

SET TRANSACTION ISOLATION LEVEL READ COMMITTED
SET NOCOUNT ON

DELETE 
FROM dbo.states;
GO

TRUNCATE TABLE dbo.states;
GO

INSERT INTO dbo.states(
  isActive,
  [name],
  postal
)
VALUES 
  (1,'Alabama','AL'),
  (1,'Alaska','AK'),
  (1,'Arizona','AZ'),
  (1,'Arkansas','AR'),
  (1,'California','CA'),
  (1,'Colorado','CO'),
  (1,'Connecticut','CT'),
  (1,'Delaware','DE'),
  (1,'Florida','FL'),
  (1,'Georgia','GA'),
  (1,'Hawaii','HI'),
  (1,'Idaho','ID'),
  (1,'Illinois','IL'),
  (1,'Indiana','IN'),
  (1,'Iowa','IA'),
  (1,'Kansas','KS'),
  (1,'Kentucky','KY'),
  (1,'Louisiana','LA'),
  (1,'Maine','ME'),
  (1,'Maryland','MD'),
  (1,'Massachusetts','MA'),
  (1,'Michigan','MI'),
  (1,'Minnesota','MN'),
  (1,'Mississippi','MS'),
  (1,'Missouri','MO'),
  (1,'Montana','MT'),
  (1,'Nebraska','NE'),
  (1,'Nevada','NV'),
  (1,'New Hampshire','NH'),
  (1,'New Jersey','NJ'),
  (1,'New Mexico','NM'),
  (1,'New York','NY'),
  (1,'North Carolina','NC'),
  (1,'North Dakota','ND'),
  (1,'Ohio','OH'),
  (1,'Oklahoma','OK'),
  (1,'Oregon','OR'),
  (1,'Pennsylvania','PA'),
  (1,'Rhode Island','RI'),
  (1,'South Carolina','SC'),
  (1,'South Dakota','SD'),
  (1,'Tennessee','TN'),
  (1,'Texas','TX'),
  (1,'Utah','UT'),
  (1,'Vermont','VT'),
  (1,'Virginia','VA'),
  (1,'Washington','WA'),
  (1,'West Virginia','WV'),
  (1,'Wisconsin','WI'),
  (1,'Wyoming','WY');
GO

SELECT *
FROM common.dbo.states
ORDER BY ID;
GO