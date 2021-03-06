USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getInquirers2]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 4/13/17
-- Description:	Returns a list of inquirers. Generally used with a filter by connector
-- =============================================
CREATE PROCEDURE [dbo].[getInquirers2]
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

if @lang is null
   begin
       set @lang = 'en';
   end
-- this "double select" was done to isolate the field names on the original tables.
-- because I was using the same table many times (users).
-- the where string passed in needs to be able to access aliases.
set @sql = 'select * from 
	(select inquiryid
	,i.userid
	,fd.data as comments
	,decisiontoday
	,i.DateSubmitted
	,i.DateProcessed
	,i.FirstContactURL
	,i.ipaddress
	,i.ProcessorID 
	,u2.FirstName as conFirstName
	,u2.LastName as conlastName
	,u2.Firstname + '' ''+u2.Lastname as conFullName
	,u1.FirstName 
	,u1.lastname
	,c.Name
	,u2.password
	,i2.connectorID
	,c.name as countryname
	,ci.ConversationID
	,case when u3.usertypeid=100 then 1 else 0 end as IsUnanswered
	,conv.LastMessageDate as dateOflastCommunication
	,''' + @lang + ''' as languagecode
	 from inquiries i 
	 join (select userid,processorid  as connectorid from inquiries) i2 on i2.userid = i.userid
	 left join formdata fd on fd.UserID = i.userid and fd.FormFieldID = 8 
	 left join users u1 on u1.userid = i.UserID 
	 left join users u2 on u2.userid = i.ProcessorID 
	 left outer join Countries c on c.Code = u1.countrycode and c.languagecode = ''' + @lang + ''''+
	 ' join (SELECT userid,[ConversationID] FROM [_connector].[dbo].[ChatMembers]) ci on ci.UserID = i.userid
	  join conversation conv on conv.conversationid = ci.conversationid
	  join users u3 on u3.userid = conv.lastauthorid  ) main
	 where  ' +  @wherestr +
	 ' order by ' +@sortColumn + ' ' + @sortOrder   +
     ' Offset '+ convert(nvarchar(15),@offset) + ' rows fetch next ' + convert(nvarchar(15), @get) + ' rows only ';

 --insert into tmpMiscData (dateentered,entrytype,entry) values(getdate(),'GetInquirers2',@sql);

exec (@sql)
END

GO
