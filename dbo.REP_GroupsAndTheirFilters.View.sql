USE [_connector]
GO
/****** Object:  View [dbo].[REP_GroupsAndTheirFilters]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[REP_GroupsAndTheirFilters]
AS
SELECT        TOP (5000) dbo.Groups.GroupName AS [Group Name], dbo.Filter.FilterName AS [Filter Name], CASE [FilterType] WHEN 1 THEN 'Standard' WHEN 2 THEN 'Force' WHEN 3 THEN 'Trump' ELSE '' END AS [Filter Type],
                          dbo.GroupFilter.Exclude AS [Exclude?], dbo.FormFields.DisplayName + '=' + dbo.Filter.FormFieldData AS [Filter Values], dbo.Groups.ExpirationTime AS [Hours Before Forwarding], 
                         Groups_1.GroupName AS [Forward To]
FROM            dbo.Groups INNER JOIN
                         dbo.GroupFilter ON dbo.Groups.GroupID = dbo.GroupFilter.GroupID INNER JOIN
                         dbo.Filter ON dbo.GroupFilter.FilterID = dbo.Filter.FilterID INNER JOIN
                         dbo.FormFields ON dbo.Filter.FormFieldID = dbo.FormFields.FormFieldID LEFT OUTER JOIN
                         dbo.Groups AS Groups_1 ON dbo.Groups.ForwardGroupID = Groups_1.GroupID
ORDER BY [Group Name], [Filter Name]

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[27] 4[35] 2[16] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Groups"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 220
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "GroupFilter"
            Begin Extent = 
               Top = 6
               Left = 258
               Bottom = 260
               Right = 428
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Filter"
            Begin Extent = 
               Top = 6
               Left = 466
               Bottom = 136
               Right = 641
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "FormFields"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Groups_1"
            Begin Extent = 
               Top = 6
               Left = 679
               Bottom = 136
               Right = 861
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 4710
         Alias = 4470
     ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'REP_GroupsAndTheirFilters'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'    Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'REP_GroupsAndTheirFilters'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'REP_GroupsAndTheirFilters'
GO
