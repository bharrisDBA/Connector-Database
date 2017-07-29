USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[updateFormData]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[updateFormData]
(
	@ID int,
	@UserID int,
	@FormFieldID int,
	@Data nvarchar(max)
)
AS
BEGIN
UPDATE FormData SET UserID = @UserID, FormFieldID = @FormFieldID, Data = @Data WHERE FormDataID = @ID
END
GO
