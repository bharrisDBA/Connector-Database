USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getLanguageTextForTranslation]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 8/4/16
-- Description:	Returns Tag, English and Localized Text for a specified language
-- =============================================
CREATE PROCEDURE [dbo].[getLanguageTextForTranslation]
	-- Add the parameters for the stored procedure here
	@LocalizedLangID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select l_tid,l_tags.l_tag as Tag,English.l_text as English, Localized.l_text as Localized
		from l_tags
		left join l_text as English on (English.l_tag = l_tags.l_tid and English.l_code = 1)
		left join l_text as Localized on (localized.l_tag = l_tags.l_tid and Localized.l_code = @LocalizedLangID)
END

GO
