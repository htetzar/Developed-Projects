
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/22/2014 11:16:28
-- Generated from EDMX file: D:\Work\GalaxySignage\GalaxySignage\Models\Signage.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [GalaxySignage_CI];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_PlaylistVideo_Playlist]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PlaylistVideo] DROP CONSTRAINT [FK_PlaylistVideo_Playlist];
GO
IF OBJECT_ID(N'[dbo].[FK_PlaylistVideo_Video]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[PlaylistVideo] DROP CONSTRAINT [FK_PlaylistVideo_Video];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Playlists]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Playlists];
GO
IF OBJECT_ID(N'[dbo].[PlaylistVideo]', 'U') IS NOT NULL
    DROP TABLE [dbo].[PlaylistVideo];
GO
IF OBJECT_ID(N'[dbo].[Videos]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Videos];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Playlists'
CREATE TABLE [dbo].[Playlists] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [TotalDuration] time  NOT NULL
);
GO

-- Creating table 'Videos'
CREATE TABLE [dbo].[Videos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Duration] time  NOT NULL,
    [Size] nvarchar(max)  NOT NULL,
    [FileName] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'PlaylistVideo'
CREATE TABLE [dbo].[PlaylistVideo] (
    [Playlists_Id] int  NOT NULL,
    [Videos_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Playlists'
ALTER TABLE [dbo].[Playlists]
ADD CONSTRAINT [PK_Playlists]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Videos'
ALTER TABLE [dbo].[Videos]
ADD CONSTRAINT [PK_Videos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Playlists_Id], [Videos_Id] in table 'PlaylistVideo'
ALTER TABLE [dbo].[PlaylistVideo]
ADD CONSTRAINT [PK_PlaylistVideo]
    PRIMARY KEY CLUSTERED ([Playlists_Id], [Videos_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Playlists_Id] in table 'PlaylistVideo'
ALTER TABLE [dbo].[PlaylistVideo]
ADD CONSTRAINT [FK_PlaylistVideo_Playlists]
    FOREIGN KEY ([Playlists_Id])
    REFERENCES [dbo].[Playlists]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Videos_Id] in table 'PlaylistVideo'
ALTER TABLE [dbo].[PlaylistVideo]
ADD CONSTRAINT [FK_PlaylistVideo_Videos]
    FOREIGN KEY ([Videos_Id])
    REFERENCES [dbo].[Videos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;

-- Creating non-clustered index for FOREIGN KEY 'FK_PlaylistVideo_Videos'
CREATE INDEX [IX_FK_PlaylistVideo_Videos]
ON [dbo].[PlaylistVideo]
    ([Videos_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------