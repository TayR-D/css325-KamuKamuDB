USE kamukamu;

-- Keng

-- Basic

-- Find the average price of all menu items
SELECT AVG(Price) AS AveragePrice
FROM Menu_Item;

-- Identify menu items that are not available in iced blended form
SELECT * 
FROM menu_item
WHERE Iced_Blend = '0';

-- List All Orders Processed by 'Sirapat Tansakul'
SELECT Order_NO AS `Order Number`, Order_Timestamp AS `Order Date & Time`
FROM _Order
WHERE Staff_ID = (SELECT ID FROM Staff WHERE First_Name = 'Sirapat' AND Last_Name = 'Tansakul');

-- Calculate average price for each menu group
SELECT Menu_Group, AVG(Price) AS AveragePrice
FROM menu_item
GROUP BY Menu_Group
ORDER BY AveragePrice DESC;

-- List all active promotions
SELECT _Name AS PromotionName, Start_Date, Exp_Date
FROM Promotion
WHERE CURDATE() BETWEEN Start_Date AND Exp_Date
ORDER BY Start_Date ASC;

-- List all order items which have milk option as 'Soy Milk'
SELECT DISTINCT Order_NO, ID, Menu_Item_Name, Milk_Option_Name
FROM Order_Item
WHERE Milk_Option_Name = 'Soy Milk'
ORDER BY Order_NO;

-- Advanced

-- Find staff who worked on orders with the highest average value
SELECT s.First_Name, s.Last_Name, AVG(oi.Amount * mi.Price) AS Avg_Order_Value
FROM _Order o
JOIN Order_Item oi ON o.Order_NO = oi.Order_NO
JOIN Menu_Item mi ON oi.Menu_Item_Name = mi.EN_Name AND oi.Menu_Item_Size = mi.Size
JOIN Staff s ON o.Staff_ID = s.ID
GROUP BY s.ID
ORDER BY Avg_Order_Value DESC
LIMIT 1;

-- Find the least popular menu item by sales
SELECT mi.EN_Name, mi.TH_Name, SUM(oi.Amount) AS Total_Sales
FROM Order_Item oi
JOIN Menu_Item mi ON oi.Menu_Item_Name = mi.EN_Name AND oi.Menu_Item_Size = mi.Size
GROUP BY mi.EN_Name, mi.TH_Name
ORDER BY Total_Sales ASC;

-- Shows how many orders each staff member handled
SELECT s.First_Name, s.Last_Name, COUNT(o.Order_NO) as total_orders, SUM(p.Amount) as total_sales
FROM staff s
LEFT JOIN _order o ON s.ID = o.Staff_ID
LEFT JOIN payment p ON o.Order_NO = p.Order_NO
GROUP BY s.First_Name, s.Last_Name
ORDER BY total_sales DESC;

-- Shows menu items and their recipe information using LEFT JOIN
SELECT mi.EN_Name, mi.Menu_Category, r.Code as recipe_code, r.Description
FROM menu_item mi
LEFT JOIN recipe r ON mi.EN_Name = r.Menu_Item_EN_Name
ORDER BY mi.EN_Name;

