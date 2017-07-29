USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[setQueueDateForUser]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[setQueueDateForUser] ( @UserID int, @QueueDate DateTime) AS DECLARE @count int SELECT @count = 0 SELECT @count = COUNT(*) FROM GroupQueue WHERE UserID = @UserID IF (@Count > 0) BEGIN UPDATE GroupQueue SET CreateDate = @QueueDate Where UserID = @UserID END ELSE UPDATE GlobalQueue SET CreateDate = @QueueDate WHERE UserID = @UserID
GO
