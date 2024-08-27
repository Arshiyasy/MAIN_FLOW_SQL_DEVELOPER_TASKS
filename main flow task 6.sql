------------------------------------------ 1. DATA EXPLORATION --------------------------------------------------------------
-- Customers Table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(20),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10)
);

--Describe table 
DESCRIBE Customers;

--  Products Table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT
);

--Describe table 
DESCRIBE Products;

-- Orders Table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATE,
    CustomerID INT,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

--Describe table 
DESCRIBE Orders;

-- OrderDetails Table (This table will link Orders and Products)
CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    LineTotal DECIMAL(10, 2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

--Describe table   
DESCRIBE OrderDetails;

-- Inserting Values in the table-----
-- Insert Data into Customers Table
INSERT INTO Customers (FirstName, LastName, Email, Phone, Address, City, State, ZipCode)
VALUES
('John', 'Doe', 'john.doe@example.com', '555-1234', '123 Elm St', 'Springfield', 'IL', '62701'),
('Jane', 'Smith', 'jane.smith@example.com', '555-5678', '456 Oak St', 'Springfield', 'IL', '62702');

--Insert Data into Products Table
INSERT INTO Products (ProductName, Category, Price, StockQuantity)
VALUES
('Laptop', 'Electronics', 899.99, 50),
('Smartphone', 'Electronics', 699.99, 150),
('Desk Chair', 'Furniture', 129.99, 200),
('Coffee Table', 'Furniture', 199.99, 100);

-- Insert Data into Orders Table
INSERT INTO Orders (OrderDate, CustomerID, TotalAmount)
VALUES
('2024-08-01', 1, 929.97),
('2024-08-02', 2, 129.99);

-- Insert Data into OrderDetails Table
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, LineTotal)
VALUES
(1, 1, 1, 899.99),
(1, 3, 1, 29.99),
(2, 3, 1, 129.99);

-- displaying  the data --
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;

------------------------------------------ 2. DATA EXTRACTION --------------------------------------------------------------
-- Total Number of Orders
SELECT COUNT(*) AS TotalOrders FROM Orders;

-- Average Order Value
SELECT AVG(TotalAmount) AS AverageOrderValue FROM Orders;

-- Top Products by Sales Quantity
SELECT P.ProductName, SUM(OD.Quantity) AS TotalQuantitySold
FROM OrderDetails OD
JOIN Products P ON OD.ProductID = P.ProductID
GROUP BY P.ProductName
ORDER BY TotalQuantitySold DESC;

------------------------------------------ 3. DATA ANALYSIS --------------------------------------------------------------
-- Most Frequent Products Bought
SELECT P.ProductName, COUNT(OD.ProductID) AS Frequency
FROM OrderDetails OD
JOIN Products P ON OD.ProductID = P.ProductID
GROUP BY P.ProductName
ORDER BY Frequency DESC;

-- Peak Order Times (by Day)
SELECT OrderDate, COUNT(OrderID) AS OrdersCount
FROM Orders
GROUP BY OrderDate
ORDER BY OrdersCount DESC;

------------------------------------------ 4. REPORTING --------------------------------------------------------------
-- Summary of Key Findings
SELECT 
    (SELECT COUNT(*) FROM Orders) AS TotalOrders,
    (SELECT AVG(TotalAmount) FROM Orders) AS AverageOrderValue,
    (SELECT ProductName FROM Products P JOIN OrderDetails OD ON P.ProductID = OD.ProductID GROUP BY ProductName ORDER BY SUM(OD.Quantity) DESC LIMIT 1) AS TopProduct,
    (SELECT OrderDate FROM Orders GROUP BY OrderDate ORDER BY COUNT(OrderID) DESC LIMIT 1) AS PeakOrderDate;
