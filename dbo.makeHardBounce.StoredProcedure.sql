USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[makeHardBounce]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: <Create Date,,>
-- Description:	Sets a user to hard bounce status, removes from all queues
-- =============================================
CREATE PROCEDURE [dbo].[makeHardBounce]
	@Userid int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	declare @email nvarchar(60)
	select @email=email from users where userid=@userid
	update users set HardBounces = 1 ,status = 3 where userid = @userid;
	delete from globalqueue where userid = @userid;
	delete from TempQueue where inquirerid = @userid;
	delete from emails where emailto=@email and sent=0
END

GO
