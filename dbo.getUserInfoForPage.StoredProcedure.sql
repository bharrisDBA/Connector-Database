USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getUserInfoForPage]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[getUserInfoForPage]
(
	@Start int,
	@End int,
	@Item As nvarchar(25),
	@Order As varchar(4)
)
AS
BEGIN
	SELECT 
		UserID,
  		UserType,
  		Username,
  		FirstName,
  		LastName,
  		UserName,
		LastLogon,
		DateRegistered,
		NumConversations,
		TeamMembership
	FROM
	(
		SELECT
			UserID,
  			UserType,
  			FirstName,
  			LastName,
  			UserName,
			LastLogon,
			DateRegistered,
			NumConversations,
			TeamMembership,
			ROW_NUMBER()
		OVER
		(
			ORDER BY
				CASE WHEN @Item = 'UserID' AND @Order = 'asc' 
					THEN UserID END ASC, 
				CASE WHEN @Item = 'UserID' AND @Order = 'desc' 
					THEN UserID END DESC,
				CASE WHEN @Item = 'UserType' AND @Order = 'asc' 
					THEN UserType END ASC, 
				CASE WHEN @Item = 'UserType' AND @Order = 'desc' 
					THEN UserType END DESC,
				CASE WHEN @Item = 'FirstName' AND @Order = 'asc' 
					THEN FirstName END ASC, 
				CASE WHEN @Item = 'FirstName' AND @Order = 'desc' 
					THEN FirstName END DESC,
				CASE WHEN @Item = 'LastName' AND @Order = 'asc' 
					THEN LastName END ASC, 
				CASE WHEN @Item = 'LastName' AND @Order = 'desc' 
					THEN LastName END DESC,
				CASE WHEN @Item = 'UserName' AND @Order = 'asc' 
					THEN UserName END ASC, 
				CASE WHEN @Item = 'UserName' AND @Order = 'desc' 
					THEN UserName END DESC,
				CASE WHEN @Item = 'LastLogon' AND @Order = 'asc' 
					THEN LastLogon END ASC, 
				CASE WHEN @Item = 'LastLogon' AND @Order = 'desc' 
					THEN LastLogon END DESC,
				CASE WHEN @Item = 'DateRegistered' AND @Order = 'asc' 
					THEN DateRegistered END ASC, 
				CASE WHEN @Item = 'DateRegistered' AND @Order = 'desc' 
					THEN DateRegistered END DESC,
				CASE WHEN @Item = 'NumConversations' AND @Order = 'asc' 
					THEN NumConversations END ASC, 
				CASE WHEN @Item = 'NumConversations' AND @Order = 'desc' 
					THEN NumConversations END DESC,
				CASE WHEN @Item = 'TeamMembership' AND @Order = 'asc' 
					THEN TeamMembership END ASC, 
				CASE WHEN @Item = 'TeamMembership' AND @Order = 'desc' 
					THEN TeamMembership END DESC
		)
		AS RowNum FROM get_user_info
	)
	AS MyDerivedTable
	WHERE MyDerivedTable.RowNum BETWEEN @Start AND @End
	end
GO
