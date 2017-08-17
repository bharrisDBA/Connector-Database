USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getlocpage]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getlocpage] @code nvarchar(5)= NULL
AS
SELECT
	code, tag, text
FROM get_local_text
WHERE code=@code

GO
