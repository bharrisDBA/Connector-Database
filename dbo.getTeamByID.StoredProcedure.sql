USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getTeamByID]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[getTeamByID]
(
	@TeamID int
)
AS
BEGIN
  SELECT
  	TeamID,
  	TeamName,
  	TeamDescription,
  	TeamCoachID,
	HeadCoachID,
	CoachName,
  	CreateDate
  FROM get_teams
  WHERE TeamID = @TeamID
END
GO
