-- Basic
--Top Seller
SELECT Menu_Item_Name, Menu_Item_Size, SUM(Amount) AS Total_Quantity
FROM Order_Item
GROUP BY Menu_Item_Name, Menu_Item_Size
ORDER BY Total_Quantity DESC
LIMIT 5;

--Revenue for each category
SELECT mi.Menu_Category, SUM(oi.Amount * mi.Price) AS Total_Revenue
FROM Order_Item oi
JOIN Menu_Item mi ON oi.Menu_Item_Name = mi.EN_Name AND oi.Menu_Item_Size = mi.Size
GROUP BY mi.Menu_Category
ORDER BY Total_Revenue DESC;


--Menu with nut allergy
SELECT EN_Name, TH_Name, Menu_Group, Price
FROM Menu_Item
WHERE Nut_Allergy = TRUE;

--Staff birthday current month
SELECT First_Name, Last_Name, Birth_Date
FROM Staff
WHERE MONTH(Birth_Date) = MONTH(CURDATE());



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

--Ingredient Usage in Recipes (List all ingredients used in recipes along with the total quantity required for each.)
SELECT 
    b.Ingredient_Name,
    i.Unit AS Measurement_Unit,
    SUM(b.Amount * oi.Amount) AS Total_Amount_Used_Today
FROM Order_Item oi
JOIN Menu_Item mi ON oi.Menu_Item_Name = mi.EN_Name AND oi.Menu_Item_Size = mi.Size
JOIN Brewing b ON b.Menu_Item_ID = mi.ID
JOIN Ingredient i ON b.Ingredient_Name = i._Name
JOIN _Order o ON oi.Order_NO = o.Order_NO
WHERE DATE(o.Order_Timestamp) = CURDATE()  -- Replace CURDATE() with a specific date if needed
GROUP BY b.Ingredient_Name, i.Unit
ORDER BY Total_Amount_Used_Today DESC;

--Revenue by Staff
SELECT s.First_Name, s.Last_Name, SUM(oi.Amount * mi.Price) AS Total_Revenue
FROM _Order o
JOIN Order_Item oi ON o.Order_NO = oi.Order_NO
JOIN Menu_Item mi ON oi.Menu_Item_Name = mi.EN_Name AND oi.Menu_Item_Size = mi.Size
JOIN Staff s ON o.Staff_ID = s.ID
GROUP BY s.ID, s.First_Name, s.Last_Name
ORDER BY Total_Revenue DESC;