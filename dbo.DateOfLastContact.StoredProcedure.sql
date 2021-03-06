USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[DateOfLastContact]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 10/6/16
-- Description:	Returns date of last contact between a connector and inquirer with In or Out
-- =============================================
CREATE PROCEDURE [dbo].[DateOfLastContact]
	-- Add the parameters for the stored procedure here
	@ConnectorID int,
	@InquirerID int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select top 1 max(datesent) as dolc,
		case when touserid=@ConnectorID then 'in' when touserid=@InquirerID then 'out' end as direct 
		from messages
		where (fromuserid = @ConnectorID and  ToUserID=@InquirerID) or (touserid = @ConnectorID and  FromUserID=@InquirerID) 
		group by FromUserID,ToUserID
		order by max(datesent) desc

END

GO
