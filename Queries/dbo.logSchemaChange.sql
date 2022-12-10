USE [Master]
GO

--Enable Service Broker in selected Database
DECLARE 
  @databaseName NVARCHAR(128) = 'Common',
  @sqlStr NVARCHAR(4000),
  @message NVARCHAR(255)

--IF(SELECT [is_broker_enabled] FROM sys.databases WHERE [name] = @databaseName) = 0
  BEGIN
    SET @message = 'Enabling Service Broker in Database [' + @databaseName + ']'
    RAISERROR(@message,0,1)WITH NOWAIT;

    SET @sqlStr = 'ALTER DATABASE [' + @databaseName + '] SET ENABLE_BROKER'; 
    EXEC (@sqlStr);

    IF @@ERROR = 0
      RAISERROR('..Success',0,1)WITH NOWAIT;
  ELSE
    RAISERROR('Service Broker Already Exists',0,1) WITH NOWAIT;
  END

--Create a message Queue
USE [Common] 

CREATE QUEUE dbo.EventNotificationQueue;

--Create the Service
SET @sqlStr = 'CREATE SERVICE [//' + @databaseName + '/EventNotificationService] 
ON QUEUE dbo.EventNotificationQueue 
  ([http://schemas.microsoft.com/SQL/Notifications/PostEventNotification]);'

EXEC (@sqlStr);

--Create the Notification
SET @sqlStr = 'CREATE EVENT NOTIFICATION NotifyDDLEvents 
ON DATABASE 
FOR DDL_DATABASE_LEVEL_EVENTS 
TO SERVICE ''' + '//' + @databaseName + '/' + 'EventNotificationService'' ,''current database;'''

EXEC (@sqlStr);



--Select From Queue
USE [Common];
SELECT CAST(message_body AS XML) AS message_in_xml 
FROM dbo.EventNotificationQueue; 

--Retrieve Message From Queue
DECLARE @MessageContent XML; 
WAITFOR( 
  RECEIVE TOP(1) 
    @MessageContent = CONVERT(XML, message_body)
  FROM dbo.EventNotificationQueue 
), TIMEOUT 1000; 
SELECT 
@MessageContent.value('(/EVENT_INSTANCE/EventType)[1]', 'varchar(128)' ) as EventType,
@MessageContent.value('(/EVENT_INSTANCE/PostTime)[1]', 'varchar(128)' ) as PostTime,
@MessageContent.value('(/EVENT_INSTANCE/SPID)[1]', 'int' ) as SPID, 
@MessageContent.value('(/EVENT_INSTANCE/ServerName)[1]', 'varchar(128)' ) as ServerName, 
@MessageContent.value('(/EVENT_INSTANCE/DatabaseName)[1]', 'varchar(128)' ) as DatabaseName, 
@MessageContent.value('(/EVENT_INSTANCE/LoginName)[1]', 'varchar(128)' ) as LoginName, 
@MessageContent.value('(/EVENT_INSTANCE/SchemaName)[1]', 'varchar(128)' ) as SchemaName, 
@MessageContent.value('(/EVENT_INSTANCE/ObjectName)[1]', 'varchar(128)' ) as ObjectName,
@MessageContent.value('(/EVENT_INSTANCE/ObjectType)[1]', 'varchar(128)' ) as ObjectType,
@MessageContent.value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]','nvarchar(max)') AS TSQLCommand

--Create the storage Table
DROP TABLE IF EXISTS dbo.databaseLogs;

CREATE TABLE dbo.databaseLogs(
  Id INT IDENTITY(1,1) NOT NULL,
  [DateTime] DATETIME NOT NULL,
  serverName VARCHAR(128) NULL,
  serviceName VARCHAR(128) NULL,
  spid INT NULL,
  sourceHostName VARCHAR(128) NULL,
  loginName VARCHAR(128) NULL,
  userName VARCHAR(128) NULL,
  schemaName VARCHAR(128) NULL,
  objectName VARCHAR(128) NULL,
  targetObjectName VARCHAR(128) NULL,
  eventType VARCHAR(128) NULL,
  objectType VARCHAR(128) NULL,
  targetObjectType VARCHAR(128) NULL,
  [eventData] XML NULL,
  CONSTRAINT [PK_DatabaseLogs] PRIMARY KEY CLUSTERED ( [Id] ASC ) 
)
GO

ALTER TABLE dbo.databaseLogs
ADD CONSTRAINT pk_databaseLogs
PRIMARY KEY CLUSTERED (id);

ALTER TABLE dbo.databaseLogs
ADD CONSTRAINT dv_databaseLogs$dateTime
DEFAULT GETDATE()
FOR [dateTime];

CREATE NONCLUSTERED INDEX nix_DatabaseLogs 
  ON dbo.databaseLogs ([DateTime] ASC) INCLUDE(ID);


--Stored Procedure
DROP PROCEDURE IF EXISTS dbo.eventNotification_Activation;
GO

CREATE OR ALTER PROCEDURE dbo.eventNotification_Activation
AS
BEGIN
  SET NOCOUNT ON;
 
  DECLARE 
    @messageContent XML,
    @messageTypeName NVARCHAR(128);
 
  WHILE (1=1)
  BEGIN
    BEGIN TRANSACTION;
    WAITFOR(
      RECEIVE TOP (1)
        @messageContent = CAST(message_body AS XML),
        @messageTypeName = message_type_name
      FROM dbo.EventNotificationQueue 
      ), TIMEOUT 5000;
 
      IF (@@ROWCOUNT = 0)
      BEGIN
        ROLLBACK TRANSACTION;
        BREAK;
      END
 
      IF @messageTypeName = N'http://schemas.microsoft.com/SQL/Notifications/EventNotification'
      BEGIN
        BEGIN TRY
          INSERT dbo.DatabaseLogs (
            [dateTime],
            serverName,
            serviceName,
            spid,
            sourceHostName,
            loginName,
            userName,
            schemaName,
            objectName,
            targetObjectName,
            eventType,
            objectType,
            targetObjectType,
            [eventData]
          )
          VALUES (
            @messageContent.value('(/EVENT_INSTANCE/PostTime)[1]','varchar(128)'),
            @@SERVERNAME,
            @@SERVICENAME,
            @messageContent.value('(/EVENT_INSTANCE/SPID)[1]','int'),
            HOST_NAME(),
            @messageContent.value('(/EVENT_INSTANCE/LoginName)[1]','varchar(128)'),
            @messageContent.value('(/EVENT_INSTANCE/UserName)[1]','varchar(128)'),
            @messageContent.value('(/EVENT_INSTANCE/SchemaName)[1]','varchar(128)'),
            @messageContent.value('(/EVENT_INSTANCE/ObjectName)[1]', 'nvarchar(128)'),
            @messageContent.value('(/EVENT_INSTANCE/TargetObjectName)[1]','nvarchar(128)'),
            @messageContent.value('(/EVENT_INSTANCE/EventType)[1]','nvarchar(128)'),
            @messageContent.value('(/EVENT_INSTANCE/ObjectType)[1]','nvarchar(128)'),
            @messageContent.value('(/EVENT_INSTANCE/TargetObjectType)[1]','nvarchar(128)'),
            @messageContent
            );
        END TRY
        BEGIN CATCH
         SET @messageContent= NULL;
        END CATCH
      END;
        COMMIT TRANSACTION;
    END
END;


--Add Procedure to Queue
ALTER QUEUE dbo.EventNotificationQueue  
WITH ACTIVATION ( 
  STATUS = ON,
  MAX_QUEUE_READERS = 10,
  PROCEDURE_NAME = dbo.eventNotification_Activation,  
  EXECUTE AS SELF) ; 
GO
