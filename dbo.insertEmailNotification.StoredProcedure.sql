USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[insertEmailNotification]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 7/27/16
-- Description:	Inserts a notification into the notifications table
-- =============================================
CREATE PROCEDURE [dbo].[insertEmailNotification]
	-- Add the parameters for the stored procedure here
	@Userid int,
	@Subject nvarchar(100),
	@Body nvarchar(max),
	@Type nvarchar(15)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	INSERT INTO Notifications (UserID, subject, body,[type]) Values(@UserID,@Subject,@Body,@Type)
END

GO
