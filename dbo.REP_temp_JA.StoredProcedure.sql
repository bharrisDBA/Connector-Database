USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[REP_temp_JA]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[REP_temp_JA]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select 
	DateCreated
	,dbo.DecisionTypeToEnglish(fddt.data) as Decision,coalesce(c.Name,'Unknown') as country
	,case when u.gender = 0 then 'Male' else 'Female' end as Gender
	,fdtl.data as Issue
	,coalesce( fdsb.SeriesName,'') as subscription
	,coalesce(fdcm.data,'') as Comment 
from users u
left join formdata fdso on fdso.userid=u.userid and fdso.FormFieldID = 12 -- site of origin
left join formdata fddt on fddt.userid = u.userid and fddt.FormFieldID = 7 -- Decision type
left join formdata fdtl on fdtl.userid = u.userid and fdtl.FormFieldID = 37 -- Isue page
left join formdata fdcm on fdcm.userid = u.userid and fdcm.FormFieldID = 8 -- Comment
left join countries c on c.Code = u.CountryCode and c.LanguageCode = 'en'
left join 
	(select fd1.userid,data as id,ds.seriesname from formdata fd1 join DiscipleshipSeries ds on ds.SeriesID = fd1.data 
where fd1.formfieldid = 38) fdsb on fdsb.UserID = u.userid 	-- Subscription
where u.DateCreated between '2016-11-01 00:00:00' and '2017-04-30 23:59:59'
and PreferredLanguage = 'en'
and usertypeid = 100
and (fdso.data like 'journeyanswers.com' or fdso.data ='JA')

order by DateCreated asc
END

GO
