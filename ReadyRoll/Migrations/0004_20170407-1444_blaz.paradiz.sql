-- <Migration ID="fb0ac6c8-683e-408e-a8bd-e0a95a97e9d9" />
GO

PRINT N'Altering [dbo].[Folder]'
GO
ALTER TABLE [dbo].[Folder] ADD
[Newp] [bit] NULL
GO
