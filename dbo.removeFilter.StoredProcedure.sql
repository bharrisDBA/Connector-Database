USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeFilter]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[removeFilter]
(
	@FilterID int
)
AS
BEGIN
DELETE FROM GroupFilter WHERE FilterID = @FilterID
DELETE FROM Filter WHERE FilterID = @FilterID
END
GO
