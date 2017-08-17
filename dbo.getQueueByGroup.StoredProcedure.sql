USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getQueueByGroup]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getQueueByGroup]
(
	@GroupID int
)
AS
BEGIN
  SELECT
  	GroupQueueID, GroupID, UserID, CreateDate
  FROM get_group_queue WHERE GroupID = @GroupID
END
GO
