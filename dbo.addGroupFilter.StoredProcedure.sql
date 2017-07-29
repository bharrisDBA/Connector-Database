USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[addGroupFilter]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addGroupFilter]
(
	@GroupID int,
	@FilterID int,
	@FilterType int
)
AS
DECLARE @Count int
SELECT @Count = 0
SELECT @Count = COUNT(GroupFilterID) FROM [dbo].GroupFilter WHERE GroupID = @GroupID AND FilterID = @FilterID
IF (@Count = 0)
BEGIN
	INSERT INTO GroupFilter (GroupID, FilterID, FilterType) VALUES (@GroupID,@FilterID,@FilterType)
END
GO
