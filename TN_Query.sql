USE kamukamu;
-- TN

-- Basic queries

-- List price of each  menu item
SELECT EN_Name as menu, SUM(price) AS total_sales 
    FROM Menu_Item
    GROUP BY Menu
;

-- The most popular menu
SELECT oi.Menu_Item_Name as Menu, SUM(Amount) as Total_Sold
    FROM Order_Item oi
    GROUP BY oi.Menu_Item_Name
    ORDER BY Total_Sold DESC LIMIT 1
;

-- Count how many order were ice_blended
SELECT COUNT(Order_NO) 
    FROM Order_Item
    WHERE Iced_Blend
;

-- Count how many times each payment method were made, 
-- and how much KamuKamu received from each payment methods
SELECT Method, COUNT(Method) as Count, SUM(Amount) as Total
    FROM Payment
    GROUP BY Method
;

-- Advance queries

-- Top selling menu items of November 2024
SELECT oi.Menu_Item_Name as Menu, SUM(Amount) as Total_Sold
    FROM Order_Item oi 
    JOIN _Order ON oi.Order_NO = _Order.Order_NO
    WHERE Month(_Order.Order_Timestamp) = '11' AND Year(_Order.Order_Timestamp) = '2024'
    GROUP BY oi.Menu_Item_Name
;

-- Find Part_Time employees' age then order by name,
-- find their income if they were to work for 6 hours a day, 20 days a month
SELECT CONCAT(s.First_Name, " ", s.Last_Name) as Fullname, year(curdate()) - year(s.Birth_Date) as Age, (pt.Wage_Per_Hour * 6 * 20 + 300) as Income
    FROM Part_Time pt 
    INNER JOIN Staff s ON pt.Staff_ID = s.ID
    ORDER BY Fullname
;

-- Find the Name, Position, and salary of Full_Time employee who earns more than the AVG salary
SELECT CONCAT(s.First_Name, " ", s.Last_Name) as Fullname, ft.Position as Position, ft.salary as Salary
    FROM Full_Time ft INNER JOIN Staff s on ft.Staff_ID = s.ID
    WHERE ft.salary > (SELECT AVG(salary) from Full_Time)
    ORDER BY Salary DESC
;

-- Compare Male and Female Full_Time Salary
SELECT s.Gender as Gender, AVG(ft.salary) as AVG_Salary
    FROM Full_Time ft INNER JOIN Staff s on ft.Staff_ID = s.ID
    GROUP BY s.Gender
;
