USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[LU_countriesWithComments]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[LU_countriesWithComments]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select u.countrycode as [key] ,c.Name 
	-- + ' ('+cast(count(*) as varchar(6)) + ' comments all time)' 
	as [Value]  from Inquiries i 
		join users u on u.userid=i.userid
		join countries c on c.Code = u.countrycode and c.LanguageCode = 'en'
		where i.Comments<>''
		group by u.CountryCode,c.name order by c.name
END

GO
