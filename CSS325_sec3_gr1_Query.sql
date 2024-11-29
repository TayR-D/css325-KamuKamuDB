-- Basic
--Menu Price > 70
SELECT EN_Name, TH_Name, Menu_Group, Price
FROM Menu_Item
WHERE Price > 70;

--Male Staff
SELECT First_Name, Last_Name, Gender
FROM Staff
WHERE Gender = 'M';

--Menu with nut allergy
SELECT EN_Name, TH_Name, Menu_Group, Price
FROM Menu_Item
WHERE Nut_Allergy = TRUE;

--Staff birthday current month
SELECT First_Name, Last_Name, Birth_Date
FROM Staff
WHERE MONTH(Birth_Date) = MONTH(CURDATE());

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

-- List all Menu Items in the "Coffee" Category.
SELECT concat(EN_Name,' ( ',TH_Name,' )') AS `Coffee Menu`, Price, Size
FROM Menu_Item
WHERE Menu_Category = 'Coffee';

-- Find the total number of staff grouped by gender.
SELECT Gender, COUNT(ID) AS `Total Staff`
FROM Staff
GROUP BY Gender;

-- List all toppings that cost more than 20.00.
SELECT _Name, Price
FROM Topping_Item
WHERE Price > 20.00;

-- Count the number of orders placed on '2024-11-09'.
SELECT COUNT(Order_NO) AS `TotalOrders in 2024,11 November`
FROM _Order
WHERE DATE(Order_Timestamp) = '2024-11-09';

-- Show the most expensive menu item and its price.
SELECT concat(EN_Name,' ( ',TH_Name,' )'), Price 
FROM Menu_Item 
ORDER BY Price DESC 
LIMIT 1;

-- Display all menu items that have "Cold" .
SELECT concat(EN_Name,' ( ',TH_Name,' )'), Size, Price
FROM Menu_Item
WHERE Type = 'Cold' ;

-- List menu items that are tea.
SELECT concat(EN_Name,' ( ',TH_Name,' )'), Price
FROM Menu_Item
WHERE EN_Name LIKE '%Tea%';

-- List menu items that are matcha.
SELECT concat(EN_Name,' ( ',TH_Name,' )'), Price 
FROM Menu_Item 
WHERE EN_Name LIKE '%Matcha%';

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





-- Advanced
--Orders Without Payment
SELECT o.Order_NO, o.Order_Timestamp, s.First_Name, s.Last_Name
FROM _Order o
LEFT JOIN Payment p ON o.Order_NO = p.Order_NO
JOIN Staff s ON o.Staff_ID = s.ID
WHERE p.ID IS NULL;

--Promotion Effectiveness (Used Times)
SELECT p._Name AS Promotion_Name, COUNT(i.Promo_ID) AS Usage_Count
FROM Promotion p
JOIN Includes i ON p.ID = i.Promo_ID
GROUP BY p.ID, p._Name
ORDER BY Usage_Count DESC;

--Revenue by Staff
SELECT s.First_Name, s.Last_Name, SUM(oi.Amount * mi.Price) AS Total_Revenue
FROM _Order o
JOIN Order_Item oi ON o.Order_NO = oi.Order_NO
JOIN Menu_Item mi ON oi.Menu_Item_Name = mi.EN_Name AND oi.Menu_Item_Size = mi.Size
JOIN Staff s ON o.Staff_ID = s.ID
GROUP BY s.ID, s.First_Name, s.Last_Name
ORDER BY Total_Revenue DESC;

--Revenue by Menu Category
SELECT mi.Menu_Category, SUM(oi.Amount * mi.Price) AS Total_Revenue
FROM Order_Item oi
JOIN Menu_Item mi ON oi.Menu_Item_Name = mi.EN_Name AND oi.Menu_Item_Size = mi.Size
GROUP BY mi.Menu_Category
ORDER BY Total_Revenue DESC;

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

-- Find the staff who processed the most orders.
SELECT concat(Staff.First_Name ,' ', Staff.Last_Name) AS Name, COUNT(_Order.Order_NO) AS `Total Orders`
FROM Staff
JOIN _Order ON Staff.ID = _Order.Staff_ID
GROUP BY Staff.ID
ORDER BY `Total Orders` DESC
LIMIT 1;

-- List all staff who are part-time along with their wage per hour.
SELECT concat(Staff.First_Name ,' ', Staff.Last_Name) AS Name , 
	Part_Time.Wage_Per_Hour as `Wage per hour`
FROM Staff 
JOIN Part_Time ON Staff.ID = Part_Time.Staff_ID
ORDER BY Part_Time.Wage_Per_Hour;

-- Find orders that include a topping priced higher than 25.00.
SELECT Order_Item.ID AS `Order Item ID`, Topping_Item._Name AS `Topping Name`, Topping_Item.Price AS `Topping Price`
FROM Order_Item
JOIN Order_Topping ON Order_Item.ID = Order_Topping.Order_Item_Id
JOIN Topping_Item ON Order_Topping.Topping_Item_Name = Topping_Item._Name
WHERE Topping_Item.Price > 25.00
ORDEr BY Order_Item.ID;

-- Show the details of all orders including the menu item, size, and milk option.
SELECT _Order.Order_NO AS `Order NO`, Order_Item.Menu_Item_Name AS `Menu Item Name`, Order_Item.Menu_Item_Size AS `Size`, Order_Item.Milk_Option_Name AS `Milk Option`
FROM _Order
JOIN Order_Item ON _Order.Order_NO = Order_Item.Order_NO;

-- Find recipes that use "Milk" as an ingredient.
SELECT Recipe.Code, Recipe.Menu_Item_EN_Name AS Menu , Recipe.Description
FROM Recipe
JOIN Brewing ON Recipe.Code = Brewing.Recipe_Code
WHERE Brewing.Ingredient_Name = 'Milk';

-- Show the promotion details of menu items available under 'Happy Hour'.
SELECT Promotion._Name AS PromotionName, concat(Menu_Item.EN_Name,' ( ',Menu_Item.TH_Name,' )')  AS MenuItem, Menu_Item.Price
FROM Promotion
JOIN Includes ON Promotion.ID = Includes.Promo_ID
JOIN Menu_Item ON Includes.Menu_Item_EN_Name = Menu_Item.EN_Name AND Includes.Menu_Item_Size = Menu_Item.Size
WHERE Promotion._Name = 'Happy Hour'
ORDER BY Price;

-- Show all promotions that include menu items with "Fruit Tea" and their details:
SELECT Promotion._Name AS `Promotion Name`, concat(Menu_Item.EN_Name,' ( ',Menu_Item.TH_Name,' )') AS Menu , Promotion.Start_Date AS `Start date` , Promotion.Exp_Date AS `End date`
FROM Promotion
JOIN Includes ON Promotion.ID = Includes.Promo_ID
JOIN Menu_Item ON Includes.Menu_Item_EN_Name = Menu_Item.EN_Name AND Includes.Menu_Item_Size = Menu_Item.Size
WHERE Menu_Item.Menu_Category = 'Real Fruit Tea';

-- List all staff members who processed orders containing "Matcha Latte":
SELECT DISTINCT Staff.First_Name, Staff.Last_Name
FROM Staff
JOIN _Order ON Staff.ID = _Order.Staff_ID
JOIN Order_Item ON _Order.Order_NO = Order_Item.Order_NO
WHERE Order_Item.Menu_Item_Name = 'Matcha Latte';

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