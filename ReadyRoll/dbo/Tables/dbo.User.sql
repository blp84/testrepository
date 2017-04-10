CREATE TABLE [dbo].[User] (
    [Id]           INT           IDENTITY (1, 1) NOT NULL,
    [Username]     NVARCHAR (50) NULL,
    [Name]         NVARCHAR (50) NULL,
    [Email]        NVARCHAR (50) NULL,
    [DepartmentId] INT           NOT NULL,
    CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_User_Department] FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([Id])
);

