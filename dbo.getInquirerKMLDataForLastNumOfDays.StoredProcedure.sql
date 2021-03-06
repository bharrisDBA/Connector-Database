USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getInquirerKMLDataForLastNumOfDays]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	Gets data needed to build a KML entry
-- =============================================
CREATE PROCEDURE [dbo].[getInquirerKMLDataForLastNumOfDays]
	-- Add the parameters for the stored procedure here
	@days int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT i.userid,
      [DecisionToday]
      ,[DateSubmitted]
	  ,i.IpAddress
	  ,u.gender
	  ,u.city
	  ,case when gr.RegionName is null then '' else gr.RegionName end as StateProvince
	  ,c.Name as CountryName
      ,fd1.data as latitude
	  ,fd2.data as longitude
  FROM [_connector].[dbo].[Inquiries] i
  join users u on u.userid=i.userid
  join Countries c on c.Code = u.CountryCode and c.LanguageCode = 'en'
  left join GeoRegionCodes gr on gr.CountryCode = u.CountryCode and gr.region = u.StateProvince
  join formdata fd1 on fd1.userid=i.userid  and fd1.Formfieldid = 30
  join formdata fd2 on fd2.userid=i.userid  and fd2.FormFieldID = 31
  where datediff(day,datesubmitted,getdate()) <=  @days and DecisionToday is not null

  order by datesubmitted desc
END

GO
