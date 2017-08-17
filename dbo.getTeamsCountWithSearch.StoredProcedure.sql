USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getTeamsCountWithSearch]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getTeamsCountWithSearch]
(
	@SearchString As nvarchar(25)
)
AS
BEGIN
SELECT Count(*) As ResultCount FROM get_teams
	WHERE
	(
		TeamID LIKE '%' + @SearchString + '%' OR
		TeamName LIKE @SearchString  OR
		TeamDescription LIKE  @SearchString OR 
		TeamCoachID LIKE '%' + @SearchString + '%' OR
		CoachName LIKE '%' + @SearchString + '%' OR
		CreateDate LIKE '%' + @SearchString + '%'
	)
end
GO
