---- Implicit transactions

SET IMPLICIT_TRANSACTIONS OFF; -- ON

BEGIN TRANSACTION

TRUNCATE TABLE GroupsStudents

INSERT INTO GroupsStudents
VALUES (9, 3)

ROLLBACK TRANSACTION

COMMIT TRANSACTION

---- Test

SELECT *
FROM GroupsStudents


---- Transaction count
SELECT @@TRANCOUNT


---- Explicit transactions

BEGIN TRANSACTION TestTran
SAVE TRANSACTION Checkpoint_BeforeDrop

DROP TABLE Students
DROP TABLE Teachers

ROLLBACK TRANSACTION TestTran

---- Tests

SELECT *
FROM Students

---- Exceptions

SELECT @@ERROR
SELECT @@IDENTITY


CREATE PROCEDURE AddRegion @Region AS NCHAR(50)
AS
BEGIN
    IF @Region IN ('Armenia', 'Russia')
    BEGIN
        THROW 63333, 'Region is not valid!', 0
    END

    INSERT INTO Region
    VALUES ((SELECT TOP 1 RegionID
             FROM Region
             ORDER BY RegionID DESC) + 1, @Region)
END

DECLARE @ErrorNumber AS INT
DECLARE @ErrorMessage AS NVARCHAR(4000)
DECLARE @ErrorProcedure AS NVARCHAR(128)

BEGIN TRY
    EXEC AddRegion 'Russia'
END TRY
BEGIN CATCH
    SET @ErrorNumber = ERROR_NUMBER()
    SET @ErrorMessage = ERROR_MESSAGE()
    SET @ErrorProcedure = ERROR_PROCEDURE()
END CATCH

IF @ErrorNumber = 63333
BEGIN
   SELECT @ErrorMessage
END

---- After triggers

CREATE TABLE DeletedUsers
(
    Id INT PRIMARY KEY IDENTITY,
    Login VARCHAR(48),
    RegistrationDate DATETIME,
    Age INT,
    Gender TINYINT,
)

---- Temp tables names
-- AFTER DELETE -> DELETED
-- AFTER UPDATE -> INSERTED
-- AFTER INSERT -> INSERTED

ALTER TRIGGER ItBottle_AfterUserDeleteTrigger
    ON Users
    AFTER DELETE
    AS
BEGIN
    DECLARE @Count AS INT = (SELECT COUNT(*)
                             FROM DELETED) -- OR INSERTED
    DECLARE @i AS INT = 0
    WHILE @i < @Count
        BEGIN
            INSERT INTO DeletedUsers
            VALUES
            (
                    (SELECT Login FROM DELETED ORDER BY Id OFFSET (@i) ROWS FETCH NEXT 1 ROWS ONLY),
                    (SELECT RegistrationDate FROM DELETED ORDER BY Id OFFSET (@i) ROWS FETCH NEXT 1 ROWS ONLY),
                    (SELECT Age FROM DELETED ORDER BY Id OFFSET (@i) ROWS FETCH NEXT 1 ROWS ONLY),
                    (SELECT Gender FROM DELETED ORDER BY Id OFFSET (@i) ROWS FETCH NEXT 1 ROWS ONLY)
            )

            SET @i = @i + 1
        END
END


DELETE Users
WHERE Id = 11

DBCC CHECKIDENT ('DeletedUsers', RESEED, 1)

---- Instead of trigger

CREATE TABLE Items
(
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(32),
    Quantity INT CHECK(Quantity >= 0)
)


INSERT INTO Items
VALUES ('Baklava', 10),
       ('Pirojok', 5)


ALTER TRIGGER ItBottle_InsteadOfDelete_Items ON Items
    INSTEAD OF DELETE
AS
BEGIN
    DECLARE @Count AS INT = (SELECT COUNT(*)
                             FROM DELETED)

    DECLARE @i AS INT = 0
    WHILE @i < @Count
    BEGIN
        UPDATE Items
        SET Quantity = Quantity - 1
        WHERE Id = (SELECT Id FROM DELETED ORDER BY Id OFFSET (@i) ROWS FETCH NEXT 1 ROWS ONLY)
        SET @i = @i + 1
    END
END

DELETE Items
WHERE Name IN ('Baklava', 'Pirojok')

SELECT *
FROM Items