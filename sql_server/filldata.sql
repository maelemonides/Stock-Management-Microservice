-- Créer une nouvelle base de données si elle n'existe pas déjà
USE master
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'InventoryManagement')
BEGIN
    CREATE DATABASE InventoryManagement
END
GO

-- Liste les database
SELECT Name from sys.databases;
GO

-- Selection de la database utilisé
USE InventoryManagement;
GO

-- Creation des tables
CREATE TABLE Balance (
    bid INT IDENTITY PRIMARY KEY NOT NULL, 
    product NVARCHAR(20) NOT NULL, 
    [location] NVARCHAR(20) NOT NULL, 
    quantity INT NOT NULL
);
GO

CREATE TABLE Movement (
    mid INT IDENTITY PRIMARY KEY, 
    ts DATETIME, 
    frm NVARCHAR(20) NOT NULL, 
    [to] NVARCHAR(20) NOT NULL, 
    pname NVARCHAR(20) NOT NULL, 
    pqty INT NOT NULL
);
GO

CREATE TABLE Product (
    prod_id INT IDENTITY PRIMARY KEY, 
    prod_name NVARCHAR(20) NOT NULL, 
    prod_qty INT NOT NULL
);
GO

CREATE TABLE Location (
    loc_id INT IDENTITY PRIMARY KEY, 
    loc_name NVARCHAR(20) NOT NULL, 
    CONSTRAINT UC_loc UNIQUE (loc_name)
);
GO

INSERT INTO Location VALUES (1, 'Paris');
GO