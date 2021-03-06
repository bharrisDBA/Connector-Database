USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getFilterCountForTemplates]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
Returns how many response templates this filter
Is attached to. If slow then will have to modify view/sp for filters there
*/
CREATE PROCEDURE [dbo].[getFilterCountForTemplates]
(
	@FilterID int
)
AS
SELECT 
	COUNT(FilterID) AS ResultCount 
FROM ResponseTemplate 
WHERE FilterID = @FilterID
GO
