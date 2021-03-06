USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getInquirers]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 4/13/17
-- Description:	Returns a list of inquirers. Generally used with a filter by connector
-- =============================================
CREATE PROCEDURE [dbo].[getInquirers]
	-- Add the parameters for the stored procedure here
	    -- Insert statements for procedure here
	 @wherestr nvarchar(1500),  -- additional clauses for the where string
	 @sortColumn nvarchar(50) = 'dateSubmitted',  -- column to sort on
	 @sortOrder nvarchar(5) = 'desc',  -- order of the sorted column asc or desc
	 @lang nvarchar(2) = NULL,  -- language that the country names will be presented in
	 @offset int = 0, -- offset from top
	 @get int = 50  -- rows to show
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


-- InquiryID, UserID, Comments, DecisionToday, DateSubmitted, FirstContactURL, IpAddress, ProcessorID, ConnectorID, 
--	 conFirstname,conLastName, FirstName, LastName, countryName, Password

declare @sql nvarchar(2000) = ''
declare @otherWhere nvarchar(1500) =''
if @wherestr  is not null 
begin
   set @otherWhere = ' and ' + @wherestr + ' '
end
declare @langwhere nvarchar(150) = '1=1 '
if @lang is not null
   begin
       set @langwhere = ' c.languagecode = ''' + @lang + '''' ;
   end
set @sql = 'select inquiryid,i.userid,fd.data as comments,decisiontoday,i.DateSubmitted,i.FirstContactURL,i.ipaddress,i.ProcessorID 
	,u2.FirstName as conFirstName,u2.LastName as conlastName,u1.FirstName,u1.lastname,c.Name ,u2.password,i2.connectorID
	,c.name as countryname
	,ci.ConversationID,dbo.isConversationUnanswered(ci.conversationid) as IsUnanswered
	,dbo.DateOfLastMessageInConversation(ci.ConversationID) as dateOflastCommunication
	 from inquiries i 
	 join (select userid,processorid  as connectorid from inquiries) i2 on i2.userid = i.userid
	 left join formdata fd on fd.UserID = i.userid and fd.FormFieldID = 8 
	 left join users u1 on u1.userid = i.UserID 
	 left join users u2 on u2.userid = i.ProcessorID 
	 left join Countries c on c.Code = u2.countrycode
	  join (SELECT userid,[ConversationID] FROM [_connector].[dbo].[ChatMembers]) ci on ci.UserID = i.userid
	 where  ' + @langwhere +  @otherWhere +
	 ' order by ' +@sortColumn + ' ' + @sortOrder   +
     ' Offset '+ convert(nvarchar(15),@offset) + ' rows fetch next ' + convert(nvarchar(15), @get) + ' rows only '

exec (@sql)
END

GO
