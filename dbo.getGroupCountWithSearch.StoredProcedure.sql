USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getGroupCountWithSearch]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getGroupCountWithSearch]
(
	@SearchString nvarchar(50)
)
AS
BEGIN
SELECT Count(*) As ResultCount FROM Groups
WHERE
	GroupName LIKE '%' + @SearchString + '%'
END
GO
