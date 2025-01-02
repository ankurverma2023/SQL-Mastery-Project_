Create Database ProductAnalyticsDB
USE ProductAnalyticsDB

--Project Name - SQL Mastery: Unlocking Data Insights for Interviews and Beyond
--Mastering SQL for Data Analysis & Tech Interviews at MAANG 

CREATE TABLE Products
(
ProductID INT PRIMARY KEY,
ProductName VARCHAR(50),
Category VARCHAR(30),
Price DECIMAL(10,2),
Quantity INT
)
INSERT INTO Products VALUES(1,'Laptop','Electronics',1000.00, 10),
(2,'SmartPhone', 'Electronics', 700.00,15),
(3,'Desk','Furniture',300.00, 5),
(4,'Chair','Furniture',150.00,20),
(5,'HeadPhones','Electronics',100.00,30),
(6,'Monitor','Electronics',200.00,12)

SELECT * FROM Products

--Filter Records (WHERE Clause) Retrieve products priced above $500:

SELECT * FROM Products
WHERE Price > 500

--Join Multiple Tables (JOIN Clause)

CREATE TABLE Suppliers
(
SupplierID INT PRIMARY KEY,
SupplierName VARCHAR(50),
ProductID INT,
FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
)
INSERT INTO Suppliers VALUES(1,'TechSupply co.',1),
(2,'GadgetPros',2),
(3,'FurnitureHub',3),
(4,'FurnitureHub',4)

SELECT * FROM Suppliers

--INNER JOIN Example: Retrieve products with supplier information:

SELECT Products.ProductName, Suppliers.SupplierName
FROM Products
INNER JOIN Suppliers ON Products.ProductID = Suppliers.ProductID

--LEFT JOIN Example: Retrieve all products, even if they have no supplier:

SELECT Products.ProductName, Suppliers.SupplierName
FROM Products
LEFT JOIN Suppliers ON Products.ProductID = Suppliers.ProductID

--FULL JOIN Example: Retrieve all records from both tables, with NULLs for missing matches:

SELECT Products.ProductName, Suppliers.SupplierName
FROM Products
FULL JOIN Suppliers ON Products.ProductID = Suppliers.ProductID

-- WHERE AND HAVING
--Retrieve categories with more than one product:

--USING WHERE
SELECT Category, COUNT(*) AS ProductCount
FROM Products
WHERE Category = 'Electronics'
GROUP BY Category

--USING HAVING
SELECT Category, COUNT(*) AS ProductCount
FROM Products
GROUP BY Category
HAVING COUNT(*) > 1

--Aggregate Functions
--Calculate the average price of products:

SELECT AVG(Price) AS AveragePrice FROM Products

--Calculate the total quantity of all products:

SELECT SUM(Quantity) AS TotalQuantity FROM Products

--Find the minimum price of products:

SELECT MIN(Price) AS MinPrice FROM Products

--Find the maximum price of products:

SELECT MAX(Price) AS MaxPrice FROM Products
