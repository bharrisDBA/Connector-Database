USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[createFormField]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[createFormField] 
(
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
	INSERT INTO FormFields 
	(
		FieldType,
		DisplayName,
		DisplayOrder,
		DefaultValue,
		ValidationType,
		IsPermanent,
		IsActive
	) 
	VALUES 
	(
		@FieldType,
		@DisplayName,
		@DisplayOrder,
		@DefaultValue,
		@ValidationType,
		@IsPermanent,
		@IsActive
	) 
END
GO
