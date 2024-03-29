USE [master]
GO
/****** Object:  Database [SalesManagement]    Script Date: 12/03/2024 11:13:17 AM ******/
CREATE DATABASE [SalesManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SalesManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MAYAO\MSSQL\DATA\SalesManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SalesManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MAYAO\MSSQL\DATA\SalesManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SalesManagement] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SalesManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SalesManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SalesManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SalesManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SalesManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SalesManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [SalesManagement] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SalesManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SalesManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SalesManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SalesManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SalesManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SalesManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SalesManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SalesManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SalesManagement] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SalesManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SalesManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SalesManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SalesManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SalesManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SalesManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SalesManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SalesManagement] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SalesManagement] SET  MULTI_USER 
GO
ALTER DATABASE [SalesManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SalesManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SalesManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SalesManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SalesManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SalesManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SalesManagement', N'ON'
GO
ALTER DATABASE [SalesManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [SalesManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SalesManagement]
GO
/****** Object:  Table [dbo].[tblBill]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBill](
	[Id] [int] IDENTITY(400,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[DateOfPayment] [datetime] NULL,
	[TotalPrice] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblBillInfo]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBillInfo](
	[ProductId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblCustomer]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCustomer](
	[Id] [int] IDENTITY(300,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblEmployee]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblEmployee](
	[Id] [int] IDENTITY(100,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Role] [bit] NOT NULL,
	[Status] [bit] NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblProduct]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblProduct](
	[Id] [int] IDENTITY(200,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ImportUnitPrice] [float] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Image] [image] NOT NULL,
	[Note] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[tblBill] ADD  DEFAULT (sysdatetime()) FOR [DateOfPayment]
GO
ALTER TABLE [dbo].[tblBill]  WITH NOCHECK ADD FOREIGN KEY([CustomerId])
REFERENCES [dbo].[tblCustomer] ([Id])
GO
ALTER TABLE [dbo].[tblBill]  WITH NOCHECK ADD FOREIGN KEY([EmployeeId])
REFERENCES [dbo].[tblEmployee] ([Id])
GO
ALTER TABLE [dbo].[tblBillInfo]  WITH CHECK ADD FOREIGN KEY([ProductId])
REFERENCES [dbo].[tblProduct] ([Id])
GO
/****** Object:  StoredProcedure [dbo].[ChangePassword]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--Stored procedures
CREATE PROC [dbo].[ChangePassword]
@email NVARCHAR(50), @oldPassword NVARCHAR(50), @newPassword NVARCHAR(50)
AS BEGIN
DECLARE @password NVARCHAR(50), @result bit
SELECT @password = Password FROM dbo.tblEmployee WHERE Email = @email
IF @password = @oldPassword
BEGIN
    UPDATE dbo.tblEmployee SET Password = @newPassword WHERE Email = @email
	SET @result = 1
END
ELSE SET @result = 0
SELECT @result
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteCustomer]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[DeleteCustomer]
@id INT
AS BEGIN
DECLARE @result BIT = 1
IF EXISTS(SELECT * FROM dbo.tblCustomer WHERE Id = @id)
	DELETE dbo.tblCustomer WHERE Id = @id
ELSE
	SET @result = 0
SELECT @result
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteEmployee]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[DeleteEmployee]
@id INT
AS BEGIN
DECLARE @result BIT = 1
IF EXISTS(SELECT * FROM dbo.tblEmployee WHERE Id = @id)
	DELETE dbo.tblEmployee WHERE Id = @id
ELSE
	SET @result = 0
SELECT @result
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[DeleteProduct]
@id int
AS BEGIN
DECLARE @result BIT = 1
IF EXISTS(SELECT * FROM dbo.tblProduct WHERE Id = @id)
	DELETE dbo.tblProduct WHERE Id = @id
ELSE
	SET @result = 0
SELECT @result
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteProductInBillInfo]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[DeleteProductInBillInfo]
@id int
AS BEGIN
DECLARE @result BIT = 1
IF EXISTS(SELECT * FROM dbo.tblBillInfo WHERE ProductId = @id)
	DELETE dbo.tblBillInfo WHERE ProductId = @id
ELSE
	SET @result = 0
SELECT @result
END
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeAddressPhoneNumber]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetEmployeeAddressPhoneNumber]
@email NVARCHAR(50)
AS BEGIN
SELECT Address + ' | ' + PhoneNumber FROM dbo.tblEmployee WHERE Email = @email
END
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeIdName]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GetEmployeeIdName]
@email NVARCHAR(50)
AS BEGIN
SELECT CONVERT(NVARCHAR(50), Id) + ' | ' + Name FROM dbo.tblEmployee WHERE Email = @email
END
GO
/****** Object:  StoredProcedure [dbo].[GetEmployeeRole]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GetEmployeeRole]
@email NVARCHAR(50)
AS BEGIN
SELECT Role FROM dbo.tblEmployee WHERE Email = @email
END
GO
/****** Object:  StoredProcedure [dbo].[GetProductId]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GetProductId]
@name NVARCHAR(50)
AS BEGIN
SELECT Id FROM dbo.tblProduct WHERE Name = @name
END
GO
/****** Object:  StoredProcedure [dbo].[GetRevenueInJuly]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetRevenueInJuly]
AS BEGIN
SELECT SUM(TotalPrice) AS Revenue, Date = DATEADD(MONTH, DATEDIFF(MONTH, 0, DateOfPayment), 0)
FROM    dbo.tblBill
WHERE   DateOfPayment >= '2022-07-01' 
AND     DateOfPayment <= '2022-07-31'
GROUP BY DATEADD(MONTH, DATEDIFF(MONTH, 0, DateOfPayment), 0)
END
GO
/****** Object:  StoredProcedure [dbo].[GetRevenueInJune]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetRevenueInJune]
AS BEGIN
SELECT SUM(TotalPrice) AS Revenue, Date = DATEADD(MONTH, DATEDIFF(MONTH, 0, DateOfPayment), 0)
FROM    dbo.tblBill
WHERE   DateOfPayment >= '2022-06-01' 
AND     DateOfPayment <= '2022-06-30'
GROUP BY DATEADD(MONTH, DATEDIFF(MONTH, 0, DateOfPayment), 0)
END
GO
/****** Object:  StoredProcedure [dbo].[GetRevenueInMay]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetRevenueInMay]
AS BEGIN
SELECT SUM(TotalPrice) AS Revenue, Date = DATEADD(MONTH, DATEDIFF(MONTH, 0, DateOfPayment), 0)
FROM    dbo.tblBill
WHERE   DateOfPayment >= '2022-05-01' 
AND     DateOfPayment <= '2022-05-31'
GROUP BY DATEADD(MONTH, DATEDIFF(MONTH, 0, DateOfPayment), 0)
END
GO
/****** Object:  StoredProcedure [dbo].[GetTotalPrice]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GetTotalPrice]
AS BEGIN
SELECT SUM(Price) from dbo.tblBillInfo
END
GO
/****** Object:  StoredProcedure [dbo].[GetUnitPrice]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[GetUnitPrice]
@name NVARCHAR(50)
AS BEGIN
SELECT UnitPrice FROM dbo.tblProduct WHERE Name = @name
END
GO
/****** Object:  StoredProcedure [dbo].[InsertBill]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[InsertBill]
@employeeId INT, @customerId INT, @totalPrice FLOAT
AS BEGIN
ALTER TABLE dbo.tblBill NOCHECK CONSTRAINT ALL
DELETE FROM dbo.tblBillInfo
ALTER TABLE dbo.tblBill CHECK CONSTRAINT ALL

INSERT INTO dbo.tblBill VALUES
(@employeeId, @customerId, DEFAULT, @totalPrice)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertBillInfo]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[InsertBillInfo]
@productId INT, @quantity INT, @unitPrice FLOAT  
AS BEGIN
DECLARE @price FLOAT = @quantity * @unitPrice
UPDATE dbo.tblProduct
SET Quantity = Quantity - @quantity
WHERE Id = @productId

INSERT INTO dbo.tblBillInfo VALUES
(@productId, @quantity, @price)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertCustomer]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[InsertCustomer]
@name NVARCHAR(50), @address NVARCHAR(50), @phoneNumber NVARCHAR(50)
AS BEGIN
INSERT INTO dbo.tblCustomer VALUES
(@name, @address, @phoneNumber)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertEmployee]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[InsertEmployee]
@name NVARCHAR(50), @address NVARCHAR(50), @phoneNumber NVARCHAR(50), 
@email NVARCHAR(50), @role BIT, @status BIT, @password NVARCHAR(50)
AS BEGIN
INSERT INTO dbo.tblEmployee VALUES
(@name, @address, @phoneNumber, @email, @role, @status, @password)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertProduct]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[InsertProduct]
@name NVARCHAR(50), @quantity INT, @importUnitPrice FLOAT, @unitPrice FLOAT,
@image IMAGE, @note NVARCHAR(100)
AS BEGIN
INSERT INTO dbo.tblProduct VALUES
(@name, @quantity, @importUnitPrice, @unitPrice, @image, @note)
END
GO
/****** Object:  StoredProcedure [dbo].[IsExistEmail]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[IsExistEmail]
@email NVARCHAR(50)
AS BEGIN
DECLARE @result BIT
IF EXISTS(SELECT * FROM dbo.tblEmployee WHERE Email = @email)
	SET @result = 1
ELSE
	SET @result = 0
SELECT @result
END
GO
/****** Object:  StoredProcedure [dbo].[ListBillInfo]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ListBillInfo]
AS BEGIN
SELECT ProductId, p.Name, b.Quantity, Price FROM dbo.tblBillInfo b, dbo.tblProduct p
WHERE ProductId = p.Id
END
GO
/****** Object:  StoredProcedure [dbo].[ListCustomerIdName]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ListCustomerIdName]
AS BEGIN
SELECT CONVERT(NVARCHAR(50), Id) + ' | ' + Name FROM dbo.tblCustomer
END
GO
/****** Object:  StoredProcedure [dbo].[ListOfBills]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ListOfBills]
AS BEGIN
SELECT b.Id, c.Name, DateOfPayment, TotalPrice FROM dbo.tblBill b, dbo.tblCustomer c
WHERE b.CustomerId = c.Id
END
GO
/****** Object:  StoredProcedure [dbo].[ListOfCustomers]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ListOfCustomers]
AS BEGIN
SELECT Id, Name, Address, PhoneNumber FROM dbo.tblCustomer
END
GO
/****** Object:  StoredProcedure [dbo].[ListOfEmployees]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ListOfEmployees]
AS BEGIN
SELECT Id, Name, Address, PhoneNumber, Email, Role, Status FROM dbo.tblEmployee
END
GO
/****** Object:  StoredProcedure [dbo].[ListOfProducts]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ListOfProducts]
AS BEGIN
SELECT Id, Name, Quantity, ImportUnitPrice, UnitPrice, Image, Note FROM dbo.tblProduct
END
GO
/****** Object:  StoredProcedure [dbo].[ListProductNameQuantity]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[ListProductNameQuantity]
AS BEGIN
SELECT Name + ' | ' + CONVERT(NVARCHAR(50), Quantity) FROM dbo.tblProduct
END
GO
/****** Object:  StoredProcedure [dbo].[Login]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Login]
@email NVARCHAR(50), @password NVARCHAR(50)
AS BEGIN
DECLARE @status BIT
IF EXISTS(SELECT * FROM dbo.tblEmployee WHERE Email = @email AND Password = @password)
	SET @status = 1
ELSE
	SET @status = 0
SELECT @status
END
GO
/****** Object:  StoredProcedure [dbo].[ReportBillInfo]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[ReportBillInfo]
AS BEGIN
SELECT ProductId, p.Name, b.Quantity, p.UnitPrice, Price FROM dbo.tblBillInfo b, dbo.tblProduct p
WHERE ProductId = p.Id
END
GO
/****** Object:  StoredProcedure [dbo].[SearchCustomer]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SearchCustomer]
@name NVARCHAR(50)
AS BEGIN
SELECT * FROM dbo.tblCustomer WHERE Name LIKE '%' + @name + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[SearchCustomerInBill]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SearchCustomerInBill]
@name NVARCHAR(50)
AS BEGIN
SELECT b.Id, c.Name, DateOfPayment, TotalPrice FROM dbo.tblBill b, dbo.tblCustomer c
WHERE b.CustomerId = c.Id AND c.Name LIKE '%' + @name + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[SearchEmployee]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SearchEmployee]
@name NVARCHAR(50)
AS BEGIN
SELECT Id, Name, Address, PhoneNumber, Email, Role, Status FROM dbo.tblEmployee WHERE Name LIKE '%' + @name + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[SearchProduct]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[SearchProduct]
@name NVARCHAR(50)
AS BEGIN
SELECT * FROM dbo.tblProduct WHERE Name LIKE '%' + @name + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateCustomer]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[UpdateCustomer]
@id INT, @name NVARCHAR(50), @address NVARCHAR(50), @phoneNumber NVARCHAR(50)
AS BEGIN
UPDATE dbo.tblCustomer
SET Name = @name, Address = @address, PhoneNumber = @phoneNumber
WHERE Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployee]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[UpdateEmployee]
@name NVARCHAR(50), @address NVARCHAR(50), @phoneNumber NVARCHAR(50), 
@email NVARCHAR(50), @role BIT, @status BIT
AS BEGIN
UPDATE dbo.tblEmployee
SET Name = @name, Address = @address, PhoneNumber = @phoneNumber,
Role = @role, Status = @status
WHERE @email = Email
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateEmployeeAddressPhoneNumber]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[UpdateEmployeeAddressPhoneNumber]
@address NVARCHAR(50), @phoneNumber NVARCHAR(50), @email NVARCHAR(50)
AS BEGIN
UPDATE dbo.tblEmployee
SET Address = @address, PhoneNumber = @phoneNumber
WHERE @email = Email
END
GO
/****** Object:  StoredProcedure [dbo].[UpdatePassword]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[UpdatePassword]
@email NVARCHAR(50), @password NVARCHAR(50)
AS BEGIN
UPDATE dbo.tblEmployee
SET Password = @password
WHERE Email = @email
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateProduct]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[UpdateProduct]
@id INT, @name NVARCHAR(50), @quantity INT, @importUnitPrice FLOAT, 
@unitPrice FLOAT, @image IMAGE, @note NVARCHAR(100)
AS BEGIN
UPDATE dbo.tblProduct
SET Name = @name, Quantity = @quantity, ImportUnitPrice = @importUnitPrice,
UnitPrice = @unitPrice, Image = @image, Note = @note
WHERE Id = @id
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateProductInBillInfo]    Script Date: 12/03/2024 11:13:18 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[UpdateProductInBillInfo]
@id int, @quantity int
AS BEGIN
UPDATE b
SET b.Quantity = @quantity, Price = @quantity * p.UnitPrice
FROM dbo.tblProduct p, dbo.tblBillInfo b
WHERE ProductId = @id AND b.ProductId = p.Id
END
GO
USE [master]
GO
ALTER DATABASE [SalesManagement] SET  READ_WRITE 
GO
