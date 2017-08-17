USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getVisitsByWebsiteForYear]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 12/5/16
-- Description:	Returns a cross tab monthly totals for given year
-- =============================================
CREATE PROCEDURE [dbo].[getVisitsByWebsiteForYear]
	-- Add the parameters for the stored procedure here
	@Year int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;



select data1 as Website
,sum(case when month([date]) = 1 then [count] else 0 end) as 'January'
,sum(case when month([date]) = 2 then count else 0 end) as February
,sum(case when month([date]) = 3 then count else 0 end) as March
,sum(case when month([date]) = 4 then count else 0 end) as April
,sum(case when month([date]) = 5 then count else 0 end) as May
,sum(case when month([date]) = 6 then count else 0 end) as June
,sum(case when month([date]) = 7 then count else 0 end) as July
,sum(case when month([date]) = 8 then count else 0 end) as August
,sum(case when month([date]) = 9 then count else 0 end) as September
,sum(case when month([date]) = 10 then count else 0 end) as October
,sum(case when month([date]) = 11 then count else 0 end) as November
,sum(case when month([date]) = 12 then count else 0 end) as December

from Analaytics
where year([date])= @year and datatype='sc'
group by data1
order by data1
END

GO
