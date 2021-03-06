USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[sendMessage]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sendMessage]
(
	@FromUserID int,
	@ToUserID int,
	@ConversationID int,
	@Subject nvarchar(255) = NULL,
	@Message nvarchar(MAX),
	@Read bit
)
AS 
BEGIN 
INSERT INTO Messages
(
	FromUserID,
	ToUserID,
	ConversationID,
	[Subject],
	[Message],
	MessageRead
)
VALUES
(
 	@FromUserID,
	@ToUserID,
	@ConversationID,
	@Subject,
	@Message,
	@Read
)
END
GO
