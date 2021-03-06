USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[InsertOrUpdateCountryAnalytic]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 11/15/16
-- Description:	Insert or update Analytics Count for Date/Country
-- =============================================
CREATE PROCEDURE [dbo].[InsertOrUpdateCountryAnalytic] 
	-- Add the parameters for the stored procedure here
	@thedate varchar(20),
	@Country varchar(2),
	@TheCount int
AS
BEGIN
SET NOCOUNT ON
declare @datatype varchar(5) = 'c'
declare @id int 
--use _connector;
--SELECT  @id = [AnalyticsID]   FROM [_connector].[dbo].[Analaytics]
SELECT @id=analyticsid   FROM [_connector].[dbo].[Analaytics] where datatype= @datatype and [date]=@thedate and data1=@Country;
--select @id
if @id is null 
	begin
		insert into [_connector].[dbo].[Analaytics] (datatype,date,data1,count) 
		values(@datatype,@thedate,@country,@thecount);
		set @id=1;
	end
else
	begin
		update [_connector].[dbo].[Analaytics] set count = @thecount where 
		datatype= @datatype and [date]=@thedate and data1=@Country;
		set @id=0;
	end

select @id as inserted;
END

GO
