create database company;
use company;
select * from sales;
-- q1: find all orders shipped via 'Economy' mode with a total amount>2500 --
select * from sales where ship_Mode ='Economy' and Total_Amount>25000;

-- Q2: retrieve all sales data for 'Technology' category in 'Ireland' made after 2020-01-01 --
select * from sales where Category='Technology' and Country='Ireland' and Order_Date> '01-01-2020';

-- Q3: List the top 10 most poriftable sales  transactions in descending order --
select * from sales order by Unit_Profit desc Limit 10;

select * from sales order by Unit_Profit desc Limit 10,20; -- skip 10 record, shows the next 20 records. --

-- Q4: Find all customers whose name start with 'J' and ends with 'n'.--

SELECT Order_ID , Customer_Name FROM sales WHERE Customer_Name LIKE 'J%n';

-- Q5: retreive all product names that contain 'ACCO' Aanywheere in the name --
select Order_ID, Product_Name from sales where Product_Name Like '%Acco%';

-- Q6: Get the top top5 cities with the highest total sales amount--
select City,SUM(Total_amount) as Total_Sales
from sales group by City order by Total_sales desc limit 5;

-- Q7: Display the second set of 10 records for Customer_Name and Total_Amount in decreasing order.
select Customer_Name, Total_Amount from sales order by Total_Amount desc Limit 10,10; 

-- Q8: Find the total revenue,average unit cost, and total number of orders
select sum(Total_Amount) as `Total Revenue` ,avg(Unit_Cost) as `Average Unit cost` , Count(Order_ID)  as `Total number of orders` from sales;

-- Q9: Count unique number of regions----
select count(distinct(region)) as uniq_region from sales;

-- Q10: Find the number of orders placed by each customer. 
select Customer_Name, count(Order_ID) as order_count from sales group by Customer_Name order by Order_Count desc;

-- Q11: Rank 5 products based on total sales using RANK(). 
select Product_Name, SUM(Total_Amount) as Total_Sales, RANK() over (order by sum(Total_Amount) desc) as Sales_Rank from sales group by Product_Name LIMIT 5;