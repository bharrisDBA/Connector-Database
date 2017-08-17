USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getTestimonyPrayerUsage]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 2/8/17
-- Description:	Gets language fields if an inquiry has been used as a testimony or prayer need
-- =============================================
CREATE PROCEDURE [dbo].[getTestimonyPrayerUsage]
	-- Add the parameters for the stored procedure here
	@Userid int
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT userid,
  case when (testimonies = '') then '' else language end  as testm, 
  case when (prayerneeds = '') then '' else  language  end as prayern
  FROM [_connector].[dbo].[TestimoniesOrPrayerNeeds]  where (testimonies <> '' or prayerneeds <> '')   and userid=@UserID
END

GO
