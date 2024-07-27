CREATE LOGIN MyLogin WITH PASSWORD = N'qwerty'

ALTER LOGIN MyLogin ENABLE

ALTER LOGIN MyLogin WITH PASSWORD = N'admin'

EXEC xp_instance_regwrite N'HKEY_LOCAL_MACHINE',
     N'Software\Microsoft\MSSQLServer\MSSQLServer',
     N'LoginMode', REG_DWORD, 2;
GO

CREATE DATABASE MyDb;
USE MyDb

CREATE USER MyUser FOR LOGIN MyLogin

GRANT ALTER ON SCHEMA::dbo TO MyUser;

GRANT CREATE TABLE To MyUser;

GRANT INSERT, UPDATE, DELETE, SELECT ON Accounts TO MyUser;

-- REVOKE INSERT, UPDATE, DELETE, SELECT FROM MyUser

CREATE ROLE JuniorRole AUTHORIZATION db_datareader

ALTER ROLE JuniorRole
ADD MEMBER MyUser

GRANT SELECT, INSERT TO JuniorRole








