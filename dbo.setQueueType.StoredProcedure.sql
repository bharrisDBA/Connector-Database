USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[setQueueType]    Script Date: 7/28/2017 10:17:13 PM ******/
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
