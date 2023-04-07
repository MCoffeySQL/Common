
USE [massCommon];
GO

DROP PROCEDURE IF EXISTS dba.tsw08_trim;
GO

CREATE PROCEDURE dba.tsw08_trim
AS
BEGIN

  SET NOCOUNT ON

  DECLARE
    @daysToKeep INT = (365 * 2),
    @rowsToDelete INT = 10,
    @message NVARCHAR(255) 

  DROP TABLE IF EXISTS #thisTable;

  CREATE TABLE #thisTable(
    id INT IDENTITY(1,1) NOT NULL,
    [databaseName] VARCHAR(128) NOT NULL,
    [fileName] VARCHAR(255) NULL,
    [type] VARCHAR(24) NULL,
    [size] DECIMAL(18,6) NULL,
    [pass] TINYINT NULL,
    [processed] TINYINT NULL
    );
  
  INSERT INTO #thisTable(
    [databaseName],
    [fileName],
    [type],
    [size],
    [pass],
    [processed]
  )
  SELECT
    DB_NAME(database_id) AS databaseName, 
    [name] AS [fileName], 
    [type_desc] AS [type], 
    size/128.0 AS [size],
    0 AS pass,
    0 AS processed
  FROM tswdata08.sys.master_files
  WHERE database_id > 6 AND [type] IN (0,1);

  SET @message = 'Processing [TSWData08]';
  RAISERROR(@message,0,1)WITH NOWAIT;
  DROP TABLE IF EXISTS TSWData08.[dbo].[t_contract_09252018];
  DROP TABLE IF EXISTS TSWData08.[dbo].[t_Owner_20220929];
  DROP TABLE IF EXISTS TSWData08.[dbo].[SalesInvStatusTest];
  DROP TABLE IF EXISTS TSWData08.[dbo].[t_ARlineItembak061516b];
  DROP TABLE IF EXISTS TSWData08.[dbo].[t_ARlineItembak061516];

  SET @message = 'Trimming - TSWData08.dbo.ctypeAvailable';
  RAISERROR(@message,0,1)WITH NOWAIT;
  WHILE EXISTS(SELECT 1 FROM TSWData08.dbo.cTypeAvailable WHERE beginDate < DATEADD(DAY,@daysToKeep,GETDATE()))
  BEGIN  
    DELETE TOP (5000) FROM TSWData08.dbo.ctypeAvailable WHERE beginDate < DATEADD(DAY,@daysToKeep,DATEADD(DAY,@daysToKeep,GETDATE()))
  END

  SET @message = 'Trimming - TSWData08.dbo.Intf_MessageProc';
  RAISERROR(@message,0,1)WITH NOWAIT;
  WHILE EXISTS(SELECT 1 FROM TSWData08.dbo.Intf_MessageProc WHERE processTime < DATEADD(DAY,@daysToKeep,GETDATE()))
  BEGIN  
    DELETE TOP (5000) FROM TSWData08.dbo.Intf_MessageProc WHERE processTime < DATEADD(DAY,@daysToKeep,GETDATE())
  END

  SET @message = 'Trimming - TSWData08.dbo.t_ARLineItem';
  RAISERROR(@message,0,1)WITH NOWAIT;
  WHILE EXISTS(SELECT 1 FROM TSWData08.dbo.t_ARLineItem WHERE [transactionDate] < DATEADD(DAY,@daysToKeep,GETDATE()))
  BEGIN    
    DELETE TOP (5000)  FROM TSWData08.dbo.t_ARLineItem WHERE [transactionDate] < DATEADD(DAY,@daysToKeep,GETDATE())
  END

  SET @message = 'Trimming - TSWData08.dbo.cTypeAvailableNewx';
  RAISERROR(@message,0,1)WITH NOWAIT;
  WHILE EXISTS(SELECT 1 FROM TSWData08.dbo.cTypeAvailableNew WHERE [endDate] < DATEADD(DAY,@daysToKeep,GETDATE()))
  BEGIN    
    DELETE TOP (5000) FROM TSWData08.dbo.cTypeAvailableNew WHERE [endDate] < DATEADD(DAY,@daysToKeep,GETDATE())
  END

  SET @message = 'Trimming - TSWData08.dbo.cUsageDetail';
  RAISERROR(@message,0,1)WITH NOWAIT;
  WHILE EXISTS(SELECT 1 FROM TSWData08.dbo.cUsageDetail WHERE [auditDate]  < DATEADD(DAY,@daysToKeep,GETDATE()))
  BEGIN    
    DELETE TOP (5000) FROM TSWData08.dbo.cUsageDetail WHERE [auditDate]  < DATEADD(DAY,@daysToKeep,GETDATE())
  END

  --SET @message = 'Trimming - TSWData08.dbo.aggInventory';
  --RAISERROR(@message,0,1)WITH NOWAIT;
  --WHILE EXISTS(SELECT 1 FROM TSWData08.dbo.aggInventory WHERE [iDate]  < DATEADD(DAY,@daysToKeep,GETDATE()))
  --BEGIN    
  --  DELETE SELECT * FROM TSWData08.dbo.aggInventory WHERE usageDetailID IN (SELECT TOP (@rowsToDelete) usageDetailID AS id FROM TSWData08.dbo.aggInventory WHERE [iDate]  < DATEADD(DAY,@daysToKeep,GETDATE()));
  --END

  SET @message = 'Trimming - TSWData08.dbo.roomEvents';
  RAISERROR(@message,0,1)WITH NOWAIT;
  WHILE EXISTS(SELECT 1 FROM TSWData08.dbo.roomEvents WHERE [Date]  < DATEADD(DAY,@daysToKeep,GETDATE()))
  BEGIN    
    DELETE TOP (5000) FROM TSWData08.dbo.roomEvents WHERE [Date]  < DATEADD(DAY,@daysToKeep,GETDATE())
  END
END
