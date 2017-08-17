USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getResponseTemplateForInquirer]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 2/10/17
-- Description:	Returns the response template for this inquirer
-- =============================================
CREATE PROCEDURE [dbo].[getResponseTemplateForInquirer]
	-- Add the parameters for the stored procedure here
	@UserID int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here

	declare @language varchar(2)
	declare @decisiontype int

	IF OBJECT_ID('tempdb..#Template_lookup') IS NOT NULL
	  /*Then it exists*/
	  DROP TABLE #template_lookup

	IF OBJECT_ID('tempdb..#Template_lookup2') IS NOT NULL
	  /*Then it exists*/
	  DROP TABLE #Template_lookup2

	select @language=u.preferredlanguage,@decisiontype=i.DecisionToday from users u
	join Inquiries i on i.userid=u.userid
	where u.userid = @userid 

	select templateid, templateName,decisiontype,LanguageID,lc.l_code,f.FilterID,case when f.FormFieldID is null then 0 else f.formfieldid end as formfieldID,f.FormFieldData,f.FilterName 
	into #Template_lookup
	from ResponseTemplate rt
	join l_codes lc on lc.l_id=rt.LanguageID 
	left join Filter f on f.FilterID = rt.FilterID
	where lc.l_code = @language and rt.DecisionType = @decisiontype

	Declare @DefaultTemplateID int
	select @DefaultTemplateID = templateID from #Template_lookup where formfieldid = 0

	if @DefaultTemplateID is null
		begin
			select @DefaultTemplateID = templateid from ResponseTemplate where decisiontype = @decisiontype and isdefault = 1
		end

	-- select * from #Template_lookup

	select userid,formfieldid,data into #Template_lookup2 from formdata where userid=@userid and formfieldid in (select formfieldid from #Template_lookup)

	--select * from #Template_lookup2
	Declare @SelectedTemplate int

	select  top 1 @SelectedTemplate=templateid from #Template_lookup t1 
		join #Template_lookup2 t2 on t2.FormFieldID=t1.formfieldid 
		where t2.data in (t1.formfielddata)

	if @SelectedTemplate is null
		begin
			set @SelectedTemplate = @DefaultTemplateID
		end

	select * from ResponseTemplate where templateid = @SelectedTemplate


END

GO
