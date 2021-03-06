USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getDelinquentQueuesList]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 3/13/17
-- Description:	Lists queues which have inquirers over 72 hours
-- =============================================
CREATE PROCEDURE [dbo].[getDelinquentQueuesList]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
	select groupname as QueueName
	,Coalesce(Under72,0) as Under72Hours
	,coalesce(Over72Hr,0) as Over72Hrs 
	,coalesce(Over168Hr,0) as Over7Days
	,Coalesce(Under72,0)+coalesce(Over72Hr,0) + coalesce(Over168Hr,0) as TotalInQueue 
	from groups g
	left join (
	select groupid,count(*) Under72 from GroupQueue gq
	where DATEDIFF(hh,gq.CreateDate,getdate()) <=72
	group by groupid
	) un72 on un72.groupid = g.GroupID
	left join 
	(select groupid,count(*) Over72Hr from GroupQueue gq
	where DATEDIFF(hh,gq.CreateDate,getdate()) >72 and  DATEDIFF(hh,gq.CreateDate,getdate()) < 168
	group by groupid
	) ov72 on ov72.GroupID= g.GroupID

	left join 
	(select groupid,count(*) Over168Hr from GroupQueue gq
	where DATEDIFF(hh,gq.CreateDate,getdate()) >168
	group by groupid
	) ov168 on ov168.GroupID= g.GroupID
	where  Over72Hr >0
	order by groupname

END

GO
