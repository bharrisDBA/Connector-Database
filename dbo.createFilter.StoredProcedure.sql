USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[createFilter]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[createFilter]
(
	@FilterName nvarchar(64),
  	@FilterDescription nvarchar(256),
  	@FormFieldData nvarchar(max),
  	@FormFieldID int
)
AS 
BEGIN 
INSERT INTO Filter
(
	FilterName,
  	FilterDescription,
  	FormFieldData,
  	FormFieldID
)
VALUES
(
 	@FilterName,
  	@FilterDescription,
  	@FormFieldData,
  	@FormFieldID
)
END
GO
