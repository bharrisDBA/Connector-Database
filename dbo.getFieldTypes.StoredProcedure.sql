USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getFieldTypes]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getFieldTypes]
AS
  SELECT
  	FormFieldTypeID,
  	FieldType,
	Name
  FROM FormFieldTypes 

GO
