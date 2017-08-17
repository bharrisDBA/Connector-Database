USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getGlobalQueueByID]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getGlobalQueueByID]
(
	@GlobalQueueID int
)
AS
BEGIN
  SELECT
  	GlobalQueueID, UserID, CreateDate
  FROM get_global_queue WHERE GlobalQueueID = @GlobalQueueID
END
GO
