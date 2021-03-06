USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeFromTempQueueAndDeleteDraftEmail]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 8/1/16
-- Description:	Remove From Temp Queue and Remove Draft
--    This assumes you have gotten the information needed before deleting
-- =============================================
CREATE PROCEDURE [dbo].[removeFromTempQueueAndDeleteDraftEmail]
	-- Add the parameters for the stored procedure here
	@ConnectorID int,
	@InquirerID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	delete from tempQueue where InquirerID = @InquirerID and ConnectorID=@ConnectorID;
	delete from EmailDrafts where InquirerID = @InquirerID and UserID=@ConnectorID;
END

GO
