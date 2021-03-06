USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getInquirersByTeamIDSummary]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getInquirersByTeamIDSummary]
(
	@TeamID int
)
AS 
SELECT 	
	UserID,
	UserName,
	UserTypeID,
	FirstName,
	LastName,
	NickName,
	DateCreated
FROM get_inquirers_by_team_summary
WHERE TeamID = @TeamID
GO
