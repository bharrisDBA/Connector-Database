USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getPossibleConnectionsSummaryByTeam]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getPossibleConnectionsSummaryByTeam]
(
	@TeamID int
)
AS 
SELECT 	
	UserName, FirstName, LastName, DateCreated, NickName, UserID, TeamID
FROM get_queue_by_team_summary
WHERE TeamID = @TeamID
GO
