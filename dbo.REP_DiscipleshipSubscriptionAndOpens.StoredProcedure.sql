USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[REP_DiscipleshipSubscriptionAndOpens]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[REP_DiscipleshipSubscriptionAndOpens]
	-- Add the parameters for the stored procedure here
	 @start nvarchar(40),
	  @end nvarchar(40)

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here



select 
--	ds.seriesid,
  ds.SeriesName as [Series Name]
  
  ,l.l_lang as Language
 -- ,ds.SeriesLength as [Sections In Series]
 ,cast(ds.SeriesLength as varchar(2)) + ' ' +  ds.Regularity + ' sections' as Frequency 
 ,subs.subscriptions As Subscriptions
 ,inq.Inquirers as [Inquirers This Language]
 ,100*subs.subscriptions / inq.Inquirers as [% Inquirers Subscribed]
 ,subs.subscriptions * ds.SeriesLength as [Sections Emailed]
 ,opens.opens as [Sections Openned]
 ,100*opens.opens/(subs.subscriptions * ds.SeriesLength ) [Percent of Sections Opened]
 from DiscipleshipSeries ds

left join (select dsuc.seriesid,count(*) as subscriptions from DiscipleshipSeriesUserConnection dsuc
	where dsuc.startdate >= @start and dsuc.startdate<=@end
	group by dsuc.seriesid ) subs on subs.SeriesID = ds.SeriesID
left join (select dsc.SeriesID,count(*) as opens from opencounter oc
	join DiscipleshipSeriesSections dsc on dsc.SectionID = oc.itemid
	where opentype='dl' and opendate >= @start and opendate<=@end
	group by dsc.SeriesID) opens on opens.SeriesID = ds.SeriesID
join l_codes l on l.l_id = ds.SeriesLanguage
left join (select l1.l_id as languageID ,count(*) as Inquirers from FormData fd
	join l_codes l1 on l1.l_code = fd.data 
	where FormFieldID = 3 and fd.createdate>=@start and fd.createdate<=@end
	group by l1.l_id) Inq on inq.languageID = ds.SeriesLanguage

 where ds.Active = 1
order by l.l_lang 

END

GO
