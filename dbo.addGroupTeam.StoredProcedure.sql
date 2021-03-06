USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[addGroupTeam]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addGroupTeam]
(
	@GroupID int,
	@TeamID int
)
AS
DECLARE @Count int
SELECT @Count = 0
SELECT @Count = COUNT(GroupTeamID) FROM [dbo].GroupTeam WHERE GroupID = @GroupID AND TeamID = @TeamID
IF (@Count = 0)
BEGIN
	INSERT INTO GroupTeam (GroupID, TeamID) VALUES (@GroupID,@TeamID)
END
GO
