USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[updateFilter]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[updateFilter]
(
	@FilterID int,
	@FilterName nvarchar(64),
  	@FilterDescription nvarchar(256),
  	@FormFieldData nvarchar(max),
  	@FormFieldID int
)
AS 
BEGIN 
UPDATE Filter
	SET 
	FilterName = @FilterName,
  	FilterDescription = @FilterDescription,
  	FormFieldData = @FormFieldData,
  	FormFieldID = @FormFieldID
WHERE FilterID = @FilterID
END
GO
