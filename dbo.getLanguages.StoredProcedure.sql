USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getLanguages]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getLanguages] AS
SELECT l_id,l_code,l_lang,IsInterfaceLang,RightToLeft FROM l_codes ORDER BY IsInterfaceLang desc,l_code asc

GO
