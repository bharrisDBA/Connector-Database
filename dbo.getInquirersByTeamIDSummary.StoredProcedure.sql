USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getInquirersByTeamIDSummary]    Script Date: 7/28/2017 10:17:13 PM ******/
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
