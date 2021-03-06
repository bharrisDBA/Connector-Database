USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[importOneMessage]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[importOneMessage]
(
	@MessageID int,
	@FromUserID int,
	@ConversationID int,
	@Subject nvarchar(255),
	@Message nvarchar(max),
	@dateSent datetime,
	@ToUserID int
) 
AS
BEGIN
SET IDENTITY_INSERT [dbo].[Messages] ON
INSERT into messages (MessageID,FromUserID,ConversationID,Subject,Message,DateSent,MessageRead,ToUserID,MessageType) Values
(@Messageid,@fromuserID,@conversationid,@subject,@message,@dateSent,1,@touserID,1)
SET IDENTITY_INSERT [dbo].[Messages] OFF
END

GO
