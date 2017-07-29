USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeFormField]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[removeFormField]
(
	@FormFieldID int
)
AS
BEGIN
DELETE FROM FormFields WHERE FormFieldID = @FormFieldID AND IsPermanent = 0
END
GO
