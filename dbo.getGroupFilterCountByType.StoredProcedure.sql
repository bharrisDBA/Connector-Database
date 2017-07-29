USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getGroupFilterCountByType]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getGroupFilterCountByType]
(
	@FilterID int,
	@FilterType int
)
AS
SELECT COUNT(GroupID) AS ResultCount FROM GroupFilter WHERE FilterID = @FilterID AND FilterType = @FilterType
GO
