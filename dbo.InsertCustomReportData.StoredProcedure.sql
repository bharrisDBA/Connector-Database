USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[InsertCustomReportData]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 7/28/16
-- Description:	Inserts 1 record into custrom report data table
-- =============================================
CREATE PROCEDURE [dbo].[InsertCustomReportData]
	-- Add the parameters for the stored procedure here
	 @ReportID int,
	 @UserID int,
	 @FieldData text
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	Insert into CustomReportData (custReportID,UserId,CustReportData) Values(@ReportID,@UserID,@FieldData)
END

GO
