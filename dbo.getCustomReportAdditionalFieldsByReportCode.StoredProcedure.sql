USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getCustomReportAdditionalFieldsByReportCode]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith sorbo
-- Create date: 7/27/16
-- Description:	Returns additonal fields for custom report in proper order
-- =============================================
CREATE PROCEDURE [dbo].[getCustomReportAdditionalFieldsByReportCode]
	-- Add the parameters for the stored procedure here
	@Reportcode nvarchar(10)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select custReportID, custReportElementtype,custReportField,custReportFieldName,custReportFieldRequired,custReportData from customReportElements 
			where custReportFieldOrder > 0 and custReportCode=@ReportCode order by CustReportFieldOrder
END

GO
