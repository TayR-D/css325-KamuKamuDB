USE kamukamu;
-- Oum & Tae
-- Basic queries 

-- 1.List all Menu Items in the "Coffee" Category.
SELECT concat(EN_Name,' ( ',TH_Name,' )') AS `Coffee Menu`, Price, Size
FROM Menu_Item
WHERE Menu_Category = 'Coffee';

-- 2.Find the total number of staff grouped by gender.
SELECT Gender, COUNT(ID) AS `Total Staff`
FROM Staff
GROUP BY Gender;

-- 3.List all toppings that cost more than 20.00.
SELECT _Name, Price
FROM Topping_Item
WHERE Price > 20.00;

-- 4.Count the number of orders placed on '2024-11-09'.
SELECT COUNT(Order_NO) AS `TotalOrders in 2024,11 November`
FROM _Order
WHERE DATE(Order_Timestamp) = '2024-11-09';

-- 5.Show the most expensive menu item and its price.
SELECT concat(EN_Name,' ( ',TH_Name,' )'), Price 
FROM Menu_Item 
ORDER BY Price DESC 
LIMIT 1;

-- 6.Display all menu items that have "Cold" .
SELECT concat(EN_Name,' ( ',TH_Name,' )'), Size, Price
FROM Menu_Item
WHERE Type = 'Cold' ;

-- 7.List menu items that are tea.
SELECT concat(EN_Name,' ( ',TH_Name,' )'), Price
FROM Menu_Item
WHERE EN_Name LIKE '%Tea%';

-- 8.List menu items that are matcha.
SELECT concat(EN_Name,' ( ',TH_Name,' )'), Price 
FROM Menu_Item 
WHERE EN_Name LIKE '%Matcha%';

-- Advanced queries 
-- 1.Find the staff who processed the most orders.
SELECT concat(Staff.First_Name ,' ', Staff.Last_Name) AS Name, COUNT(_Order.Order_NO) AS `Total Orders`
FROM Staff
JOIN _Order ON Staff.ID = _Order.Staff_ID
GROUP BY Staff.ID
ORDER BY `Total Orders` DESC
LIMIT 1;

-- 2.List all staff who are part-time along with their wage per hour.
SELECT concat(Staff.First_Name ,' ', Staff.Last_Name) AS Name , 
	Part_Time.Wage_Per_Hour as `Wage per hour`
FROM Staff 
JOIN Part_Time ON Staff.ID = Part_Time.Staff_ID
ORDER BY Part_Time.Wage_Per_Hour;

-- 3.Find orders that include a topping priced higher than 25.00.
SELECT Order_Item.ID AS `Order Item ID`, Topping_Item._Name AS `Topping Name`, Topping_Item.Price AS `Topping Price`
FROM Order_Item
JOIN Order_Topping ON Order_Item.ID = Order_Topping.Order_Item_Id
JOIN Topping_Item ON Order_Topping.Topping_Item_Name = Topping_Item._Name
WHERE Topping_Item.Price > 25.00
ORDEr BY Order_Item.ID;

-- 4.Show the details of all orders including the menu item, size, and milk option.
SELECT _Order.Order_NO AS `Order NO`, Order_Item.Menu_Item_Name AS `Menu Item Name`, Order_Item.Menu_Item_Size AS `Size`, Order_Item.Milk_Option_Name AS `Milk Option`
FROM _Order
JOIN Order_Item ON _Order.Order_NO = Order_Item.Order_NO;

-- 5.Find recipes that use "Milk" as an ingredient.
SELECT Recipe.Code, Recipe.Menu_Item_EN_Name AS Menu , Recipe.Description
FROM Recipe
JOIN Brewing ON Recipe.Code = Brewing.Recipe_Code
WHERE Brewing.Ingredient_Name = 'Milk';

-- 6.Show the promotion details of menu items available under 'Happy Hour'.
SELECT Promotion._Name AS PromotionName, concat(Menu_Item.EN_Name,' ( ',Menu_Item.TH_Name,' )')  AS MenuItem, Menu_Item.Price
FROM Promotion
JOIN Includes ON Promotion.ID = Includes.Promo_ID
JOIN Menu_Item ON Includes.Menu_Item_EN_Name = Menu_Item.EN_Name AND Includes.Menu_Item_Size = Menu_Item.Size
WHERE Promotion._Name = 'Happy Hour'
ORDER BY Price;

-- 7.Show all promotions that include menu items with "Fruit Tea" and their details:
SELECT Promotion._Name AS `Promotion Name`, concat(Menu_Item.EN_Name,' ( ',Menu_Item.TH_Name,' )') AS Menu , Promotion.Start_Date AS `Start date` , Promotion.Exp_Date AS `End date`
FROM Promotion
JOIN Includes ON Promotion.ID = Includes.Promo_ID
JOIN Menu_Item ON Includes.Menu_Item_EN_Name = Menu_Item.EN_Name AND Includes.Menu_Item_Size = Menu_Item.Size
WHERE Menu_Item.Menu_Category = 'Real Fruit Tea';

-- 8.List all staff members who processed orders containing "Matcha Latte":
SELECT DISTINCT Staff.First_Name, Staff.Last_Name
FROM Staff
JOIN _Order ON Staff.ID = _Order.Staff_ID
JOIN Order_Item ON _Order.Order_NO = Order_Item.Order_NO
WHERE Order_Item.Menu_Item_Name = 'Matcha Latte';
