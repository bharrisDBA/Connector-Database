USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getTeamsByUser]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getTeamsByUser]
(
	@UserID int
)
AS
BEGIN
	/* TODO: Rewrite, so we can prevent multiples due to user being
	either in the team, coach or head coach without using a GROUP BY
	*/
  SELECT
  	TeamID,
  	TeamName,
  	TeamDescription,
  	TeamCoachID,
	HeadCoachID,
	CoachName,
  	CreateDate,
	TeamChatID
  FROM get_team_by_user 
  WHERE UserID = @UserID or TeamCoachID = @UserID or HeadCoachID = @UserID
  GROUP BY TeamID,TeamName,TeamDescription, TeamCoachID, HeadCoachID, CoachName,CreateDate, TeamChatID
  ORDER BY TeamName ASC
END
GO
