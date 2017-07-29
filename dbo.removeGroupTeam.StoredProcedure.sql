USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeGroupTeam]    Script Date: 7/28/2017 10:17:13 PM ******/
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
