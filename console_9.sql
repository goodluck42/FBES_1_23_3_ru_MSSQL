-- SELECT (SELECT FirstName FROM Employees AS E WHERE E.EmployeeID = O.EmployeeID) AS FirstName,
--        (SELECT LastName FROM Employees AS E WHERE E.EmployeeID = O.EmployeeID)  AS LastName,
--        O.ShippedDate
-- FROM Orders AS O

---- INNER JOIN
-- SELECT E.FirstName, E.LastName, ShippedDate
-- FROM Orders AS O
-- INNER JOIN Employees AS E ON O.EmployeeID = E.EmployeeID

---- FULL OUTER JOIN

-- SELECT C.CustomerID, C.ContactName, OD.UnitPrice, O.ShipCity
-- FROM [Order Details] AS OD -- A
--          INNER JOIN Orders AS O ON OD.OrderID = O.OrderID -- B
--          FULL JOIN Customers AS C ON C.CustomerID = O.CustomerID -- C
-- ORDER BY C.CustomerID



SELECT C.CustomerID, C.ContactName, OD.UnitPrice, O.ShipCity
FROM [Order Details] AS OD
         INNER JOIN Orders AS O ON OD.OrderID = O.OrderID
         LEFT JOIN Customers AS C ON C.CustomerID = O.CustomerID
ORDER BY C.CustomerID


-- SELECT P.ProductName, OD.UnitPrice
-- FROM [Order Details] AS OD -- A
-- RIGHT JOIN Products AS P ON P.ProductID = OD.ProductID -- B


SELECT P.ProductName, OD.UnitPrice
FROM [Products] AS P -- A (LEFT Table)
LEFT JOIN [Order Details] AS OD ON P.ProductID = OD.ProductID -- B (RIGHT Table)
WHERE OD.ProductID IS NULL

-- INSERT INTO Products
-- VALUES ('Baklava', 16, 3, '1 pcs.', 4.5, 32767, 100, 95, 0)

