USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getActiveConnectionsSummaryByUser]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getActiveConnectionsSummaryByUser]
(
	@ConnectorID int
)
AS 
SELECT 	
	UserName, FirstName, LastName, NickName, UserID, DateCreated, ConnectorID, TeamID
FROM get_active_connections_summary
WHERE ConnectorID = @ConnectorID
GO
