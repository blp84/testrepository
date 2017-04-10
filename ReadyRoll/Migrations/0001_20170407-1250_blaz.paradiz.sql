-- <Migration ID="f192ab04-385a-4843-8aa4-f18305bb8667" />
GO

PRINT N'Creating [dbo].[Department]'
GO
CREATE TABLE [dbo].[Department]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Name] [nvarchar] (50) NULL,
[Location] [nvarchar] (50) NULL
)
GO
PRINT N'Creating primary key [PK_Department] on [dbo].[Department]'
GO
ALTER TABLE [dbo].[Department] ADD CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Creating [dbo].[User]'
GO
CREATE TABLE [dbo].[User]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Username] [nvarchar] (50) NULL,
[Name] [nvarchar] (50) NULL,
[Email] [nvarchar] (50) NULL,
[DepartmentId] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_User] on [dbo].[User]'
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED  ([Id])
GO
PRINT N'Adding foreign keys to [dbo].[User]'
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [FK_User_Department] FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([Id])
GO
