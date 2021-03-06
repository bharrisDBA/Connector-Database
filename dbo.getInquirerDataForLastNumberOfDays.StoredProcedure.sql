USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getInquirerDataForLastNumberOfDays]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 3/7/17
-- Description:	Gets basic inquirer data for the last number of days
-- basically designed to be used by the project100million map.html page (buildjson.php)
-- =============================================
CREATE PROCEDURE [dbo].[getInquirerDataForLastNumberOfDays]
	-- Add the parameters for the stored procedure here
	@NumberOfDays int = 7,
	@Language nvarchar(2) = 'en'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT 
      [DateSubmitted]
	  ,[DecisionToday]
      ,u.city
	  ,fd3.data as regionname
	  ,c.Name as Countryname
	  ,fd1.Data as Latitude
	  ,fd2.data as Longitude,
	  i.FirstContactURL
      ,[IpAddress]
   --  ,datediff(dd,i.datesubmitted,GETDATE())
  FROM [_connector].[dbo].[Inquiries] i
 join users u on u.userid=i.userid
 join formdata fd1 on fd1.userid=i.userid and fd1.FormFieldID = 30  -- latitude
 join formdata fd2 on fd2.userid=i.userid and fd2.FormFieldID = 31  -- longitude
 join formdata fd3 on fd3.userid=i.userid and fd3.FormFieldID = 28  -- regionname
 join Countries c on c.Code = u.CountryCode and c.LanguageCode = @Language
  where datediff(dd,i.datesubmitted,GETDATE())<=@NumberOfDays

 order by DateSubmitted desc
END

GO
