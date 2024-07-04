---- Aliases
CREATE TYPE NameType FROM NVARCHAR(20)
CREATE TYPE EmployeesTable AS TABLE
(
    FirstName NameType,
    LastName  NameType
)

---- Variables 1
DECLARE @myVar AS NameType = 'Farid'

PRINT @myVar

SET @myVar = 'Jamal'

PRINT @myVar


---- Variables 2

DECLARE @Result AS TABLE
                   (
                       FirstName NameType,
                       LastName  NameType
                   )

DECLARE @Result AS EmployeesTable

INSERT INTO @Result
VALUES ('FName1', 'LName1'),
       ('FName2', 'LName2')

SELECT *
FROM @Result

---- IF ELSE
-- EXISTS, ALL, SOME|ANY, >, <, =, <>
IF EXISTS(SELECT EmployeeID
          FROM Employees
          WHERE FirstName = 'Nancy')
    BEGIN
        SELECT * FROM Employees WHERE FirstName = 'Nancy'
    END
ELSE
    BEGIN
        SELECT 'User not found'
    END

IF 3 BETWEEN 1 AND 5
    BEGIN
        PRINT 'OK'
    END

----

DECLARE @i AS INT = 0

WHILE @i < 10
    BEGIN
        SET @i = @i + 1

        IF @i = 9
            BEGIN
                BREAK
            END

        IF @i BETWEEN 3 AND 7
            BEGIN
                CONTINUE
            END
        PRINT @i
    END

---- Procedures
CREATE TYPE CustomerInfoTable AS TABLE
(
    FullName NVARCHAR(30),
    Company NVARCHAR(40)
)

ALTER PROCEDURE GetCustomerInfo
AS
BEGIN
    SELECT ContactName, CompanyName
    FROM Customers
END

DECLARE @Result AS CustomerInfoTable

INSERT @Result EXEC GetCustomerInfo

SELECT TOP 3 * FROM @Result

ALTER PROCEDURE GetEmployeesByCountry
    @Country AS NVARCHAR(15),
    @Limit AS INT = -1
AS
BEGIN
    IF @Limit = -1 OR @Limit < 0
    BEGIN
        SELECT *
        FROM Employees
        WHERE Country = @Country
    END
    ELSE
    BEGIN
        SELECT TOP (@Limit) *
        FROM Employees
        WHERE Country = @Country
    END
END


ALTER PROCEDURE GetProductsWithCount
    @Count AS INT OUTPUT
AS
BEGIN
    SET @Count =
    (
        SELECT COUNT(*)
        FROM Products
    )

    SELECT ProductID, ProductName
    FROM Products
END

DECLARE @Count INT
DECLARE @Products AS TABLE
(
    ProductID INT,
    ProductName NVARCHAR(40)
)

INSERT @Products
EXEC GetProductsWithCount @Count OUTPUT

SELECT @Count AS ProductCount
SELECT * FROM @Products

-- EXEC GetEmployeesByCountry @Limit = 3, @Country = 'USA'
--
-- EXEC GetEmployeesByCountry 'USA', 3

---- Functions

CREATE FUNCTION GetEmployeeCount()
RETURNS INT
AS
BEGIN
    RETURN (SELECT COUNT(*) FROM Employees)
END

SELECT dbo.GetEmployeeCount()

CREATE TYPE CustomerType AS TABLE
(
    Id NCHAR(5),
    FullName NVARCHAR(30),
    Address NVARCHAR(60)
)

CREATE FUNCTION GetCustomersByCountry(@Country AS NVARCHAR(15))
RETURNS @Result TABLE
(
    Id NCHAR(5),
    FullName NVARCHAR(30),
    Address NVARCHAR(60)
)
AS
BEGIN
    INSERT INTO @Result
    SELECT CustomerID AS Id, ContactName AS FullName, Address
    FROM Customers
    WHERE Country = @Country
    RETURN;
END

SELECT * FROM GetCustomersByCountry('USA')
