USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[updateFormField]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[updateFormField] 
(
	@FormFieldID int,
	@FieldType int,
	@DisplayName nvarchar(32),
	@DisplayOrder int,
	@DefaultValue nvarchar(max) = NULL,
	@ValidationType int,
	@IsPermanent bit,
	@IsActive bit
) 
AS 
BEGIN 
	UPDATE FormFields SET
	FieldType = @FieldType,
	DisplayName = @DisplayName,
	DisplayOrder = @DisplayOrder,
	DefaultValue = @DefaultValue,
	ValidationType = @ValidationType,
	IsPermanent = @IsPermanent,
	IsActive = @IsActive
	WHERE FormFieldID = @FormFieldID
END
GO
