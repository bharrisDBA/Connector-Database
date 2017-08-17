USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getTagByID]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getTagByID]
(
	@TagID int
)
AS
BEGIN
SELECT l_tid,l_tag FROM l_tags WHERE l_tid = @TagID
END
GO
