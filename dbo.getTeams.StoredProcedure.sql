USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getTeams]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[getTeams]
AS
BEGIN
  SELECT
  	TeamID,
  	TeamName,
  	TeamDescription,
  	TeamCoachID,
	CoachName,
	HeadCoachID,
  	CreateDate
  FROM get_teams
  ORDER BY TeamName ASC
END
GO
