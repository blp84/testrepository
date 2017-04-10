-- <Migration ID="161bdb1d-6488-4ff7-952f-986d3071495f" />
GO

PRINT N'Altering [dbo].[Department]'
GO
ALTER TABLE [dbo].[Department] ADD
[Address] [nvarchar] (50) NULL
GO
