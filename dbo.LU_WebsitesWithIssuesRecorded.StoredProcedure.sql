USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[LU_WebsitesWithIssuesRecorded]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 5/17/17
-- Description:	Returns a list of websites (of inquirer orgin) where a evangelism issue page was recorded.
-- =============================================
CREATE PROCEDURE [dbo].[LU_WebsitesWithIssuesRecorded]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select lower(fd.data) as [Key],fd.data as [Value]  from formdata fd
	join formdata fd2 on fd.UserID = fd2.userid and fd2.FormFieldID = 37
	where fd.FormFieldID = 12
	group by fd.data
	order by lower(fd.data)
END

GO
