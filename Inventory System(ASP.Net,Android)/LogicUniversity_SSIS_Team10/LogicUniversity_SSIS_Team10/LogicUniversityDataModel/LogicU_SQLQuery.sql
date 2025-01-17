DROP DATABASE LogicU_Inventory_System

CREATE DATABASE LogicU_Inventory_System

USE [LogicU_Inventory_System]
GO
/****** Object:  User [NT AUTHORITY\LOCAL SERVICE]    Script Date: 1/21/2017 5:39:29 PM ******/
CREATE USER [NT AUTHORITY\LOCAL SERVICE] FOR LOGIN [NT AUTHORITY\LOCAL SERVICE] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT AUTHORITY\LOCAL SERVICE]
GO
/****** Object:  Table [dbo].[Adjustment]    Script Date: 1/21/2017 5:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Adjustment](
	[VoucherId] [varchar](200) NOT NULL,
	[IssueDate] [date] NULL,
	[ApprovedBy] [varchar](150) NULL,
	[Remark] [varchar](200) NULL,
	[Status] [varchar](50) NULL,
 CONSTRAINT [PK_Adjustment] PRIMARY KEY CLUSTERED 
(
	[VoucherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AdjustmentDetail]    Script Date: 1/21/2017 5:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AdjustmentDetail](
	[VoucherId] [varchar](200) NOT NULL,
	[ItemId] [varchar](100) NOT NULL,
	[Quantity_Adjusted] [varchar](50) NULL,
	[Reason] [varchar](200) NULL,
 CONSTRAINT [PK_AdjustmentDetail] PRIMARY KEY CLUSTERED 
(
	[VoucherId] ASC,
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/21/2017 5:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](150) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CollectionPoint]    Script Date: 1/21/2017 5:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CollectionPoint](
	[CollectionPointId] [int] IDENTITY(1,1) NOT NULL,
	[CollectionPoint_Name] [varchar](100) NULL,
	[CollectionTime] [varchar](50) NULL,
 CONSTRAINT [PK_CollectionPoint] PRIMARY KEY CLUSTERED 
(
	[CollectionPointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Delegate]    Script Date: 1/21/2017 5:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Delegate](
	[DelegateId] [int] IDENTITY(200,1) NOT NULL,
	[DepartmentHeadId] [int] NOT NULL,
	[StaffId] [varchar](150) NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Delegate] PRIMARY KEY CLUSTERED 
(
	[DelegateId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 1/21/2017 5:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentId] [varchar](50) NOT NULL,
	[DepartmentName] [varchar](50) NULL,
	[ContactName] [varchar](50) NULL,
	[TelephoneNo] [varchar](50) NULL,
	[FaxNo] [varchar](50) NULL,
	[DepartmentHead_ID] [varchar](50) NULL,
	[Representative_ID] [varchar](50) NULL,
	[CollectionPointId] [int] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dibursement]    Script Date: 1/21/2017 5:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dibursement](
	[DisbursementId] [int] IDENTITY(100,1) NOT NULL,
	[DepartmentId] [varchar](50) NOT NULL,
	[Create_Date] [date] NULL,
	[ApprovedBy] [varchar](50) NULL,
	[Received_Date] [date] NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Dibursement] PRIMARY KEY CLUSTERED 
(
	[DisbursementId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DisbursementDetail]    Script Date: 1/21/2017 5:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DisbursementDetail](
	[DisbursementId] [int] NOT NULL,
	[ItemId] [varchar](100) NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_DisbursementDetail] PRIMARY KEY CLUSTERED 
(
	[DisbursementId] ASC,
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Item]    Script Date: 1/21/2017 5:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Item](
	[ItemId] [varchar](100) NOT NULL,
	[ItemName] [varchar](150) NULL,
	[CategoryId] [int] NOT NULL,
	[BinId] [varchar](50) NULL,
	[ReorderLevel] [int] NULL,
	[ReorderQty] [int] NULL,
	[UOM] [varchar](50) NULL,
	[First_SupplierId] [varchar](100) NULL,
	[Second_SupplierId] [varchar](100) NULL,
	[Third_SupplierId] [varchar](100) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Item] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/21/2017 5:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [bigint] IDENTITY(200000068,1) NOT NULL,
	[SupplierId] [varchar](50) NULL,
	[OrderDate] [date] NULL,
	[Expected_DeliveryDate] [date] NULL,
	[OrderedBy] [varchar](50) NULL,
	[ApprovedBy] [varchar](50) NULL,
	[ApprovedDate] [date] NULL,
	[ReceivedDate] [date] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 1/21/2017 5:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderId] [bigint] NOT NULL,
	[ItemId] [varchar](100) NOT NULL,
	[Order_Quantity] [int] NOT NULL,
	[Received_Quantity] [int] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Requisition]    Script Date: 1/21/2017 5:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Requisition](
	[RequisitionId] [nvarchar](150) NOT NULL,
	[DepartmentId] [varchar](50) NOT NULL,
	[StaffId] [varchar](150) NOT NULL,
	[Status] [varchar](50) NULL,
	[Approvedby] [varchar](50) NULL,
	[ApproveDate] [date] NULL,
	[Create_date] [date] NULL,
	[Remark] [varchar](200) NULL,
 CONSTRAINT [PK_Requisition] PRIMARY KEY CLUSTERED 
(
	[RequisitionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RequisitionDetail]    Script Date: 1/21/2017 5:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RequisitionDetail](
	[RequisitionId] [nvarchar](150) NOT NULL,
	[ItemId] [varchar](100) NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_RequisitionDetail] PRIMARY KEY CLUSTERED 
(
	[RequisitionId] ASC,
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Role]    Script Date: 1/21/2017 5:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] NOT NULL,
	[RoleName] [varchar](100) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 1/21/2017 5:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staff](
	[StaffId] [varchar](150) NOT NULL,
	[Password] [varchar](100) NULL,
	[StaffName] [varchar](150) NULL,
	[RoleId] [int] NOT NULL,
	[DepartmentId] [varchar](50) NOT NULL,
	[Email] [varchar](150) NULL,
	[PhoneNumber] [varchar](100) NULL,
	[Address] [varchar](150) NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[StaffId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockCard]    Script Date: 1/21/2017 5:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StockCard](
	[ItemId] [varchar](100) NOT NULL,
	[Update_Date] [datetime] NOT NULL,
	[Description] [varchar](150) NULL,
	[Quantity] [int] NULL,
	[Balance] [float] NULL,
 CONSTRAINT [PK_StockCard_1] PRIMARY KEY CLUSTERED 
(
	[ItemId] ASC,
	[Update_Date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 1/21/2017 5:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierId] [varchar](50) NOT NULL,
	[SupplierName] [varchar](50) NULL,
	[ContactName] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[FaxNumber] [varchar](50) NULL,
	[GST_Regstration_No] [varchar](100) NULL,
	[Address] [varchar](150) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Supplier_Stock]    Script Date: 1/21/2017 5:39:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Supplier_Stock](
	[SupplierId] [varchar](50) NOT NULL,
	[ItemId] [varchar](100) NOT NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_Supplier_Stock] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC,
	[ItemId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (1, N'Clip')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (2, N'Envelope')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (3, N'Eraser')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (4, N'Exercise')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (5, N'File')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (6, N'Pen')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (7, N'Puncher')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (8, N'Pad')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (9, N'Paper')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (10, N'Ruler')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (11, N'Scissors')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (12, N'Tape')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (13, N'Sharpener')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (14, N'Shorthand')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (15, N'Stapler')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (16, N'Tacks')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (17, N'Tparency')
GO
INSERT [dbo].[Category] ([CategoryId], [CategoryName]) VALUES (18, N'Tray')
GO
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[CollectionPoint] ON 

GO
INSERT [dbo].[CollectionPoint] ([CollectionPointId], [CollectionPoint_Name], [CollectionTime]) VALUES (1, N'Stationery Store', N'9:30 am')
GO
INSERT [dbo].[CollectionPoint] ([CollectionPointId], [CollectionPoint_Name], [CollectionTime]) VALUES (2, N'Management School', N'11:00 am')
GO
INSERT [dbo].[CollectionPoint] ([CollectionPointId], [CollectionPoint_Name], [CollectionTime]) VALUES (3, N'Medical School', N'9:30 am')
GO
INSERT [dbo].[CollectionPoint] ([CollectionPointId], [CollectionPoint_Name], [CollectionTime]) VALUES (4, N'Engineering School', N'11:00 am')
GO
INSERT [dbo].[CollectionPoint] ([CollectionPointId], [CollectionPoint_Name], [CollectionTime]) VALUES (5, N'Science School', N'9:30 am')
GO
INSERT [dbo].[CollectionPoint] ([CollectionPointId], [CollectionPoint_Name], [CollectionTime]) VALUES (6, N'University Hospital', N'11:00am')
GO
SET IDENTITY_INSERT [dbo].[CollectionPoint] OFF
GO
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [ContactName], [TelephoneNo], [FaxNo], [DepartmentHead_ID], [Representative_ID], [CollectionPointId]) VALUES (N' ENGL', N'English Dept', N'Mrs Pamela Kow', N'8742234', N'8921456', N'1102', N'1104', NULL)
GO
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [ContactName], [TelephoneNo], [FaxNo], [DepartmentHead_ID], [Representative_ID], [CollectionPointId]) VALUES (N'COMM', N'Commerce Dept', N'Mr Mohd.Azman', N'8741284', N'8921256', N'1113', N'1114', NULL)
GO
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [ContactName], [TelephoneNo], [FaxNo], [DepartmentHead_ID], [Representative_ID], [CollectionPointId]) VALUES (N'CPSC', N'Computer Science', N'Mr Wee Kian Fatt', N'8921457', N'8921457', N'1109', N'1110', NULL)
GO
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [ContactName], [TelephoneNo], [FaxNo], [DepartmentHead_ID], [Representative_ID], [CollectionPointId]) VALUES (N'REGR', N'Registrar Dept', N'Mr Helen Ho', N'8901266', N'8921465', N'1117', N'1118', NULL)
GO
INSERT [dbo].[Department] ([DepartmentId], [DepartmentName], [ContactName], [TelephoneNo], [FaxNo], [DepartmentHead_ID], [Representative_ID], [CollectionPointId]) VALUES (N'ZOOL', N'Zoology Dept', N'Mr.Peter Tan Ah Meng', N'8901266', N'8921465', N'1122', N'1123', NULL)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'C001', N'Clips Double 1', 1, N'C1', 50, 30, N'Dozen', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'C002', N'Clips Double 2', 1, N'C2', 50, 30, N'Dozen', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'C003', N'Clips Double 3/4', 1, N'C3', 50, 30, N'Dozen', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'C004', N'Clips Paper Large', 1, N'C4', 50, 30, N'Box', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'C005', N'Clips Paper Medium', 1, N'C5', 50, 30, N'Box', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'C006', N'Clips Paper Small', 1, N'C6', 50, 30, N'Box', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'E001', N'Envelop Brown ("3*6")', 2, N'E1', 600, 400, N'Each', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'E002', N'Envelope Brown ("3*6") w/Window', 2, N'E3', 600, 400, N'Each', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'E003', N'Enevlope Brown ("5*7")', 2, N'E3', 600, 400, N'Each', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'E004', N'Envelope Brown ("5*7") w/Window', 2, N'E4', 600, 400, N'Each', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'E005', N'Enevelope White ("3*6")', 2, N'E5', 600, 400, N'Each', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'E006', N'Enevelope White ("3*6") w/Window', 2, N'E6', 600, 400, N'Each', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'E007', N'Enevelope White ("5*7")', 2, N'E7', 600, 400, N'Each', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'E008', N'Enevelope White ("5*7") w/Window', 2, N'E8', 600, 400, N'Each', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'E020', N'Eraser(hard)', 3, N'E20', 50, 20, N'Each', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'E021', N'Eraser(soft)', 3, N'E21', 50, 20, N'Each', N'ALPA', N'BANE', N'OMEG', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'E030', N'Exercise Book(100 pg)', 4, N'E30', 100, 50, N'Each', N'ALPA', N'BANE', N'OMEG', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'E031', N'Exercise Book(120 pg)', 4, N'E31', 100, 50, N'Each', N'ALPA', N'OMEG', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'E032', N'Exercise Book A4 Hardcover(100 pg)', 4, N'E32', 100, 50, N'Each', N'ALPA', N'OMEG', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'E033', N'Exercise Book A4 Hardcover(120 pg)', 4, N'E33', 100, 50, N'Each', N'ALPA', N'OMEG', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'E034', N'Exercise Book A4 Hardcover(200 pg)', 4, N'E34', 100, 50, N'Each', N'ALPA', N'OMEG', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'E035', N'Exercise Book Hardcover(100 pg)', 4, N'E35', 100, 50, N'Each', N'ALPA', N'OMEG', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'E036', N'Exercise Book Hardcover(120 pg)', 4, N'E36', 100, 50, N'Each', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'F020', N'File Separator', 5, N'F20', 100, 50, N'Set', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'F021', N'File-Blue Plain', 5, N'F21', 200, 100, N'Each', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'F022', N'File-Blue with Logo', 5, N'F22', 200, 100, N'Each', N'ALPA', N'BANE', N'OMEG', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'F023', N'File-Brown w/o Logo', 5, N'F23', 200, 150, N'Each', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'F024', N'File-Brown with Logo', 5, N'F24', 200, 150, N'Each', N'ALPA', N'BANE', N'OMEG', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'F031', N'Folder Plastic Blue', 5, N'F31', 200, 150, N'Each', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'F032', N'Folder Plastic Clear', 5, N'F32', 200, 150, N'Each', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'F033', N'Folder Plastic Green', 5, N'F33', 200, 150, N'Each', N'ALPA', N'BANE', N'OMEG', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'F034', N'Folder Plastic Pink', 5, N'F34', 200, 150, N'Each', N'ALPA', N'BANE', N'OMEG', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'F035', N'Folder Plastic Yellow', 5, N'F35', 200, 150, N'Each', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'H011', N'Highlighter Blue', 6, N'H11', 100, 80, N'Box', N'ALPA', N'BANE', N'OMEG', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'H012', N'Highlighter Green', 6, N'H12', 100, 80, N'Box', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'H013', N'Highlighter Pink', 6, N'H13', 100, 80, N'Box', N'ALPA', N'BANE', N'OMEG', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'H014', N'Highlighter Yellow', 6, N'H14', 100, 80, N'Box', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'H031', N'Hole Puncher 2 holes', 7, N'H31', 50, 20, N'Each', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'H032', N'Hole Puncher 3 holes', 7, N'H32', 50, 20, N'Each', N'ALPA', N'BANE', N'OMEG', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'H033', N'Hole Puncher Adjustable', 7, N'H33', 50, 20, N'Each', N'ALPA', N'BANE', N'OMEG', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P010', N'Pad Postit Memo 1"*2"', 8, N'P10', 100, 60, N'Packet', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P011', N'Pad Postit Memo 1/2"*1"', 8, N'P111', 100, 60, N'Packet', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P012', N'Pad Postit Memo 1/2"*2"', 8, N'P12', 100, 60, N'Packet', N'ALPA', N'BANE', N'OMEG', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P013', N'Pad Postit Memo 2"*3"', 8, N'P13', 100, 60, N'Packet', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P014', N'Pad Postit Memo 2"*4"', 8, N'P14', 100, 60, N'Packet', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P015', N'Pad Postit Memo 2"*4"', 8, N'P15', 100, 60, N'Packet', N'ALPA', N'BANE', N'OMEG', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P016', N'Pad Postit Memo 3/4"*2"', 8, N'P16', 100, 60, N'Packet', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P020', N'Paper PhotostatA3', 9, N'P20', 500, 500, N'Box', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P021', N'Paper PhotostatA4', 9, N'P21', 500, 500, N'Box', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P030', N'Pen Ballpoint Black', 6, N'P30', 100, 50, N'Dozen', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P031', N'Pen Ballpoint Blue', 6, N'P31', 100, 50, N'Dozen', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P032', N'Pen Ballpoint Red', 6, N'P32', 100, 50, N'Dozen', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P033', N'Pen Ballpoint Black', 6, N'P33', 100, 50, N'Dozen', N'ALPA', N'BANE', N'OMEG', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P034', N'Pen Ballpoint Blue', 6, N'P34', 100, 50, N'Dozen', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P035', N'Pen Ballpoint Red', 6, N'P35', 100, 50, N'Dozen', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P036', N'Pen Transparency Permanent', 6, N'P36', 100, 50, N'Packet', N'ALPA', N'BANE', N'OMEG', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P037', N'Pen Transparency Soluble', 6, N'P37', 100, 50, N'Packet', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P038', N'Pen Whiteboard Marker Black', 6, N'P38', 100, 50, N'Box', N'ALPA', N'BANE', N'OMEG', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P039', N'Pen Whiteboard Marker Blue', 6, N'P39', 100, 50, N'Box', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P040', N'Pen Whiteboard Marker Green', 6, N'P40', 100, 50, N'Box', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P041', N'Pen Whiteboard Marker Red', 6, N'P41', 100, 50, N'Box', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P042', N'Pencil 2B', 6, N'P42', 100, 50, N'Dozen', N'ALPA', N'BANE', N'OMEG', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P043', N'Pencil 2B with Eraser End', 6, N'P43', 100, 50, N'Dozen', N'ALPA', N'BANE', N'OMEG', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P044', N'Pencil 4H', 6, N'P44', 100, 50, N'Dozen', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P045', N'Pencil B', 6, N'P45', 100, 50, N'Dozen', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'P046', N'Pencil B with Eraser End', 6, N'P46', 100, 50, N'Dozen', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'R001', N'Ruler 6"', 10, N'R1', 50, 20, N'Dozen', N'ALPA', N'BANE', N'OMEG', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'R002', N'Ruler 12"', 10, N'R2', 50, 20, N'Dozen', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'S010', N'Shorthand Book (100 pg)', 14, N'S10', 100, 80, N'Each', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'S011', N'Shorthand Book (120 pg)', 14, N'S11', 100, 80, N'Each', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'S012', N'Shorthand Book (80 pg)', 14, N'S12', 100, 80, N'Each', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'S020', N'Stapler No.28', 15, N'S20', 50, 20, N'Each', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'S021', N'Stapler No.36', 15, N'S21', 50, 20, N'Each', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'S022', N'Stapler No.28', 15, N'S22', 50, 20, N'Box', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'S023', N'Stapler No.36', 15, N'S23', 50, 20, N'Box', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'S040', N'Scotch Tape', 12, N'S40', 50, 20, N'Each', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'S041', N'Scotch Tape Dispenser', 12, N'S41', 50, 20, N'Each', N'ALPA', N'BANE', N'OMEG', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'S100', N'Scissors', 11, N'S1', 50, 20, N'Each', N'ALPA', N'BANE', N'OMEG', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'S101', N'Sharpener', 13, N'S01', 50, 20, N'Each', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'T001', N'Thumb Tacks Large', 16, N'T1', 10, 10, N'Box', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'T002', N'Thumb Tacks Medium', 16, N'T2', 10, 10, N'Box', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'T003', N'Thumb Tacks Small', 16, N'T3', 10, 10, N'Box', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'T020', N'Transparency Blue', 17, N'T20', 100, 200, N'Box', N'ALPA', N'BANE', N'OMEG', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'T021', N'Transparency Clear', 17, N'T21', 500, 400, N'Box', N'ALPA', N'BANE', N'OMEG', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'T022', N'Transparency Green', 17, N'T22', 100, 200, N'Box', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'T023', N'Transparency Red', 17, N'T23', 100, 200, N'Box', N'ALPA', N'BANE', N'OMEG', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'T024', N'Transparency Reverse Blue', 17, N'T24', 100, 200, N'Box', N'ALPA', N'BANE', N'CHEP', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'T025', N'Transparency COver 3M', 17, N'T25', 500, 400, N'Box', N'ALPA', N'BANE', N'OMEG', 0)
GO
INSERT [dbo].[Item] ([ItemId], [ItemName], [CategoryId], [BinId], [ReorderLevel], [ReorderQty], [UOM], [First_SupplierId], [Second_SupplierId], [Third_SupplierId], [Status]) VALUES (N'T100', N'Trays In/Out', 18, N'T100', 20, 10, N'Set', N'ALPA', N'BANE', N'OMEG', 0)
GO
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (1, N'DepartmentHead')
GO
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'DepartmentRep')
GO
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (3, N'Staff')
GO
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (4, N'StoreClerk')
GO
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (5, N'Supervisor')
GO
INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (6, N'Manager')
GO
INSERT [dbo].[Staff] ([StaffId], [Password], [StaffName], [RoleId], [DepartmentId], [Email], [PhoneNumber], [Address]) VALUES (N'1101', N'123', N'Jenny Wong Mei Lin', 3, N'ENGL', N'jenny@gmail.com', N'87699088', N'Blk 400,Bouna Vista Road #07-02 Ban Soh Building Singapore 110525')
GO
INSERT [dbo].[Staff] ([StaffId], [Password], [StaffName], [RoleId], [DepartmentId], [Email], [PhoneNumber], [Address]) VALUES (N'1102', N'123', N'Prof Ezra Pound', 1, N'ENGL', N'soh@gmail.com', N'82100987', N'Blk 400,Bishan Road #07-05 Ban Soh Building Singapore 1107')
GO
INSERT [dbo].[Staff] ([StaffId], [Password], [StaffName], [RoleId], [DepartmentId], [Email], [PhoneNumber], [Address]) VALUES (N'1103', N'123', N'Chan Heng', 4, N'Store', N'chan@gmail.com', N'98567888', N'Blk 680,Tanjong Rhu Road #07-05 Ban Soh Building Singapore 110525')
GO
INSERT [dbo].[Staff] ([StaffId], [Password], [StaffName], [RoleId], [DepartmentId], [Email], [PhoneNumber], [Address]) VALUES (N'1104', N'123', N'Tanya Chua', 2, N'ENGL', N'tanya@gmail.com', N'78965433', N'Blk 600,Tanjong Rhu Road #07-05 Ban Soh Building Singapore 110525')
GO
INSERT [dbo].[Staff] ([StaffId], [Password], [StaffName], [RoleId], [DepartmentId], [Email], [PhoneNumber], [Address]) VALUES (N'1105', N'123', N'Rohan Gunaratna', 5, N'Store', N'rohan@gmail.com', N'765654321', N'Blk 640,Tanjong Rhu Road #07-05 Ban Soh Building Singapore 110525')
GO
INSERT [dbo].[Staff] ([StaffId], [Password], [StaffName], [RoleId], [DepartmentId], [Email], [PhoneNumber], [Address]) VALUES (N'1106', N'123', N'Ivan Heng', 6, N'Store', N'ivan@gmail.com', N'87543211', N'Blk 500,Tanjong Rhu Road #07-05 Ban Soh Building Singapore 110525')
GO
INSERT [dbo].[Staff] ([StaffId], [Password], [StaffName], [RoleId], [DepartmentId], [Email], [PhoneNumber], [Address]) VALUES (N'1107', N'123', N'Ho Ching', 3, N'ENGL', N'ching@gmail.com', N'6785467', N'Blk 890,Tanjong Rhu Road #07-05 Ban Soh Building Singapore 110525')
GO
INSERT [dbo].[Staff] ([StaffId], [Password], [StaffName], [RoleId], [DepartmentId], [Email], [PhoneNumber], [Address]) VALUES (N'1108', N'123', N'Jiang Yanmei	', 4, N'Store', N'yanmei@gmail.com', N'678543267', N'Blk 780,Tanjong Rhu Road #07-05 Ban Soh Building Singapore 110525')
GO
INSERT [dbo].[Staff] ([StaffId], [Password], [StaffName], [RoleId], [DepartmentId], [Email], [PhoneNumber], [Address]) VALUES (N'1109', N'123', N'Soh Kian Wee', 1, N'CPSC', N'soh@gmail.com', N'87654333', N'Blk 890,Tanjong Rhu Road #07-05 Ban Soh Building Singapore 110525')
GO
INSERT [dbo].[Staff] ([StaffId], [Password], [StaffName], [RoleId], [DepartmentId], [Email], [PhoneNumber], [Address]) VALUES (N'1110', N'123', N'Lee Hsien Yang', 2, N'CPSC', N'leehsien@gmail.com', N'9809766', N'Blk 620,Tanjong Rhu Road #07-05 Ban Soh Building Singapore 110525')
GO
INSERT [dbo].[Staff] ([StaffId], [Password], [StaffName], [RoleId], [DepartmentId], [Email], [PhoneNumber], [Address]) VALUES (N'1111', N'123', N'Poh Seng Song', 3, N'CPSC', N'poh@gmail.com', N'7685678', N'Blk 500,Tanjong Rhu Road #07-05 Ban Soh Building Singapore 110525')
GO
INSERT [dbo].[Staff] ([StaffId], [Password], [StaffName], [RoleId], [DepartmentId], [Email], [PhoneNumber], [Address]) VALUES (N'1112', N'123', N'Ng Teng Fong', 3, N'CPSC', N'teng@gmail.com', N'76854321', N'Blk 500,Alexandra Road #07-05 Ban Soh Building Singapore 110525')
GO
INSERT [dbo].[Staff] ([StaffId], [Password], [StaffName], [RoleId], [DepartmentId], [Email], [PhoneNumber], [Address]) VALUES (N'1113', N'123', N'Dr.Chia Leow', 1, N'COMM', N'azma@gmail.com', N'65787900', N'Blk 500,Alexandra Road #07-05 Ban Soh Building Singapore 110525')
GO
INSERT [dbo].[Staff] ([StaffId], [Password], [StaffName], [RoleId], [DepartmentId], [Email], [PhoneNumber], [Address]) VALUES (N'1114', N'123', N'Siow Lee Chin', 2, N'COMM', N'siowlee@gmail.com', N'879089786', N'Blk 500,Alexandra Road #07-05 Ban Soh Building Singapore 110525')
GO
INSERT [dbo].[Staff] ([StaffId], [Password], [StaffName], [RoleId], [DepartmentId], [Email], [PhoneNumber], [Address]) VALUES (N'1115', N'123', N'Tan Howe Liang', 3, N'COMM', N'howel@gmail.com', N'675434567', N'Blk 550,Alexandra Road #07-05 Ban Soh Building Singapore 110525')
GO
INSERT [dbo].[Staff] ([StaffId], [Password], [StaffName], [RoleId], [DepartmentId], [Email], [PhoneNumber], [Address]) VALUES (N'1116', N'123', N'Wee Cho Yaw', 3, N'COMM', N'weecho@gmail.com', N'342123456', N'Blk 550,Alexandra Road #07-05 Ban Soh Building Singapore 110525')
GO
INSERT [dbo].[Staff] ([StaffId], [Password], [StaffName], [RoleId], [DepartmentId], [Email], [PhoneNumber], [Address]) VALUES (N'1117', N'123', N'Mrs Low Kway Boo', 1, N'REGR', N'low@gmail.com', N'234567890', N'Blk 550,Alexandra Road #07-05 Ban Soh Building Singapore 110525')
GO
INSERT [dbo].[Staff] ([StaffId], [Password], [StaffName], [RoleId], [DepartmentId], [Email], [PhoneNumber], [Address]) VALUES (N'1118', N'123', N'Wong Yip Yan', 2, N'REGR', N'yip@gmail.com', N'678987654', N'Blk 550,Alexandra Road #07-05 Ban Soh Building Singapore 110525')
GO
INSERT [dbo].[Staff] ([StaffId], [Password], [StaffName], [RoleId], [DepartmentId], [Email], [PhoneNumber], [Address]) VALUES (N'1119', N'123', N'Daniel Bennett', 3, N'REGR', N'daniel@gmail.com', N'876567898', N'Blk 550,Alexandra Road #07-05 Ban Soh Building Singapore 110525')
GO
INSERT [dbo].[Staff] ([StaffId], [Password], [StaffName], [RoleId], [DepartmentId], [Email], [PhoneNumber], [Address]) VALUES (N'1120', N'123', N'Kwek Leng Beng', 3, N'REGR', N'kwek@gmail.com', N'8909878990', N'Blk 550,Alexandra Road #07-05 Ban Soh Building Singapore 110525')
GO
INSERT [dbo].[Staff] ([StaffId], [Password], [StaffName], [RoleId], [DepartmentId], [Email], [PhoneNumber], [Address]) VALUES (N'1121', N'123', N'Wong Peng Soon', 3, N'REGR', N'wong@gmail.com', N'786543234', N'Blk 550,Alexandra Road #07-05 Ban Soh Building Singapore 110525')
GO
INSERT [dbo].[Staff] ([StaffId], [Password], [StaffName], [RoleId], [DepartmentId], [Email], [PhoneNumber], [Address]) VALUES (N'1122', N'123', N'Prof Tan', 1, N'ZOOL', N'tan@gmail.com', N'565434545', N'Blk 22,Alexandra Road #07-05 Ban Soh Building Singapore 110525')
GO
INSERT [dbo].[Staff] ([StaffId], [Password], [StaffName], [RoleId], [DepartmentId], [Email], [PhoneNumber], [Address]) VALUES (N'1123', N'123', N'Peter Tan Ah Meng', 2, N'ZOOL', N'pete@gmail.com', N'78965678', N'Blk 22,Alexandra Road #07-05 Ban Soh Building Singapore 110525')
GO
INSERT [dbo].[Staff] ([StaffId], [Password], [StaffName], [RoleId], [DepartmentId], [Email], [PhoneNumber], [Address]) VALUES (N'1124', N'123', N'Jing Jun Hong', 3, N'ZOOL', N'jing@gmail.com', N'76543290', N'Blk 22,Alexandra Road #07-05 Ban Soh Building Singapore 110525')
GO
INSERT [dbo].[Staff] ([StaffId], [Password], [StaffName], [RoleId], [DepartmentId], [Email], [PhoneNumber], [Address]) VALUES (N'1125', N'123', N'Catherine Lim	', 3, N'ZOOL', N'catherin@gmail.com', N'876567890', N'Blk 22,Alexandra Road #07-05 Ban Soh Building Singapore 110525')
GO
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [ContactName], [Email], [PhoneNumber], [FaxNumber], [GST_Regstration_No], [Address]) VALUES (N'ALPA', N'ALPHA Office Supplies', N'Ms Irene Tan', N'alpha@gmail.com', N'4619928', N'4612238', N'MR-8500440-2', N'Blk 1128,Ang Mo Kio Industrial Park')
GO
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [ContactName], [Email], [PhoneNumber], [FaxNumber], [GST_Regstration_No], [Address]) VALUES (N'BANE', N'BANES Shop', N'Mr Loh Ah Pek', N'loh@gmail.com', N'4781234', N'4792434', N'MR-8200420-2', N'Blk 124,Alexandra Road #03-04 Banes Building Singapore 550315')
GO
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [ContactName], [Email], [PhoneNumber], [FaxNumber], [GST_Regstration_No], [Address]) VALUES (N'CHEP', N'Cheap Stationer', N'Mr Soh Kway Koh', N'soh@gmail.com', N'3543234', N'4742434', N'Nil', N'Blk 34,Clementi Road #07-02 Ban Ban Soh Building Singapore 110525')
GO
INSERT [dbo].[Supplier] ([SupplierId], [SupplierName], [ContactName], [Email], [PhoneNumber], [FaxNumber], [GST_Regstration_No], [Address]) VALUES (N'OMEG', N'OMEGA Stationery Supplier', N'Mr Ronnie Ho', N'omega2gmail.com', N'7671233', N'767 1234', N'MR-8555330-1', N'Blk 11,Hillview Avenue #03-04,Singapore 679036')
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'C001', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'C002', 1.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'C003', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'C004', 54)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'C005', 80)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'C006', 65)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'E001', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'E002', 1.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'E003', 70)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'E004', 1.2)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'E005', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'E006', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'E007', 1.25)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'E008', 85)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'E020', 90)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'E021', 75)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'E030', 70)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'E031', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'E032', 1.35)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'E033', 1.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'E034', 1.3)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'E035', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'E036', 90)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'F020', 1.2)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'F021', 22)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'F022', 62)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'F023', 48)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'F024', 40)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'F031', 55)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'F032', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'F033', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'F034', 90)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'F035', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'H011', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'H012', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'H013', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'H014', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'H031', 6)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'H032', 7)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'H033', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P010', 4.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P011', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P012', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P013', 3.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P014', 12)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P015', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P016', 6.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P020', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P021', 12)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P030', 6)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P031', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P032', 12)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P033', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P034', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P035', 15)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P036', 8)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P037', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P038', 15)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P039', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P040', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P041', 6)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P042', 9)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P043', 7)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P044', 12)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P045', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'P046', 14)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'R001', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'R002', 12)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'S010', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'S011', 6.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'S012', 6.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'S020', 12)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'S021', 15)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'S022', 12)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'S023', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'S040', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'S041', 15)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'S100', 15)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'S101', 4.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'T001', 5.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'T002', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'T003', 12)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'T020', 14)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'T021', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'T022', 15)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'T023', 4.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'T024', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'T025', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'ALPA', N'T100', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'C001', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'C002', 1.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'C003', 1.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'C004', 62)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'C005', 80)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'C006', 60)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'E001', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'E002', 1.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'E003', 70)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'E004', 1.2)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'E005', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'E006', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'E007', 1.25)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'E008', 85)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'E020', 90)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'E021', 75)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'E030', 70)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'E036', 90)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'F020', 1.2)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'F021', 22)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'F022', 62)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'F023', 48)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'F024', 40)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'F031', 55)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'F032', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'F033', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'F034', 90)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'F035', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'H011', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'H012', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'H013', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'H014', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'H031', 6)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'H032', 7)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'H033', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P010', 4.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P011', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P012', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P013', 3.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P014', 12)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P015', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P016', 6.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P020', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P021', 12)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P030', 6)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P031', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P032', 12)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P033', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P034', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P035', 15)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P036', 8)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P037', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P038', 15)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P039', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P040', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P041', 6)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P042', 9)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P043', 7)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P044', 12)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P045', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'P046', 14)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'R001', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'R002', 12)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'S010', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'S011', 6.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'S012', 6.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'S020', 12)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'S021', 15)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'S022', 12)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'S023', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'S040', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'S041', 15)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'S100', 15)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'S101', 4.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'T001', 5.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'T002', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'T003', 12)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'T020', 14)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'T021', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'T022', 15)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'T023', 4.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'T024', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'T025', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'BANE', N'T100', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'C001', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'C002', 1.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'C003', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'C004', 54)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'C005', 80)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'C006', 65)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'E001', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'E002', 1.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'E003', 70)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'E004', 1.2)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'E005', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'E006', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'E007', 1.25)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'E008', 85)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'E020', 90)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'E031', 75)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'E032', 70)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'E033', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'E034', 1.35)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'E035', 1.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'E036', 1.3)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'F020', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'F021', 90)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'F023', 8)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'F031', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'F032', 15)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'F035', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'H012', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'H014', 6)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'H031', 9)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'P010', 7)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'P011', 12)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'P013', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'P014', 14)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'P016', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'P020', 12)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'P021', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'P030', 6.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'P031', 6.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'P032', 12)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'P034', 15)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'P035', 12)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'P037', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'P039', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'P040', 15)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'P041', 15)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'P044', 4.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'P045', 5.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'P046', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'R002', 12)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'S010', 14)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'S011', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'S012', 15)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'S020', 4.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'S021', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'S022', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'S023', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'S040', 15)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'S101', 4.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'T001', 5.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'T002', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'T003', 12)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'T022', 14)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'CHEP', N'T024', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'E021', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'E030', 1.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'E031', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'E032', 2.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'E033', 3.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'E034', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'E035', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'F022', 6)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'F024', 4.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'F033', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'F034', 12)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'H011', 6.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'H013', 1)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'H032', 12)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'H033', 4)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'P012', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'P015', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'P033', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'P036', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'P038', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'P042', 4)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'P043', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'R001', 6)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'S041', 5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'S100', 4)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'T020', 2.5)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'T021', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'T023', 12)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'T025', 10)
GO
INSERT [dbo].[Supplier_Stock] ([SupplierId], [ItemId], [Price]) VALUES (N'OMEG', N'T100', 12)
GO
ALTER TABLE [dbo].[AdjustmentDetail]  WITH CHECK ADD  CONSTRAINT [FK_AdjustmentDetail_Adjustment] FOREIGN KEY([VoucherId])
REFERENCES [dbo].[Adjustment] ([VoucherId])
GO
ALTER TABLE [dbo].[AdjustmentDetail] CHECK CONSTRAINT [FK_AdjustmentDetail_Adjustment]
GO
ALTER TABLE [dbo].[AdjustmentDetail]  WITH CHECK ADD  CONSTRAINT [FK_AdjustmentDetail_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
GO
ALTER TABLE [dbo].[AdjustmentDetail] CHECK CONSTRAINT [FK_AdjustmentDetail_Item]
GO
ALTER TABLE [dbo].[Delegate]  WITH NOCHECK ADD  CONSTRAINT [FK_Delegate_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[Delegate] CHECK CONSTRAINT [FK_Delegate_Staff]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_CollectionPoint] FOREIGN KEY([CollectionPointId])
REFERENCES [dbo].[CollectionPoint] ([CollectionPointId])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_CollectionPoint]
GO
ALTER TABLE [dbo].[Dibursement]  WITH CHECK ADD  CONSTRAINT [FK_Dibursement_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[Dibursement] CHECK CONSTRAINT [FK_Dibursement_Department]
GO
ALTER TABLE [dbo].[DisbursementDetail]  WITH CHECK ADD  CONSTRAINT [FK_DisbursementDetail_DisbursementDetail] FOREIGN KEY([DisbursementId])
REFERENCES [dbo].[Dibursement] ([DisbursementId])
GO
ALTER TABLE [dbo].[DisbursementDetail] CHECK CONSTRAINT [FK_DisbursementDetail_DisbursementDetail]
GO
ALTER TABLE [dbo].[DisbursementDetail]  WITH CHECK ADD  CONSTRAINT [FK_DisbursementDetail_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
GO
ALTER TABLE [dbo].[DisbursementDetail] CHECK CONSTRAINT [FK_DisbursementDetail_Item]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([CategoryId])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Category]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Supplier] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([SupplierId])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Supplier]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Item]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_OrderDetail] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_OrderDetail]
GO
ALTER TABLE [dbo].[Requisition]  WITH CHECK ADD  CONSTRAINT [FK_Requisition_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[Requisition] CHECK CONSTRAINT [FK_Requisition_Department]
GO
ALTER TABLE [dbo].[Requisition]  WITH CHECK ADD  CONSTRAINT [FK_Requisition_Staff] FOREIGN KEY([StaffId])
REFERENCES [dbo].[Staff] ([StaffId])
GO
ALTER TABLE [dbo].[Requisition] CHECK CONSTRAINT [FK_Requisition_Staff]
GO
ALTER TABLE [dbo].[RequisitionDetail]  WITH CHECK ADD  CONSTRAINT [FK_RequisitionDetail_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
GO
ALTER TABLE [dbo].[RequisitionDetail] CHECK CONSTRAINT [FK_RequisitionDetail_Item]
GO
ALTER TABLE [dbo].[RequisitionDetail]  WITH CHECK ADD  CONSTRAINT [FK_RequisitionDetail_RequisitionDetail] FOREIGN KEY([RequisitionId])
REFERENCES [dbo].[Requisition] ([RequisitionId])
GO
ALTER TABLE [dbo].[RequisitionDetail] CHECK CONSTRAINT [FK_RequisitionDetail_RequisitionDetail]
GO
ALTER TABLE [dbo].[Staff]  WITH NOCHECK ADD  CONSTRAINT [FK_Staff_Department] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Department] ([DepartmentId])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Department]
GO
ALTER TABLE [dbo].[Staff]  WITH NOCHECK ADD  CONSTRAINT [FK_Staff_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([RoleId])
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Role]
GO
ALTER TABLE [dbo].[StockCard]  WITH CHECK ADD  CONSTRAINT [FK_StockCard_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
GO
ALTER TABLE [dbo].[StockCard] CHECK CONSTRAINT [FK_StockCard_Item]
GO
ALTER TABLE [dbo].[Supplier_Stock]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Stock_Item] FOREIGN KEY([ItemId])
REFERENCES [dbo].[Item] ([ItemId])
GO
ALTER TABLE [dbo].[Supplier_Stock] CHECK CONSTRAINT [FK_Supplier_Stock_Item]
GO
ALTER TABLE [dbo].[Supplier_Stock]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Stock_Supplier] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([SupplierId])
GO
ALTER TABLE [dbo].[Supplier_Stock] CHECK CONSTRAINT [FK_Supplier_Stock_Supplier]
GO
