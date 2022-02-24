
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/14/2022 23:53:53
-- Generated from EDMX file: c:\users\muhammad atta\documents\visual studio 2015\Projects\Sindh_University_Transport_M_S\Sindh_University_Transport_M_S\Models\Transport_Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Sindh_University_Transport_MS];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Cities'
CREATE TABLE [dbo].[Cities] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Areas'
CREATE TABLE [dbo].[Areas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [CityId] int  NOT NULL
);
GO

-- Creating table 'Locations'
CREATE TABLE [dbo].[Locations] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Routes] nvarchar(max)  NOT NULL,
    [AreaId] int  NOT NULL
);
GO

-- Creating table 'Points'
CREATE TABLE [dbo].[Points] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [P_Name] nvarchar(max)  NOT NULL,
    [P_Type] nvarchar(max)  NOT NULL,
    [P_Number] nvarchar(max)  NOT NULL,
    [P_Photo] varchar(max)  NOT NULL,
    [P_S_Timing] nvarchar(max)  NOT NULL,
    [P_E_Timing] nvarchar(max)  NOT NULL,
    [Shift] nvarchar(max)  NOT NULL,
    [LocationId] int  NOT NULL
);
GO

-- Creating table 'Admins'
CREATE TABLE [dbo].[Admins] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Cities'
ALTER TABLE [dbo].[Cities]
ADD CONSTRAINT [PK_Cities]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Areas'
ALTER TABLE [dbo].[Areas]
ADD CONSTRAINT [PK_Areas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Locations'
ALTER TABLE [dbo].[Locations]
ADD CONSTRAINT [PK_Locations]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Points'
ALTER TABLE [dbo].[Points]
ADD CONSTRAINT [PK_Points]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Admins'
ALTER TABLE [dbo].[Admins]
ADD CONSTRAINT [PK_Admins]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CityId] in table 'Areas'
ALTER TABLE [dbo].[Areas]
ADD CONSTRAINT [FK_CityArea]
    FOREIGN KEY ([CityId])
    REFERENCES [dbo].[Cities]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CityArea'
CREATE INDEX [IX_FK_CityArea]
ON [dbo].[Areas]
    ([CityId]);
GO

-- Creating foreign key on [AreaId] in table 'Locations'
ALTER TABLE [dbo].[Locations]
ADD CONSTRAINT [FK_AreaLocation]
    FOREIGN KEY ([AreaId])
    REFERENCES [dbo].[Areas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AreaLocation'
CREATE INDEX [IX_FK_AreaLocation]
ON [dbo].[Locations]
    ([AreaId]);
GO

-- Creating foreign key on [LocationId] in table 'Points'
ALTER TABLE [dbo].[Points]
ADD CONSTRAINT [FK_LocationPoint]
    FOREIGN KEY ([LocationId])
    REFERENCES [dbo].[Locations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LocationPoint'
CREATE INDEX [IX_FK_LocationPoint]
ON [dbo].[Points]
    ([LocationId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------