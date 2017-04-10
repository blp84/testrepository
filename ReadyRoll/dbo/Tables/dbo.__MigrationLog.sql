﻿CREATE TABLE [dbo].[__MigrationLog] (
    [migration_id]    UNIQUEIDENTIFIER NOT NULL,
    [script_checksum] NVARCHAR (64)    NOT NULL,
    [script_filename] NVARCHAR (255)   NOT NULL,
    [complete_dt]     DATETIME2 (7)    NOT NULL,
    [applied_by]      NVARCHAR (100)   NOT NULL,
    [deployed]        TINYINT          CONSTRAINT [DF___MigrationLog_deployed] DEFAULT ((1)) NOT NULL,
    [version]         VARCHAR (255)    NULL,
    [package_version] VARCHAR (255)    NULL,
    [release_version] VARCHAR (255)    NULL,
    [sequence_no]     INT              IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK___MigrationLog] PRIMARY KEY CLUSTERED ([migration_id] ASC, [complete_dt] ASC, [script_checksum] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [UX___MigrationLog_SequenceNo]
    ON [dbo].[__MigrationLog]([sequence_no] ASC);


GO
CREATE NONCLUSTERED INDEX [IX___MigrationLog_Version]
    ON [dbo].[__MigrationLog]([version] ASC);


GO
CREATE NONCLUSTERED INDEX [IX___MigrationLog_CompleteDt]
    ON [dbo].[__MigrationLog]([complete_dt] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'An auto-seeded numeric identifier that can be used to determine the order in which migrations were deployed.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'__MigrationLog', @level2type = N'COLUMN', @level2name = N'sequence_no';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If you are using Octopus Deploy, you can use the value in this column to look-up which release was responsible for deploying this migration.
If deploying via PowerShell, set the $ReleaseVersion variable to populate this column.
If deploying via Visual Studio, this column will always be NULL.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'__MigrationLog', @level2type = N'COLUMN', @level2name = N'release_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'If you have enabled SQLCMD Packaging in your ReadyRoll project, or if you are using Octopus Deploy, this will be the version number that your database package was stamped with at build-time.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'__MigrationLog', @level2type = N'COLUMN', @level2name = N'package_version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The semantic version that this migration was created under. In ReadyRoll projects, a folder can be given a version number, e.g. 1.0.0, and one or more migration scripts can be stored within that folder to provide logical grouping of related database changes.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'__MigrationLog', @level2type = N'COLUMN', @level2name = N'version';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This column contains a number of potential states:

0 - Marked As Deployed: The migration was not executed.
1- Deployed: The migration was executed successfully.
2- Imported: The migration was generated by importing from this DB.

"Marked As Deployed" and "Imported" are similar in that the migration was not executed on this database; it was was only marked as such to prevent it from executing during subsequent deployments.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'__MigrationLog', @level2type = N'COLUMN', @level2name = N'deployed';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The executing user at the time of deployment (populated using the SYSTEM_USER function).', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'__MigrationLog', @level2type = N'COLUMN', @level2name = N'applied_by';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date/time that the migration finished executing. This value is populated using the SYSDATETIME function in SQL Server 2008+ or by using GETDATE in SQL Server 2005.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'__MigrationLog', @level2type = N'COLUMN', @level2name = N'complete_dt';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The name of the migration script file on disk, at the time of build.
If Semantic Versioning has been enabled, then this value will contain the full relative path from the root of the project folder. If it is not enabled, then it will simply contain the filename itself.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'__MigrationLog', @level2type = N'COLUMN', @level2name = N'script_filename';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'A SHA256 representation of the migration script file at the time of build.  This value is used to determine whether a migration has been changed since it was deployed. In the case of a programmable object script, a different checksum will cause the migration to be redeployed.
Note: if any variables have been specified as part of a deployment, this will not affect the checksum value.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'__MigrationLog', @level2type = N'COLUMN', @level2name = N'script_checksum';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The unique identifier of a migration script file. This value is stored within the <Migration /> Xml fragment within the header of the file itself.

Note that it is possible for this value to repeat in the [__MigrationLog] table. In the case of programmable object scripts, a record will be inserted with a particular ID each time a change is made to the source file and subsequently deployed.

In the case of a migration, you may see the same [migration_id] repeated, but only in the scenario where the "Mark As Deployed" button/command has been run.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'__MigrationLog', @level2type = N'COLUMN', @level2name = N'migration_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'This table is required by ReadyRoll SQL Projects to keep track of which migrations have been executed during deployment. Please do not alter or remove this table from the database.', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'__MigrationLog';

