USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[GetCustomApplicationDataByUserID]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 7/28/16
-- Description:	GetCustomApplicationDataByUser
-- =============================================
CREATE PROCEDURE [dbo].[GetCustomApplicationDataByUserID]
	-- Add the parameters for the stored procedure here
	@UserId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select CustomReportElements.custReportFieldName as FieldName
			,CustomReportElements.custReportElementType as ElementType
		   ,CustomReportData.custReportData as FieldData
		   ,CustomReportElements.custReportCode as ReportCode	
		 from CustomReportData
		join CustomReportElements on CustomReportElements.custReportId=CustomReportData.custReportID
		where CustomReportData.UserID = @UserId
		order by CustomReportElements.custReportFieldOrder asc
END

GO
