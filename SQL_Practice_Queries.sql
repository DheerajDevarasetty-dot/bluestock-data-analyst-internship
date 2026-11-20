CREATE DATABASE retail_sales_db;
USE retail_sales_db;
SHOW TABLES;
SELECT COUNT(*) FROM sales_data;
SELECT COUNT(*) AS total_records
FROM sales_data;
SELECT COUNT(DISTINCT `Order ID`) AS unique_orders
FROM sales_data;
SELECT * FROM sales_data
LIMIT 10;
SHOW WARNINGS;
SELECT * FROM sales_data LIMIT 5;
SELECT * FROM sales_data;
SELECT `Customer Name`
FROM sales_data;
SELECT `Product Name`
FROM sales_data;
SELECT `Order ID`, `Customer Name`, Sales, Profit
FROM sales_data;
SELECT `Order ID`, `Region`, Sales
FROM sales_data;
SELECT *
FROM sales_data
WHERE Region = 'East';
SELECT *
FROM sales_data
WHERE Sales > 1000;
SELECT *
FROM sales_data
WHERE Category = 'Furniture';
SELECT *
FROM sales_data
WHERE Category = 'Furniture';
SELECT *
FROM sales_data
WHERE Region = 'East'
OR Region = 'West';
SELECT *
FROM sales_data
WHERE Region = 'West'
AND Sales > 1000;
SELECT *
FROM sales_data
WHERE `Payment Method` = 'UPI';
SELECT `Order ID`, Region, Sales
FROM sales_data
ORDER BY Sales DESC;
SELECT `Order ID`, Region, Sales
FROM sales_data
ORDER BY Sales ASC;
SELECT `Customer Name`, Region
FROM sales_data
ORDER BY `Customer Name` ASC;
SELECT `Order ID`, Region, Sales
FROM sales_data
ORDER BY Region ASC, Sales DESC;
SELECT `Order ID`, `Customer Name`, Region, Sales
FROM sales_data
ORDER BY Sales DESC
LIMIT 10;
SELECT Region, SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Region;
SELECT Region, COUNT(*) AS Total_Orders
FROM sales_data
GROUP BY Region;
SELECT Category, SUM(Quantity) AS Total_Quantity
FROM sales_data
GROUP BY Category;
SELECT Category, SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Category
HAVING SUM(Sales) > 50000;
SELECT Region, SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Region
HAVING SUM(Profit) > 10000;
DESCRIBE sales_data;
CREATE TABLE customers (
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    City VARCHAR(100)
);
INSERT INTO customers (Customer_ID, Customer_Name, City)
VALUES
('CUST-009', 'Rahul', 'Hyderabad'),
('CUST-003', 'Priya', 'Bangalore'),
('CUST-010', 'Arjun', 'Chennai'),
('CUST-008', 'Sneha', 'Mumbai'),
('CUST-011', 'Kiran', 'Delhi');
SELECT * FROM customers;
SELECT
    s.`Customer ID`,
    s.`Customer Name`,
    c.City,
    s.Sales
FROM sales_data s
INNER JOIN customers c
ON s.`Customer ID` = c.Customer_ID;
SELECT
    s.`Customer ID`,
    s.`Customer Name`,
    c.City,
    s.Sales
FROM sales_data s
LEFT JOIN customers c
ON s.`Customer ID` = c.Customer_ID;
SELECT
    s.`Customer ID`,
    s.`Customer Name`,
    c.Customer_Name,
    c.City,
    s.Sales
FROM sales_data s
RIGHT JOIN customers c
ON s.`Customer ID` = c.Customer_ID;
SELECT SUM(Sales) AS Total_Sales
FROM sales_data;
SELECT COUNT(*) AS Total_Records
FROM sales_data;
SELECT AVG(Sales) AS Average_Sales
FROM sales_data;
SELECT MAX(Sales) AS Highest_Sales
FROM sales_data;
SELECT MIN(Sales) AS Lowest_Sales
FROM sales_data;
SELECT `Order ID`, `Customer Name`, Profit
FROM sales_data
ORDER BY Profit DESC
LIMIT 5;
SELECT COUNT(DISTINCT Category) AS Total_Categories
FROM sales_data;
SELECT
    Category AS Product_Category,
    SUM(Sales) AS Revenue,
    SUM(Profit) AS Profit_Amount
FROM sales_data
GROUP BY Category;
SELECT *
FROM sales_data
WHERE Sales BETWEEN 500 AND 2000;
SELECT *
FROM sales_data
WHERE Region IN ('East', 'West');
SELECT *
FROM sales_data
WHERE `Customer Name` LIKE 'A%';
SELECT `Order ID`, Sales
FROM sales_data
WHERE Sales > (
    SELECT AVG(Sales)
    FROM sales_data
);
SELECT
    `Order ID`,
    Sales,
    RANK() OVER (ORDER BY Sales DESC) AS Sales_Rank
FROM sales_data;
SELECT
    `Order ID`,
    Region,
    Sales,
    RANK() OVER (
        PARTITION BY Region
        ORDER BY Sales DESC
    ) AS Region_Rank
FROM sales_data;
SELECT `Order ID`, `Product Name`, Sales
FROM sales_data
ORDER BY Sales DESC
LIMIT 10;
SELECT Category, SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Category;
SELECT
    `Payment Method`,
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Revenue
FROM sales_data
GROUP BY `Payment Method`;




