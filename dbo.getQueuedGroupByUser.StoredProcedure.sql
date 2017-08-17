USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getQueuedGroupByUser]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getQueuedGroupByUser]
(
	@UserID int
)
AS
BEGIN
	SELECT GroupID As QueuedGroup
	FROM GroupQueue
	WHERE UserID = @UserID
END

GO
