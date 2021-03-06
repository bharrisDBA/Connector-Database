USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[REP_GetRecentlyApprovedConnectorApplications]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[REP_GetRecentlyApprovedConnectorApplications]
	-- Add the parameters for the stored procedure here
	@Days int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select  u.userid,u.firstname,u.lastname,u.email,u.dateofbirth,u.address,u.city,u.stateprovince
		,u.CountryCode,dbo.LanguageName(u.PreferredLanguage,'en') as [Interface Language], format(ua.dateprocessed,'d','en-US') as Approved from user121application ua
		join users u on u.userid=ua.userid
		where ua.status=2 and dateprocessed > dateadd(day, -1 * @Days ,getdate()) order by dateprocessed desc 
END

GO
