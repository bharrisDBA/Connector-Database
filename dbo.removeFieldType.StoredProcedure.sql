USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeFieldType]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[removeFieldType]
(
	@ID int
)
AS
DELETE FROM FormFieldTypes WHERE FormFieldTypeID = @ID
GO
