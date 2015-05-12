
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 05/12/2015 01:44:17
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


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[MoviesSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MoviesSet];
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
    [Tags] nvarchar(50)  NOT NULL,
    [UserId] int  NOT NULL
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

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------