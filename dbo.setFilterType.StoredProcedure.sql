USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[setFilterType]    Script Date: 8/16/2017 8:45:18 PM ******/
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
