USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getGroupQueueCount]    Script Date: 7/28/2017 10:17:13 PM ******/
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
