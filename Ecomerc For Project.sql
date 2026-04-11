CREATE DATABASE ECommerceDB;
USE ECommerceDB;


CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(100),
    Email NVARCHAR(100) UNIQUE,
    Password NVARCHAR(100),

    IsDeleted BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME NULL
);

CREATE TABLE Categories (
    CategoryID INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(100),

    IsDeleted BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME NULL
);



CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(100),
    Price DECIMAL(10,2),
    CategoryID INT,

    IsDeleted BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME NULL,

    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY IDENTITY,
    UserID INT,
    TotalAmount DECIMAL(10,2),

    IsDeleted BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME NULL,

    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);


CREATE TABLE OrderItems (
    OrderItemID INT PRIMARY KEY IDENTITY,
    OrderID INT,
    ProductID INT,
    Quantity INT,

    IsDeleted BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME NULL,

    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);



CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY IDENTITY,
    OrderID INT,
    Method NVARCHAR(50),

    IsDeleted BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME NULL,

    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);



CREATE TABLE Reviews (
    ReviewID INT PRIMARY KEY IDENTITY,
    ProductID INT,
    UserID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comment NVARCHAR(255),

    IsDeleted BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME NULL,

    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);




CREATE TABLE Wishlist (
    WishlistID INT PRIMARY KEY IDENTITY,
    UserID INT,

    IsDeleted BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME NULL,

    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);



CREATE TABLE WishlistItems (
    ID INT PRIMARY KEY IDENTITY,
    WishlistID INT,
    ProductID INT,

    IsDeleted BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME NULL,

    FOREIGN KEY (WishlistID) REFERENCES Wishlist(WishlistID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);



INSERT INTO Users (Name, Email, Password)
VALUES 
('Hussam','hussam@mail.com','123'),
('Ali','ali@mail.com','123');

INSERT INTO Categories (Name)
VALUES ('Electronics'), ('Clothes');

INSERT INTO Products (Name, Price, CategoryID)
VALUES 
('Laptop',1000,1),
('Phone',500,1),
('T-Shirt',20,2);

INSERT INTO Orders (UserID, TotalAmount)
VALUES (1,1500),(2,20);

INSERT INTO OrderItems (OrderID, ProductID, Quantity)
VALUES 
(1,1,1),
(1,2,1),
(2,3,1);

INSERT INTO Payments (OrderID, Method)
VALUES (1,'Cash'),(2,'Card');

INSERT INTO Reviews (ProductID, UserID, Rating, Comment)
VALUES 
(1,1,5,'Excellent'),
(2,2,4,'Good');

INSERT INTO Wishlist (UserID)
VALUES (1);

INSERT INTO WishlistItems (WishlistID, ProductID)
VALUES (1,2),(1,3);


UPDATE Products
SET Price = 900,
    UpdatedAt = GETDATE()
WHERE ProductID = 1;

UPDATE Products
SET IsDeleted = 1
WHERE ProductID = 3;


select orderId ,Name ,Email,TotalAmount from Orders o inner join Users u on o.orderId= u.UserId


