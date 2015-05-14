
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/14/2015 00:12:49
-- Generated from EDMX file: C:\w3schools_demo\MvcDemo\Dados\DataModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [BlogDatabase];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_PostId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CommentsSet] DROP CONSTRAINT [FK_PostId];
GO
IF OBJECT_ID(N'[dbo].[FK_UserId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[CommentsSet] DROP CONSTRAINT [FK_UserId];
GO
IF OBJECT_ID(N'[dbo].[FK_UsersId]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[BlogPostSet] DROP CONSTRAINT [FK_UsersId];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[MoviesSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MoviesSet];
GO
IF OBJECT_ID(N'[dbo].[BlogPostSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[BlogPostSet];
GO
IF OBJECT_ID(N'[dbo].[CommentsSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[CommentsSet];
GO
IF OBJECT_ID(N'[dbo].[UserSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'MoviesSet'
CREATE TABLE [dbo].[MoviesSet] (
    [MovieId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(100)  NOT NULL,
    [Director] nvarchar(100)  NOT NULL,
    [LaunchDate] datetime  NOT NULL
);
GO

-- Creating table 'BlogPostSet'
CREATE TABLE [dbo].[BlogPostSet] (
    [PostId] int IDENTITY(1,1) NOT NULL,
    [Post] nvarchar(max)  NOT NULL,
    [Title] nvarchar(100)  NOT NULL,
    [UserId] int  NOT NULL,
    [TagsId] int  NOT NULL
);
GO

-- Creating table 'CommentsSet'
CREATE TABLE [dbo].[CommentsSet] (
    [CommentId] int IDENTITY(1,1) NOT NULL,
    [Comment] nvarchar(max)  NOT NULL,
    [PostId] int  NOT NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'UserSet'
CREATE TABLE [dbo].[UserSet] (
    [UserId] int IDENTITY(1,1) NOT NULL,
    [UserName] nvarchar(50)  NOT NULL,
    [Email] nvarchar(80)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'TagsSet'
CREATE TABLE [dbo].[TagsSet] (
    [TagId] int IDENTITY(1,1) NOT NULL,
    [Tag] nvarchar(50)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [MovieId] in table 'MoviesSet'
ALTER TABLE [dbo].[MoviesSet]
ADD CONSTRAINT [PK_MoviesSet]
    PRIMARY KEY CLUSTERED ([MovieId] ASC);
GO

-- Creating primary key on [PostId] in table 'BlogPostSet'
ALTER TABLE [dbo].[BlogPostSet]
ADD CONSTRAINT [PK_BlogPostSet]
    PRIMARY KEY CLUSTERED ([PostId] ASC);
GO

-- Creating primary key on [CommentId] in table 'CommentsSet'
ALTER TABLE [dbo].[CommentsSet]
ADD CONSTRAINT [PK_CommentsSet]
    PRIMARY KEY CLUSTERED ([CommentId] ASC);
GO

-- Creating primary key on [UserId] in table 'UserSet'
ALTER TABLE [dbo].[UserSet]
ADD CONSTRAINT [PK_UserSet]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [TagId] in table 'TagsSet'
ALTER TABLE [dbo].[TagsSet]
ADD CONSTRAINT [PK_TagsSet]
    PRIMARY KEY CLUSTERED ([TagId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [PostId] in table 'CommentsSet'
ALTER TABLE [dbo].[CommentsSet]
ADD CONSTRAINT [FK_PostId]
    FOREIGN KEY ([PostId])
    REFERENCES [dbo].[BlogPostSet]
        ([PostId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PostId'
CREATE INDEX [IX_FK_PostId]
ON [dbo].[CommentsSet]
    ([PostId]);
GO

-- Creating foreign key on [UserId] in table 'CommentsSet'
ALTER TABLE [dbo].[CommentsSet]
ADD CONSTRAINT [FK_UserId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserId'
CREATE INDEX [IX_FK_UserId]
ON [dbo].[CommentsSet]
    ([UserId]);
GO

-- Creating foreign key on [UserId] in table 'BlogPostSet'
ALTER TABLE [dbo].[BlogPostSet]
ADD CONSTRAINT [FK_UsersId]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[UserSet]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsersId'
CREATE INDEX [IX_FK_UsersId]
ON [dbo].[BlogPostSet]
    ([UserId]);
GO

-- Creating foreign key on [TagsId] in table 'BlogPostSet'
ALTER TABLE [dbo].[BlogPostSet]
ADD CONSTRAINT [FK_TagsId]
    FOREIGN KEY ([TagsId])
    REFERENCES [dbo].[TagsSet]
        ([TagId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TagsId'
CREATE INDEX [IX_FK_TagsId]
ON [dbo].[BlogPostSet]
    ([TagsId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------