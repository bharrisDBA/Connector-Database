USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[REP_InquirersCommentsByDateAndLanguage]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[REP_InquirersCommentsByDateAndLanguage]
	-- Add the parameters for the stored procedure here
	@StartDate varchar(20),
	@EndDate varchar(20),
	@LanguageCode varchar(10)=Null

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @sql nvarchar(2500)
	declare @Lang nvarchar(50)
	declare @start nvarchar(20)
	declare @end nvarchar(20)
	if (@languageCode is null)
	    begin
			set @Lang = ''
	    end
	else
	    begin
		    set @lang = 'AND (ffd.Data = ''' + @LanguageCode + ''')'
       end

    -- Insert statements for procedure here
	set @sql = N'SELECT  dbo.decisionTypeToEnglish(i.DecisionToday) as [Decision]
	   , format(i.DateSubmitted, ''d'', ''en-us'') AS [Date Submitted]
		, u.FirstName as [Inquirer Name], c.Name AS Country
		,CASE WHEN u.gender = 0 THEN ''Man'' ELSE ''Woman'' END AS Gender,i.Comments
		FROM  dbo.Inquiries AS i 
		INNER JOIN dbo.Users AS u ON u.UserID = i.UserID INNER JOIN
          dbo.Countries AS c ON c.Code = u.CountryCode AND c.LanguageCode = ''en'' INNER JOIN
          dbo.FormData AS ffd ON ffd.UserID = u.UserID AND ffd.FormFieldID = 3
	WHERE (i.DateSubmitted between convert(datetime,''' + @startdate + ''',20) and convert(datetime,''' + @enddate + ''',20)) AND (i.Comments IS NOT NULL) AND (i.Comments <> '''') '
    + @lang + ' ORDER BY i.DateSubmitted DESC'
	--select @sql

	execute sp_executesql @sql
END

GO
