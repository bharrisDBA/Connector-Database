USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[queueTemp]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[queueTemp] (
	@QueueType int, 
	@InquirerID int,
	@QueueDate datetime, 
	@TeamID int = NULL, 
	@GroupID int,
	@ConnectorID int = NULL,
	@Comments nvarchar(max) = NULL
) 
AS DECLARE 	
	@count int  	
	SELECT @count = 0 	SELECT @count = COUNT(*) FROM TempQueue WHERE InquirerID = @InquirerID 
IF (@count = 0) 
BEGIN 
INSERT INTO TempQueue 
( 	
	Type, 	
	InquirerID, 	
	QueueDate, 	
	GroupID,
	TeamID, 	
	ConnectorID,
	Comments
) VALUES 
( 	
	@QueueType, 	
	@InquirerID, 	
	@QueueDate,
	@GroupID,
	@TeamID, 	
	@ConnectorID,
	@Comments
) END
GO
