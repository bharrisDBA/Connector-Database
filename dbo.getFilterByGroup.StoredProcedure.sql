USE [_connector]
GO
/****** Object:  StoredProcedure [dbo].[getFilterByGroup]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[getFilterByGroup]
(
	@GroupID int
)
AS
BEGIN
  SELECT
  FilterID, FilterName, FilterDescription, FormFieldID, FormFieldData, CreateDate, FilterType, Exclude,
  GroupID, GroupFilterID, FieldName
  FROM get_filter_by_group
  WHERE GroupID = @GroupID
END
GO
