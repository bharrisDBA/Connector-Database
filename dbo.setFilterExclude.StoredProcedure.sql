USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[setFilterExclude]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[setFilterExclude] 
(	
	@GroupFilterID int,	
	@Exclude bit
) 
AS
BEGIN
	UPDATE GroupFilter SET Exclude = @Exclude WHERE GroupFilterID = @GroupFilterID 
END
GO
