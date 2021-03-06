USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getGlobalQueueByUserID]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getGlobalQueueByUserID]
(
	@UserID int
)
AS
BEGIN
  SELECT
  	GlobalQueueID, UserID, CreateDate
  FROM get_global_queue WHERE UserID = @UserID
END
GO
