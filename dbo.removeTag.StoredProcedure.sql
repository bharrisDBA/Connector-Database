USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeTag]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[removeTag]
(
	@TagID int
)
AS
BEGIN
DELETE FROM l_text WHERE l_tag = @TagID;
DELETE FROM l_tags WHERE l_tid = @TagID
END
GO
