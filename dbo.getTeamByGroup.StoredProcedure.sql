USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getTeamByGroup]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getTeamByGroup]
(
	@GroupID int
)
AS
BEGIN
  SELECT
  	CreateDate, TeamDescription, TeamCoachID, CoachName, HeadCoachID, TeamName, TeamID, GroupID
  FROM get_team_by_group
  WHERE GroupID = @GroupID
  ORDER BY TeamName ASC
END
GO
