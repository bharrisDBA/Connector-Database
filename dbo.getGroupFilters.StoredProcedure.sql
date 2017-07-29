USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getGroupFilters]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getGroupFilters] 
AS
BEGIN
	SELECT
	 FilterID, FilterName, FilterDescription, FormFieldID, FormFieldData, CreateDate, FilterType, Exclude, GroupID, 
                         GroupFilterID, FieldName
	FROM get_filter_by_group
END

GO
