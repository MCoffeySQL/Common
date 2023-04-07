USE [MassCommon]
GO

/****** Object:  StoredProcedure [dba].[tsw08_changeSchemaOwner]    Script Date: 1/2/2023 11:05:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dba].[tsw08_changeSchemaOwner]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dba].[tsw08_changeSchemaOwner] AS' 
END
GO


ALTER   PROCEDURE [dba].[tsw08_changeSchemaOwner]
AS
BEGIN

  DECLARE 
    @sqlStr AS NVARCHAR(4000)

  SET @sqlStr = 'USE tswdata08;'
  SET @sqlSTr = @sqlStr + 'ALTER AUTHORIZATION ON SCHEMA::db_datareader TO db_datareader;'
  SET @sqlStr = @sqlStr + 'ALTER AUTHORIZATION ON SCHEMA::db_datawriter TO db_datawriter;'

  EXEC (@sqlStr)
END
GO


