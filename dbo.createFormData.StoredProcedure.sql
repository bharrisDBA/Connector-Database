USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[createFormData]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[createFormData]
(
	@UserID int,
	@FormFieldID int,
	@Data nvarchar(max)
)
AS
DECLARE
	@count int 
	SELECT @count = 0
	SELECT @count = COUNT(*) FROM FormData WHERE (UserID = @UserID) AND (FormFieldID = @FormFieldID)
IF (@count = 0)
BEGIN
INSERT INTO FormData
(
	UserID,
	FormFieldID,
	Data
)
VALUES
(
	@UserID,
	@FormFieldID,
	@Data
)
END
GO
