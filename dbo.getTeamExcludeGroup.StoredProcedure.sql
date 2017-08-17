USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getTeamExcludeGroup]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getTeamExcludeGroup]
(
	@GroupID int
)
AS
BEGIN
  SELECT
  	CreateDate, TeamDescription, TeamCoachID, HeadCoachID, TeamName, TeamID, GroupID
  FROM get_team_by_group
  WHERE GroupID IS NULL OR GroupID <> @GroupID
  ORDER BY CreateDate DESC
END
GO
