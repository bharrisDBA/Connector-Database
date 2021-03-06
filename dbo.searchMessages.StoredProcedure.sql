USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[searchMessages]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 5/4/17
-- Description:	Returns conversations/messages where search term is found in name, comment or a messages
-- =============================================
CREATE  PROCEDURE [dbo].[searchMessages]
	 @ConnectorId int ,
	 @searchString nvarchar(500),
	 @lang nvarchar(10) = 'en'
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
select  u.firstname as InquirerName
	,u.countrycode
	,c.Name as Country
	,coalesce(fd.data,'') as InquirerComment
	,cm.ConversationID
	,coalesce(m.Subject,'') as Subject
--	,m.ToUserID
--	,m.FromUserID
	,m.DateSent
	,coalesce(m.Message,'') as Message
	,fldr.FolderName
	,case when (m.fromuserid = 1) then 'Me' else u.firstname end as Author
 from users u
join Inquiries i on i.UserID = u.userid
left join formdata fd on fd.UserID = u.userid and fd.FormFieldID = 8
join chatmembers cm on cm.userid=u.userid
join messages m on m.ConversationID = cm.ConversationID
join (select mf.foldername,mf.userid,fa.folderid,conversationid from FolderAssignments fa
join MessagesFolders mf on mf.FolderID = fa.FolderID) fldr on fldr.ConversationID = cm.ConversationID and fldr.userid = @ConnectorId
join countries c on c.Code = u.CountryCode and c.LanguageCode = @lang
where i.ProcessorID = @ConnectorId
and 
(u.firstname like '%' + @searchString + '%' or fd.data like '%' + @searchString + '%' or m.Message like '%' + @searchString + '%')

order by m.datesent desc 

END

GO
