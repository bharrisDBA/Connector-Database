USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[setQueueType]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[setQueueType] 
( 
	@InquirerID int, 
	@QueueType int 
) 
AS 
BEGIN
UPDATE TempQueue SET Type = @QueueType, DateInserted = getdate() WHERE InquirerID = @InquirerID 
END
GO
