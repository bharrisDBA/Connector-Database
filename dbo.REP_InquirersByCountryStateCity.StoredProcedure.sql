USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[REP_InquirersByCountryStateCity]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 2/17/17
-- Description:	Inquirers counted by country,state,city
-- =============================================
CREATE PROCEDURE [dbo].[REP_InquirersByCountryStateCity]
	-- Add the parameters for the stored procedure here
	@StartDate varchar(20),
	@EndDate varchar(20),
	@CountryCodes varchar(70)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select c.Code,c.Name as Country
		,case when StateProvince ='' then '(unknown)' else stateprovince end as stateprovince
		,case when city ='' then '(unknown)' else city end as city
		,count(*) as inquirers from users u
		join Countries c on c.Code = u.CountryCode and c.LanguageCode = 'en'
		where usertypeid=100 and patindex('%'+u.countrycode+'%',@CountryCodes)>0 and datecreated >=@startdate and datecreated <= @enddate
		group by c.code,c.name,StateProvince,city
		order by c.name,stateprovince,city 
END

GO
