USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[updateTeam]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[updateTeam]
(
	@TeamID int,
	@TeamName nvarchar(64),
  	@TeamDescription nvarchar(64),
  	@CoachID int,
	@HeadCoachID int
)
AS 
BEGIN 
UPDATE Teams
	SET
	TeamName = @TeamName,
  	TeamDescription = @TeamDescription,
  	TeamCoachID = @CoachID,
	HeadCoachID = @HeadCoachID
	WHERE TeamID = @TeamID
END
GO
