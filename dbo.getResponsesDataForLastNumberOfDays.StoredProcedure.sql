USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getResponsesDataForLastNumberOfDays]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 3/7/17
-- Description:	Returns the evangelism responses from the last number of days
-- =============================================
CREATE PROCEDURE [dbo].[getResponsesDataForLastNumberOfDays]
	-- Add the parameters for the stored procedure here
	@NumberOfDays int = 7
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT visTime
	,regionname
	,city
	,countryname
      ,[Latitude]
      ,[Longitude]
	  ,siteOfOrigin
	  ,docURL
  FROM [_connector].[dbo].[EvangelismResponseRecording]

  where datediff(dd,vistime,GETDATE())<= @NumberOfDays
  order by vistime desc 
END

GO
