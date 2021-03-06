USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[FindInquirer]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[FindInquirer]
	-- Add the parameters for the stored procedure here
	@InquirerName nvarchar(250)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @seek nvarchar(255)
	set @seek = '%' + @inquirerName + '%'
    -- Insert statements for procedure here
	select u.userid,u.firstname as inquirerName,decisiontoday,i.comments,u.city,u.stateprovince,u.CountryCode,u2.firstname + ' ' + u2.lastname as ConnectorName
  ,case when gq.GroupQueueID >0 then 'On General Queue'
	   when tq.TempQueueID >0 then 'On Temp Queue'
	   else 'Not in queue' end as queueStatus

  from users u

join Inquiries i on i.UserID = u.userid
left join users u2 on u2.userid=i.ProcessorID
left join User121Extension ui on ui.UserID = u.UserID
left join GroupQueue gq on gq.UserID = u.userid
left join TempQueue tq on tq.InquirerID = u.userid
where u.firstname like @seek
END

GO
