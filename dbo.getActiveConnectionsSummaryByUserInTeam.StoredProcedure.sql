USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getActiveConnectionsSummaryByUserInTeam]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getActiveConnectionsSummaryByUserInTeam]
(
	@ConnectorID int,
	@TeamID int
)
AS 
SELECT 	
	UserName, FirstName, LastName, NickName, UserID, DateCreated, ConnectorID, TeamID
FROM get_active_connections_summary
WHERE ConnectorID = @ConnectorID AND TeamID = @TeamID
GO
