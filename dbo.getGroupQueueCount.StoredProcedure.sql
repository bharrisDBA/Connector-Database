USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getGroupQueueCount]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getGroupQueueCount]
(
	@GroupID int
)
AS
BEGIN
	SELECT COUNT(*) as QueueCount FROM GroupQueue Where GroupID = @GroupID
END

GO
