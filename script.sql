USE [10MinZepto]
GO
/****** Object:  Table [dbo].[tbl_adminlogin]    Script Date: 24-09-2023 13:21:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_adminlogin](
	[AdminId] [varchar](100) NOT NULL,
	[Password] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_cart]    Script Date: 24-09-2023 13:21:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_cart](
	[CId] [int] IDENTITY(1,1) NOT NULL,
	[PId] [int] NULL,
	[UId] [varchar](100) NULL,
	[Quantity] [int] NULL,
	[Total] [int] NULL,
	[AddDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_category]    Script Date: 24-09-2023 13:21:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_category](
	[CId] [int] IDENTITY(1,1) NOT NULL,
	[CName] [varchar](100) NULL,
	[CPic] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_contact]    Script Date: 24-09-2023 13:21:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_contact](
	[SR] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NULL,
	[Email] [varchar](100) NULL,
	[MobNo] [bigint] NULL,
	[Message] [text] NULL,
	[Enq_Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[SR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_order]    Script Date: 24-09-2023 13:21:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_order](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[CId] [int] NULL,
	[PId] [int] NULL,
	[UId] [varchar](100) NULL,
	[Quality] [int] NULL,
	[Total] [int] NULL,
	[Add_Date] [datetime] NULL,
	[Status] [varchar](100) NULL,
	[Order_Date] [datetime] NULL,
 CONSTRAINT [PK__tbl_orde__3213E83F274748F8] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_product]    Script Date: 24-09-2023 13:21:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_product](
	[PId] [int] IDENTITY(101,1) NOT NULL,
	[CId] [int] NULL,
	[SubCId] [int] NULL,
	[Title] [varchar](100) NOT NULL,
	[Description] [text] NULL,
	[Model] [varchar](100) NULL,
	[MRP] [int] NULL,
	[SaleRate] [int] NULL,
	[Pack] [varchar](100) NULL,
	[Pic] [varchar](200) NULL,
	[AddDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[PId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_subcategory]    Script Date: 24-09-2023 13:21:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_subcategory](
	[SId] [int] IDENTITY(1,1) NOT NULL,
	[CId] [int] NULL,
	[SubCatName] [varchar](100) NULL,
	[SubCatPic] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[SId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_user]    Script Date: 24-09-2023 13:21:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_user](
	[Name] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[MobNo] [bigint] NULL,
	[Password] [varchar](50) NULL,
	[Address] [text] NOT NULL,
	[Landmark] [varchar](100) NULL,
	[PinCode] [int] NOT NULL,
	[AddDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[tbl_adminlogin] ([AdminId], [Password]) VALUES (N'admin1.0', N'123')
GO
SET IDENTITY_INSERT [dbo].[tbl_cart] ON 

INSERT [dbo].[tbl_cart] ([CId], [PId], [UId], [Quantity], [Total], [AddDate]) VALUES (13, 141, N'imayushsri7@gmail.com', 1, 900, CAST(N'2023-09-24T12:09:00.000' AS DateTime))
INSERT [dbo].[tbl_cart] ([CId], [PId], [UId], [Quantity], [Total], [AddDate]) VALUES (14, 140, N'imayushsri7@gmail.com', 2, 130, CAST(N'2023-09-24T12:10:00.000' AS DateTime))
INSERT [dbo].[tbl_cart] ([CId], [PId], [UId], [Quantity], [Total], [AddDate]) VALUES (15, 122, N'imayushsri7@gmail.com', 1, 26, CAST(N'2023-09-24T12:10:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_cart] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_category] ON 

INSERT [dbo].[tbl_category] ([CId], [CName], [CPic]) VALUES (14, N'Dairy, Bread & Eggs', N'dairy.jpg')
INSERT [dbo].[tbl_category] ([CId], [CName], [CPic]) VALUES (15, N'Snacks', N'snacks.jpg')
INSERT [dbo].[tbl_category] ([CId], [CName], [CPic]) VALUES (16, N'Atta, Rice & Dal', N'atta rice dal.jpg')
INSERT [dbo].[tbl_category] ([CId], [CName], [CPic]) VALUES (17, N'Masala, Oil & More', N'Masala oil more.jpeg')
INSERT [dbo].[tbl_category] ([CId], [CName], [CPic]) VALUES (18, N'Vegitables', N'vegitables.png')
INSERT [dbo].[tbl_category] ([CId], [CName], [CPic]) VALUES (19, N'Fruits', N'fruits.png')
INSERT [dbo].[tbl_category] ([CId], [CName], [CPic]) VALUES (20, N'Breakfast & Instant Food', N'noodles.jpeg')
INSERT [dbo].[tbl_category] ([CId], [CName], [CPic]) VALUES (21, N'Cold Drink', N'colddrink.png')
SET IDENTITY_INSERT [dbo].[tbl_category] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_contact] ON 

INSERT [dbo].[tbl_contact] ([SR], [Name], [Email], [MobNo], [Message], [Enq_Date]) VALUES (5, N'Ayush Srivastava', N'ayushsri9666@gmail.com', 6667777777, N'Hiiii!', CAST(N'2023-12-09T13:59:49.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_contact] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_order] ON 

INSERT [dbo].[tbl_order] ([id], [CId], [PId], [UId], [Quality], [Total], [Add_Date], [Status], [Order_Date]) VALUES (1, 8, 122, N'imayushsri7@gmail.com', 1, 26, CAST(N'2023-09-22T23:00:00.000' AS DateTime), N'pending', CAST(N'2023-09-23T12:45:00.000' AS DateTime))
INSERT [dbo].[tbl_order] ([id], [CId], [PId], [UId], [Quality], [Total], [Add_Date], [Status], [Order_Date]) VALUES (2, 10, 123, N'imayushsri7@gmail.com', 1, 15, CAST(N'2023-09-23T12:47:00.000' AS DateTime), N'pending', CAST(N'2023-09-23T12:47:00.000' AS DateTime))
INSERT [dbo].[tbl_order] ([id], [CId], [PId], [UId], [Quality], [Total], [Add_Date], [Status], [Order_Date]) VALUES (3, 12, 123, N'imayushsri7@gmail.com', 3, 45, CAST(N'2023-09-23T15:14:00.000' AS DateTime), N'pending', CAST(N'2023-09-24T12:02:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[tbl_order] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_product] ON 

INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (122, 14, 20, N'Amul Milk', N'', N'Amul', 30, 26, N'500ml', N'AmulMilk.jpg', CAST(N'2023-09-21' AS Date))
INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (123, 14, 21, N'Nature Own Bread', N'', N'', 20, 15, N'13g', N'Nature Own Bread.jpg', CAST(N'2023-09-21' AS Date))
INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (124, 16, 25, N'Ashirwaad Atta', N'', N'Ashirwaad', 570, 460, N'10Kg', N'Atta.png', CAST(N'2023-09-23' AS Date))
INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (125, 16, 26, N'Aashirvaad Organic Urad Whole Dal', N'', N'Ashirwaad', 600, 550, N'1kg', N'Ashirvaad dal.jpg', CAST(N'2023-09-23' AS Date))
INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (126, 16, 27, N'Rice', N'', N'', 400, 320, N'10Kg', N'rice.jpg', CAST(N'2023-09-23' AS Date))
INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (127, 15, 23, N'Lays Sizzlin Hot Potato Chips', N'', N'Lays', 20, 20, N'50g', N'lays.jpg', CAST(N'2023-09-23' AS Date))
INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (128, 15, 24, N'Haldiram Namkeen', N'', N'', 20, 18, N'100g', N'namkeen.jpg', CAST(N'2023-09-23' AS Date))
INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (129, 14, 22, N'Egg', N'', N'', 8, 7, N'1pc', N'egg.jpeg', CAST(N'2023-09-23' AS Date))
INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (130, 17, 28, N'MDH Chana Masala', N'', N'MDH', 300, 230, N'100g', N'MDH Chana Masala.jpg', CAST(N'2023-09-23' AS Date))
INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (131, 17, 29, N'Fortune Kacchi Ghani Oil', N'', N'Fortune', 600, 550, N'2L', N'fortune oil.jpg', CAST(N'2023-09-23' AS Date))
INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (132, 17, 30, N'Fortune Sun Lite Refined', N'', N'Fortune', 800, 740, N'2L', N'Refiend.jpeg', CAST(N'2023-09-23' AS Date))
INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (133, 16, 25, N'Fortune Chakki Fresh Atta', N'', N'Fortune', 500, 430, N'10kg', N'Fortune Atta.jpeg', CAST(N'2023-09-23' AS Date))
INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (134, 18, 32, N'Gobhi', N'', N'', 60, 55, N'1kg', N'Gobhi.jpg', CAST(N'2023-09-23' AS Date))
INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (135, 18, 32, N'Potato', N'', N'', 25, 20, N'1kg', N'potato.jpg', CAST(N'2023-09-23' AS Date))
INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (137, 20, 34, N'Maggi', N'', N'Nestlé', 14, 14, N'100g', N'noodles.jpeg', CAST(N'2023-09-24' AS Date))
INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (138, 20, 34, N'Yipee', N'', N'', 20, 20, N'100g', N'yipee.jpg', CAST(N'2023-09-24' AS Date))
INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (139, 18, 31, N'Potato', N'', N'', 25, 20, N'1kg', N'potato.jpg', CAST(N'2023-09-24' AS Date))
INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (140, 19, 32, N'Mango', N'', N'', 80, 65, N'1kg', N'mango.jpeg', CAST(N'2023-09-24' AS Date))
INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (141, 19, 33, N'Kaju', N'', N'', 1500, 900, N'1kg', N'kaju.jpg', CAST(N'2023-09-24' AS Date))
INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (142, 21, 35, N'Coca Cola', N'', N'Coca Cola', 100, 95, N'1L', N'new-product-500x500.jpg', CAST(N'2023-09-24' AS Date))
INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (143, 21, 35, N'Thums Up', N'', N'Coca Cola', 95, 85, N'1L', N'thumsUp.jpeg', CAST(N'2023-09-24' AS Date))
INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (144, 19, 32, N'Lichhi', N'', N'', 60, 55, N'1kg', N'lichies.png', CAST(N'2023-09-24' AS Date))
INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (145, 19, 32, N'Santara', N'', N'', 120, 110, N'1kg', N'santara.jpg', CAST(N'2023-09-24' AS Date))
INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (146, 19, 31, N'Pine Apple', N'', N'', 50, 45, N'1kg', N'pineapple.png', CAST(N'2023-09-24' AS Date))
INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (147, 17, 36, N'Tata Salt', N'', N'Tata', 30, 28, N'1kg', N'Tata Salt.jpeg', CAST(N'2023-09-24' AS Date))
INSERT [dbo].[tbl_product] ([PId], [CId], [SubCId], [Title], [Description], [Model], [MRP], [SaleRate], [Pack], [Pic], [AddDate]) VALUES (148, 17, 36, N'Tata Salt Plus', N'', N'Tata', 45, 40, N'1kg', N'tata salt plus.jpeg', CAST(N'2023-09-24' AS Date))
SET IDENTITY_INSERT [dbo].[tbl_product] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_subcategory] ON 

INSERT [dbo].[tbl_subcategory] ([SId], [CId], [SubCatName], [SubCatPic]) VALUES (20, 14, N'Dairy', N'AmulMilk.jpg')
INSERT [dbo].[tbl_subcategory] ([SId], [CId], [SubCatName], [SubCatPic]) VALUES (21, 14, N'Bread', N'bread.jpeg')
INSERT [dbo].[tbl_subcategory] ([SId], [CId], [SubCatName], [SubCatPic]) VALUES (22, 14, N'Eggs', N'egg.jpeg')
INSERT [dbo].[tbl_subcategory] ([SId], [CId], [SubCatName], [SubCatPic]) VALUES (23, 15, N'Chips', N'chips.jpeg')
INSERT [dbo].[tbl_subcategory] ([SId], [CId], [SubCatName], [SubCatPic]) VALUES (24, 15, N'Namkeen', N'namkeen.jpg')
INSERT [dbo].[tbl_subcategory] ([SId], [CId], [SubCatName], [SubCatPic]) VALUES (25, 16, N'Atta', N'Atta.png')
INSERT [dbo].[tbl_subcategory] ([SId], [CId], [SubCatName], [SubCatPic]) VALUES (26, 16, N'Dal', N'dal.jpeg')
INSERT [dbo].[tbl_subcategory] ([SId], [CId], [SubCatName], [SubCatPic]) VALUES (27, 16, N'Rice', N'rice.jpg')
INSERT [dbo].[tbl_subcategory] ([SId], [CId], [SubCatName], [SubCatPic]) VALUES (28, 17, N'Masala', N'Masala.jpg')
INSERT [dbo].[tbl_subcategory] ([SId], [CId], [SubCatName], [SubCatPic]) VALUES (29, 17, N'Oil', N'fortune oil.jpg')
INSERT [dbo].[tbl_subcategory] ([SId], [CId], [SubCatName], [SubCatPic]) VALUES (30, 17, N'Refiend', N'Refiend.jpeg')
INSERT [dbo].[tbl_subcategory] ([SId], [CId], [SubCatName], [SubCatPic]) VALUES (31, 18, N'Fresh', N'vegitables.png')
INSERT [dbo].[tbl_subcategory] ([SId], [CId], [SubCatName], [SubCatPic]) VALUES (32, 19, N'Fresh', N'fruits.png')
INSERT [dbo].[tbl_subcategory] ([SId], [CId], [SubCatName], [SubCatPic]) VALUES (33, 19, N'Dry', N'dry fruit.jpg')
INSERT [dbo].[tbl_subcategory] ([SId], [CId], [SubCatName], [SubCatPic]) VALUES (34, 20, N'Noodles', N'noodles.jpeg')
INSERT [dbo].[tbl_subcategory] ([SId], [CId], [SubCatName], [SubCatPic]) VALUES (35, 21, N'Soft Drink', N'colddrink.png')
INSERT [dbo].[tbl_subcategory] ([SId], [CId], [SubCatName], [SubCatPic]) VALUES (36, 17, N'Salt', N'Tata Salt.jpeg')
SET IDENTITY_INSERT [dbo].[tbl_subcategory] OFF
GO
INSERT [dbo].[tbl_user] ([Name], [Email], [MobNo], [Password], [Address], [Landmark], [PinCode], [AddDate]) VALUES (N'Ayush Srivastava', N'ayushsri9666@gmail.com', 235423, N'1324325', N'Kushinagar Up', N'asdf', 274306, CAST(N'2023-09-16' AS Date))
INSERT [dbo].[tbl_user] ([Name], [Email], [MobNo], [Password], [Address], [Landmark], [PinCode], [AddDate]) VALUES (N'Ayush Srivastava', N'imayushsri7@gmail.com', 9559779666, N'123', N'Kushinagar Up', N'aaaaa', 274306, CAST(N'2023-09-20' AS Date))
GO
ALTER TABLE [dbo].[tbl_cart]  WITH CHECK ADD FOREIGN KEY([PId])
REFERENCES [dbo].[tbl_product] ([PId])
GO
ALTER TABLE [dbo].[tbl_cart]  WITH CHECK ADD FOREIGN KEY([UId])
REFERENCES [dbo].[tbl_user] ([Email])
GO
ALTER TABLE [dbo].[tbl_product]  WITH CHECK ADD FOREIGN KEY([SubCId])
REFERENCES [dbo].[tbl_subcategory] ([SId])
GO
ALTER TABLE [dbo].[tbl_product]  WITH CHECK ADD FOREIGN KEY([CId])
REFERENCES [dbo].[tbl_category] ([CId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_subcategory]  WITH CHECK ADD FOREIGN KEY([CId])
REFERENCES [dbo].[tbl_category] ([CId])
ON DELETE CASCADE
GO
