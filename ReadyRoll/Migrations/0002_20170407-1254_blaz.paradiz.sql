-- <Migration ID="62f708cc-48c6-494d-a3bc-6e7b9bed264b" />
GO

PRINT N'Creating [dbo].[Folder]'
GO
CREATE TABLE [dbo].[Folder]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (50) NOT NULL,
[Parent] [int] NULL
)
GO
PRINT N'Creating primary key [PK_Folder] on [dbo].[Folder]'
GO
ALTER TABLE [dbo].[Folder] ADD CONSTRAINT [PK_Folder] PRIMARY KEY CLUSTERED  ([Id])
GO
