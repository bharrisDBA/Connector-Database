USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getFormFieldsCount]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getFormFieldsCount]
AS
BEGIN
SELECT Count(*) As ResultCount FROM get_form_fields
END
GO
