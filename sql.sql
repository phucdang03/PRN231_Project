USE [MangaOnline.V1.Dev]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/22/2023 10:24:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 7/22/2023 10:24:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Id] [uniqueidentifier] NOT NULL,
	[SubId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/22/2023 10:24:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [uniqueidentifier] NOT NULL,
	[SubId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CategoryManga]    Script Date: 7/22/2023 10:24:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoryManga](
	[CategoryId] [uniqueidentifier] NOT NULL,
	[MangaId] [uniqueidentifier] NOT NULL,
	[SubId] [bigint] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SubId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 7/22/2023 10:24:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [uniqueidentifier] NOT NULL,
	[MangaId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[CreatedAt] [datetimeoffset](7) NOT NULL,
	[LikedCount] [int] NOT NULL,
	[DislikedCount] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Comments_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Chapteres]    Script Date: 7/22/2023 10:24:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Chapteres](
	[Id] [uniqueidentifier] NOT NULL,
	[SubId] [bigint] IDENTITY(1,1) NOT NULL,
	[MangaId] [uniqueidentifier] NOT NULL,
	[ChapterNumber] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CreatedAt] [datetimeoffset](7) NOT NULL,
	[Status] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[FilePDF] [nvarchar](max) NULL,
 CONSTRAINT [PK_Chapteres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FollowList]    Script Date: 7/22/2023 10:24:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FollowList](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[MangaId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_FollowList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReadingHistory]    Script Date: 7/22/2023 10:24:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReadingHistory](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[MangaId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ReadingHistory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] 
GO
/****** Object:  Table [dbo].[History]    Script Date: 7/22/2023 10:24:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[Id] [uniqueidentifier] NOT NULL,
	[user] [nvarchar](256) NULL,
	[hash] [nvarchar](256) NULL,
	[from] [nvarchar](256) NULL,
	[to] [nvarchar](256) NULL,
	[value] [nvarchar](256) NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IpUserVote]    Script Date: 7/22/2023 10:24:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IpUserVote](
	[MangaId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[Rate] [int] NULL,
 CONSTRAINT [pk_my_table] PRIMARY KEY CLUSTERED 
(
	[MangaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mangas]    Script Date: 7/22/2023 10:24:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mangas](
	[Id] [uniqueidentifier] NOT NULL,
	[SubId] [bigint] IDENTITY(1,1) NOT NULL,
	[AuthorId] [uniqueidentifier] NOT NULL,
	[Status] [int] NOT NULL,
	[ViewCount] [int] NOT NULL,
	[RateCount] [int] NOT NULL,
	[Star] [int] NOT NULL,
	[FollowCount] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetimeoffset](7) NULL,
	[ModifiedAt] [datetimeoffset](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Mangas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 7/22/2023 10:24:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[Id] [uniqueidentifier] NOT NULL,
	[SubId] [bigint] NOT NULL,
	[Content] [nvarchar](max) NULL,
	[ChapterId] [uniqueidentifier] NOT NULL,
	[Status] [int] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_Notification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 7/22/2023 10:24:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[Id] [uniqueidentifier] NOT NULL,
	[ChapterId] [uniqueidentifier] NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[PageNumber] [int] NOT NULL,
 CONSTRAINT [PK_Pages_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/22/2023 10:24:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[SubId] [bigint] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[CreatedAt] [datetimeoffset](7) NULL,
	[ModifiedAt] [datetimeoffset](7) NULL,
	[IsActive] [bit] NOT NULL,
	[Status] [int] NOT NULL,
	[Avatar] [nvarchar](max) NULL,
	[RoleId] [int] NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTokens]    Script Date: 7/22/2023 10:24:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTokens](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Email] [nvarchar](256) NOT NULL,
	[Expires] [datetime2](7) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([Id], [SubId], [Name]) VALUES (N'b639c10f-b129-4ad4-be07-4eea2842485f', 30, N'Kishimoto Masashi')
INSERT [dbo].[Authors] ([Id], [SubId], [Name]) VALUES (N'76957289-8fcb-4fb6-a42e-5625d3ffc939', 29, N'Eiichiro Oda')
INSERT [dbo].[Authors] ([Id], [SubId], [Name]) VALUES (N'8eae4958-1157-446e-aad3-7737fe6ab669', 27, N'Kimetsu No Yaiba')
INSERT [dbo].[Authors] ([Id], [SubId], [Name]) VALUES (N'2ffc2c49-4725-4e2e-9444-a4746a20faac', 31, N'Akira Toriyama')
INSERT [dbo].[Authors] ([Id], [SubId], [Name]) VALUES (N'bdcea30d-607b-4766-a29c-b35ed73fceeb', 28, N'Đang Cập Nhật')
SET IDENTITY_INSERT [dbo].[Authors] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [SubId], [Name]) VALUES (N'd8c7163c-1e11-48c0-98d4-16b22c812607', 3, N'Ngôn tình')
INSERT [dbo].[Categories] ([Id], [SubId], [Name]) VALUES (N'6accc550-d475-4357-bcb9-17302ed409c4', 4, N'Drama')
INSERT [dbo].[Categories] ([Id], [SubId], [Name]) VALUES (N'fd761c84-897c-4529-aec7-7a8731ef1b90', 5, N'Trinh thám')
INSERT [dbo].[Categories] ([Id], [SubId], [Name]) VALUES (N'385871e9-75b7-4cf9-9eb3-87f31d6e7bae', 6, N'Cổ đại')
INSERT [dbo].[Categories] ([Id], [SubId], [Name]) VALUES (N'2660558e-65c0-4efd-86f8-8b84de4b9ce4', 7, N'Tình cảm')
INSERT [dbo].[Categories] ([Id], [SubId], [Name]) VALUES (N'766a75b4-6942-4b9b-aecb-bbeeaa36a4b0', 8, N'Anime')
INSERT [dbo].[Categories] ([Id], [SubId], [Name]) VALUES (N'83458358-35e2-4845-bddc-c00314040cb0', 9, N'Đam mỹ')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryManga] ON 

INSERT [dbo].[CategoryManga] ([CategoryId], [MangaId], [SubId]) VALUES (N'd8c7163c-1e11-48c0-98d4-16b22c812607', N'c109722c-24a3-4675-81f1-567f4f81bfda', 79)
INSERT [dbo].[CategoryManga] ([CategoryId], [MangaId], [SubId]) VALUES (N'6accc550-d475-4357-bcb9-17302ed409c4', N'c109722c-24a3-4675-81f1-567f4f81bfda', 80)
INSERT [dbo].[CategoryManga] ([CategoryId], [MangaId], [SubId]) VALUES (N'fd761c84-897c-4529-aec7-7a8731ef1b90', N'7ee8b0a7-6c61-4988-8270-616c6479b76a', 81)
INSERT [dbo].[CategoryManga] ([CategoryId], [MangaId], [SubId]) VALUES (N'385871e9-75b7-4cf9-9eb3-87f31d6e7bae', N'7ee8b0a7-6c61-4988-8270-616c6479b76a', 82)
INSERT [dbo].[CategoryManga] ([CategoryId], [MangaId], [SubId]) VALUES (N'2660558e-65c0-4efd-86f8-8b84de4b9ce4', N'7ee8b0a7-6c61-4988-8270-616c6479b76a', 83)
INSERT [dbo].[CategoryManga] ([CategoryId], [MangaId], [SubId]) VALUES (N'385871e9-75b7-4cf9-9eb3-87f31d6e7bae', N'f27e7c70-a2ac-48e8-b612-5c0ac99313dc', 84)
INSERT [dbo].[CategoryManga] ([CategoryId], [MangaId], [SubId]) VALUES (N'2660558e-65c0-4efd-86f8-8b84de4b9ce4', N'f27e7c70-a2ac-48e8-b612-5c0ac99313dc', 85)
INSERT [dbo].[CategoryManga] ([CategoryId], [MangaId], [SubId]) VALUES (N'766a75b4-6942-4b9b-aecb-bbeeaa36a4b0', N'f27e7c70-a2ac-48e8-b612-5c0ac99313dc', 86)
INSERT [dbo].[CategoryManga] ([CategoryId], [MangaId], [SubId]) VALUES (N'385871e9-75b7-4cf9-9eb3-87f31d6e7bae', N'1a71dc04-e0e2-495f-a878-63ccce412641', 87)
INSERT [dbo].[CategoryManga] ([CategoryId], [MangaId], [SubId]) VALUES (N'766a75b4-6942-4b9b-aecb-bbeeaa36a4b0', N'1a71dc04-e0e2-495f-a878-63ccce412641', 88)
INSERT [dbo].[CategoryManga] ([CategoryId], [MangaId], [SubId]) VALUES (N'766a75b4-6942-4b9b-aecb-bbeeaa36a4b0', N'467da999-9011-4f90-b9fb-488110c37879', 89)
SET IDENTITY_INSERT [dbo].[CategoryManga] OFF
GO
INSERT [dbo].[Comments] ([Id], [MangaId], [UserId], [Content], [CreatedAt], [LikedCount], [DislikedCount], [IsActive]) VALUES (N'b73e937d-7b08-4626-a9a8-64cbca6e2b0c', N'467da999-9011-4f90-b9fb-488110c37879', N'2164d540-49ca-45ac-b88e-f7001b82ff66', N'fff', CAST(N'2023-07-22T22:17:43.3718305+07:00' AS DateTimeOffset), 0, 0, 1)
GO
SET IDENTITY_INSERT [dbo].[Chapteres] ON 

INSERT [dbo].[Chapteres] ([Id], [SubId], [MangaId], [ChapterNumber], [Name], [CreatedAt], [Status], [IsActive], [FilePDF]) VALUES (N'e73a7220-705c-4c60-bd67-127475ae394d', 32, N'467da999-9011-4f90-b9fb-488110c37879', 2, N' Chapter 2', CAST(N'2023-07-22T22:16:57.2812426+07:00' AS DateTimeOffset), 2, 1, N'30d3c761-c9df-443c-b527-74fbe17df44d.pdf')
INSERT [dbo].[Chapteres] ([Id], [SubId], [MangaId], [ChapterNumber], [Name], [CreatedAt], [Status], [IsActive], [FilePDF]) VALUES (N'bb8a4ccf-aaa9-4fda-9c7c-c1f23e9e1770', 31, N'467da999-9011-4f90-b9fb-488110c37879', 1, N' Chapter 1', CAST(N'2023-07-22T22:14:05.6963198+07:00' AS DateTimeOffset), 1, 1, N'dafa7191-5ec8-4add-9967-793527f23fed.pdf')
SET IDENTITY_INSERT [dbo].[Chapteres] OFF
GO
SET IDENTITY_INSERT [dbo].[Mangas] ON 

INSERT [dbo].[Mangas] ([Id], [SubId], [AuthorId], [Status], [ViewCount], [RateCount], [Star], [FollowCount], [Description], [CreatedAt], [ModifiedAt], [IsActive], [Image], [Name]) VALUES (N'467da999-9011-4f90-b9fb-488110c37879', 31, N'2ffc2c49-4725-4e2e-9444-a4746a20faac', 1, 16, 0, 0, 0, N'Câu truyện kể về một cậu bé tên Songoku cùng nhóm bạn của mình tham gia những chuyến phiêu lưu tìm ngọc rồng, chống lại cái ác bảo vệ trái đất. Nhân vật Songoku được mọi người ưa thích bởi tính thánh thiện và ngây ngô của mình. Câu truyện lôi cuốn người qua những tình huống phiêu lưu kì thú, những pha đấu võ đẹp mắt, và những tình huống hài hước. Dragon ball là bộ truyện tranh thuộc nhóm nổi tiếng nhất thế giới, được rất nhiều bạn trẻ ưa thích.', CAST(N'1999-01-01T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2023-07-22T22:04:49.2161270+07:00' AS DateTimeOffset), 1, N'937dcf5e-98fd-4d14-b2a2-7178c526552e.jpg', N'7 Viên Ngọc Rồng')
INSERT [dbo].[Mangas] ([Id], [SubId], [AuthorId], [Status], [ViewCount], [RateCount], [Star], [FollowCount], [Description], [CreatedAt], [ModifiedAt], [IsActive], [Image], [Name]) VALUES (N'c109722c-24a3-4675-81f1-567f4f81bfda', 27, N'8eae4958-1157-446e-aad3-7737fe6ab669', 2, 0, 0, 0, 0, N'Kimetsu no Yaiba – Tanjirou là con cả của gia đình vừa mất cha. Một ngày nọ, Tanjirou đến thăm thị trấn khác để bán than, khi đêm về cậu ở nghỉ tại nhà người khác thay vì về nhà vì lời đồn thổi về ác quỷ luôn rình mò gần núi vào buổi tối. Khi cậu về nhà vào ngày hôm sau, bị kịch đang đợi chờ cậu…', CAST(N'2020-01-01T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2023-07-22T21:59:23.9324700+07:00' AS DateTimeOffset), 1, N'3a84a426-1e7a-485a-b3bb-862971a55510.jpg', N'Onepunch Man Ngôn tình Đam mỹ 3  20 Chương 1 DORAB')
INSERT [dbo].[Mangas] ([Id], [SubId], [AuthorId], [Status], [ViewCount], [RateCount], [Star], [FollowCount], [Description], [CreatedAt], [ModifiedAt], [IsActive], [Image], [Name]) VALUES (N'f27e7c70-a2ac-48e8-b612-5c0ac99313dc', 29, N'76957289-8fcb-4fb6-a42e-5625d3ffc939', 1, 0, 0, 0, 0, N'One Piece là câu truyện kể về Luffy và các thuyền viên của mình. Khi còn nhỏ, Luffy ước mơ trở thành Vua Hải Tặc. Cuộc sống của cậu bé thay đổi khi cậu vô tình có được sức mạnh có thể co dãn như cao su, nhưng đổi lại, cậu không bao giờ có thể bơi được nữa. Giờ đây, Luffy cùng những người bạn hải tặc của mình ra khơi tìm kiếm kho báu One Piece, kho báu vĩ đại nhất trên thế giới. Trong One Piece, mỗi nhân vật trong đều mang một nét cá tính đặc sắc kết hợp cùng các tình huống kịch tính, lối dẫn truyện hấp dẫn chứa đầy các bước ngoặt bất ngờ và cũng', CAST(N'2000-01-01T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2023-07-22T22:02:21.0403353+07:00' AS DateTimeOffset), 1, N'4b2401ef-f78e-4023-a1f5-1310aae16ab1.jpg', N'ONE PIECE')
INSERT [dbo].[Mangas] ([Id], [SubId], [AuthorId], [Status], [ViewCount], [RateCount], [Star], [FollowCount], [Description], [CreatedAt], [ModifiedAt], [IsActive], [Image], [Name]) VALUES (N'7ee8b0a7-6c61-4988-8270-616c6479b76a', 28, N'bdcea30d-607b-4766-a29c-b35ed73fceeb', 2, 0, 0, 0, 0, N'Ta độ được 999 lần thiên kiếp Chân Hà Đồ, một du khách đến từ thế giới khác. Sau 10 năm tu luyện vẫn chỉ ở Luyện Khí kỳ (8585520/????), không biết bao giờ mới đột phá. Thiên kiếp lần 999, với người tu luyện ai nấy cũng sợ. Cho đến khi sư muội của hắn dẫn đến thì phát hiện ra... hắn thật sự rất mạnh', CAST(N'2021-01-01T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2023-07-22T22:01:18.9331192+07:00' AS DateTimeOffset), 1, N'e067003d-353e-4b47-9de7-003cdd379c97.jpg', N'TA ĐỘ 999 LẦN THIÊN KIẾP')
INSERT [dbo].[Mangas] ([Id], [SubId], [AuthorId], [Status], [ViewCount], [RateCount], [Star], [FollowCount], [Description], [CreatedAt], [ModifiedAt], [IsActive], [Image], [Name]) VALUES (N'1a71dc04-e0e2-495f-a878-63ccce412641', 30, N'b639c10f-b129-4ad4-be07-4eea2842485f', 1, 0, 0, 0, 0, N'Bối cảnh Naruto xảy ra vào mười hai năm trước khi câu chuyện chính thức bắt đầu, một con hồ ly chín đuôi đã tấn công Konohagakure. Nó là một con quái vật có sức mạnh khủng khiếp, chỉ một cái vẫy từ một trong chín cái đuôi của nó có thể tạo ra những cơn sóng thần và san bằng nhiều ngọn núi. Nó gây ra sự hỗn loạn và giết chết rất nhiều người cho đến khi người đứng đầu làng Lá – Hokage đệ tứ – đã đánh bại nó bằng cách đổi lấy mạng sống của mình để phong ấn nó vào trong người một đứa trẻ mới sinh. Đứa trẻ đó tên là Uzumaki Naruto. Bộ truyện kể về cuộc hành trình đầy gian khổ với vô vàn khó khăn, thử thách của Naruto từ khi còn là một cậu bé tới khi trở thành một trong những nhẫn giả vĩ đại nhất. Không chỉ mô tả về một thế giới nhẫn giả huyền bí, Naruto còn mang trong nó nhiều ý nghĩa nhân sinh sâu sắc về tình bạn, tình đồng đội, tình yêu, ước mơ và hi vọng.
', CAST(N'2001-01-01T00:00:00.0000000+00:00' AS DateTimeOffset), CAST(N'2023-07-22T22:03:25.8475177+07:00' AS DateTimeOffset), 1, N'2db45caa-730f-444a-94ca-cac668939fba.jpg', N'Naruto')
SET IDENTITY_INSERT [dbo].[Mangas] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [SubId], [FullName], [Email], [EmailConfirmed], [Password], [PhoneNumber], [PhoneNumberConfirmed], [AccessFailedCount], [CreatedAt], [ModifiedAt], [IsActive], [Status], [Avatar], [RoleId]) VALUES (N'2ef75afd-96e6-4b60-8c11-2f79849cf703', 14, N'Van Trai Chu', N'lsb45230@zslsz.com', 1, N'$2a$10$uXPEMwv6wA0Ev61TeaD25.CaPsvcNSRroS1RWAl6RqwA.UYwb6Im6', N'0362351671', 1, 0, CAST(N'2023-07-21T16:12:50.7350663+07:00' AS DateTimeOffset), CAST(N'2023-07-21T16:13:12.9354063+07:00' AS DateTimeOffset), 1, 0, N'8f49658d-8f6e-47b5-9982-51ed49bc21ea.png', 2)
INSERT [dbo].[Users] ([Id], [SubId], [FullName], [Email], [EmailConfirmed], [Password], [PhoneNumber], [PhoneNumberConfirmed], [AccessFailedCount], [CreatedAt], [ModifiedAt], [IsActive], [Status], [Avatar], [RoleId]) VALUES (N'fd9f24c7-4000-4383-b223-6dc525337192', 13, N'123 1234 456', N'gqf85455@nezid.com', 1, N'$2a$10$.9qj6qzj6V/OdU4F8ez7IOZBm8GqEuyQEsVupQ24bvNnTAvD3bU8S', N'0213456789', 1, 0, CAST(N'2023-07-19T17:05:55.4223665+07:00' AS DateTimeOffset), CAST(N'2023-07-19T17:06:24.9506041+07:00' AS DateTimeOffset), 1, 0, NULL, 3)
INSERT [dbo].[Users] ([Id], [SubId], [FullName], [Email], [EmailConfirmed], [Password], [PhoneNumber], [PhoneNumberConfirmed], [AccessFailedCount], [CreatedAt], [ModifiedAt], [IsActive], [Status], [Avatar], [RoleId]) VALUES (N'ef20386b-2335-4f65-87b2-819e1aef6612', 2, N'traicv', N'enm55606@nezid.com', 1, N'$2a$10$wFJohcnCB4WbPREwYvSHiumPdowhVcu4EB4.ZJAUOhf6Vu2YQif0m', N'1234567890', 1, 0, CAST(N'2023-06-14T15:22:56.1352367+07:00' AS DateTimeOffset), CAST(N'2023-06-14T16:07:04.0387130+07:00' AS DateTimeOffset), 1, 0, NULL, 2)
INSERT [dbo].[Users] ([Id], [SubId], [FullName], [Email], [EmailConfirmed], [Password], [PhoneNumber], [PhoneNumberConfirmed], [AccessFailedCount], [CreatedAt], [ModifiedAt], [IsActive], [Status], [Avatar], [RoleId]) VALUES (N'2164d540-49ca-45ac-b88e-f7001b82ff66', 3, N'traicv', N'djn74003@zslsz.com', 1, N'$2a$10$QQeP/bGJWW0WVg7mG2UQXOATionGp2X8vF8pr4OC1v7YsxROQSNrW', N'1234567890', 1, 0, CAST(N'2023-06-14T15:46:27.3331169+07:00' AS DateTimeOffset), CAST(N'2023-06-14T15:46:27.3332403+07:00' AS DateTimeOffset), 1, 0, NULL, 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [dbo].[UserTokens] ([Id], [UserId], [Email], [Expires], [Value]) VALUES (N'acf4bd30-60cd-450a-a272-6300e9d2419c', N'2ef75afd-96e6-4b60-8c11-2f79849cf703', N'lsb45230@zslsz.com', CAST(N'2023-08-20T09:12:50.7354900' AS DateTime2), N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyZWY3NWFmZC05NmU2LTRiNjAtOGMxMS0yZjc5ODQ5Y2Y3MDMiLCJ1c2VybmFtZSI6IlZhbiBUcmFpIENodSIsImVtYWlsIjoibHNiNDUyMzBAenNsc3ouY29tIiwicm9sZSI6IlVzZXJOb3JtYWwiLCJpcEFkZHJlc3MiOiIxMTcuNS4yMTIuOTQiLCJleHAiOjE2OTI2MjgwMDUsImlzcyI6Im1hbmdhb25saW5lIiwiYXVkIjoibWFuZ2FvbmxpbmUifQ.keyAk-BERcKFj8rkyWPopo9gWqKI5jK7cl4gsawF05w')
INSERT [dbo].[UserTokens] ([Id], [UserId], [Email], [Expires], [Value]) VALUES (N'b07b67a5-1d17-498b-992d-66f5e15a2d99', N'fd9f24c7-4000-4383-b223-6dc525337192', N'gqf85455@nezid.com', CAST(N'2023-08-18T10:05:55.4227190' AS DateTime2), N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJmZDlmMjRjNy00MDAwLTQzODMtYjIyMy02ZGM1MjUzMzcxOTIiLCJ1c2VybmFtZSI6IjEyMyAxMjM0IDQ1NiIsImVtYWlsIjoiZ3FmODU0NTVAbmV6aWQuY29tIiwicm9sZSI6IlVzZXJWaXAiLCJpcEFkZHJlc3MiOiIxMTcuNS4yMTIuOTQiLCJleHAiOjE2OTI2MTcyNDQsImlzcyI6Im1hbmdhb25saW5lIiwiYXVkIjoibWFuZ2FvbmxpbmUifQ.TfIpZx6NJM7DNEe3jCqnE4GTEtg6ksUhJtFBGOvoi7k')
INSERT [dbo].[UserTokens] ([Id], [UserId], [Email], [Expires], [Value]) VALUES (N'2382737a-946c-4ab1-afb0-9f82725918db', N'ef20386b-2335-4f65-87b2-819e1aef6612', N'enm55606@nezid.com', CAST(N'2024-07-14T08:22:56.1360013' AS DateTime2), N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJlZjIwMzg2Yi0yMzM1LTRmNjUtODdiMi04MTllMWFlZjY2MTIiLCJ1c2VybmFtZSI6InRyYWljdiIsImVtYWlsIjoiZW5tNTU2MDZAbmV6aWQuY29tIiwicm9sZSI6IlVzZXJOb3JtYWwiLCJpcEFkZHJlc3MiOiIxMTcuNS4yMTIuOTQiLCJleHAiOjE2OTI2MTcxOTAsImlzcyI6Im1hbmdhb25saW5lIiwiYXVkIjoibWFuZ2FvbmxpbmUifQ.RHrg7vSqLy-mOl4mA5Y7Ge_yAyI25OqpvPvZYAV_K_I')
INSERT [dbo].[UserTokens] ([Id], [UserId], [Email], [Expires], [Value]) VALUES (N'6f72cd6d-bc69-4b90-9afe-afe28d8eef0c', N'2164d540-49ca-45ac-b88e-f7001b82ff66', N'djn74003@zslsz.com', CAST(N'2024-08-02T07:32:45.8984768' AS DateTime2), N'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIyMTY0ZDU0MC00OWNhLTQ1YWMtYjg4ZS1mNzAwMWI4MmZmNjYiLCJ1c2VybmFtZSI6InRyYWljdiIsImVtYWlsIjoiZGpuNzQwMDNAenNsc3ouY29tIiwicm9sZSI6IkFkbWluIiwiaXBBZGRyZXNzIjoiMTE3LjUuMjEyLjk0IiwiZXhwIjoxNjkyNjMwNTk1LCJpc3MiOiJtYW5nYW9ubGluZSIsImF1ZCI6Im1hbmdhb25saW5lIn0.NZv-Wax78kByn-1LniK-MaE09V4dDqeibbID2Vv3crk')
GO
ALTER TABLE [dbo].[CategoryManga]  WITH CHECK ADD  CONSTRAINT [FK_CategoryManga_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[CategoryManga] CHECK CONSTRAINT [FK_CategoryManga_Categories]
GO
ALTER TABLE [dbo].[CategoryManga]  WITH CHECK ADD  CONSTRAINT [FK_CategoryManga_Mangas] FOREIGN KEY([MangaId])
REFERENCES [dbo].[Mangas] ([Id])
GO
ALTER TABLE [dbo].[CategoryManga] CHECK CONSTRAINT [FK_CategoryManga_Mangas]
GO
ALTER TABLE [dbo].[ReadingHistory]  WITH CHECK ADD  CONSTRAINT [FK_ReadingHistory_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[ReadingHistory]  WITH CHECK ADD  CONSTRAINT [FK_ReadingHistory_Mangas] FOREIGN KEY([MangaId])
REFERENCES [dbo].[Mangas] ([Id])
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Mangas] FOREIGN KEY([MangaId])
REFERENCES [dbo].[Mangas] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Mangas]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users]
GO
ALTER TABLE [dbo].[Chapteres]  WITH CHECK ADD  CONSTRAINT [FK_Chapteres_Mangas] FOREIGN KEY([MangaId])
REFERENCES [dbo].[Mangas] ([Id])
GO
ALTER TABLE [dbo].[Chapteres] CHECK CONSTRAINT [FK_Chapteres_Mangas]
GO
ALTER TABLE [dbo].[FollowList]  WITH CHECK ADD  CONSTRAINT [FK_FollowList_Mangas] FOREIGN KEY([MangaId])
REFERENCES [dbo].[Mangas] ([Id])
GO
ALTER TABLE [dbo].[FollowList] CHECK CONSTRAINT [FK_FollowList_Mangas]
GO
ALTER TABLE [dbo].[FollowList]  WITH CHECK ADD  CONSTRAINT [FK_FollowList_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[FollowList] CHECK CONSTRAINT [FK_FollowList_Users]
GO
ALTER TABLE [dbo].[Mangas]  WITH CHECK ADD  CONSTRAINT [FK_Mangas_Authors] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Authors] ([Id])
GO
ALTER TABLE [dbo].[Mangas] CHECK CONSTRAINT [FK_Mangas_Authors]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notification_Chapteres] FOREIGN KEY([ChapterId])
REFERENCES [dbo].[Chapteres] ([Id])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notification_Chapteres]
GO
ALTER TABLE [dbo].[Pages]  WITH CHECK ADD  CONSTRAINT [FK_Pages_Chapteres] FOREIGN KEY([ChapterId])
REFERENCES [dbo].[Chapteres] ([Id])
GO
ALTER TABLE [dbo].[Pages] CHECK CONSTRAINT [FK_Pages_Chapteres]
GO
ALTER TABLE [dbo].[UserTokens]  WITH CHECK ADD  CONSTRAINT [FK_UserTokens_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserTokens] CHECK CONSTRAINT [FK_UserTokens_Users]
GO
