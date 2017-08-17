USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getLocalizedText]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[getLocalizedText]
(
	@tag nvarchar(max),
	@code nvarchar(5)
)
AS
SELECT text
FROM get_localized_text
WHERE code=@code and tag=@tag

GO
