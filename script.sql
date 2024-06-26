USE [MusicTicketDB]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 23/04/2024 5:24:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[bill_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[buyDate] [date] NULL,
	[price_total] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill_detail]    Script Date: 23/04/2024 5:24:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill_detail](
	[bdetail_id] [int] IDENTITY(1,1) NOT NULL,
	[unitPrice] [money] NULL,
	[bill_id] [int] NULL,
	[product_id] [varchar](100) NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[bdetail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 23/04/2024 5:24:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[category_id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[category_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 23/04/2024 5:24:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[product_id] [varchar](100) NOT NULL,
	[category_id] [int] NOT NULL,
	[product_name] [nvarchar](255) NOT NULL,
	[img] [nvarchar](255) NULL,
	[ticket_type] [int] NULL,
	[discription] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_detail]    Script Date: 23/04/2024 5:24:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_detail](
	[detailid] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [varchar](100) NULL,
	[detail_discription] [nvarchar](255) NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[detailid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_image]    Script Date: 23/04/2024 5:24:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_image](
	[img_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [varchar](100) NULL,
	[detail_img] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[img_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_ticketDetail]    Script Date: 23/04/2024 5:24:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_ticketDetail](
	[detail_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [varchar](100) NULL,
	[price] [int] NULL,
	[quantity] [int] NULL,
	[ticket_type] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[detail_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ticket]    Script Date: 23/04/2024 5:24:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ticket](
	[ticket_type] [int] NOT NULL,
	[ticket_name] [varchar](255) NULL,
	[ticket_price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ticket_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 23/04/2024 5:24:06 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](200) NULL,
	[user_email] [varchar](255) NULL,
	[user_pass] [nvarchar](255) NULL,
	[isSeller] [int] NULL,
	[isAdmin] [int] NULL,
	[Address] [varchar](255) NULL,
	[phone] [int] NULL,
	[avatar] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Bill] ON 

INSERT [dbo].[Bill] ([bill_id], [user_id], [buyDate], [price_total]) VALUES (1, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Bill] OFF
GO
INSERT [dbo].[Category] ([category_id], [name]) VALUES (1, N'Concerts')
INSERT [dbo].[Category] ([category_id], [name]) VALUES (2, N'Festivals')
INSERT [dbo].[Category] ([category_id], [name]) VALUES (3, N'Special Events')
INSERT [dbo].[Category] ([category_id], [name]) VALUES (4, N'Music Festivals')
GO
INSERT [dbo].[Product] ([product_id], [category_id], [product_name], [img], [ticket_type], [discription]) VALUES (N'CON001', 1, N'Nhung Thanh Pho Mo Mang', N'img/8-scaled.jpg', 1, N' Thanh pho cua nhung ke khong ngu')
INSERT [dbo].[Product] ([product_id], [category_id], [product_name], [img], [ticket_type], [discription]) VALUES (N'CON002', 1, N'Eras Tour', N'img/erastour.jpg', 1, N'Classic world tour of TayLor Swift')
INSERT [dbo].[Product] ([product_id], [category_id], [product_name], [img], [ticket_type], [discription]) VALUES (N'CON003', 1, N'Rooftop VietNam ConCert ', N'img/rooftop.jpg', 1, N'Rooftop Vietnam Concert, where the stars align with the city skyline for an unforgettable evening of music and magic..')
INSERT [dbo].[Product] ([product_id], [category_id], [product_name], [img], [ticket_type], [discription]) VALUES (N'CON004', 1, N'VietNam Indie Show', N'img/indieshow.jpg', 1, N'Famous Underground singers mini show in Hanoi')
INSERT [dbo].[Product] ([product_id], [category_id], [product_name], [img], [ticket_type], [discription]) VALUES (N'FES001', 2, N'Beck''s Stage-Unexpected Rap Fest', N'img/landscape.jpg', 2, N'Rap Contest Musicial with some famous rapper')
INSERT [dbo].[Product] ([product_id], [category_id], [product_name], [img], [ticket_type], [discription]) VALUES (N'FES002', 2, N'Cinema Under the Stars', N'img/cinema.jpg', 2, N'Watching film under the star')
INSERT [dbo].[Product] ([product_id], [category_id], [product_name], [img], [ticket_type], [discription]) VALUES (N'SPE001', 3, N'Jazz Night', N'img/jazznight.png', 3, N'Night Jazz with famous composer')
INSERT [dbo].[Product] ([product_id], [category_id], [product_name], [img], [ticket_type], [discription]) VALUES (N'SPE002', 3, N'Salsa Fiesta', N'img/salsa.jpeg', 3, N'Mexico Music show the first time in VietNam')
GO
SET IDENTITY_INSERT [dbo].[Product_detail] ON 

INSERT [dbo].[Product_detail] ([detailid], [product_id], [detail_discription], [user_id]) VALUES (1, N'CON002', N'The Eras Tour (cách điệu bằng Taylor Swift | The Eras Tour) là chuyến lưu diễn hòa nhạc thứ sáu của ca sĩ kiêm sáng tác nhạc người Mỹ Taylor Swift.', 2)
INSERT [dbo].[Product_detail] ([detailid], [product_id], [detail_discription], [user_id]) VALUES (6, N'CON001', NULL, 11)
INSERT [dbo].[Product_detail] ([detailid], [product_id], [detail_discription], [user_id]) VALUES (7, N'CON003', NULL, NULL)
INSERT [dbo].[Product_detail] ([detailid], [product_id], [detail_discription], [user_id]) VALUES (8, N'FES001', N'Beck''Stage - Unexpected Rap Fest, ngày hội dành cho những người yêu nhạc Rap, Hip Hop tại Việt Nam với sự tham gia của đông đảo nghệ sỹ, rapper tên tuổi qua các thời kỳ.', 11)
INSERT [dbo].[Product_detail] ([detailid], [product_id], [detail_discription], [user_id]) VALUES (10, N'SPE001', N'Special Mini Concert With Famous Jazz Composers.', NULL)
INSERT [dbo].[Product_detail] ([detailid], [product_id], [detail_discription], [user_id]) VALUES (11, N'SPE002', N'Salsa Fiesta Special Night with lover', NULL)
SET IDENTITY_INSERT [dbo].[Product_detail] OFF
GO
SET IDENTITY_INSERT [dbo].[Product_ticketDetail] ON 

INSERT [dbo].[Product_ticketDetail] ([detail_id], [product_id], [price], [quantity], [ticket_type]) VALUES (1, N'CON001', 800000, 100, 1)
INSERT [dbo].[Product_ticketDetail] ([detail_id], [product_id], [price], [quantity], [ticket_type]) VALUES (2, N'CON001', 800000, 200, 1)
INSERT [dbo].[Product_ticketDetail] ([detail_id], [product_id], [price], [quantity], [ticket_type]) VALUES (3, N'CON001', 800000, 250, 1)
INSERT [dbo].[Product_ticketDetail] ([detail_id], [product_id], [price], [quantity], [ticket_type]) VALUES (4, N'CON002', 1500000, 300, 1)
INSERT [dbo].[Product_ticketDetail] ([detail_id], [product_id], [price], [quantity], [ticket_type]) VALUES (5, N'CON002', 1500000, 450, 2)
INSERT [dbo].[Product_ticketDetail] ([detail_id], [product_id], [price], [quantity], [ticket_type]) VALUES (6, N'CON002', 1500000, 500, 3)
INSERT [dbo].[Product_ticketDetail] ([detail_id], [product_id], [price], [quantity], [ticket_type]) VALUES (7, N'CON003', 1000000, 50, 1)
INSERT [dbo].[Product_ticketDetail] ([detail_id], [product_id], [price], [quantity], [ticket_type]) VALUES (8, N'CON003', 1000000, 30, 1)
INSERT [dbo].[Product_ticketDetail] ([detail_id], [product_id], [price], [quantity], [ticket_type]) VALUES (9, N'CON003', 1000000, 20, 1)
INSERT [dbo].[Product_ticketDetail] ([detail_id], [product_id], [price], [quantity], [ticket_type]) VALUES (10, N'FES001', 250000, 2000, 1)
INSERT [dbo].[Product_ticketDetail] ([detail_id], [product_id], [price], [quantity], [ticket_type]) VALUES (11, N'FES002', 175000, 1000, 2)
INSERT [dbo].[Product_ticketDetail] ([detail_id], [product_id], [price], [quantity], [ticket_type]) VALUES (14, N'FES001', 100000, 2000, 2)
INSERT [dbo].[Product_ticketDetail] ([detail_id], [product_id], [price], [quantity], [ticket_type]) VALUES (15, N'FES002', 80000, 3000, 1)
INSERT [dbo].[Product_ticketDetail] ([detail_id], [product_id], [price], [quantity], [ticket_type]) VALUES (16, N'SPE001', 50000, 200, 2)
INSERT [dbo].[Product_ticketDetail] ([detail_id], [product_id], [price], [quantity], [ticket_type]) VALUES (17, N'SPE002', 75000, 300, 2)
INSERT [dbo].[Product_ticketDetail] ([detail_id], [product_id], [price], [quantity], [ticket_type]) VALUES (18, N'CON004', 100000, 200, 1)
INSERT [dbo].[Product_ticketDetail] ([detail_id], [product_id], [price], [quantity], [ticket_type]) VALUES (19, N'CON004', 75000, 300, 2)
SET IDENTITY_INSERT [dbo].[Product_ticketDetail] OFF
GO
INSERT [dbo].[Ticket] ([ticket_type], [ticket_name], [ticket_price]) VALUES (1, N'Luxury', 2)
INSERT [dbo].[Ticket] ([ticket_type], [ticket_name], [ticket_price]) VALUES (2, N'Standartd', 1.75)
INSERT [dbo].[Ticket] ([ticket_type], [ticket_name], [ticket_price]) VALUES (3, N'Normal', 1.5)
INSERT [dbo].[Ticket] ([ticket_type], [ticket_name], [ticket_price]) VALUES (4, N'Basic', 1)
INSERT [dbo].[Ticket] ([ticket_type], [ticket_name], [ticket_price]) VALUES (5, N'Bussiness', 5)
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [user_name], [user_email], [user_pass], [isSeller], [isAdmin], [Address], [phone], [avatar]) VALUES (1, N'John Doe', N'password123', N'john@example.com', 0, 0, N'San Francisco, United State of America', 987654321, N'img/avatar.png')
INSERT [dbo].[Users] ([user_id], [user_name], [user_email], [user_pass], [isSeller], [isAdmin], [Address], [phone], [avatar]) VALUES (2, N'Admin', N'admin@example.com', N'adminpass', 1, 1, NULL, 98123456, N'img/bear.png')
INSERT [dbo].[Users] ([user_id], [user_name], [user_email], [user_pass], [isSeller], [isAdmin], [Address], [phone], [avatar]) VALUES (11, N'Taylor Swift', N'taylor@example.com', N'taylor123', 1, 0, NULL, 8922222, N'img/avatar.png')
INSERT [dbo].[Users] ([user_id], [user_name], [user_email], [user_pass], [isSeller], [isAdmin], [Address], [phone], [avatar]) VALUES (12, N'anhducokok', N'dpham1874@gmail.com', N'anhduc11', 0, 1, NULL, 99988811, N'img/avatar.png')
INSERT [dbo].[Users] ([user_id], [user_name], [user_email], [user_pass], [isSeller], [isAdmin], [Address], [phone], [avatar]) VALUES (13, N'aloalo', N'anh123@gmail.com', N'anhducok', 0, 0, NULL, 369798003, NULL)
INSERT [dbo].[Users] ([user_id], [user_name], [user_email], [user_pass], [isSeller], [isAdmin], [Address], [phone], [avatar]) VALUES (15, N'Pham Duc ', N'anhducokok@gmail.com', N'123', 0, 0, N'HaNoi, VietNam', NULL, NULL)
INSERT [dbo].[Users] ([user_id], [user_name], [user_email], [user_pass], [isSeller], [isAdmin], [Address], [phone], [avatar]) VALUES (16, N'Tran Dung', N'dung@example.com', N'123', 0, 0, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Bill_detail]  WITH CHECK ADD FOREIGN KEY([bill_id])
REFERENCES [dbo].[Bill] ([bill_id])
GO
ALTER TABLE [dbo].[Bill_detail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([category_id])
REFERENCES [dbo].[Category] ([category_id])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([ticket_type])
REFERENCES [dbo].[Ticket] ([ticket_type])
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD FOREIGN KEY([ticket_type])
REFERENCES [dbo].[Ticket] ([ticket_type])
GO
ALTER TABLE [dbo].[Product_detail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Product_image]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
ALTER TABLE [dbo].[Product_ticketDetail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[Product] ([product_id])
GO
