USE [_connector]
GO
/****** Object:  View [dbo].[get_comments_for_sort]    Script Date: 8/16/2017 8:45:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[get_comments_for_sort]
AS
SELECT        dbo.TestimoniesOrPrayerNeeds.commentID, dbo.TestimoniesOrPrayerNeeds.UserID, dbo.TestimoniesOrPrayerNeeds.Comment, dbo.TestimoniesOrPrayerNeeds.commentType, dbo.Users.Gender, 
                         dbo.l_codes.l_lang, dbo.Users.CountryCode, dbo.Countries.Name, dbo.TestimoniesOrPrayerNeeds.Testimonies, dbo.TestimoniesOrPrayerNeeds.PrayerNeeds, dbo.TestimoniesOrPrayerNeeds.dateATime, 
                         dbo.TestimoniesOrPrayerNeeds.Language, dbo.Countries.LanguageCode, dbo.agwm.Region AS agwmregion
FROM            dbo.TestimoniesOrPrayerNeeds INNER JOIN
                         dbo.Users ON dbo.TestimoniesOrPrayerNeeds.UserID = dbo.Users.UserID INNER JOIN
                         dbo.Countries ON dbo.Users.CountryCode = dbo.Countries.Code INNER JOIN
                         dbo.l_codes ON dbo.TestimoniesOrPrayerNeeds.Language = dbo.l_codes.l_code INNER JOIN
                         dbo.agwm ON dbo.Countries.Code = dbo.agwm.CountryCode

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[48] 4[23] 2[24] 3) )"
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
         Begin Table = "TestimoniesOrPrayerNeeds"
            Begin Extent = 
               Top = 27
               Left = 26
               Bottom = 297
               Right = 284
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 108
               Left = 649
               Bottom = 455
               Right = 838
            End
            DisplayFlags = 280
            TopColumn = 12
         End
         Begin Table = "Countries"
            Begin Extent = 
               Top = 5
               Left = 948
               Bottom = 297
               Right = 1118
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "l_codes"
            Begin Extent = 
               Top = 140
               Left = 326
               Bottom = 391
               Right = 560
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "agwm"
            Begin Extent = 
               Top = 6
               Left = 322
               Bottom = 119
               Right = 492
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
         Column = 1440
         Alias' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'get_comments_for_sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N' = 900
         Table = 1170
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'get_comments_for_sort'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'get_comments_for_sort'
GO
