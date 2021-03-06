USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[updateTag]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateTag]
(
	@TagID int,
	@Key nvarchar(max)
)
AS
DECLARE
	@count int 
	SELECT @count = 0
	SELECT @count = COUNT(*) FROM l_tags WHERE l_tag = @Key
IF (@count = 0)
BEGIN
UPDATE l_tags SET l_tag = @key WHERE l_tid = @TagID
END
GO
