USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getGroupsForPage]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getGroupsForPage]
(
	@Start int,
	@End int,
	@Item As nvarchar(25),
	@Order As varchar(4)
)
AS
BEGIN
	SELECT 
		GroupID,
  		GroupName,
  		GroupDescription,
  		ExpirationTime,
  		ForwardGroupID,
  		CreateDate
	FROM
	(
		SELECT
			GroupID,
  			GroupName,
  			GroupDescription,
  			ExpirationTime,
  			ForwardGroupID,
  			CreateDate,
			ROW_NUMBER()
		OVER
		(
			ORDER BY
				CASE WHEN @Item = 'GroupID' AND @Order = 'asc' 
					THEN GroupID END ASC, 
				CASE WHEN @Item = 'GroupID' AND @Order = 'desc' 
					THEN GroupID END DESC,
				CASE WHEN @Item = 'GroupName' AND @Order = 'asc' 
					THEN GroupName END ASC, 
				CASE WHEN @Item = 'GroupName' AND @Order = 'desc' 
					THEN GroupName END DESC,
				CASE WHEN @Item = 'GroupDescription' AND @Order = 'asc' 
					THEN GroupDescription END ASC, 
				CASE WHEN @Item = 'GroupDescription' AND @Order = 'desc' 
					THEN GroupDescription END DESC,
				CASE WHEN @Item = 'ExpirationTime' AND @Order = 'asc' 
					THEN ExpirationTime END ASC, 
				CASE WHEN @Item = 'ExpirationTime' AND @Order = 'desc' 
					THEN ExpirationTime END DESC,
				CASE WHEN @Item = 'ForwardGroupID' AND @Order = 'asc' 
					THEN ForwardGroupID END ASC, 
				CASE WHEN @Item = 'ForwardGroupID' AND @Order = 'desc' 
					THEN ForwardGroupID END DESC,
				CASE WHEN @Item = 'CreateDate' AND @Order = 'asc' 
					THEN CreateDate END ASC, 
				CASE WHEN @Item = 'CreateDate' AND @Order = 'desc' 
					THEN CreateDate END DESC
		)
		AS RowNum FROM Groups
	)
	AS MyDerivedTable
	WHERE MyDerivedTable.RowNum BETWEEN @Start AND @End
	end
GO
