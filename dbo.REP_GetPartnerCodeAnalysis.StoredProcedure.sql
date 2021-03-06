USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[REP_GetPartnerCodeAnalysis]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 2/2/17
-- Description:	Gets a summary of inquirers by partnercode for a website
-- designed for a custom report
-- =============================================
CREATE PROCEDURE [dbo].[REP_GetPartnerCodeAnalysis]
	-- Add the parameters for the stored procedure here
	@Website nvarchar(50),
	@start nvarchar(20),
	@end nvarchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select 
		fd.data as PartnerCode,fd2.data as website, dbo.GetIssueFromPartnerCode(fd.data) as Issue
		,count(*) as [Inquirers] 

		from FormData fd
		join formdata fd2 on fd2.userid=fd.userid and fd2.FormFieldID = 12
		where fd.FormFieldID=24 and fd2.data like '%'+@website+'%' and fd.CreateDate  between @start and @end

		group by fd.data,fd2.data
		order by count(*) desc 

END

GO
