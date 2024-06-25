-- MIN, MAX, COUNT/COUNT_BIG, SUM, AVG
-- ROUND, CAST, LEFT, RIGHT, SUBSTRING

-- SELECT SUBSTRING(CAST(SUM(UnitPrice) AS VARCHAR(32)), 1, 3)
-- FROM Products


-- SELECT COUNT(DISTINCT UnitPrice)
-- FROM Products

SELECT AVG(Freight) AS AvgFreight, ShipCountry
FROM Orders
WHERE OrderID <> 10363
GROUP BY ShipCountry
HAVING AVG(Freight) > 100
ORDER BY AvgFreight DESC


-- UPDATE Products
-- SET UnitPrice = 2699.12345
-- WHERE ProductID = 38