USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getUserFormData]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getUserFormData]
(
	@UserID int,
	@FieldID int = NULL
)
AS
BEGIN
SELECT
	 FormDataID, UserID, FormFieldID, Data, CreateDate
FROM get_form_data
WHERE UserID = @UserID AND ((@FieldID IS NULL) OR (FormFieldID = @FieldID))
END
GO
