USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[insertEmail]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertEmail] 
(
	@Subject nvarchar(255),
	@Body nvarchar(max),
	@ToEmail nvarchar(max),
	@FromEmail nvarchar(max),
	@SendDate datetime,
	@TextBody nvarchar(MAX),
	@Notation varchar(50)
) 
AS BEGIN 
INSERT INTO Emails 
(
	Subject,
	Body,
	DateSubmitted,
	EmailFrom,
	EmailTo,
	DateToSend,
	textBody,
	notation
) VALUES 
(
	@Subject,
	@Body,
	CURRENT_TIMESTAMP,
	@FromEmail,
	@ToEmail,
	@SendDate,
	@TextBody,
	@notation
) END
GO
