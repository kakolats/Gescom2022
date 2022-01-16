
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 01/08/2022 17:26:59
-- Generated from EDMX file: C:\Users\HP\Documents\TROISIEME ANNEE\C#\Projet C#\Gestion_Com_2022\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [gescom2022];
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

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Login] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [NomComplet] nvarchar(max)  NOT NULL,
    [Role] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Produits'
CREATE TABLE [dbo].[Produits] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Libelle] nvarchar(max)  NOT NULL,
    [Code] nvarchar(max)  NOT NULL,
    [Prix] float  NOT NULL,
    [Stock] bigint  NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [SeuilStock] bigint  NOT NULL,
    [CategorieId] int  NOT NULL,
    [CategorieId1] int  NOT NULL
);
GO

-- Creating table 'Categories'
CREATE TABLE [dbo].[Categories] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Libelle] nvarchar(max)  NOT NULL,
    [Image] tinyint  NULL,
    [CodeCat] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Images'
CREATE TABLE [dbo].[Images] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ImageByte] tinyint  NOT NULL,
    [ProduitId] int  NOT NULL
);
GO

-- Creating table 'Commandes'
CREATE TABLE [dbo].[Commandes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Numero] bigint  NOT NULL,
    [Date] datetime  NOT NULL,
    [Montant] float  NOT NULL,
    [AdresseLivraison] nvarchar(max)  NOT NULL,
    [Etat] nvarchar(max)  NOT NULL,
    [ClientId] int  NOT NULL
);
GO

-- Creating table 'Livraisons'
CREATE TABLE [dbo].[Livraisons] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Date] datetime  NOT NULL,
    [Statut] nvarchar(max)  NOT NULL,
    [LivreurId] int  NOT NULL,
    [Commande_Id] int  NOT NULL
);
GO

-- Creating table 'Paiements'
CREATE TABLE [dbo].[Paiements] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Type] nvarchar(max)  NOT NULL,
    [Reference] nvarchar(max)  NOT NULL,
    [Montant] float  NOT NULL,
    [Date] datetime  NOT NULL,
    [ClientId] int  NOT NULL,
    [Commande_Id] int  NOT NULL
);
GO

-- Creating table 'DetailCommandes'
CREATE TABLE [dbo].[DetailCommandes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Quantite] bigint  NOT NULL,
    [CommandeId] int  NOT NULL,
    [ProduitId] int  NOT NULL
);
GO

-- Creating table 'Users_Livreur'
CREATE TABLE [dbo].[Users_Livreur] (
    [Matricule] nvarchar(max)  NOT NULL,
    [Telephone] nvarchar(max)  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- Creating table 'Users_Client'
CREATE TABLE [dbo].[Users_Client] (
    [Telephone] nvarchar(max)  NOT NULL,
    [Adresse] nvarchar(max)  NOT NULL,
    [Solde] float  NOT NULL,
    [Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Produits'
ALTER TABLE [dbo].[Produits]
ADD CONSTRAINT [PK_Produits]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Categories'
ALTER TABLE [dbo].[Categories]
ADD CONSTRAINT [PK_Categories]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Images'
ALTER TABLE [dbo].[Images]
ADD CONSTRAINT [PK_Images]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Commandes'
ALTER TABLE [dbo].[Commandes]
ADD CONSTRAINT [PK_Commandes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Livraisons'
ALTER TABLE [dbo].[Livraisons]
ADD CONSTRAINT [PK_Livraisons]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Paiements'
ALTER TABLE [dbo].[Paiements]
ADD CONSTRAINT [PK_Paiements]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DetailCommandes'
ALTER TABLE [dbo].[DetailCommandes]
ADD CONSTRAINT [PK_DetailCommandes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Users_Livreur'
ALTER TABLE [dbo].[Users_Livreur]
ADD CONSTRAINT [PK_Users_Livreur]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Users_Client'
ALTER TABLE [dbo].[Users_Client]
ADD CONSTRAINT [PK_Users_Client]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [CategorieId1] in table 'Produits'
ALTER TABLE [dbo].[Produits]
ADD CONSTRAINT [FK_ProduitCategorie]
    FOREIGN KEY ([CategorieId1])
    REFERENCES [dbo].[Categories]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProduitCategorie'
CREATE INDEX [IX_FK_ProduitCategorie]
ON [dbo].[Produits]
    ([CategorieId1]);
GO

-- Creating foreign key on [ProduitId] in table 'Images'
ALTER TABLE [dbo].[Images]
ADD CONSTRAINT [FK_ProduitImage]
    FOREIGN KEY ([ProduitId])
    REFERENCES [dbo].[Produits]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProduitImage'
CREATE INDEX [IX_FK_ProduitImage]
ON [dbo].[Images]
    ([ProduitId]);
GO

-- Creating foreign key on [CommandeId] in table 'DetailCommandes'
ALTER TABLE [dbo].[DetailCommandes]
ADD CONSTRAINT [FK_CommandeDetailCommande]
    FOREIGN KEY ([CommandeId])
    REFERENCES [dbo].[Commandes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CommandeDetailCommande'
CREATE INDEX [IX_FK_CommandeDetailCommande]
ON [dbo].[DetailCommandes]
    ([CommandeId]);
GO

-- Creating foreign key on [ProduitId] in table 'DetailCommandes'
ALTER TABLE [dbo].[DetailCommandes]
ADD CONSTRAINT [FK_ProduitDetailCommande]
    FOREIGN KEY ([ProduitId])
    REFERENCES [dbo].[Produits]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProduitDetailCommande'
CREATE INDEX [IX_FK_ProduitDetailCommande]
ON [dbo].[DetailCommandes]
    ([ProduitId]);
GO

-- Creating foreign key on [Commande_Id] in table 'Paiements'
ALTER TABLE [dbo].[Paiements]
ADD CONSTRAINT [FK_CommandePaiement]
    FOREIGN KEY ([Commande_Id])
    REFERENCES [dbo].[Commandes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CommandePaiement'
CREATE INDEX [IX_FK_CommandePaiement]
ON [dbo].[Paiements]
    ([Commande_Id]);
GO

-- Creating foreign key on [Commande_Id] in table 'Livraisons'
ALTER TABLE [dbo].[Livraisons]
ADD CONSTRAINT [FK_CommandeLivraison]
    FOREIGN KEY ([Commande_Id])
    REFERENCES [dbo].[Commandes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CommandeLivraison'
CREATE INDEX [IX_FK_CommandeLivraison]
ON [dbo].[Livraisons]
    ([Commande_Id]);
GO

-- Creating foreign key on [LivreurId] in table 'Livraisons'
ALTER TABLE [dbo].[Livraisons]
ADD CONSTRAINT [FK_LivreurLivraison]
    FOREIGN KEY ([LivreurId])
    REFERENCES [dbo].[Users_Livreur]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LivreurLivraison'
CREATE INDEX [IX_FK_LivreurLivraison]
ON [dbo].[Livraisons]
    ([LivreurId]);
GO

-- Creating foreign key on [ClientId] in table 'Paiements'
ALTER TABLE [dbo].[Paiements]
ADD CONSTRAINT [FK_ClientPaiement]
    FOREIGN KEY ([ClientId])
    REFERENCES [dbo].[Users_Client]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClientPaiement'
CREATE INDEX [IX_FK_ClientPaiement]
ON [dbo].[Paiements]
    ([ClientId]);
GO

-- Creating foreign key on [ClientId] in table 'Commandes'
ALTER TABLE [dbo].[Commandes]
ADD CONSTRAINT [FK_ClientCommande]
    FOREIGN KEY ([ClientId])
    REFERENCES [dbo].[Users_Client]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClientCommande'
CREATE INDEX [IX_FK_ClientCommande]
ON [dbo].[Commandes]
    ([ClientId]);
GO

-- Creating foreign key on [Id] in table 'Users_Livreur'
ALTER TABLE [dbo].[Users_Livreur]
ADD CONSTRAINT [FK_Livreur_inherits_User]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Users_Client'
ALTER TABLE [dbo].[Users_Client]
ADD CONSTRAINT [FK_Client_inherits_User]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------