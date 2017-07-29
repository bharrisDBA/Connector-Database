USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeFilter]    Script Date: 7/28/2017 10:17:13 PM ******/
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
