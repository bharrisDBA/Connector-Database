USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeGroupFilter]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[removeGroupFilter]
(
	@GroupID int,
	@FilterID int
)
AS
BEGIN
	DELETE FROM GroupFilter WHERE GroupID = @GroupID AND FilterID = @FilterID
END
GO
