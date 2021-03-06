USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getFilterCountForGroupByType]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getFilterCountForGroupByType]
(
	@GroupID int,
	@FilterType int
)
AS
SELECT 
	COUNT(GroupID) AS ResultCount 
FROM GroupFilter 
WHERE GroupID = @GroupID AND FilterType = @FilterType
GO
