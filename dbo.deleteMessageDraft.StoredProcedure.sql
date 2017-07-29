USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[deleteMessageDraft]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Keith Sorbo
-- Create date: 7/25/16
-- Description:	Deletes draft messages, i.e., those that do not have a conversation id
-- =============================================
CREATE PROCEDURE [dbo].[deleteMessageDraft]

	@UserID int,
	@InquirerID int

AS
BEGIN
	DELETE FROM EmailDrafts WHERE UserID = @UserID AND InquirerID = @InquirerID
END

GO
