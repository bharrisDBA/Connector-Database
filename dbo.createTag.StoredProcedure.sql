USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[createTag]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[createTag]
(
	@Key nvarchar(max)
)
AS
DECLARE
	@count int 
	SELECT @count = 0
	SELECT @count = COUNT(*) FROM l_tags WHERE l_tag = @Key
IF (@count = 0)
BEGIN
INSERT INTO l_tags
(
	l_tag
)
VALUES
(
	@Key
)
END
GO
