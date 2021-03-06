USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[updateFormData]    Script Date: 8/16/2017 8:45:18 PM ******/
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
