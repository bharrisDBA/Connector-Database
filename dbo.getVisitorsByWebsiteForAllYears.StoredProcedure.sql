USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getVisitorsByWebsiteForAllYears]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 12/5/16
-- Description:	Returns a cross tab by year totals and by website
-- =============================================
CREATE PROCEDURE [dbo].[getVisitorsByWebsiteForAllYears]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
declare @year int 
declare @start int
declare @val int
declare @datatype nvarchar(4) = 'sc'
declare @h nvarchar(4)
declare @sql nvarchar(2000) = N''
set @year = year(getdate())
set @start = @year - 10
select @start = min(year(date)),@year = max(year(date)) from Analaytics where datatype='c'
set @val = @start

while (@val <= @year)
	Begin
		set @h = convert(nvarchar(4),@val) 
		set @sql = @sql + iif(@sql='','',',') + N'sum(case when year([date])=' +@h + N' then [count] else 0 end) as [Visits in ' + @h + N']'
		set @val = @val + 1
	End

set @sql = N'Select data1 as website, ' + @sql + N' from analaytics where datatype=''sc'''
set @sql = @sql + N' group by data1 order by data1 '
--print @sql

exec sp_executesql @sql
END

GO
