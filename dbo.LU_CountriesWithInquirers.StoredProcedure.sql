USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[LU_CountriesWithInquirers]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 2/17/17
-- Description:	Lookup Country codes where we have inquirers
-- =============================================
CREATE PROCEDURE [dbo].[LU_CountriesWithInquirers]
	-- Add the parameters for the stored procedure here
	AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select u.countrycode as [key],c.name as [value] from users u
		join countries c on c.Code = u.CountryCode and c.LanguageCode = 'en'
		group by countrycode,c.Name
		order by c.Name
END

GO
