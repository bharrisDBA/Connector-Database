USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[REP_ResponsesAndInquirersByCountrySelectableByDate]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 10/28/16
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[REP_ResponsesAndInquirersByCountrySelectableByDate]
	-- Add the parameters for the stored procedure here
	@StartDate varchar(30),
	@EndDate varchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT  c.Name as [Country], CASE WHEN ev.responses IS NULL THEN 0 ELSE ev.responses END AS [Evangelism Responses], CASE WHEN iq.Inquirers IS NULL THEN 0 ELSE iq.Inquirers END AS Inquirers, 
                         format(CASE WHEN ev.responses > 0 THEN (CAST(100 * iq.Inquirers AS float) / CAST(ev.responses AS float)) ELSE 0 END, '###.#') AS [Response Rate]
FROM  dbo.Countries AS c LEFT OUTER JOIN
                             (SELECT        CountryCode, COUNT(*) AS responses
                               FROM            dbo.EvangelismResponseRecording AS err
                               WHERE        (visTime BETWEEN convert(datetime,@startdate,20) AND convert(datetime,@EndDate,20))
                               GROUP BY CountryCode) AS ev ON ev.CountryCode = c.Code LEFT OUTER JOIN
                             (SELECT        u.CountryCode, COUNT(*) AS Inquirers
                               FROM            dbo.Inquiries AS i INNER JOIN
                                                         dbo.Users AS u ON u.UserID = i.UserID
                               WHERE        (i.DateSubmitted BETWEEN convert(datetime,@startdate,20) AND convert(datetime,@EndDate,20))
                               GROUP BY u.CountryCode) AS iq ON iq.CountryCode = c.Code
WHERE        (c.LanguageCode = 'en')
ORDER BY c.Name
END

GO
