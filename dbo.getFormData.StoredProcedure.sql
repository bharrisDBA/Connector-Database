USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getFormData]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getFormData]
(
	@ID int = NULL
)
AS
BEGIN
SELECT
	 FormDataID, UserID, FormFieldID, Data, CreateDate
FROM get_form_data
WHERE (@ID IS NULL) OR (FormDataID = @ID)
END
GO
