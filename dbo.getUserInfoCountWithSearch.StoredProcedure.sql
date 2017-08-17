USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getUserInfoCountWithSearch]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getUserInfoCountWithSearch]
(
	@SearchString nvarchar(50)
)
AS
BEGIN
SELECT Count(*) As ResultCount FROM get_user_info
WHERE
	UserID LIKE '%' + @SearchString + '%' 
	OR
	UserType LIKE @SearchString  
	OR
	Username LIKE  @SearchString 
	OR 
	FirstName LIKE '%' + @SearchString + '%' 
	OR
	LastName LIKE '%' + @SearchString + '%' 
	OR
	UserName LIKE '%' + @SearchString + '%' 
	OR
	LastLogon LIKE @SearchString  
	OR
	DateRegistered LIKE  @SearchString 
	OR 
	NumConversations LIKE '%' + @SearchString + '%'
	 OR
	TeamMembership LIKE '%' + @SearchString + '%'
END
GO
