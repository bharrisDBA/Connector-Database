USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getTeamsForPageWithSearch]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getTeamsForPageWithSearch]
(
	@Start int,
	@End int,
	@Item As nvarchar(25),
	@Order As varchar(4),
	@SearchString As nvarchar(25)
)
AS
BEGIN
	SELECT 
		TeamID,
  		TeamName,
  		TeamDescription,
  		TeamCoachID,
		HeadCoachID,
  		CoachName,
  		CreateDate
	FROM
	(
		SELECT
			TeamID,
  			TeamName,
  			TeamDescription,
  			TeamCoachID,
			HeadCoachID,
  			CoachName,
  			CreateDate,
			ROW_NUMBER()
		OVER
		(
			ORDER BY
				CASE WHEN @Item = 'TeamID' AND @Order = 'asc' 
					THEN TeamID END ASC, 
				CASE WHEN @Item = 'TeamID' AND @Order = 'desc' 
					THEN TeamID END DESC,
				CASE WHEN @Item = 'TeamName' AND @Order = 'asc' 
					THEN TeamName END ASC, 
				CASE WHEN @Item = 'TeamName' AND @Order = 'desc' 
					THEN TeamName END DESC,
				CASE WHEN @Item = 'TeamDescription' AND @Order = 'asc' 
					THEN TeamDescription END ASC, 
				CASE WHEN @Item = 'TeamDescription' AND @Order = 'desc' 
					THEN TeamDescription END DESC,
				CASE WHEN @Item = 'TeamCoachID' AND @Order = 'asc' 
					THEN TeamCoachID END ASC, 
				CASE WHEN @Item = 'TeamCoachID' AND @Order = 'desc' 
					THEN TeamCoachID END DESC,
				CASE WHEN @Item = 'CoachName' AND @Order = 'asc' 
					THEN CoachName END ASC, 
				CASE WHEN @Item = 'CoachName' AND @Order = 'desc' 
					THEN CoachName END DESC,
				CASE WHEN @Item = 'CreateDate' AND @Order = 'asc'
					THEN CreateDate END ASC,
				CASE WHEN @Item = 'CreateDate' AND @Order = 'desc'
					THEN CreateDate END DESC
		)
		AS RowNum FROM get_teams
		WHERE
		(
			TeamID LIKE '%' + @SearchString + '%' OR
			TeamName LIKE '%' + @SearchString + '%' OR
			TeamDescription LIKE  @SearchString OR 
			TeamCoachID LIKE '%' + @SearchString + '%' OR
			CoachName LIKE '%' + @SearchString + '%' OR
			CreateDate LIKE '%' + @SearchString + '%'
		)
	)
	AS MyDerivedTable
	WHERE MyDerivedTable.RowNum BETWEEN @Start AND @End
	end
GO
