USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeFormData]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[removeFormData]
(
	@ID int
)
AS
BEGIN
DELETE FROM FormData WHERE FormDataID = @ID
END
GO
