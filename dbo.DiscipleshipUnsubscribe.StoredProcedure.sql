USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[DiscipleshipUnsubscribe]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 8/3/16
-- Description:	Removes inquirer from subscription and emails to go out
-- =============================================
CREATE PROCEDURE [dbo].[DiscipleshipUnsubscribe]
	-- Add the parameters for the stored procedure here
	@seriesid int,
	@userid int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @tomorrow datetime, @email nchar(150);
set @tomorrow = dateadd(d, datediff(d, 0, getdate()) + 1, 0);
select @email= email from users where userid=@userid

delete from DiscipleshipSeriesUserConnection where seriesid = @SeriesID and userid = @userID;
delete from emails where datetosend>= @tomorrow and  emailto = @email and notation = 'Sub:' + cast(@userid as varchar) + '|' + cast(@seriesid as varchar)
END

GO
