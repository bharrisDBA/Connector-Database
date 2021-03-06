USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[removeFromTempQueueAndRequeueToGeneral]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 10/27/16
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[removeFromTempQueueAndRequeueToGeneral] 

	@InquirerID int,
	@GroupID int = NULL,
	@QueueDate date = NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select @QueueDate = tempQueue.QueueDate,@GroupID = groupid from TempQueue where InquirerID = @InquirerID;
    -- Insert statements for procedure here
	delete from tempQueue where InquirerID = @InquirerID;
	insert into GroupQueue (GroupID,UserID,CreateDate) Values(@GroupID,@InquirerID,@QueueDate);
	
END

GO
