USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[DeleteUserCompletely]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 7/30/16
-- Description:	Delete User
-- =============================================
CREATE PROCEDURE [dbo].[DeleteUserCompletely]
	 @UserId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON

    -- Insert statements for procedure here
	declare @userEmail as nvarchar(100);
	select @userEmail=email from users where userid=@userid;
	delete from emails where EmailTo = @userEmail or EmailFrom = @userEmail;
	delete from users where userid=@Userid;
	delete from FormData where userid=@userid;
	delete from GroupQueue where userid=@userid;
	delete from inquiries where userid=@userId;
	delete from Notifications where UserID=@UserId;
	delete from TeamAssignment where UserID=@UserId;
	delete from Messages where FromUserID=@UserId or TouserId=@UserID;
	delete from TempQueue where ConnectorID=@UserId or InquirerID=@userID;
	delete from User121Application where UserID=@UserId;
	delete from User121Extension where UserID=@UserId;


END

GO
