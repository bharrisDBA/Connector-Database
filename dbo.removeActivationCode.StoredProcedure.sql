USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeActivationCode]    Script Date: 8/16/2017 8:45:18 PM ******/
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
