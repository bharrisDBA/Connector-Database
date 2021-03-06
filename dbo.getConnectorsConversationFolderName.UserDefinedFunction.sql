USE [_connector]
GO
/****** Object:  UserDefinedFunction [dbo].[getConnectorsConversationFolderName]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 1/31/17
-- Description:	Returns the folder name for this conversation for the connector involved
-- =============================================
CREATE FUNCTION [dbo].[getConnectorsConversationFolderName]
(
	-- Add the parameters for the function here
	@ConversationID int
)
RETURNS nvarchar(50)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @FolderName nVarChar(50)

	-- Add the T-SQL statements to compute the return value here
	select @foldername= foldername from FolderAssignments fa
	 join MessagesFolders mf on mf.FolderID = fa.FolderID
	 join users u on u.userid=mf.userid
	 where ConversationID = @ConversationID and usertypeid >100		
	-- Return the result of the function
	RETURN @foldername

END

GO
