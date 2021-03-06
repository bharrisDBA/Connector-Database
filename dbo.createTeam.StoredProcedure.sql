USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[createTeam]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[createTeam]
(
	@TeamName nvarchar(64),
  	@TeamDescription nvarchar(64),
  	@CoachID int,
	@HeadCoachID int
)
AS 
BEGIN 
INSERT INTO Teams
(
	TeamName,
  	TeamDescription,
  	TeamCoachID,
	HeadCoachID
)
OUTPUT Inserted.TeamID
VALUES
(
 	@TeamName,
  	@TeamDescription,
  	@CoachID,
	@HeadCoachID
)
END
GO
