-- SELECT *
-- FROM Products
-- WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM Products)

-- SELECT *
-- FROM Products
-- WHERE UnitPrice = (SELECT MIN(UnitPrice) FROM Products)

-- SELECT P.ProductName, OD.Quantity
-- FROM (SELECT *
--       FROM Products
--       WHERE UnitsInStock <> 0) AS P, [Order Details] AS OD
-- WHERE OD.ProductID = P.ProductID

-- SELECT P.ProductName, OD.Quantity
-- FROM Products AS P, [Order Details] AS OD
-- WHERE UnitsInStock <> 0 AND OD.ProductID = P.ProductID


SELECT T.ProductName, SUM(T.TotalPrice)
FROM (SELECT (SELECT ProductName FROM Products AS P WHERE P.ProductID = OD.ProductID) AS ProductName,
             (UnitPrice * (1 - OD.Discount)) * Quantity                               AS TotalPrice

      FROM [Order Details] AS OD) AS T
GROUP BY T.ProductName


SELECT (SELECT ShipName FROM Orders AS O WHERE OD.OrderID = O.OrderID)          AS ShipName,
       (SELECT ProductName FROM Products AS P WHERE P.ProductID = OD.ProductID) AS ProductName,
       (UnitPrice * (1 - OD.Discount)) * Quantity                               AS TotalPrice

FROM [Order Details] AS OD



