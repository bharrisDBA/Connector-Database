USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getUserIdByEmail]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getUserIdByEmail] (@Email nvarchar(64)) AS SELECT UserID FROM Users WHERE Email = @Email
GO
