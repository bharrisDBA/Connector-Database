USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getFormFieldByID]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[getFormFieldByID]
(
	@FormFieldID int
)
AS
  SELECT
  	FormFieldID,
  	FieldType,
	FieldName,
  	DisplayName,
  	DisplayOrder,
	DefaultValue,
	ValidationType,
  	IsPermanent,
  	IsActive 
  FROM get_form_fields
  WHERE FormFieldID = @FormFieldID

GO
