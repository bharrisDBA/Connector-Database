USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getLanguagesCount]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getLanguagesCount]
AS
BEGIN
SELECT Count(*) As ResultCount FROM l_codes
End
GO
