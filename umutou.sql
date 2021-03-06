USE [master]
GO
/****** Object:  Database [WangYc]    Script Date: 2018/5/7 18:36:21 ******/
CREATE DATABASE [WangYc]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WangYc', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\WangYc.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WangYc_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\WangYc_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WangYc] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WangYc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WangYc] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WangYc] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WangYc] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WangYc] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WangYc] SET ARITHABORT OFF 
GO
ALTER DATABASE [WangYc] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WangYc] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [WangYc] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WangYc] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WangYc] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WangYc] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WangYc] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WangYc] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WangYc] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WangYc] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WangYc] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WangYc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WangYc] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WangYc] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WangYc] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WangYc] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WangYc] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WangYc] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WangYc] SET RECOVERY FULL 
GO
ALTER DATABASE [WangYc] SET  MULTI_USER 
GO
ALTER DATABASE [WangYc] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WangYc] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WangYc] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WangYc] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WangYc', N'ON'
GO
USE [WangYc]
GO
/****** Object:  Table [dbo].[InOutbound]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InOutbound](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Type] [varchar](20) NULL,
	[WarehouseId] [int] NOT NULL,
	[Qty] [int] NOT NULL,
	[Price] [float] NOT NULL,
	[Currency] [varchar](10) NULL,
	[Note] [varchar](200) NULL,
	[ParentId] [int] NULL,
	[CurrentQty] [int] NOT NULL,
	[CreateUserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[InOutReasonId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InOutboundOfShelf]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InOutboundOfShelf](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[InOutBoundId] [int] NOT NULL,
	[Type] [varchar](20) NULL,
	[WarehouseShelfId] [int] NOT NULL,
	[Qty] [int] NOT NULL,
	[CurrentQty] [int] NOT NULL,
	[Note] [varchar](200) NULL,
	[ParentId] [int] NULL,
	[CreateUserId] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InOutReason]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InOutReason](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](20) NULL,
	[InOutType] [int] NULL,
	[IsValid] [bit] NOT NULL,
	[Note] [varchar](200) NULL,
	[CreateDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Organization]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Organization](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[Name] [varchar](64) NOT NULL,
	[Descriptin] [varchar](200) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Level] [int] NULL,
	[CreateUserId] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrganizationUsers]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrganizationUsers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](20) NOT NULL,
	[OrganizationID] [int] NOT NULL,
	[Note] [varchar](20) NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Payment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseOrderId] [int] NOT NULL,
	[SupplierId] [int] NULL,
	[PaymentTypeId] [int] NULL,
	[ExpectedDate] [datetime] NULL,
	[Amount] [float] NOT NULL,
	[Note] [varchar](200) NULL,
	[IsValid] [bit] NOT NULL,
	[CreateUserId] [varchar](20) NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PaymentType]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PaymentType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](20) NULL,
	[Note] [varchar](200) NULL,
	[IsValid] [bit] NOT NULL,
	[CreateUserId] [varchar](20) NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ChineseName] [nvarchar](200) NULL,
	[EnglishName] [nvarchar](200) NULL,
	[Price] [float] NOT NULL,
	[Currency] [varchar](10) NULL,
	[Note] [varchar](200) NULL,
	[ProductTypeId] [int] NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NULL,
	[CreateDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Project]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Project](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NULL,
	[ChargeId] [varchar](20) NULL,
	[ApproveId] [varchar](20) NULL,
	[Note] [varchar](200) NULL,
	[State] [int] NULL,
	[CreateUserId] [varchar](20) NULL,
	[CreateDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectAttendance]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProjectAttendance](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NULL,
	[UserId] [varchar](20) NULL,
	[IsValid] [bit] NULL,
	[CreateUserId] [varchar](20) NULL,
	[CreateDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectMaterial]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProjectMaterial](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NULL,
	[ProductId] [int] NULL,
	[Qty] [int] NULL,
	[IsValid] [bit] NULL,
	[Type] [int] NULL,
	[CreateUserId] [varchar](20) NULL,
	[CreateDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectProduct]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProjectProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NULL,
	[ProductId] [int] NULL,
	[Qty] [int] NULL,
	[CreateUserId] [varchar](20) NULL,
	[CreateDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProjectType]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProjectType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [int] NULL,
	[Note] [varchar](200) NULL,
	[LaborCost] [decimal](18, 2) NULL,
	[IsValid] [bit] NOT NULL,
	[CreateUserId] [varchar](20) NULL,
	[CreateDate] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseOrder]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PurchaseOrder](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseTypeId] [int] NULL,
	[PaymentTypeId] [int] NULL,
	[SupplierId] [int] NULL,
	[Note] [varchar](200) NULL,
	[IsValid] [bit] NOT NULL,
	[CreateUserId] [varchar](20) NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseOrderDetail]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PurchaseOrderDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseOrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Qty] [int] NOT NULL,
	[UnitPrice] [float] NOT NULL,
	[Note] [varchar](200) NULL,
	[IsValid] [bit] NOT NULL,
	[CreateUserId] [varchar](20) NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseReceipt]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PurchaseReceipt](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Note] [varchar](200) NULL,
	[IsValid] [bit] NOT NULL,
	[CreateUserId] [varchar](20) NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseReceiptDetail]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PurchaseReceiptDetail](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseReceiptId] [int] NOT NULL,
	[PurchaseOrderDetailId] [int] NOT NULL,
	[Qty] [varchar](20) NOT NULL,
	[Note] [varchar](200) NULL,
	[IsValid] [bit] NOT NULL,
	[CreateUserId] [varchar](20) NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PurchaseType]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PurchaseType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](20) NULL,
	[Note] [varchar](200) NULL,
	[IsValid] [bit] NOT NULL,
	[CreateUserId] [varchar](20) NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Rights]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rights](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[Name] [varchar](64) NOT NULL,
	[Url] [varchar](200) NULL,
	[Descriptin] [varchar](200) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Level] [int] NULL,
	[CreateUserId] [varchar](20) NULL,
	[IsShow] [bit] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NULL,
	[Description] [varchar](200) NOT NULL,
	[OrganizationId] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RoleRights]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoleRights](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [varchar](20) NULL,
	[RightsId] [varchar](200) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supplier](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [int] NOT NULL,
	[MobilePhone] [varchar](20) NOT NULL,
	[Note] [varchar](200) NULL,
	[IsValid] [bit] NOT NULL,
	[CreateUserId] [varchar](20) NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SupplierProduct]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SupplierProduct](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SupplierId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Price] [decimal](18, 2) NULL,
	[IsValid] [bit] NOT NULL,
	[CreateUserId] [varchar](20) NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserLevel]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserLevel](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [varchar](20) NULL,
	[UserWorkTypeId] [int] NULL,
	[LaborCost] [decimal](18, 2) NULL,
	[IsValid] [bit] NOT NULL,
	[CreateUserId] [varchar](20) NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserRole](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [varchar](20) NOT NULL,
	[RoleID] [varchar](20) NOT NULL,
	[UserRoleNote] [varchar](20) NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [varchar](20) NOT NULL,
	[UserName] [varchar](20) NULL,
	[UserPwd] [varchar](20) NULL,
	[LastSignTime] [datetime] NULL,
	[SignState] [int] NULL,
	[TickeID] [varchar](20) NULL,
	[Telephone] [varchar](20) NULL,
	[OrganizationId] [int] NULL,
 CONSTRAINT [UserID_key] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserWorkType]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserWorkType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [varchar](20) NULL,
	[Note] [varchar](200) NULL,
	[IsValid] [bit] NOT NULL,
	[CreateUserId] [varchar](20) NULL,
	[CreateDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Warehouse]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Warehouse](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Note] [varchar](200) NULL,
	[WarehouseTypeId] [int] NULL,
	[State] [int] NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[WarehouseShelf]    Script Date: 2018/5/7 18:36:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WarehouseShelf](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Capacity] [int] NULL,
	[Note] [nvarchar](200) NULL,
	[WarehouseId] [int] NULL,
	[CreateDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[InOutbound] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[InOutboundOfShelf] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[InOutReason] ADD  DEFAULT ((1)) FOR [IsValid]
GO
ALTER TABLE [dbo].[InOutReason] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Organization] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[OrganizationUsers] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Payment] ADD  DEFAULT ((0)) FOR [Amount]
GO
ALTER TABLE [dbo].[Payment] ADD  DEFAULT ((1)) FOR [IsValid]
GO
ALTER TABLE [dbo].[Payment] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[PaymentType] ADD  DEFAULT ((1)) FOR [IsValid]
GO
ALTER TABLE [dbo].[PaymentType] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Product] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[ProductType] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Project] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[ProjectAttendance] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[ProjectMaterial] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[ProjectProduct] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[ProjectType] ADD  DEFAULT ((0)) FOR [LaborCost]
GO
ALTER TABLE [dbo].[ProjectType] ADD  DEFAULT ((1)) FOR [IsValid]
GO
ALTER TABLE [dbo].[ProjectType] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  DEFAULT ((1)) FOR [IsValid]
GO
ALTER TABLE [dbo].[PurchaseOrder] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[PurchaseOrderDetail] ADD  DEFAULT ((0)) FOR [Qty]
GO
ALTER TABLE [dbo].[PurchaseOrderDetail] ADD  DEFAULT ((0)) FOR [UnitPrice]
GO
ALTER TABLE [dbo].[PurchaseOrderDetail] ADD  DEFAULT ((1)) FOR [IsValid]
GO
ALTER TABLE [dbo].[PurchaseOrderDetail] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[PurchaseReceipt] ADD  DEFAULT ((1)) FOR [IsValid]
GO
ALTER TABLE [dbo].[PurchaseReceipt] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[PurchaseReceiptDetail] ADD  DEFAULT ((1)) FOR [IsValid]
GO
ALTER TABLE [dbo].[PurchaseReceiptDetail] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[PurchaseType] ADD  DEFAULT ((1)) FOR [IsValid]
GO
ALTER TABLE [dbo].[PurchaseType] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Rights] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Role] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[RoleRights] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Supplier] ADD  DEFAULT ((1)) FOR [IsValid]
GO
ALTER TABLE [dbo].[Supplier] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[SupplierProduct] ADD  DEFAULT ((1)) FOR [IsValid]
GO
ALTER TABLE [dbo].[SupplierProduct] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[UserLevel] ADD  DEFAULT ((0)) FOR [LaborCost]
GO
ALTER TABLE [dbo].[UserLevel] ADD  DEFAULT ((1)) FOR [IsValid]
GO
ALTER TABLE [dbo].[UserLevel] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[UserRole] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[UserWorkType] ADD  DEFAULT ((1)) FOR [IsValid]
GO
ALTER TABLE [dbo].[UserWorkType] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Warehouse] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[WarehouseShelf] ADD  DEFAULT (getdate()) FOR [CreateDate]
GO
USE [master]
GO
ALTER DATABASE [WangYc] SET  READ_WRITE 
GO
