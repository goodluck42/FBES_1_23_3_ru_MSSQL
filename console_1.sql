-- T-SQL. DDL - ?; DCL; DML; TCL; DQL

---- DDL

-- CREATE DATABASE [ItBottle];

-- USE [ItBottle]

-- DROP TABLE [Users]

CREATE TABLE [Users] (
    Id INT IDENTITY(1, 1),
    [Login] VARCHAR(32),
    [PasswordHash] VARCHAR(32),
    [RegistrationDate] DATETIME NOT NULL,
    [Age] INT,
    [Gender] TINYINT CONSTRAINT DF_ItBottle_Users_Gender DEFAULT 0,
    CONSTRAINT PK_ItBottle_Users_Id PRIMARY KEY (Id),
    CONSTRAINT UQ_ItBottle_Users_Login UNIQUE ([Login]),
    CONSTRAINT CK_ItBottle_Users_Age CHECK([AGE] >= 18 AND [AGE] <= 65),
    CONSTRAINT CK_ItBottle_Users_Gender CHECK ([Gender] BETWEEN 0 AND 3),
);

-- ALTER TABLE [Users]
-- ALTER COLUMN [Login] VARCHAR(48)


-- ALTER TABLE [Users]
-- DROP CONSTRAINT CK_ItBottle_Users_Gender

-- ALTER TABLE [Users]
-- ADD CONSTRAINT CK_ItBottle_Users_Gender CHECK ([Gender] BETWEEN 0 AND 4)

-- ALTER TABLE [Users]
-- ADD [RefLink] VARCHAR(32) NOT NULL CONSTRAINT DF_ItBottle_Users_RefLink DEFAULT 'N/A'

-- ALTER TABLE Users
-- DROP CONSTRAINT DF_ItBottle_Users_RefLink
--
-- ALTER TABLE [Users]
-- DROP COLUMN RefLink

