USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getFilters]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[getFilters]
AS
BEGIN
  SELECT
  	FilterID,
  	FilterName,
  	FilterDescription,
  	FormFieldData,
  	CreateDate,
  	FormFieldID,
	FieldName
  FROM get_filters
  ORDER BY FilterName ASC
END
GO
