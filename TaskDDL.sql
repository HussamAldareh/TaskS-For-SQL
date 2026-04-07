use onlineStore ;
create table Users (Id INT PRIMARY KEY,
Name Nvarchar (50),

)

alter table Users add Email NVARCHAR (100) unique

ALTER TABLE Users
DROP CONSTRAINT UQ__Users__A9D1053431DF7BBE;

ALTER TABLE Users
ALTER COLUMN Email NVARCHAR(100) NOT NULL;

ALTER TABLE Users
ADD CONSTRAINT UQ_Users_Email UNIQUE (Email);


create table Products(name Nvarchar (50) , price DECIMAL NOT Null  )

create table Orders (    Id INT PRIMARY KEY IDENTITY(1,1),UserId int,
DateOfOrder date  ,FOREIGN KEY(UserId) REFERENCES Users(Id)
 )

ALTER TABLE Orders
ADD CONSTRAINT DF_Orders_DateOfOrder
DEFAULT GETDATE() FOR DateOfOrder;

alter table Products
add  Id int PRIMARY KEY 

CREATE TABLE OrdersProduct (
    OrderId INT,
    ProductId INT,
    Quantity INT,

    PRIMARY KEY (OrderId, ProductId),

    FOREIGN KEY (OrderId) REFERENCES Orders(Id),
    FOREIGN KEY (ProductId) REFERENCES Products(Id)
);


create table categories(

Id int primary key ,Name NVARCHAR (50)

)

alter table Products
ADD CategoryId INT,
FOREIGN KEY (CategoryId) REFERENCES Categories(Id);


CREATE TABLE Employees (
    Id INT PRIMARY KEY,
    Name NVARCHAR(50),
    ManagerId INT,

    FOREIGN KEY (ManagerId) REFERENCES Employees(Id)
);

alter table Users
add phone NVARCHAR (50) ;

alter table Users
drop column phone


alter table Users
alter column Name NVARCHAR (100)


CREATE TABLE customers (id int primary key ,  Name NVARCHAR (50) NOT NULL  )


CREATE TABLE Payments (
    Id INT PRIMARY KEY IDENTITY(1,1),
    OrderId INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentDate DATETIME DEFAULT GETDATE(),

    FOREIGN KEY (OrderId) REFERENCES Orders(Id)
);



CREATE table Student (
Id int PRIMARY KEY ,Name nvarchar (50)
)

create table courses(

id int  PRIMARY KEY  ,Titel nvarchar (100)

)


CREATE TABLE StudentCourses (
    StudentId INT,
    CourseId INT,

    PRIMARY KEY (StudentId, CourseId),

    FOREIGN KEY (StudentId) REFERENCES Student(Id),
    FOREIGN KEY (CourseId) REFERENCES Courses(Id)
);

CREATE TABLE Logs (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Message NVARCHAR(255),
    CreatedAt DATETIME DEFAULT GETDATE()
);


TRUNCATE TABLE Logs;

ALTER TABLE Users
DROP COLUMN Name;

Drop table Logs


create Table Userss(id int primary key IDENTITY (1,1)
,Name NVARCHAR (50)
)


create table mustValue(
ID Int Primary key not null  ,
Titel NVARCHAR (50) NULL ,

)
create table Books (
id Int Primary key not null  ,
Titel   Nvarchar (50) 
, price DECIMAL 
)

CREATE TABLE Authors (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(50)
);

ALTER TABLE Books
ADD AuthorId INT;



ALTER TABLE Books
ADD FOREIGN KEY (AuthorId) REFERENCES Authors(Id);


CREATE TABLE OnlyIds (
    Id INT PRIMARY KEY 
);


CREATE TABLE SampleTable (
    Id INT PRIMARY KEY,
    Description NVARCHAR(100),
    CreatedAt DATETIME
);


alter table Users
add  Emails Nvarchar(50) 

