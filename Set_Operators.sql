- UNION
SELECT city
FROM Customers

UNION

SELECT city
FROM Suppliers;


-- UNION ALL
SELECT city
FROM Customers

UNION ALL

SELECT city
FROM Suppliers;


-- INTERSECT
SELECT city
FROM Customers

INTERSECT

SELECT city
FROM Suppliers;


-- MINUS
SELECT city
FROM Customers

MINUS

SELECT city
FROM Suppliers;
