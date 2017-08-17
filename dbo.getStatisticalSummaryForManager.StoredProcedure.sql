USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getStatisticalSummaryForManager]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 4/3/17
-- Description:	Returns several statistics in a single row, for last 24 hours and last week.
-- =============================================
CREATE PROCEDURE [dbo].[getStatisticalSummaryForManager]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Declare @EmailSent24hrs int
	Declare @EmailSent168hrs int
	Declare @EmailSent30Days int

	Declare @MessagesFromInquirers24 int
	Declare @MessagesFromInquirers168 int
	Declare @MessagesFromInquirers30Days int

	Declare @MessagesFromConnectors24 int
	Declare @MessagesFromConnectors168 int
	Declare @MessagesFromConnectors30Days int

	Declare @InquirersLast24Hours int
	Declare @InquirersLastweek int
	Declare @InquirersLast30Days int

	Declare @ResponsesLast24Hours int
	declare @ResponsesLastWeek int
	declare @ResponsesLast30Days int

	declare @ConnectorsActiveIn24Hours int
	declare @ConnectorsActivein7Days int
	declare @ConnectorsActivein30Days int

	declare @UnansweredLessThan48Hours int
	declare @Unanswered48To96Hours int
	declare @Unanswered96To168Hours int
	declare @UnansweredOver168Hours int

select @EmailSent24Hrs = count(*) from emails where datetosend  between dateadd(hh,-24,GetDate()) and GetDate()
select @EmailSent168Hrs = count(*) from emails where datetosend  between dateadd(hh,-168,GetDate()) and GetDate()
select @EmailSent30Days = count(*) from emails where datetosend  between dateadd(dd,-30,GetDate()) and GetDate()

select @MessagesFromConnectors24 =  count(*) from messages m
   join users u on u.userid = m.FromUserID 
   where u.UserTypeID >100 and datesent between dateadd(hh,-24,GetDate()) and GetDate()
select @MessagesFromConnectors168 = count(*) from messages m
   join users u on u.userid = m.FromUserID 
   where u.UserTypeID >100 and datesent between dateadd(hh,-168,GetDate()) and GetDate()
select @MessagesFromConnectors30Days = count(*) from messages m
   join users u on u.userid = m.FromUserID 
   where u.UserTypeID >100 and datesent between dateadd(dd,-30,GetDate()) and GetDate()

select @MessagesFromInquirers24 =  count(*) from messages m
   join users u on u.userid = m.FromUserID 
   where u.UserTypeID =100 and datesent between dateadd(hh,-24,GetDate()) and GetDate()
select @MessagesFromInquirers168 = count(*) from messages m
   join users u on u.userid = m.FromUserID 
   where u.UserTypeID =100 and datesent between dateadd(hh,-168,GetDate()) and GetDate()
select @MessagesFromInquirers30Days = count(*) from messages m
   join users u on u.userid = m.FromUserID 
   where u.UserTypeID =100 and datesent between dateadd(dd,-30,GetDate()) and GetDate()

select @ResponsesLast24Hours = sum(case when datediff(hh,vistime,getdate())<=24 then 1 else 0 end)
	,@responsesLastWeek = sum(case when datediff(hh,vistime,getdate())<=168 then 1 else 0 end)
	,@responsesLast30Days = sum(case when datediff(dd,vistime,getdate())<=30 then 1 else 0 end)
	from EvangelismResponseRecording
	where vistime between dateadd(dd,-30,GetDate()) and GetDate()

select @InquirersLast24Hours = sum(case when datediff(hh,fd.createdate,getdate())<=24 then 1 else 0 end)
	,@inquirerslastweek= sum(case when  datediff(hh,fd.createdate,getdate())<=168 then 1 else 0 end) 
	,@inquirerslastweek= sum(case when  datediff(hh,fd.createdate,getdate())<=168 then 1 else 0 end) 
	,@inquirerslast30days= sum(case when  datediff(dd,fd.createdate,getdate())<=30 then 1 else 0 end) 
 from formdata fd 
   where fd.FormFieldID = 12 and createdate between dateadd(dd,-30,getdate()) and getdate()

select @ConnectorsActiveIn24Hours = count(*)  from 
(select m.FromUserID from messages m join users u on u.userid = m.FromUserID and u.UserTypeID > 100 
   where m.DateSent between dateadd(hh,-24,getdate()) and getdate() group by m.FromUserID) as active
select @ConnectorsActiveIn7Days = count(*)  from 
(select m.FromUserID from messages m join users u on u.userid = m.FromUserID and u.UserTypeID > 100 
   where m.DateSent between dateadd(hh,-168,getdate()) and getdate() group by m.FromUserID) as active
select @ConnectorsActivein30Days = count(*)  from 
(select m.FromUserID from messages m join users u on u.userid = m.FromUserID and u.UserTypeID > 100 
   where m.DateSent between dateadd(dd,-30,getdate()) and getdate() group by m.FromUserID) as active

select @UnansweredLessThan48Hours = sum(lessthan48)
	,@Unanswered48To96Hours =  sum(h48to96)
	,@Unanswered96To168Hours =  sum(h96to168)
	,@UnansweredOver168Hours =  sum(over168) 
	 from 
		(select 
			--c.conversationid,c.LastMessageDate,c.LastAuthorID,c.lastrecipientid 
		case when datediff(hh,lastmessagedate,getdate())<48 then 1 else 0 end as LessThan48
		,case when datediff(hh,lastmessagedate,getdate())>=48 and datediff(hh,lastmessagedate,getdate()) <96   then 1 else 0 end as H48to96
		,case when datediff(hh,lastmessagedate,getdate())>96 and datediff(hh,lastmessagedate,getdate()) <168 then 1 else 0 end as h96to168
		,case when datediff(hh,lastmessagedate,getdate())>168 then 1 else 0 end as Over168 
		from Conversation c
		join FolderAssignments fa on fa.ConversationID = c.ConversationID  
		join MessagesFolders mf on mf.FolderID = fa.FolderID
		join users u on u.userid = c.LastAuthorID
		where u.UserTypeID = 100 and mf.userid<> c.LastAuthorID and mf.FolderName = 'Inbox' ) t

select @EmailSent24hrs as [EmailSentInLast24Hours] 
	,@EmailSent168hrs as EmailSentInLast7Days
	,@EmailSent30Days as EmailSentInLast30Days
	,@MessagesFromConnectors24 as MessagesFromConnectorsInLast24Hrs
	,@MessagesFromConnectors168 as MessagesFromConnectorsInLast168Hrs
	,@MessagesFromConnectors30Days as MessagesFromConnectorsInLast30Days
	,@MessagesFromInquirers24 as MessagesFromInquirersInLast24Hrs
	,@MessagesFromInquirers168 as MessagesFromInquirersInLast168Hrs
	,@MessagesFromInquirers30Days as MessagesFromInquirersInLast30Days
	,@ResponsesLast24Hours as ResponsesLast24Hours
	,@ResponsesLastWeek as ResponsesLastWeek
	,@ResponsesLast30Days as ResponsesLast30Days
	,@InquirersLast24Hours as InquirersLast24Hours
	,@InquirersLastweek as InquirersInTheLastWeek
	,@InquirersLast30Days as InquirersInTheLast30Days
	,@ConnectorsActiveIn24Hours as ConnectorsActive24Hrs
	,@ConnectorsActivein7Days as ConnectorsActive7Days
	,@ConnectorsActivein30Days as ConnectorsActive30Days
	,@UnansweredLessThan48Hours as UnansweredLessThan48Hours
	,@Unanswered48To96Hours as Unanswered48To96Hours
	,@Unanswered96To168Hours as Unanswered96To168Hours
	,@UnansweredOver168Hours as UnansweredOver168HOurs

END

GO
