USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[recordDiscipleshipLessonEmailOpen]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 2/3/17
-- Description:	Accepts a 32 char hash and records an open in the opencount table if the hash matches 
--              a sectionhash in the discipleshipseriessecsion table.
-- =============================================
CREATE PROCEDURE [dbo].[recordDiscipleshipLessonEmailOpen]
	-- Add the parameters for the stored procedure here
	@sectionhash varchar(32)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	Declare @sectionid int

	select @sectionid = sectionid from DiscipleshipSeriesSections where sectionhash = @sectionhash

	if @sectionid > 0 
	   begin
			insert into OpenCounter (Opendate,opentype,itemid) Values(getdate(),'dl',@sectionid)
	   end
END

GO
