USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[setFilterType]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[setFilterType] 
(	
	@GroupFilterID int,	
	@FilterType int
) 
AS
BEGIN
	UPDATE GroupFilter SET FilterType = @FilterType WHERE GroupFilterID = @GroupFilterID 
END
GO
