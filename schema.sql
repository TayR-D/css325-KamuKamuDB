-- Create Database
DROP DATABASE IF EXISTS kamukamu;
CREATE DATABASE kamukamu;
-- Switch to database
USE kamukamu;

-- Create tables
CREATE TABLE
    Menu_Item (
        EN_Name varchar(50) not null,
        TH_Name varchar(50),
        Menu_Group ENUM ("Kamu Coffee", "Kamu Signature", "Kamu Original"),
        Menu_Category ENUM (
            "Coffee",
            "Dino Family",
            "Ichigo",
            "Cheese Tea",
            "Milk Tea",
            "Matcha",
            "Fresh Tea",
            "Cocoa",
            "Milk",
            "Real Fruit Tea",
            "Sparkling",
            "Plant-Based (Oat)",
            "Plant-Based (Soy)"
        ),
        Iced_Blend boolean,
        Nut_Allergy boolean,
        Type ENUM ("Hot", "Cold"),
        Size VARCHAR(1) not null CHECK (Size = "M" or Size = "L"),
        Price decimal(5, 2) not null CHECK (Price > 0),
        Status ENUM ("Available", "Unavailable"),
        PRIMARY KEY (EN_Name, Size)
    );

CREATE TABLE
    Topping_Item (
        _Name varchar(50) not null,
        Price decimal(5, 2),
        Type ENUM ("Duo Topping", "Signature Topping"),
        PRIMARY KEY (_Name)
    );

CREATE TABLE
    Milk_Option (
        _Name varchar(50) not null,
        Price decimal(5, 2) not null,
        PRIMARY KEY (_Name)
    );

CREATE TABLE
    Recipe (
        Code varchar(20) not null,
        Sweetness VARCHAR(3) not null CHECK (Sweetness = "0" or Sweetness = "25" or Sweetness = "50" or Sweetness = "75" or Sweetness = "100"),
        Description Text,
        Menu_Item_EN_Name varchar(50),
        Menu_Item_Size VARCHAR(1),
        PRIMARY KEY (Code, Sweetness)
    );

CREATE TABLE
    Ingredient (
        _Name varchar(50) not null unique,
        Unit varchar(5),
        Stock int,
        PRIMARY KEY (_Name)
    );

CREATE TABLE
    Brewing (
        Unit varchar(10),
        Amount INT CHECK (Amount > 0),
        Recipe_Code varchar(20),
        Recipe_Sweetness varchar(3),
        Ingredient_Name varchar(50),
        PRIMARY KEY (Recipe_Code, Recipe_Sweetness, Ingredient_Name)
    );

CREATE TABLE
    Staff (
        ID int not null unique,
        First_Name varchar(50) not null,
        Last_Name varchar(50) not null,
        Nickname varchar(50),
        Gender char(1) not null check (Gender = 'M' or Gender = 'F' or Gender ='O'),
        Birth_Date date not null,
        Facebook varchar(50),
        Line_ID	varchar(50),
        Phone_number varchar(10) not null,
        Profile_Picture	text,
        Perks text,
        PRIMARY KEY (ID)
    );

CREATE TABLE
    Address (
        Staff_ID int,
        Address varchar(511) not null,
        PRIMARY KEY (Staff_ID, Address)
    );

CREATE TABLE
    Part_Time (
        Staff_ID int,
        Wage_Per_Hour decimal(5, 2) not null,
        PRIMARY KEY (Staff_ID)
    );

CREATE TABLE
    Full_Time (
        Staff_ID int,
        Position varchar(50),
        Salary decimal(8, 2) not null,
        PRIMARY KEY (Staff_ID)
    );

CREATE TABLE
    Promotion (
        ID int not null unique,
        _Name varchar(100),
        Code varchar(20),
        Poster text,
        Requirement text not null,
        Status varchar(20),
        Limit_Per_Recipe int not null,
        Max_Redeem int not null,
        Start_Date date,
        Exp_Date date,
        PRIMARY KEY (ID)
    );

CREATE TABLE
    Fix_Price (
        Promo_ID int not null unique,
        Price decimal(5, 2) not null,
        PRIMARY KEY (Promo_ID)
    );

CREATE TABLE
    Fix_Discount (
        Promo_ID int not null unique,
        Discount decimal(5, 2) not null,
        PRIMARY KEY (Promo_ID)
    );

CREATE TABLE
    Fix_Percentage (
        Promo_ID int not null unique,
        Discount_Percentage decimal(3, 2) not null,
        PRIMARY KEY (Promo_ID)
    );

CREATE TABLE
    Includes (
        Promo_ID int,
        Menu_Item_EN_Name varchar(50),
        Menu_Item_Size VARCHAR(1),
        PRIMARY KEY (Promo_ID, Menu_Item_EN_Name, Menu_Item_Size)
    );

CREATE TABLE
    _Order (
        Order_NO int not null unique,
        Queue_Number int not null,
        Order_Timestamp timestamp not null,
        Staff_ID int,
        PRIMARY KEY (Order_NO)
    );

CREATE TABLE
    Order_Item (
        ID int not null unique,
        Sweetness varchar(20) not null,
        Iced_Blend boolean not null,
        Amount int not null,
        Milk_Option_Name varchar(50),
        Order_NO int,
        Menu_Item_Name varchar(50),
        Menu_Item_Size varchar(1),
        PRIMARY KEY (ID)
    );

CREATE TABLE
    Order_Topping (
        Order_Item_Id int,
        Amount int,
        Topping_Item_Name varchar(50),
        PRIMARY KEY (Order_Item_Id)
    );

CREATE TABLE
    Payment (
        ID int not null unique,
        Method varchar(20),
        Amount decimal(8, 2) not null,
        Order_NO int,
        PRIMARY KEY (ID)
    );

CREATE TABLE
    Tax_Invoice (
        Customer_Name varchar(100) not null unique,
        Date date not null,
        Address text not null,
        Customer_Identification_NO varchar(20) not null,
        Tax_Identification_NO varchar(20) not null,
        Tax_Order_NO int not null unique,
        Tax_Staff_ID int not null,
        PRIMARY KEY (Tax_Order_NO)
    );

-- Create relations
ALTER TABLE
    Recipe
        ADD CONSTRAINT FK_Recipe_Menu FOREIGN KEY (Menu_Item_EN_Name, Menu_Item_Size) REFERENCES Menu_Item (EN_Name, Size);

ALTER TABLE
    Brewing
        ADD CONSTRAINT FK_Brewing_Recipe FOREIGN KEY (Recipe_Code, Recipe_Sweetness) REFERENCES Recipe (Code, Sweetness),
        ADD CONSTRAINT FK_Brewing_Ingredient FOREIGN KEY (Ingredient_Name) REFERENCES Ingredient (_Name);

ALTER TABLE
    Address
        ADD CONSTRAINT FK_Address_Staff FOREIGN KEY (Staff_ID) REFERENCES Staff (ID);

ALTER TABLE
    Part_Time
        ADD CONSTRAINT FK_Partime_Staff FOREIGN KEY (Staff_ID) REFERENCES Staff (ID);

ALTER TABLE
    Full_Time
        ADD CONSTRAINT FK_Fulltime_Staff FOREIGN KEY (Staff_ID) REFERENCES Staff (ID);

ALTER TABLE 
    Fix_Price
        ADD CONSTRAINT FK_Promo_FixP_ID FOREIGN KEY (Promo_ID) REFERENCES Promotion (ID);

ALTER TABLE
    Fix_Discount
        ADD CONSTRAINT FK_Promo_FixD_ID FOREIGN KEY (Promo_ID) REFERENCES Promotion (ID);

ALTER TABLE
    Fix_Percentage 
        ADD CONSTRAINT FK_Promo_FixPercen_ID FOREIGN KEY (Promo_ID) REFERENCES Promotion (ID);

ALTER TABLE
    Includes
        ADD CONSTRAINT FK_Includes_Promotion FOREIGN KEY (Promo_ID) REFERENCES Promotion (ID),
        ADD CONSTRAINT FK_Includes_Menu FOREIGN KEY (Menu_Item_EN_Name, Menu_Item_Size) REFERENCES Menu_Item (EN_Name, Size);

ALTER TABLE
    _Order
        ADD CONSTRAINT FK_Order_Staff FOREIGN KEY (Staff_ID) REFERENCES Staff (ID);

ALTER TABLE 
    Order_Item
        ADD CONSTRAINT FK_OrderItem_MilkOption FOREIGN KEY (Milk_Option_Name) REFERENCES Milk_Option (_Name),
        ADD CONSTRAINT FK_OrderItem_Order FOREIGN KEY (Order_NO) REFERENCES _Order (Order_NO),
        ADD CONSTRAINT FK_OrderItem_Menu FOREIGN KEY (Menu_Item_Name, Menu_Item_Size) REFERENCES Menu_Item (EN_Name, Size);

ALTER TABLE 
    Order_Topping 
        ADD CONSTRAINT FK_Topping_Order FOREIGN KEY (Order_Item_Id) REFERENCES Order_Item (ID),
        ADD CONSTRAINT FK_Topping_Topitem FOREIGN KEY (Topping_Item_Name) REFERENCES Topping_Item (_Name);

ALTER TABLE 
    Payment 
        ADD CONSTRAINT FK_Payment_Order FOREIGN KEY (Order_NO) REFERENCES _Order (Order_NO);

Alter table 
    Tax_Invoice 
        ADD CONSTRAINT FK_Tax_Order FOREIGN KEY (Tax_Order_NO) REFERENCES _Order (Order_NO),
        ADD CONSTRAINT FK_Tax_Staff FOREIGN KEY (Tax_Staff_ID) REFERENCES Staff (ID);