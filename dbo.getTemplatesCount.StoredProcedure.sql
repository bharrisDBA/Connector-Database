USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getTemplatesCount]    Script Date: 8/16/2017 8:45:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getTemplatesCount]
AS
BEGIN
SELECT Count(*) As ResultCount FROM ResponseTemplate
END
GO
