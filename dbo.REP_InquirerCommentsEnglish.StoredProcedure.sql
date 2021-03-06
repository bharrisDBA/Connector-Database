USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[REP_InquirerCommentsEnglish]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 10/28/16
-- Description:	Returns Inquirer Comments from English Inquirers.
-- =============================================
CREATE PROCEDURE [dbo].[REP_InquirerCommentsEnglish]
	-- Add the parameters for the stored procedure here
	@StartDate date,
	@EndDate date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  dbo.decisionTypeToEnglish(i.DecisionToday) as [Decision]
	   , format(i.DateSubmitted, 'd', 'en-us') AS [Date Submitted]
		--, u.FirstName as [Inquirer Name]
		, c.Name AS Country
		,CASE WHEN u.gender = 0 THEN 'Man' ELSE 'Woman' END AS Gender, i.Comments
		FROM  dbo.Inquiries AS i 
		INNER JOIN dbo.Users AS u ON u.UserID = i.UserID INNER JOIN
          dbo.Countries AS c ON c.Code = u.CountryCode AND c.LanguageCode = 'en' INNER JOIN
          dbo.FormData AS ffd ON ffd.UserID = u.UserID AND ffd.FormFieldID = 3
WHERE (i.DateSubmitted between convert(datetime,@startdate,20) and convert(datetime,@enddate,20) ) AND (i.Comments IS NOT NULL) AND (i.Comments <> '') AND (ffd.Data = 'en')
ORDER BY i.DateSubmitted DESC
END

GO
