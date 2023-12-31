USE [master]
GO
/****** Object:  Database [BL_MeterCheck]    Script Date: 9/3/2023 9:19:27 PM ******/
CREATE DATABASE [BL_MeterCheck]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BL_MeterCheck', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BL_MeterCheck.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BL_MeterCheck_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BL_MeterCheck_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BL_MeterCheck] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BL_MeterCheck].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BL_MeterCheck] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BL_MeterCheck] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BL_MeterCheck] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BL_MeterCheck] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BL_MeterCheck] SET ARITHABORT OFF 
GO
ALTER DATABASE [BL_MeterCheck] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BL_MeterCheck] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BL_MeterCheck] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BL_MeterCheck] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BL_MeterCheck] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BL_MeterCheck] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BL_MeterCheck] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BL_MeterCheck] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BL_MeterCheck] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BL_MeterCheck] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BL_MeterCheck] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BL_MeterCheck] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BL_MeterCheck] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BL_MeterCheck] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BL_MeterCheck] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BL_MeterCheck] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BL_MeterCheck] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BL_MeterCheck] SET RECOVERY FULL 
GO
ALTER DATABASE [BL_MeterCheck] SET  MULTI_USER 
GO
ALTER DATABASE [BL_MeterCheck] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BL_MeterCheck] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BL_MeterCheck] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BL_MeterCheck] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BL_MeterCheck] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BL_MeterCheck] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'BL_MeterCheck', N'ON'
GO
ALTER DATABASE [BL_MeterCheck] SET QUERY_STORE = ON
GO
ALTER DATABASE [BL_MeterCheck] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BL_MeterCheck]
GO
/****** Object:  User [BL-USER]    Script Date: 9/3/2023 9:19:27 PM ******/
CREATE USER [BL-USER] FOR LOGIN [BL-USER] WITH DEFAULT_SCHEMA=[db_ddladmin]
GO
ALTER ROLE [db_owner] ADD MEMBER [BL-USER]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [BL-USER]
GO
/****** Object:  Table [dbo].[BL_cities]    Script Date: 9/3/2023 9:19:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BL_cities](
	[city_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](200) NOT NULL,
	[country] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[city_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BL_customers]    Script Date: 9/3/2023 9:19:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BL_customers](
	[customer_id] [bigint] IDENTITY(1,1) NOT NULL,
	[names] [varchar](200) NOT NULL,
	[lastname] [varchar](200) NOT NULL,
	[address] [varchar](500) NOT NULL,
	[city] [int] NOT NULL,
	[enabled] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BL_meterchecks]    Script Date: 9/3/2023 9:19:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BL_meterchecks](
	[check_id] [bigint] IDENTITY(1,1) NOT NULL,
	[customer_id] [bigint] NOT NULL,
	[date] [date] NOT NULL,
	[measure] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[check_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BL_session]    Script Date: 9/3/2023 9:19:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BL_session](
	[session_id] [bigint] IDENTITY(1,1) NOT NULL,
	[user_id] [bigint] NOT NULL,
	[token] [varchar](1000) NOT NULL,
	[expires] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[session_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BL_users]    Script Date: 9/3/2023 9:19:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BL_users](
	[user_id] [bigint] IDENTITY(1,1) NOT NULL,
	[names] [varchar](200) NOT NULL,
	[lastname] [varchar](200) NOT NULL,
	[loginname] [varchar](50) NOT NULL,
	[password] [varchar](1000) NOT NULL,
	[created] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BL_cities] ON 

INSERT [dbo].[BL_cities] ([city_id], [name], [country]) VALUES (1, N'Indoor City', N'Country')
INSERT [dbo].[BL_cities] ([city_id], [name], [country]) VALUES (2, N'Outdoor City', N'Country')
SET IDENTITY_INSERT [dbo].[BL_cities] OFF
GO
SET IDENTITY_INSERT [dbo].[BL_customers] ON 

INSERT [dbo].[BL_customers] ([customer_id], [names], [lastname], [address], [city], [enabled]) VALUES (1, N'John', N'Doe', N'123 Street', 1, 0)
INSERT [dbo].[BL_customers] ([customer_id], [names], [lastname], [address], [city], [enabled]) VALUES (2, N'Mary', N'Johnson', N'543 Avenue', 2, 0)
INSERT [dbo].[BL_customers] ([customer_id], [names], [lastname], [address], [city], [enabled]) VALUES (3, N'Luke', N'Skywalker', N'12 Boulevard', 2, 0)
SET IDENTITY_INSERT [dbo].[BL_customers] OFF
GO
SET IDENTITY_INSERT [dbo].[BL_meterchecks] ON 

INSERT [dbo].[BL_meterchecks] ([check_id], [customer_id], [date], [measure]) VALUES (2, 1, CAST(N'2023-06-18' AS Date), 767.79998779296875)
INSERT [dbo].[BL_meterchecks] ([check_id], [customer_id], [date], [measure]) VALUES (3, 1, CAST(N'2023-07-21' AS Date), 15.88)
INSERT [dbo].[BL_meterchecks] ([check_id], [customer_id], [date], [measure]) VALUES (4, 2, CAST(N'2023-06-15' AS Date), 22)
INSERT [dbo].[BL_meterchecks] ([check_id], [customer_id], [date], [measure]) VALUES (6, 2, CAST(N'2023-07-16' AS Date), 19.35)
INSERT [dbo].[BL_meterchecks] ([check_id], [customer_id], [date], [measure]) VALUES (7, 2, CAST(N'2023-09-01' AS Date), 12.800000190734863)
INSERT [dbo].[BL_meterchecks] ([check_id], [customer_id], [date], [measure]) VALUES (8, 2, CAST(N'2023-01-09' AS Date), 77.800003051757812)
INSERT [dbo].[BL_meterchecks] ([check_id], [customer_id], [date], [measure]) VALUES (9, 2, CAST(N'2023-01-09' AS Date), 77.800003051757812)
INSERT [dbo].[BL_meterchecks] ([check_id], [customer_id], [date], [measure]) VALUES (10, 2, CAST(N'2023-01-09' AS Date), 77.800003051757812)
INSERT [dbo].[BL_meterchecks] ([check_id], [customer_id], [date], [measure]) VALUES (11, 2, CAST(N'2023-01-09' AS Date), 77.800003051757812)
INSERT [dbo].[BL_meterchecks] ([check_id], [customer_id], [date], [measure]) VALUES (12, 2, CAST(N'2023-01-09' AS Date), 77.800003051757812)
INSERT [dbo].[BL_meterchecks] ([check_id], [customer_id], [date], [measure]) VALUES (13, 2, CAST(N'2023-01-09' AS Date), 77.800003051757812)
INSERT [dbo].[BL_meterchecks] ([check_id], [customer_id], [date], [measure]) VALUES (14, 2, CAST(N'2023-01-09' AS Date), 77.800003051757812)
INSERT [dbo].[BL_meterchecks] ([check_id], [customer_id], [date], [measure]) VALUES (15, 2, CAST(N'2023-01-09' AS Date), 77.800003051757812)
INSERT [dbo].[BL_meterchecks] ([check_id], [customer_id], [date], [measure]) VALUES (16, 2, CAST(N'2023-01-09' AS Date), 77.800003051757812)
SET IDENTITY_INSERT [dbo].[BL_meterchecks] OFF
GO
SET IDENTITY_INSERT [dbo].[BL_session] ON 

INSERT [dbo].[BL_session] ([session_id], [user_id], [token], [expires]) VALUES (1, 1, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6Im5maXNjYWxpbmkiLCJleHAiOjE2OTM1ODc0NDMsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NzA2NS8iLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0OjcwNjUvIn0.wtQDwsmHwMnj9Gd0Rus9_78TYH67v6zxnoDulQPlF5k', CAST(N'2023-09-01T14:02:23.963' AS DateTime))
INSERT [dbo].[BL_session] ([session_id], [user_id], [token], [expires]) VALUES (2, 1, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6Im5maXNjYWxpbmkiLCJleHAiOjE2OTM3ODI2MzMsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NzA2NS8iLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0OjcwNjUvIn0.wpQ7dlXXQv3dqiODF2RnJAQ5VodagAtRPVEmWsrfN_w', CAST(N'2023-09-03T20:15:33.377' AS DateTime))
INSERT [dbo].[BL_session] ([session_id], [user_id], [token], [expires]) VALUES (3, 1, N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6Im5maXNjYWxpbmkiLCJleHAiOjE2OTM3ODI2ODUsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NzA2NS8iLCJhdWQiOiJodHRwOi8vbG9jYWxob3N0OjcwNjUvIn0.Ye7JSfEVS72IvMsu4dpjii0k6Aw7PUjCt4Y0AWyCt0Q', CAST(N'2023-09-03T22:16:25.527' AS DateTime))
SET IDENTITY_INSERT [dbo].[BL_session] OFF
GO
SET IDENTITY_INSERT [dbo].[BL_users] ON 

INSERT [dbo].[BL_users] ([user_id], [names], [lastname], [loginname], [password], [created]) VALUES (1, N'Nico', N'Fiscalini', N'nfiscalini', N'7LJSBEteoPZ57njsGhKQRznikE0=', CAST(N'2023-09-01T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[BL_users] OFF
GO
ALTER TABLE [dbo].[BL_customers] ADD  DEFAULT ((0)) FOR [enabled]
GO
ALTER TABLE [dbo].[BL_customers]  WITH CHECK ADD  CONSTRAINT [FK_BL_customers_BL_cities] FOREIGN KEY([city])
REFERENCES [dbo].[BL_cities] ([city_id])
GO
ALTER TABLE [dbo].[BL_customers] CHECK CONSTRAINT [FK_BL_customers_BL_cities]
GO
ALTER TABLE [dbo].[BL_meterchecks]  WITH CHECK ADD  CONSTRAINT [FK_BL_meterchecks_BL_customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[BL_customers] ([customer_id])
GO
ALTER TABLE [dbo].[BL_meterchecks] CHECK CONSTRAINT [FK_BL_meterchecks_BL_customers]
GO
ALTER TABLE [dbo].[BL_session]  WITH CHECK ADD  CONSTRAINT [FK_BL_session_BL_users] FOREIGN KEY([user_id])
REFERENCES [dbo].[BL_users] ([user_id])
GO
ALTER TABLE [dbo].[BL_session] CHECK CONSTRAINT [FK_BL_session_BL_users]
GO
/****** Object:  StoredProcedure [dbo].[PR_ADD_CUSTOMER]    Script Date: 9/3/2023 9:19:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nicolás Fiscalini
-- Create date: 2023-08-30
-- Description:	Adds CUSTOMER info
-- =============================================
CREATE PROCEDURE [dbo].[PR_ADD_CUSTOMER] 
	@NAME VARCHAR(200),
	@LASTNAME VARCHAR(200),
	@ADDRESS VARCHAR(500),
	@CITY INT,
	@ENABLED BIT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.BL_customers(names, lastname, [address], city, [enabled])
	VALUES (@NAME, @LASTNAME, @ADDRESS, @CITY, @ENABLED)

	SELECT SCOPE_IDENTITY()	
END
GO
/****** Object:  StoredProcedure [dbo].[PR_ADD_METERCHECKS]    Script Date: 9/3/2023 9:19:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nicolás Fiscalini
-- Create date: 2023-08-30
-- Description:	Gets METER CHECKS info
-- =============================================
CREATE PROCEDURE [dbo].[PR_ADD_METERCHECKS] 
	@CUSTOMER_ID INT,
	@DATE DATE,
	@MEASURE FLOAT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.BL_meterchecks (customer_id, [date], measure)
	VALUES (@CUSTOMER_ID, @DATE, @MEASURE)

	SELECT SCOPE_IDENTITY()	
END
GO
/****** Object:  StoredProcedure [dbo].[PR_ADD_SESSION]    Script Date: 9/3/2023 9:19:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nicolás Fiscalini
-- Create date: 2023-08-30
-- Description:	Adds CUSTOMER info
-- =============================================
CREATE PROCEDURE [dbo].[PR_ADD_SESSION] 
	@USER_ID INT,
	@TOKEN VARCHAR(1000)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO dbo.BL_session([user_id], token, [expires])
	VALUES (@USER_ID, @TOKEN, DATEADD(MINUTE, 20, GETDATE()))

	SELECT SCOPE_IDENTITY()	
END
GO
/****** Object:  StoredProcedure [dbo].[PR_DEL_CUSTOMER]    Script Date: 9/3/2023 9:19:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nicolás Fiscalini
-- Create date: 2023-08-30
-- Description:	Marks CUSTOMER as disabled
-- =============================================
CREATE PROCEDURE [dbo].[PR_DEL_CUSTOMER] 
	@CUSTOMER_ID INT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE dbo.BL_customers
	SET [enabled] = 1
	WHERE customer_id = @CUSTOMER_ID

	SELECT COUNT(*)
	FROM dbo.BL_customers
	WHERE customer_id = @CUSTOMER_ID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_DEL_METERCHECK]    Script Date: 9/3/2023 9:19:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nicolás Fiscalini
-- Create date: 2023-08-30
-- Description:	Deletes METER CHECKS info
-- =============================================
CREATE PROCEDURE [dbo].[PR_DEL_METERCHECK] 
	@CHECK_ID INT
AS
BEGIN
	SET NOCOUNT ON;

	DELETE
	FROM dbo.BL_meterchecks
	WHERE check_id = @CHECK_ID

	RETURN 0
END
GO
/****** Object:  StoredProcedure [dbo].[PR_GET_CUSTOMER]    Script Date: 9/3/2023 9:19:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nicolás Fiscalini
-- Create date: 2023-08-30
-- Description:	Gets customer info
-- =============================================
CREATE PROCEDURE [dbo].[PR_GET_CUSTOMER] 
	@ID int
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		customer_id AS Customer_id
		,names as Names
		,lastname as Lastname
		,[address] as [Address]
		,city as City
		,CI.name as CityName
		,CI.country as Country
	FROM dbo.BL_customers CU
	INNER JOIN BL_cities CI
		ON CU.city = CI.city_id
	WHERE customer_id = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_GET_METERCHECKS]    Script Date: 9/3/2023 9:19:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nicolás Fiscalini
-- Create date: 2023-08-30
-- Description:	Gets METER CHECKS info
-- =============================================
CREATE PROCEDURE [dbo].[PR_GET_METERCHECKS] 
	@CUSTOMER_ID INT,
	@DATE_FROM DATE,
	@DATE_TO DATE
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		check_id AS Check_id
		,customer_id AS Customer_id
		,[date] AS [Date]
		,measure AS Measure
	FROM dbo.BL_meterchecks
	WHERE customer_id = @CUSTOMER_ID
	AND [date] BETWEEN @DATE_FROM AND @DATE_TO
END
GO
/****** Object:  StoredProcedure [dbo].[PR_GET_SESSION]    Script Date: 9/3/2023 9:19:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nicolás Fiscalini
-- Create date: 2023-08-30
-- Description:	Checks active session
-- =============================================
CREATE PROCEDURE [dbo].[PR_GET_SESSION] 
	@ACCESS_TOKEN VARCHAR(1000)
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @SESSION_ACTIVE BIT

	SELECT @SESSION_ACTIVE = COUNT(*)
	FROM dbo.BL_session
	WHERE token = @ACCESS_TOKEN
	AND expires > GETDATE()

	SELECT @SESSION_ACTIVE
END
GO
/****** Object:  StoredProcedure [dbo].[PR_GET_USER_BY_CREDENTIALS]    Script Date: 9/3/2023 9:19:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nicolás Fiscalini
-- Create date: 2023-08-30
-- Description:	Gets USER info
-- =============================================
CREATE PROCEDURE [dbo].[PR_GET_USER_BY_CREDENTIALS] 
	@LOGINNAME VARCHAR(50),
	@PASSWORD VARCHAR(1000)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT
		[user_id] AS [User_id]
		,names as Names
		,lastname as Lastname
		,loginname as Loginname
		,created as Created
	FROM dbo.BL_users
	WHERE [loginname] = @LOGINNAME
	AND [password] = @PASSWORD
END
GO
/****** Object:  StoredProcedure [dbo].[PR_UPD_CUSTOMER]    Script Date: 9/3/2023 9:19:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nicolás Fiscalini
-- Create date: 2023-08-30
-- Description:	Updates CUSTOMER info
-- =============================================
CREATE PROCEDURE [dbo].[PR_UPD_CUSTOMER] 
	@CUSTOMER_ID INT,
	@NAME VARCHAR(200),
	@LASTNAME VARCHAR(200),
	@ADDRESS VARCHAR(500),
	@CITY INT,
	@ENABLED BIT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE dbo.BL_customers
	SET names = @NAME
		,lastname = @LASTNAME
		,[address] = @ADDRESS
		,city = @CITY
		,[enabled] = @ENABLED
	WHERE customer_id = @CUSTOMER_ID

	SELECT COUNT(*)
	FROM dbo.BL_customers
	WHERE customer_id = @CUSTOMER_ID
END
GO
/****** Object:  StoredProcedure [dbo].[PR_UPD_METERCHECKS]    Script Date: 9/3/2023 9:19:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Nicolás Fiscalini
-- Create date: 2023-08-30
-- Description:	Updates METER CHECKS info
-- =============================================
CREATE PROCEDURE [dbo].[PR_UPD_METERCHECKS] 
	@CHECK_ID INT,
	@MEASURE FLOAT
AS
BEGIN
	SET NOCOUNT ON;

	UPDATE dbo.BL_meterchecks
	SET measure = @MEASURE
	WHERE check_id = @CHECK_ID

	SELECT COUNT(*)
	FROM dbo.BL_meterchecks
	WHERE check_id = @CHECK_ID
END
GO
USE [master]
GO
ALTER DATABASE [BL_MeterCheck] SET  READ_WRITE 
GO
