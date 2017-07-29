USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getFilterByID]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[getFilterByID]
(
	@FilterID int
)
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
  WHERE FilterID = @FilterID
END
GO
