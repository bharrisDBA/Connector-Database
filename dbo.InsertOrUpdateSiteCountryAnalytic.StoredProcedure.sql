USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[InsertOrUpdateSiteCountryAnalytic]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 12/5/16
-- Description:	Insert or update Analytics Count for site and country by date
-- =============================================
CREATE PROCEDURE [dbo].[InsertOrUpdateSiteCountryAnalytic] 
	-- Add the parameters for the stored procedure here
	@thedate varchar(20),
	@Site varchar(40),
	@Country varchar(2),
	@TheCount int
AS
BEGIN
SET NOCOUNT ON
declare @datatype varchar(5) = 'sc'
declare @id int 

SELECT @id=analyticsid FROM [_connector].[dbo].[Analaytics] where datatype= @datatype and [date]=@thedate and data2=@Country and data1=@Site;
--select @id
if @id is null 
	begin
		insert into [_connector].[dbo].[Analaytics] (datatype,date,data1,data2,count) 
		values(@datatype,@thedate,@Site,@country,@thecount);
		set @id=1;
	end
else
	begin
		update [_connector].[dbo].[Analaytics] set count = @thecount where 
		datatype= @datatype and [date]=@thedate and data1=@site and data2=@Country;
		set @id=0;
	end

select @id as inserted;
END

GO
