USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeActivationCode]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[removeActivationCode]
(
	@Code nvarchar(20)
)
AS
BEGIN
	DELETE FROM Activation WHERE Code = @Code
END
GO
