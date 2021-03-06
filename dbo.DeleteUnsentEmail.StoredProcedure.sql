USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[DeleteUnsentEmail]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 4/28/17
-- Description:	Deletes unsent email for this email address
-- =============================================
CREATE PROCEDURE [dbo].[DeleteUnsentEmail] 
	-- Add the parameters for the stored procedure here
	@Email nvarchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from emails where sent=0 and emailTo = @email
END

GO
