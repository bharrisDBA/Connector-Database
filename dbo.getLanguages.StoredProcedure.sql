USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getLanguages]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getLanguages] AS
SELECT l_id,l_code,l_lang,IsInterfaceLang,RightToLeft FROM l_codes ORDER BY IsInterfaceLang desc,l_code asc

GO
