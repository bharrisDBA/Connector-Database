USE [_connector]
GO
/****** Object:  View [dbo].[get_conversation_members]    Script Date: 7/28/2017 10:17:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[get_conversation_members]
AS
SELECT        dbo.ConversationType.ConversationTypeID, dbo.ChatMembers.ChatMembersID, dbo.ChatMembers.UserID, dbo.Users.UserName, dbo.Users.UserTypeID, dbo.Users.FirstName, dbo.Users.LastName, 
                         dbo.Users.Gender, dbo.Users.DateOfBirth, dbo.Users.Address, dbo.Users.City, dbo.Users.StateProvince, dbo.Users.Zip, dbo.Users.CountryCode, dbo.Users.Email, dbo.Users.Phone, dbo.Users.DateCreated, 
                         dbo.Users.DateJoined, dbo.Users.NickName, dbo.Users.EmailNotification, dbo.Users.PreferredLanguage, dbo.Users.FluentLanguages, dbo.Conversation.ConversationID
FROM            dbo.Conversation INNER JOIN
                         dbo.ConversationType ON dbo.Conversation.ConversationTypeID = dbo.ConversationType.ConversationTypeID INNER JOIN
                         dbo.ChatMembers ON dbo.Conversation.ConversationID = dbo.ChatMembers.ConversationID INNER JOIN
                         dbo.Users ON dbo.ChatMembers.UserID = dbo.Users.UserID

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[52] 4[18] 2[12] 3) )"
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
         Begin Table = "Conversation"
            Begin Extent = 
               Top = 3
               Left = 248
               Bottom = 99
               Right = 444
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ConversationType"
            Begin Extent = 
               Top = 6
               Left = 470
               Bottom = 102
               Right = 666
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ChatMembers"
            Begin Extent = 
               Top = 2
               Left = 26
               Bottom = 115
               Right = 201
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Users"
            Begin Extent = 
               Top = 132
               Left = 277
               Bottom = 269
               Right = 466
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
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
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
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'get_conversation_members'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'get_conversation_members'
GO
