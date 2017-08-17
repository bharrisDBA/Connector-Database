USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeGroupTeam]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[removeGroupTeam]
(
	@GroupID int,
	@TeamID int
)
AS
BEGIN
	DELETE FROM GroupTeam WHERE GroupID = @GroupID AND TeamID = @TeamID
END
GO
