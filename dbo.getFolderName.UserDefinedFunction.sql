USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[getFolderName]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	Gets the name of the folder where the conversation is stored for this user
-- =============================================
CREATE FUNCTION [dbo].[getFolderName] 
(
	-- Add the parameters for the function here
	@Conversationid int,
	@UserID int
)
RETURNS nvarchar(40)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @FolderName nvarchar(40)

	-- Add the T-SQL statements to compute the return value here
	SELECT @Foldername =  foldername
  FROM [_connector].[dbo].[MessagesFolders] mf
  join FolderAssignments fa on fa.FolderID = mf.FolderID

  where @Conversationid = fa.ConversationID and mf.userid = @userid

	-- Return the result of the function
	RETURN @FolderName

END

GO
