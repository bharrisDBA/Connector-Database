USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[REP_InquirersCommentsByDateAndCountry]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[REP_InquirersCommentsByDateAndCountry]
	-- Add the parameters for the stored procedure here
	@StartDate varchar(20),
	@EndDate varchar(20),
	@CountryCodes varchar(10)=Null

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @sql nvarchar(2500)
	declare @country nvarchar(50)
	declare @start nvarchar(20)
	declare @end nvarchar(20)
	set @start = SUBSTRING(@StartDate, 6, 2) + '/' + RIGHT(@StartDate, 2)+ '/'+SUBSTRING(@StartDate, 1, 4)
	set @end = SUBSTRING(@EndDate, 6, 2) + '/' + RIGHT(@EndDate, 2)+ '/'+SUBSTRING(@EndDate, 1, 4)
	if (@CountryCodes is null)
	    begin
			set @Country = ''
	    end
	else
	    begin
		    set @country = '''%'' + u.countrycode + ''%'''
		    set @country = ' AND 0<(PatIndex('+ @country + ',''' + @CountryCodes + '''' 
			set @country = @country + ')'
       end

    -- Insert statements for procedure here
	-- if you want to key on language INNER JOIN dbo.FormData AS fdlang ON fdlang.UserID = u.UserID AND flang.FormFieldID = 3
	SELECT  dbo.decisionTypeToEnglish(i.DecisionToday) as [Decision]
	   , format(i.DateSubmitted, 'd', 'en-us') AS [Date Submitted]
		, u.FirstName as [Inquirer Name]
		, c.Name AS Country
		,CASE WHEN u.gender = 0 THEN 'Man' ELSE 'Woman' END AS Gender,
		i.Comments
		FROM  dbo.Inquiries AS i 
		INNER JOIN dbo.Users AS u ON u.UserID = i.UserID 
		INNER JOIN dbo.Countries AS c ON c.Code = u.CountryCode AND c.LanguageCode = 'en'
		
		WHERE (i.DateSubmitted between convert(datetime, @start ,20) and convert(datetime, @end, 20)) 
		AND (i.Comments IS NOT NULL) AND (i.Comments <> '')
		and patindex('%'+u.countrycode+'%',@CountryCodes)>0
		 ORDER BY i.DateSubmitted DESC
	--select @sql

	--execute sp_executesql @sql
END

GO
