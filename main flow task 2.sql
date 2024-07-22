--CREATING A DATABASE
CREATE DATABASE MARKET;

--USING A DATABASE
USE MARKET;

--CREATING A TABLE
CREATE TABLE Sales (
    ID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10, 2)
);

--INSERTING THE VALUES
INSERT INTO Sales (ID, ProductName, Quantity, Price) VALUES
(1, 'Laptop', 10, 999.99),
(2, 'Smartphone', 20, 499.99),
(3, 'Tablet', 15, 299.99),
(4, 'Smartwatch', 5, 199.99);

--DISPLAYING THE TABLE
SELECT * FROM Sales;

-- USING AGGREGATE FUCTIONS
--SUM() --USING GROUP BY
SELECT ProductName,SUM(Quantity) AS TotalQuantity FROM Sales
GROUP BY ProductName;  

--AVERAGE AVG()
SELECT AVG(Price) AS AveragePrice FROM Sales;

--COUNT()
SELECT COUNT(*) AS NumberOfProducts FROM Sales;

--MAX()
SELECT MAX(Price) AS HighestPrice FROM Sales;

--MIN()
SELECT MIN(Price) AS LowestPrice FROM Sales;