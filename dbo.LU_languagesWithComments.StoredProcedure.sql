USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[LU_languagesWithComments]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
Create PROCEDURE [dbo].[LU_languagesWithComments]
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select u.PreferredLanguage as [key] ,l.l_lang
	-- + ' ('+cast(count(*) as varchar(6)) + ' comments all time)' 
	as [Value]  
	from users u 
	join inquiries i on u.userid=i.userid
	join l_codes l on l.l_code = u.PreferredLanguage
	where i.Comments<>''
	group by u.PreferredLanguage,l.l_lang
	order by l.l_lang asc
END

GO
