USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getQueuesAvailableToATeam]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 2/8/17
-- Description:	Returns a list of queues(groups) available to a particular team with number in queue
-- =============================================
CREATE PROCEDURE [dbo].[getQueuesAvailableToATeam]
	-- Add the parameters for the stored procedure here
	@TeamID int 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT g.GroupName ,case when gq.inQueue is null then 0 else gq.inqueue end as inqueue ,gt.TeamID
  FROM [_connector].[dbo].[GroupTeam] gt
  join Groups g on g.GroupID = gt.GroupID
  left join (select count(*) as inqueue, groupid from groupqueue group by groupid) gq on gq.groupid = gt.groupid
  where gt.TeamID = @TeamID
END

GO
