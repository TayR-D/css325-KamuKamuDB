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