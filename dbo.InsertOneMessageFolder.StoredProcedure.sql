USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[InsertOneMessageFolder]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith
-- Create date: 8/16/16
-- Description:	Safely Inserts on folder. Done this way to avoid ' in names
-- =============================================
CREATE PROCEDURE [dbo].[InsertOneMessageFolder]
	-- Add the parameters for the stored procedure here
	@FolderID int,
	@FolderName nvarChar(50),
	@UserID int,
	@Permanent int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SET IDENTITY_INSERT [dbo].[MessagesFolders] ON;
	 Insert into MessagesFolders (FolderID,FolderName,UserID,Permanent)
     values(@FolderID, @FolderName,@UserID,@Permanent) ;
	SET IDENTITY_INSERT [dbo].[MessagesFolders] OFF
END

GO
