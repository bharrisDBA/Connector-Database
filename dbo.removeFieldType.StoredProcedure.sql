USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeFieldType]    Script Date: 8/16/2017 8:45:18 PM ******/
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
