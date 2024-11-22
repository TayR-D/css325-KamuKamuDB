/*
    Master Table: Menu_Item, Topping_Item, Milk_Option, Ingredient, Recipe, Promotion (and its subclasses), Staff (and its subclasses) 
    Transaction Table: Includes, Payment, _Order, Order_Item, Order_Topping, Tax_Invoice, Brewing
*/

USE kamukamu;

-- Inserting records into Menu_Item
INSERT INTO Menu_Item (EN_Name, TH_Name, Menu_Group, Menu_Category, Iced_Blend, Nut_Allergy, Type, Size, Price, Status) VALUES
('Espresso', 'เอสเพรสโซ', 'Kamu Coffee', 'Coffee', false, false, 'Hot', 'M', 50.00, 'Available'),
('Latte', 'ลาเต้', 'Kamu Coffee', 'Coffee', true, false, 'Cold', 'L', 85.00, 'Available'),
('Matcha Latte', 'มัทฉะลาเต้', 'Kamu Signature', 'Matcha', false, false, 'Hot', 'M', 90.00, 'Available'),
('Cheese Tea', 'ชีสที', 'Kamu Signature', 'Cheese Tea', true, true, 'Cold', 'L', 100.00, 'Available'),
('Fruit Tea', 'ชาน้ำผลไม้', 'Kamu Original', 'Real Fruit Tea', true, false, 'Cold', 'M', 75.00, 'Available'),
('Dino Milk', 'ดิโน่มิลค์', 'Kamu Original', 'Milk', false, false, 'Hot', 'L', 70.00, 'Available'),
('Cocoa', 'โกโก้', 'Kamu Original', 'Cocoa', false, false, 'Hot', 'M', 65.00, 'Available'),
('Iced Matcha', 'มัทฉะเย็น', 'Kamu Signature', 'Matcha', true, false, 'Cold', 'M', 95.00, 'Available'),
('Iced Coffee', 'กาแฟเย็น', 'Kamu Coffee', 'Coffee', true, false, 'Cold', 'L', 80.00, 'Available'),
('Sparkling Lemonade', 'สปาร์กลิงเลมอน', 'Kamu Original', 'Sparkling', true, false, 'Cold', 'L', 85.00, 'Available');

-- Inserting records into Topping_Item
INSERT INTO Topping_Item (_Name, Price, Type) VALUES
('Black Pearl', 10.00, 'Signature Topping'),
('Grass Jelly', 10.00, 'Duo Topping'),
('Strawberry Jam', 30.00, 'Signature Topping'),
('MAS-CAMO-NE Cheese Cream (single)', 40.00, 'Signature Topping'),
('MAS-CAMO-NE Cheese Cream (double)', 50.00, 'Signature Topping'),
('Cocoa Crumble', 20.00, 'Signature Topping'),
('Fossil waffle', 25.00, 'Signature Topping'),
('Crystal Pearl', 15.00, 'Signature Topping'),
('Aloe Vera', 10.00, 'Signature Topping'),
('Pearl Duo', 20.00, 'Duo Topping'),
('Crystal Duo', 20.00, 'Duo Topping'),
('Crumble Duo', 25.00, 'Duo Topping');

-- Inserting records into Milk_Option
INSERT INTO Milk_Option (_Name, Price) VALUES
('Fresh Milk', 10.00),
('Low Fat Milk', 10.00),
('Soy Milk', 25.00),
('Oat Milk', 25.00);

-- Inserting records into Recipe
INSERT INTO Recipe (Code, Sweetness, Description, Menu_Item_EN_Name, Menu_Item_Size) VALUES
('ESPR-0', '0', 'Bitter espresso shot', 'Espresso', 'M'),
('ESPR-25', '25', 'Mild-Bitter espresso shot', 'Espresso', 'M'),
('ESPR-50', '50', 'Little bitter espresso shot', 'Espresso', 'M'),
('ESPR-100', '100', 'Regular espresso shot', 'Espresso', 'M'),
('LATT-50', '50', 'Smooth latte with a touch of sweetness', 'Latte', 'L'),
('MLAT-100', '100', 'Rich and creamy matcha blend', 'Matcha Latte', 'M'),
('CTEA-75', '75', 'Creamy cheese tea topped with cheese foam', 'Cheese Tea', 'L'),
('FTEA-25', '25', 'Refreshing fruit tea with real fruits', 'Fruit Tea', 'M'),
('DINO-0', '0', 'Rich and creamy dino milk', 'Dino Milk', 'L'),
('COCO-0', '0', 'Rich cocoa drink', 'Cocoa', 'M'),
('MATC-50', '50', 'Iced matcha with milk', 'Iced Matcha', 'M'),
('COFF-100', '100', 'Iced coffee with a sweet finish', 'Iced Coffee', 'L'),
('SLEM-0', '0', 'Sparkling lemonade with a twist', 'Sparkling Lemonade', 'L');

-- Inserting records into Ingredient
INSERT INTO Ingredient (_Name, Unit, Stock) VALUES
('Coffee Beans', 'kg', 100),
('Milk', 'L', 200),
('Sugar', 'kg', 50),
('Matcha Powder', 'kg', 30),
('Tea Leaves', 'kg', 40),
('Cocoa Powder', 'kg', 20),
('Fruit Puree', 'L', 50),
('Boba', 'kg', 25),
('Cream Cheese', 'kg', 15),
('Whipping Cream', 'L', 40),
('Espresso Beans', 'kg', 15),  
('Cheese Foam', 'L', 10),      
('Dried Fruit Pieces', 'kg', 5), 
('Cold Brew Coffee', 'L', 20), 
('Lemon Juice', 'L', 10),      
('Sparkling Water', 'L', 20),  
('Fruit Tea Base', 'L', 15);

-- Inserting records into Staff
INSERT INTO Staff (ID, First_Name, Last_Name, Nickname, Gender, Birth_Date, Facebook, Line_ID, Phone_number, Profile_Picture, Perks) VALUES
(1, 'Korn', 'Dhampiban-udom', 'TN', 'M', '2004-11-11', 'TN Korn', 'tndudom1104', '0957451913', 'tnd.png', 'Master of choc, Bonus: 2% sales'),
(2, 'Sirapat', 'Tansakul', 'Keng', 'M', '2003-08-15', 'Sirapat Tansakul', 'keng5912', '0988275856', 'kengs.ong', 'Brewing with kindness, Bonus: 2% sales'),
(3, 'Chanyanud', 'Sriyota', 'Oum', 'F', '2004-09-03', 'Oum Chanyanud', '0619954861', '0619954861', 'oums.png', '+20 year experience in Thai Tea, Bonus: 2% sales'),
(4, 'Anawin', 'Srivoranan', 'Tae', 'M', '2003-08-12', 'Anawin Srivoranan', 'anasri12', '0955408047', 'taes.png', 'Savage dino maker, Bonus: 2% sales'),
(5, 'Teerachot', 'Khusuwan', 'Ham', 'M', '2003-09-16', 'Teerachot Khusuwan', 'hamplus', '0958470305', 'hamt.png', 'Best of tea, Bonus: 2% sales'),
(6, 'Alice', 'Wonderer', 'Allie', 'F', '2003-06-18', 'Alice Wonderer', 'allicie06', '0817495844', 'alicew.png', 'Bonus: 2% sales'),
(7, 'Bob', 'Charles', 'Bob', 'M', '2003-02-21', 'Bob Charles', 'bobby43', '0869974125', 'bobc.png', 'Bonus: 2% sales'),
(8, 'Emily', 'Watson', 'Emma', 'F', '2003-06-30', 'Emily Watson', 'emily30', '0817485454', 'Emilyw.png', 'Bonus: 2% sales'),
(9, 'David', 'Beckham', 'David', 'M', '2003-07-11', 'David Beckham', 'david11', '0811568224', 'Davidb.png', '-'),
(10, 'Linda', 'Wonderer', 'Linda', 'F', '2003-08-18', 'Linda Odinson', 'lindy08', '0812345564', 'lindaw.png', 'Bonus: 2% sales'),
(11, 'Ruben', 'Amorim', 'Ruben', 'M', '1985-01-27', 'Ruben Amorim', 'ruben77', '0123456789', 'rubena.png', 'Bonus: 2% sales'),
(12, 'Tony', 'Stark', 'Tony', 'M', '1978-08-16', 'Tony Stark', 'ironman', '0851597463', 'tonys.png', 'PT-Bonus: 300baht'),
(13, 'Donald', 'Trumpet', 'Trump', 'M', '2025-11-05', 'Donald Trupet', 'trump11', '0851746933', 'donaldt.png', 'Us first, PT-Bonus: 300baht'),
(14, 'Anya', 'Joy', 'Anya', 'F', '2003-01-11', 'Anya Taylor Joy', 'Anya02', '0967485166', 'anyaj.png', 'PT-Bonus: 300baht'),
(15, 'Somsak', 'Bhunyangyuen', 'Teng', 'M', '2003-08-18', 'Somsak B', 'Som233', '0854445213', 'somsakb.png', 'PT-Bonus: 300baht'),
(16, 'George', 'Bush', 'George', 'M', '1870-09-08', 'George Bush', 'bush1234', '0893456855', 'georgeb.png', 'PT-Bonus: 300baht'),
(17, 'Henry', 'Ford', 'Ford', 'M', '1878-03-18', 'Henry Ford', 'hford', '0895554444', 'henryf.png', 'PT-Bonus: 300baht'),
(18, 'Peter', 'Parker', 'Peter', 'M', '2004-02-11', 'Peter Parker', 'perterp', '0967461813', 'perterp.png', 'PT-Bonus: 300baht'),
(19, 'Sorayut', 'Nakmura', 'Ood', 'M', '2001-07-22', 'Sorayut Na', 'sryna22', '0874458114', 'sorayutn.png', 'PT-Bonus: 300baht'),
(20, 'Water', 'Bottle', 'Wally', 'M', '2004-11-11', 'Water Bottle', 'wally47', '0699444156', 'watterb.png', 'PT-Bonus: 300baht');


-- Inserting records into Address
INSERT INTO Address (Staff_ID, Address) VALUES
(1, '168/276 Khlong Nueng, Khlong Luang District, Pathum Thani 12120'),
(2, '1822 Condo, Khlong Nueng, Khlong Luang District, Pathum Thani 12120'),
(3, '169/296 Kave Ava, Khlong Nueng, Khlong Luang District, Pathum Thani 12120'),
(4, '169/296 Khlong Nueng, Khlong Luang District, Pathum Thani 10120'),
(5, 'SIIT, Khlong Nueng, Khlong Luang District, Pathum Thani 10120'),
(6, '987 Birch St'),
(7, '135 Cedar St'),
(8, '246 Spruce St'),
(9, '369 Walnut St'),
(10, '753 Cherry St');

-- Inserting records into Part_Time
INSERT INTO Part_Time (Staff_ID, Wage_Per_Hour) VALUES
(11, 50.00),
(12, 55.00),
(13, 60.00),
(14, 65.00),
(15, 70.00),
(16, 50.00),
(17, 55.00),
(18, 60.00),
(19, 65.00),
(20, 70.00);

-- Inserting records into Full_Time
INSERT INTO Full_Time (Staff_ID, Position, Salary) VALUES
(1, 'Barista', 13500.00),
(2, 'Barista', 13500.00),
(3, 'Supervisor', 16000.00),
(4, 'Supervisor', 16000.00),
(5, 'Manager', 20000.00),
(6, 'Manager', 20000.00),
(7, 'Barista', 14000.00),
(8, 'Barista', 14000.00),
(9, 'Supervisor', 17000.00),
(10, 'Supervisor', 17000.00);


-- Inserting records into Promotion
INSERT INTO Promotion (ID, _Name, Code, Poster, Requirement, Status, Limit_Per_Recipe, Max_Redeem, Start_Date, Exp_Date) VALUES
(1, 'Happy Hour', 'HH2024', 'Poster1', 'Buy 1 Get 1', 'Active', 1, 100, '2024-01-01', '2024-12-31'),
(2, 'Student Discount', 'SD2024', 'Poster2', '10% off for students', 'Active', 1, 200, '2024-02-01', '2024-12-31'),
(3, 'Summer Special', 'SS2024', 'Poster3', 'Free topping with any drink', 'Active', 1, 150, '2024-03-01', '2024-12-31'),
(4, 'Loyalty Reward', 'LR2024', 'Poster4', 'Every 10th drink is free', 'Active', 1, 50, '2024-04-01', '2024-12-31'),
(5, 'Holiday Sale', 'HS2024', 'Poster5', '15% off on selected items', 'Active', 1, 75, '2024-05-01', '2024-12-31'),
(6, 'Birthday Treat', 'BT2024', 'Poster6', 'Free drink on your birthday', 'Active', 1, 100, '2024-06-01', '2024-12-31'),
(7, 'Pay M For L', 'ML2024', 'Poster7.png', 'Pay for M size, get L size', 'Active', 1, 100, '2024-07-01', '2025-01-15'),
(8, 'Buy 2 Only 109', '2O2024', 'Poster8.png', 'Buy 2 glasses and pay only 109 Baht', 'Active', 1, 100, '2024-08-01', '2024-12-31'),
(9, 'Only Monday', 'OM2024', 'Poster9.png', 'Buy 1 get 1 on every Mondays', 'Active', 1, 200, '2024-09-01', '2024-12-31'),
(10, 'Matcha 30%', 'MC2024', 'Poster10.png', 'Buy 2 Matcha Latte, get discount 30%', 'Active', 1 ,150, '2024-10-01', '2024-12-31');


-- Transaction Table: Include, Payment, _Order, Order_Item, Order_Topping, Tax_Invoice, Brewing


-- Inserting records into Includes
INSERT INTO Includes (Promo_ID, Menu_Item_EN_Name, Menu_Item_Size) VALUES
(1, 'Espresso', 'M'),
(1, 'Latte', 'L'),
(1, 'Matcha Latte', 'M'),
(1, 'Cheese Tea', 'L'),
(1, 'Fruit Tea', 'M'),
(1, 'Dino Milk', 'L'),
(1, 'Cocoa', 'M'),
(1, 'Iced Matcha', 'M'),
(1, 'Iced Coffee', 'L'),
(1, 'Sparkling Lemonade', 'L'),

(2, 'Espresso', 'M'),
(2, 'Latte', 'L'),
(2, 'Matcha Latte', 'M'),
(2, 'Cheese Tea', 'L'),
(2, 'Fruit Tea', 'M'),
(2, 'Dino Milk', 'L'),
(2, 'Cocoa', 'M'),
(2, 'Iced Matcha', 'M'),
(2, 'Iced Coffee', 'L'),
(2, 'Sparkling Lemonade', 'L'),

(3, 'Espresso', 'M'),
(3, 'Latte', 'L'),
(3, 'Matcha Latte', 'M'),
(3, 'Cheese Tea', 'L'),
(3, 'Fruit Tea', 'M'),
(3, 'Dino Milk', 'L'),
(3, 'Cocoa', 'M'),
(3, 'Iced Matcha', 'M'),
(3, 'Iced Coffee', 'L'),
(3, 'Sparkling Lemonade', 'L');

-- Inserting records into _Order
INSERT INTO _Order (Order_NO, Queue_Number, Order_Timestamp, Payment_ID, Staff_ID) VALUES
(1, 1, '2024-11-09 08:15:00', null, 1),
(2, 2, '2024-11-09 08:30:00', null, 2),
(3, 3, '2024-11-09 08:45:00', null, 3),
(4, 4, '2024-11-09 09:00:00', null, 4),
(5, 5, '2024-11-09 09:15:00', null, 5),
(6, 6, '2024-11-09 09:30:00', null, 6),
(7, 7, '2024-11-09 09:45:00', null, 7),
(8, 8, '2024-11-09 10:00:00', null, 8),
(9, 9, '2024-11-09 10:15:00', null, 9),
(10, 10, '2024-11-09 10:30:00', null, 10),
(11, 11, '2024-11-09 10:45:00', null, 1),
(12, 12, '2024-11-09 11:00:00', null, 2),
(13, 13, '2024-11-09 11:15:00', null, 3),
(14, 14, '2024-11-09 11:30:00', null, 4),
(15, 15, '2024-11-09 11:45:00', null, 5),
(16, 16, '2024-11-09 12:00:00', null, 6),
(17, 17, '2024-11-09 12:15:00', null, 7),
(18, 18, '2024-11-09 12:30:00', null, 8),
(19, 19, '2024-11-09 12:45:00', null, 9),
(20, 20, '2024-11-09 13:00:00', null, 10),
(21, 21, '2024-11-09 13:15:00', null, 1),
(22, 22, '2024-11-09 13:30:00', null, 2),
(23, 23, '2024-11-09 13:45:00', null, 3),
(24, 24, '2024-11-09 14:00:00', null, 4),
(25, 25, '2024-11-09 14:15:00', null, 5),
(26, 26, '2024-11-09 14:30:00', null, 6),
(27, 27, '2024-11-09 14:45:00', null, 7),
(28, 28, '2024-11-09 15:00:00', null, 8),
(29, 29, '2024-11-09 15:15:00', null, 9),
(30, 30, '2024-11-09 15:30:00', null, 10);


-- Inserting records into Order_Item
INSERT INTO Order_Item (ID, Sweetness, Iced_Blend, Amount, Milk_Option_Name, Order_NO, Menu_Item_Name, Menu_Item_Size) VALUES
(1, '0', true, 1, 'Fresh Milk', 1, 'Espresso', 'M'),
(2, '25', false, 1, 'Low Fat Milk', 2, 'Latte', 'L'),
(3, '50', true, 1, 'Soy Milk', 3, 'Matcha Latte', 'M'),
(4, '100', false, 1, 'Oat Milk', 4, 'Cheese Tea', 'L'),
(5, '0', true, 1, 'Fresh Milk', 5, 'Fruit Tea', 'M'),
(6, '25', false, 1, 'Low Fat Milk', 6, 'Dino Milk', 'L'),
(7, '50', true, 1, 'Soy Milk', 7, 'Cocoa', 'M'),
(8, '100', false, 1, 'Oat Milk', 8, 'Iced Matcha', 'M'),
(9, '0', true, 1, 'Fresh Milk', 9, 'Iced Coffee', 'L'),
(10, '25', false, 1, 'Low Fat Milk', 10, 'Sparkling Lemonade', 'L'),
(11, '50', true, 1, 'Soy Milk', 11, 'Espresso', 'M'),
(12, '100', false, 1, 'Oat Milk', 12, 'Latte', 'L'),
(13, '0', true, 1, 'Fresh Milk', 13, 'Matcha Latte', 'M'),
(14, '25', false, 1, 'Low Fat Milk', 14, 'Cheese Tea', 'L'),
(15, '50', true, 1, 'Soy Milk', 15, 'Fruit Tea', 'M'),
(16, '100', false, 1, 'Oat Milk', 16, 'Dino Milk', 'L'),
(17, '0', true, 1, 'Fresh Milk', 17, 'Cocoa', 'M'),
(18, '25', false, 1, 'Low Fat Milk', 18, 'Iced Matcha', 'M'),
(19, '50', true, 1, 'Soy Milk', 19, 'Iced Coffee', 'L'),
(20, '100', false, 1, 'Oat Milk', 20, 'Sparkling Lemonade', 'L'),
(21, '0', true, 1, 'Fresh Milk', 21, 'Espresso', 'M'),
(22, '25', false, 1, 'Low Fat Milk', 22, 'Latte', 'L'),
(23, '50', true, 1, 'Soy Milk', 23, 'Matcha Latte', 'M'),
(24, '100', false, 1, 'Oat Milk', 24, 'Cheese Tea', 'L'),
(25, '0', true, 1, 'Fresh Milk', 25, 'Fruit Tea', 'M'),
(26, '25', false, 1, 'Low Fat Milk', 26, 'Dino Milk', 'L'),
(27, '50', true, 1, 'Soy Milk', 27, 'Cocoa', 'M'),
(28, '100', false, 1, 'Oat Milk', 28, 'Iced Matcha', 'M'),
(29, '0', true, 1, 'Fresh Milk', 29, 'Iced Coffee', 'L'),
(30, '25', false, 1, 'Low Fat Milk', 30, 'Sparkling Lemonade', 'L');

-- Inserting records into Order_Topping
INSERT INTO Order_Topping (Order_Item_Id, Amount, Topping_Item_Name) VALUES
(1, 1, 'Black Pearl'),
(2, 2, 'Grass Jelly'),
(3, 3, 'Strawberry Jam'),
(4, 1, 'MAS-CAMO-NE Cheese Cream (single)'),
(5, 2, 'MAS-CAMO-NE Cheese Cream (double)'),
(6, 1, 'Cocoa Crumble'),
(7, 2, 'Fossil waffle'),
(8, 3, 'Crystal Pearl'),
(9, 1, 'Aloe Vera'),
(10, 2, 'Pearl Duo'),
(11, 3, 'Crystal Duo'),
(12, 1, 'Crumble Duo'),
(13, 2, 'Black Pearl'),
(14, 3, 'Grass Jelly'),
(15, 1, 'Strawberry Jam'),
(16, 2, 'MAS-CAMO-NE Cheese Cream (single)'),
(17, 3, 'MAS-CAMO-NE Cheese Cream (double)'),
(18, 1, 'Cocoa Crumble'),
(19, 2, 'Fossil waffle'),
(20, 3, 'Crystal Pearl'),
(21, 1, 'Aloe Vera'),
(22, 2, 'Pearl Duo'),
(23, 3, 'Crystal Duo'),
(24, 1, 'Crumble Duo'),
(25, 2, 'Black Pearl'),
(26, 3, 'Grass Jelly'),
(27, 1, 'Strawberry Jam'),
(28, 2, 'MAS-CAMO-NE Cheese Cream (single)'),
(29, 3, 'MAS-CAMO-NE Cheese Cream (double)'),
(30, 1, 'Cocoa Crumble');

-- Inserting records into Payment
INSERT INTO Payment (ID, Method, Amount, Order_NO) VALUES
(1, 'Credit Card', 50.00, 1),
(2, 'Cash', 85.00, 2),
(3, 'PayPal', 90.00, 3),
(4, 'Credit Card', 100.00, 4),
(5, 'Cash', 75.00, 5),
(6, 'PayPal', 70.00, 6),
(7, 'Credit Card', 65.00, 7),
(8, 'Cash', 95.00, 8),
(9, 'PayPal', 80.00, 9),
(10, 'Credit Card', 85.00, 10),
(11, 'Cash', 50.00, 11),
(12, 'PayPal', 85.00, 12),
(13, 'Credit Card', 90.00, 13),
(14, 'Cash', 100.00, 14),
(15, 'PayPal', 75.00, 15),
(16, 'Credit Card', 70.00, 16),
(17, 'Cash', 65.00, 17),
(18, 'PayPal', 95.00, 18),
(19, 'Credit Card', 80.00, 19),
(20, 'Cash', 85.00, 20),
(21, 'PayPal', 50.00, 21),
(22, 'Credit Card', 85.00, 22),
(23, 'Cash', 90.00, 23),
(24, 'PayPal', 100.00, 24),
(25, 'Credit Card', 75.00, 25),
(26, 'Cash', 70.00, 26),
(27, 'PayPal', 65.00, 27),
(28, 'Credit Card', 95.00, 28),
(29, 'Cash', 80.00, 29),
(30, 'PayPal', 85.00, 30);

UPDATE _Order
SET Payment_ID = 1
WHERE Order_NO = 1;
UPDATE _Order
SET Payment_ID = 2
WHERE Order_NO = 2;
UPDATE _Order
SET Payment_ID = 3
WHERE Order_NO = 3;
UPDATE _Order
SET Payment_ID = 4
WHERE Order_NO = 4;
UPDATE _Order
SET Payment_ID = 5
WHERE Order_NO = 5;
UPDATE _Order
SET Payment_ID = 6
WHERE Order_NO = 6;
UPDATE _Order
SET Payment_ID = 7
WHERE Order_NO = 7;
UPDATE _Order
SET Payment_ID = 8
WHERE Order_NO = 8;
UPDATE _Order
SET Payment_ID = 9
WHERE Order_NO = 9;
UPDATE _Order
SET Payment_ID = 10
WHERE Order_NO = 10;
UPDATE _Order
SET Payment_ID = 11
WHERE Order_NO = 11;
UPDATE _Order
SET Payment_ID = 12
WHERE Order_NO = 12;
UPDATE _Order
SET Payment_ID = 13
WHERE Order_NO = 13;
UPDATE _Order
SET Payment_ID = 14
WHERE Order_NO = 14;
UPDATE _Order
SET Payment_ID = 15
WHERE Order_NO = 15;
UPDATE _Order
SET Payment_ID = 16
WHERE Order_NO = 16;
UPDATE _Order
SET Payment_ID = 17
WHERE Order_NO = 17;
UPDATE _Order
SET Payment_ID = 18
WHERE Order_NO = 18;
UPDATE _Order
SET Payment_ID = 19
WHERE Order_NO = 19;
UPDATE _Order
SET Payment_ID = 20
WHERE Order_NO = 20;
UPDATE _Order
SET Payment_ID = 21
WHERE Order_NO = 21;
UPDATE _Order
SET Payment_ID = 22
WHERE Order_NO = 22;
UPDATE _Order
SET Payment_ID = 23
WHERE Order_NO = 23;
UPDATE _Order
SET Payment_ID = 24
WHERE Order_NO = 24;
UPDATE _Order
SET Payment_ID = 25
WHERE Order_NO = 25;
UPDATE _Order
SET Payment_ID = 26
WHERE Order_NO = 26;
UPDATE _Order
SET Payment_ID = 27
WHERE Order_NO = 27;
UPDATE _Order
SET Payment_ID = 28
WHERE Order_NO = 28;
UPDATE _Order
SET Payment_ID = 29
WHERE Order_NO = 29;
UPDATE _Order
SET Payment_ID = 30
WHERE Order_NO = 30;

-- Inserting records into Tax_Invoice
INSERT INTO Tax_Invoice (Customer_Name, Date, Address, Customer_Identification_NO, Tax_Identification_NO, Tax_Order_NO, Tax_Staff_ID) VALUES
('John Doe', '2024-11-09', '123 Elm Street, Springfield', '1000000000001', 'TIN12345', 1, 1),
('Jane Smith', '2024-11-09', '456 Maple Avenue, Shelbyville', '1000000000002', 'TIN12346', 2, 2),
('Alice Brown', '2024-11-09', '789 Oak Road, Capital City', '1000000000003', 'TIN12347', 3, 3),
('Bob Johnson', '2024-11-09', '101 Pine Lane, Greenfield', '1000000000004', 'TIN12348', 4, 4),
('Charlie White', '2024-11-09', '202 Birch Drive, Rivertown', '1000000000005', 'TIN12349', 5, 5),
('David Green', '2024-11-09', '303 Cedar Blvd, Hill Valley', '1000000000006', 'TIN12350', 6, 6),
('Eva Black', '2024-11-09', '404 Cherry Crescent, Pleasantville', '1000000000007', 'TIN12351', 7, 7),
('Frank Harris', '2024-11-09', '505 Ash Street, Woodbridge', '1000000000008', 'TIN12352', 8, 8),
('Grace Lee', '2024-11-09', '606 Pinecrest Ave, Lakewood', '1000000000009', 'TIN12353', 9, 9),
('Henry Walker', '2024-11-09', '707 Spruce Lane, Eastwood', '1000000000010', 'TIN12354', 10, 10),
('Isla King', '2024-11-09', '808 Redwood Drive, Northfield', '1000000000011', 'TIN12355', 11, 1),
('Jack White', '2024-11-09', '909 Willow Road, Oldtown', '1000000000012', 'TIN12356', 12, 2),
('Kylie Adams', '2024-11-09', '1010 Maple Street, Brightville', '1000000000013', 'TIN12357', 13, 3),
('Liam Carter', '2024-11-09', '1111 Elm Avenue, Grayson', '1000000000014', 'TIN12358', 14, 4),
('Mia Clark', '2024-11-09', '1212 Oak Drive, Oakford', '1000000000015', 'TIN12359', 15, 5),
('Nathan Lewis', '2024-11-09', '1313 Birch Boulevard, Redwood City', '1000000000016', 'TIN12360', 16, 6),
('Olivia Walker', '2024-11-09', '1414 Pine Road, Willowbrook', '1000000000017', 'TIN12361', 17, 7),
('Paul Scott', '2024-11-09', '1515 Cedar Lane, Brookdale', '1000000000018', 'TIN12362', 18, 8),
('Quinn Young', '2024-11-09', '1616 Redwood Avenue, Rivertown', '1000000000019', 'TIN12363', 19, 9),
('Rachel King', '2024-11-09', '1717 Maple Drive, Fairmont', '1000000000020', 'TIN12364', 20, 10),
('Sam Taylor', '2024-11-09', '1818 Oak Boulevard, Cliffside', '1000000000021', 'TIN12365', 21, 1),
('Tina Harris', '2024-11-09', '1919 Ash Street, Lakeside', '1000000000022', 'TIN12366', 22, 2),
('Ursula Moore', '2024-11-09', '2020 Pine Crescent, Highland', '1000000000023', 'TIN12367', 23, 3),
('Victor Nelson', '2024-11-09', '2121 Cherry Road, Stoneville', '1000000000024', 'TIN12368', 24, 4),
('Wendy Scott', '2024-11-09', '2222 Cedar Blvd, Hillview', '1000000000025', 'TIN12369', 25, 5),
('Xander White', '2024-11-09', '2323 Birch Avenue, Woodtown', '1000000000026', 'TIN12370', 26, 6),
('Yara Evans', '2024-11-09', '2424 Oak Lane, Riverdale', '1000000000027', 'TIN12371', 27, 7),
('Zoe Mitchell', '2024-11-09', '2525 Maple Avenue, Highland Park', '1000000000028', 'TIN12372', 28, 8),
('Aidan Carter', '2024-11-09', '2626 Elm Road, Pleasant Park', '1000000000029', 'TIN12373', 29, 9),
('Bella Stewart', '2024-11-09', '2727 Pinecrest Drive, Stonebridge', '1000000000030', 'TIN12374', 30, 10);

-- Inserting records into Brewing
INSERT INTO Brewing (Unit, Amount, Recipe_Code, Recipe_Sweetness, Ingredient_Name) VALUES 
('g', 5, 'ESPR-0', '0', 'Coffee Beans'),
('g', 10, 'ESPR-25', '25', 'Coffee Beans'),
('g', 15, 'ESPR-50', '50', 'Coffee Beans'),
('g', 20, 'ESPR-100', '100', 'Coffee Beans'),
('ml', 200, 'LATT-50', '50', 'Milk'),
('g', 10, 'MLAT-100', '100', 'Matcha Powder'),
('g', 5, 'FTEA-25', '25', 'Dried Fruit Pieces'),
('ml', 180, 'DINO-0', '0', 'Milk'),
('g', 15, 'COCO-0', '0', 'Cocoa Powder'),
('g', 12, 'MATC-50', '50', 'Matcha Powder'),
('ml', 200, 'SLEM-0', '0', 'Lemon Juice'),
('ml', 180, 'ESPR-0', '0', 'Espresso Beans'),
('ml', 250, 'CTEA-75', '75', 'Cheese Foam'),
('ml', 240, 'FTEA-25', '25', 'Fruit Tea Base'),
('ml', 220, 'SLEM-0', '0', 'Sparkling Water'),
('ml', 250, 'COFF-100', '100', 'Cold Brew Coffee');