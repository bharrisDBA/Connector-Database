USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getInquirerFromGroupQueue]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 7/13/16
-- Description:	Returns an inquirer from the Group Queue
-- =============================================
CREATE PROCEDURE [dbo].[getInquirerFromGroupQueue]
	 @UserId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT * from GroupQueue where userid = @UserId
END

GO
