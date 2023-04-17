USE [master]
GO
/****** Object:  Database [BirdTournament]    Script Date: 3/21/2023 9:16:00 PM ******/
CREATE DATABASE [BirdTournament]
GO
ALTER DATABASE [BirdTournament] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BirdTournament] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BirdTournament] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BirdTournament] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BirdTournament] SET ARITHABORT OFF 
GO
ALTER DATABASE [BirdTournament] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BirdTournament] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BirdTournament] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BirdTournament] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BirdTournament] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BirdTournament] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BirdTournament] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BirdTournament] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BirdTournament] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BirdTournament] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BirdTournament] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BirdTournament] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BirdTournament] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BirdTournament] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BirdTournament] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BirdTournament] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BirdTournament] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BirdTournament] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BirdTournament] SET  MULTI_USER 
GO
ALTER DATABASE [BirdTournament] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BirdTournament] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BirdTournament] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BirdTournament] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BirdTournament] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BirdTournament] SET QUERY_STORE = OFF
GO
USE [BirdTournament]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/21/2023 9:16:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[accountID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[profilePhoto] [nvarchar](50) NULL,
	[phone] [bigint] NOT NULL,
	[role] [int] NOT NULL,
	[accountStatus] [int] NOT NULL,
 CONSTRAINT [PK__Account__F267253E4FE3E1FF] PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Achievement]    Script Date: 3/21/2023 9:16:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Achievement](
	[achievementID] [int] IDENTITY(1,1) NOT NULL,
	[birdID] [int] NOT NULL,
	[description] [nvarchar](50) NULL,
	[medals] [nvarchar](50) NULL,
	[totalScore] [int] NULL,
	[rank] [int] NULL,
 CONSTRAINT [PK__Achievem__9E540466DD827A4B] PRIMARY KEY CLUSTERED 
(
	[achievementID] ASC,
	[birdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bird]    Script Date: 3/21/2023 9:16:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bird](
	[birdID] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NOT NULL,
	[categoriesID] [int] NOT NULL,
	[birdName] [nvarchar](50) NOT NULL,
	[birdPhoto] [nvarchar](50) NOT NULL,
	[height] [nvarchar](50) NULL,
	[weight] [nvarchar](50) NULL,
	[color] [nvarchar](50) NULL,
	[dentification] [nvarchar](50) NOT NULL,
	[birdStatus] [int] NOT NULL,
 CONSTRAINT [PK__Bird__5FCF36E71F2F4DFB] PRIMARY KEY CLUSTERED 
(
	[birdID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BirdCategories]    Script Date: 3/21/2023 9:16:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BirdCategories](
	[categoriesID] [int] IDENTITY(1,1) NOT NULL,
	[categoriesName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[categoriesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 3/21/2023 9:16:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[blogID] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NOT NULL,
	[Body] [text] NOT NULL,
	[Title] [text] NULL,
	[Media] [nvarchar](50) NULL,
	[createTime] [datetime] NOT NULL,
 CONSTRAINT [PK__Blog__FA0AA70D2B6C2879] PRIMARY KEY CLUSTERED 
(
	[blogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Candidates]    Script Date: 3/21/2023 9:16:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Candidates](
	[candidatesID] [int] IDENTITY(1,1) NOT NULL,
	[roundID] [int] NULL,
	[tournamentID] [int] NOT NULL,
	[formID] [int] NOT NULL,
	[score] [int] NULL,
	[result] [nvarchar](50) NULL,
	[candidatesStatus] [int] NOT NULL,
 CONSTRAINT [PK__Candidat__3AA0732AD125FB71] PRIMARY KEY CLUSTERED 
(
	[candidatesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 3/21/2023 9:16:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedbackID] [int] IDENTITY(1,1) NOT NULL,
	[accountID] [int] NOT NULL,
	[tournamentID] [int] NOT NULL,
	[body] [text] NOT NULL,
 CONSTRAINT [PK__Feedback__2613FDC466A5CDDB] PRIMARY KEY CLUSTERED 
(
	[feedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RegistrationForm]    Script Date: 3/21/2023 9:16:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RegistrationForm](
	[formID] [int] IDENTITY(1,1) NOT NULL,
	[tournamentID] [int] NOT NULL,
	[accountID] [int] NOT NULL,
	[birdID] [int] NOT NULL,
	[formStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[formID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Round]    Script Date: 3/21/2023 9:16:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Round](
	[roundID] [int] IDENTITY(1,1) NOT NULL,
	[tournamentID] [int] NOT NULL,
	[roundName] [nvarchar](50) NULL,
	[typeOfRound] [nvarchar](50) NULL,
	[birdPass] [int] NULL,
	[birdAttend] [int] NULL,
	[roundStatus] [int] NOT NULL,
 CONSTRAINT [PK__Round__EA0947358D4158F7] PRIMARY KEY CLUSTERED 
(
	[roundID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tournament]    Script Date: 3/21/2023 9:16:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tournament](
	[tournamentID] [int] IDENTITY(1,1) NOT NULL,
	[categoriesID] [int] NOT NULL,
	[tournamentName] [nvarchar](50) NOT NULL,
	[description] [text] NULL,
	[sponsor] [nvarchar](50) NOT NULL,
	[prize] [nvarchar](100) NULL,
	[minParticipant] [int] NOT NULL,
	[maxParticipant] [int] NOT NULL,
	[dateTime] [datetime] NOT NULL,
	[fee] [nvarchar](50) NOT NULL,
	[location] [nvarchar](50) NOT NULL,
	[image] [nvarchar](50) NULL,
	[tournamentStatus] [int] NOT NULL,
 CONSTRAINT [PK__Tourname__92FBE428C4A14BD2] PRIMARY KEY CLUSTERED 
(
	[tournamentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (1, N'User', N'user@gmail.com', N'1', NULL, 123456789, 0, 0)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (4, N'An', N'an@gmail.com', N'1', N'image/avatar.jpg', 123, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (5, N'Chuong', N'chuong@gmail.com', N'1', N'image/avatar.jpg', 12345678, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (8, N'quoc', N'quoc@gmail.com', N'1', N'image/avatar.jpg', 12345678, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (9, N'Admin', N'admin@gmail.com', N'1', N'image/avatar.jpg', 12345678, 1, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (17, N'John Doe', N'johndoe@example.com', N'1', N'image/avatar.jpg', 123456, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (18, N'Jane Smith', N'janesmith@example.com', N'1', N'image/avatar.jpg', 234567, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (19, N'David Lee', N'davidlee@example.com', N'1', N'image/avatar.jpg', 34567, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (20, N'Michael Johnson', N'michaeljohnson@example.com', N'1', N'image/avatar.jpg', 456, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (21, N'Emily Brown', N'emilybrown@example.com', N'1', N'image/avatar.jpg', 5678, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (22, N'Sarah Jones', N'sarahjones@example.com', N'1', N'image/avatar.jpg', 678, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (23, N'William Davis', N'williamdavis@example.com', N'1', N'image/avatar.jpg', 78901, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (24, N'Sophia Rodriguez', N'sophiarodriguez@example.com', N'1', N'image/avatar.jpg', 890123, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (25, N'James Wilson', N'jameswilson@example.com', N'1', N'image/avatar.jpg', 90123, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (26, N'Isabella Hernandez', N'isabellahernandez@example.com', N'1', N'image/avatar.jpg', 12345, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (27, N'Ethan Moore', N'ethanmoore@example.com', N'1', N'image/avatar.jpg', 23456, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (28, N'Ava Martin', N'avamartin@example.com', N'1', N'image/avatar.jpg', 3456, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (29, N'Oliver Jackson', N'oliverjackson@example.com', N'1', N'image/avatar.jpg', 456789, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (30, N'Mia Lee', N'miale@example.com', N'1', N'image/avatar.jpg', 5455, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (31, N'Daniel Brown', N'danielbrown@example.com', N'1', N'image/avatar.jpg', 6789, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (32, N'Charlotte Johnson', N'charlottejohnson@example.com', N'1', N'image/avatar.jpg', 7890, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (33, N'Logan Davis', N'logandavis@example.com', N'1', N'image/avatar.jpg', 8901, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (34, N'Avery Rodriguez', N'averyrodriguez@example.com', N'1', N'image/avatar.jpg', 9012, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (35, N'Nguyen Van A', N'nguyenvana@example.com', N'1', N'image/avatar.jpg', 123456789, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (36, N'Tran Thi B', N'tranthib@example.com', N'1', N'image/avatar.jpg', 987654321, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (37, N'Le Van C', N'levanc@example.com', N'1', N'image/avatar.jpg', 12344321, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (38, N'Pham Thi D', N'phamthid@example.com', N'1', N'image/avatar.jpg', 654321987, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (39, N'Hoang Van E', N'hoangvane@example.com', N'1', N'image/avatar.jpg', 123456789, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (40, N'Nguyen Thi F', N'nguyenthif@example.com', N'1', N'image/avatar.jpg', 987654321, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (41, N'Tran Van G', N'tranvang@example.com', N'1', N'image/avatar.jpg', 12344321, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (42, N'Le Thi H', N'lethih@example.com', N'1', N'image/avatar.jpg', 654321987, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (43, N'Pham Van I', N'phamvani@example.com', N'11', N'image/avatar.jpg', 123456789, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (44, N'Hoang Thi K', N'hoangthik@example.com', N'1', N'image/avatar.jpg', 987654321, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (45, N'Nguyen Van L', N'nguyenvanl@example.com', N'1', N'image/avatar.jpg', 12344321, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (46, N'Tran Thi M', N'tranthim@example.com', N'1', N'image/avatar.jpg', 654321987, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (47, N'Le Van N', N'levann@example.com', N'1', N'image/avatar.jpg', 123456789, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (48, N'Pham Thi O', N'phamthio@example.com', N'1', N'image/avatar.jpg', 987654321, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (49, N'Hoang Van P', N'hoangvanp@example.com', N'1', N'image/avatar.jpg', 12344321, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (50, N'Nguyen Thi Q', N'nguyenthiq@example.com', N'1', N'image/avatar.jpg', 654321987, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (51, N'Tran Van R', N'tranvanr@example.com', N'1', N'image/avatar.jpg', 123456789, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (52, N'Le Thi S', N'lethis@example.com', N'1', N'image/avatar.jpg', 987654321, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (53, N'Pham Van T', N'phamvant@example.com', N'1', N'image/avatar.jpg', 12344321, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (54, N'Hoang Thi U', N'hoangthiu@example.com', N'1', N'image/avatar.jpg', 654321987, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (55, N'Nguyen Van V', N'nguyenvanv@example.com', N'1', N'image/avatar.jpg', 123456789, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (56, N'Tran Thi X', N'tranthix@example.com', N'1', N'image/avatar.jpg', 987654321, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (57, N'Le Van Y', N'levany@example.com', N'1', N'image/avatar.jpg', 12344321, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (58, N'Emily Mitchell', N'emilymitchell@example.com', N'1', N'image/avatar.jpg', 123456789, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (59, N'Olivia Campbell', N'oliviacampbell@example.com', N'1', N'image/avatar.jpg', 987654321, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (60, N'Ava Gonzalez', N'avagonzalez@example.com', N'1', N'image/avatar.jpg', 654321987, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (61, N'Isabella Rodriguez', N'isabellarodriguez@example.com', N'1', N'image/avatar.jpg', 12344321, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (62, N'Sophia Lee', N'sophialee@example.com', N'1', N'image/avatar.jpg', 654321987, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (63, N'Mia Perez', N'miaperez@example.com', N'1', N'image/avatar.jpg', 123456789, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (64, N'Amelia Wilson', N'ameliawilson@example.com', N'1', N'image/avatar.jpg', 987654321, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (65, N'Harper Anderson', N'harperanderson@example.com', N'1', N'image/avatar.jpg', 12344321, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (66, N'Evelyn Thomas', N'evelynthomas@example.com', N'1', N'image/avatar.jpg', 654321987, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (67, N'Abigail Jackson', N'abigailjackson@example.com', N'1', N'image/avatar.jpg', 123456789, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (68, N'Charlotte White', N'charlottewhite@example.com', N'1', N'image/avatar.jpg', 987654321, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (69, N'Avery Harris', N'averyharris@example.com', N'1', N'image/avatar.jpg', 12344321, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (70, N'Elizabeth Martin', N'elizabethmartin@example.com', N'1', N'image/avatar.jpg', 654321987, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (71, N'Sofia Thompson', N'sofiathompson@example.com', N'1', N'image/avatar.jpg', 123456789, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (72, N'Ella Garcia', N'ellagarcia@example.com', N'1', N'image/avatar.jpg', 987654321, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (73, N'Aria Martinez', N'ariamartinez@example.com', N'1', N'image/avatar.jpg', 12344321, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (74, N'Chloe Davis', N'chloedavis@example.com', N'1', N'image/avatar.jpg', 654321987, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (75, N'Victoria Hernandez', N'victoriahernandez@example.com', N'1', N'image/avatar.jpg', 123456789, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (76, N'Grace Moore', N'gracemoore@example.com', N'1', N'image/avatar.jpg', 987654321, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (77, N'Madison Jackson', N'madisonjackson@example.com', N'1', N'image/avatar.jpg', 12344321, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (78, N'Scarlett Martin', N'scarlettmartin@example.com', N'1', N'image/avatar.jpg', 654321987, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (79, N'Aaliyah Thompson', N'aaliyahthompson@example.com', N'1', N'image/avatar.jpg', 123456789, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (83, N'Lily Adams', N'lilyadams@example.com', N'1', N'image/avatar.jpg', 12344321, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (84, N'Aurora Wright', N'aurorawright@example.com', N'1', N'image/avatar.jpg', 654321987, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (85, N'Hazel Perez', N'hazelperez@example.com', N'1', N'image/avatar.jpg', 123456789, 0, 1)
INSERT [dbo].[Account] ([accountID], [name], [email], [password], [profilePhoto], [phone], [role], [accountStatus]) VALUES (88, N'Demo', N'demo@gmail.com', N'1', N'image/avatar.jpg', 9892382923, 0, 1)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[Achievement] ON 

INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (6, 1, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (7, 2, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (8, 3, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (9, 4, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (10, 5, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (11, 6, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (12, 7, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (13, 8, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (14, 9, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (15, 10, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (16, 11, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (17, 12, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (18, 13, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (19, 14, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (20, 15, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (21, 16, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (22, 17, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (23, 18, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (24, 19, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (25, 20, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (26, 21, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (27, 22, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (28, 23, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (29, 24, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (30, 25, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (31, 26, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (32, 27, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (33, 28, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (34, 29, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (35, 30, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (36, 31, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (37, 32, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (38, 33, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (39, 34, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (40, 35, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (41, 36, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (42, 37, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (43, 38, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (44, 39, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (45, 40, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (46, 41, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (47, 42, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (48, 43, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (49, 44, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (50, 45, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (51, 46, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (52, 47, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (53, 48, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (54, 49, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (55, 50, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (56, 51, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (57, 52, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (58, 53, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
INSERT [dbo].[Achievement] ([achievementID], [birdID], [description], [medals], [totalScore], [rank]) VALUES (59, 54, NULL, N'Top1:0;Top2:0;Top3:0;Top4:0', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Achievement] OFF
SET IDENTITY_INSERT [dbo].[Bird] ON 

INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (1, 1, 1, N'Blue Jay', N'image/bird(1).jpg', N'50', N'50', N'blue', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (2, 9, 1, N'Northern Cardinal', N'image/bird(2).jpg', N'50', N'50', N'red', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (3, 17, 1, N'Bald Eagle', N'image/bird(3).png', N'50', N'50', N'brown', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (4, 18, 1, N'Peregrine Falcon', N'none', N'50', N'50', N'brown', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (5, 19, 1, N'Mallard Duck', N'none', N'50', N'50', N'brown', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (6, 20, 1, N'Wood Duck', N'none', N'50', N'50', N'brown', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (7, 21, 1, N'American Goldfinch', N'50', N'none', N'50', N'yellow', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (8, 22, 1, N'Eastern Bluebird', N'none', N'50', N'50', N'blue', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (9, 23, 1, N'Barn Owl', N'none', N'50', N'50', N'white', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (10, 4, 1, N'Crocodie', N'image/Crocodie.jpg', N'50', N'50', N'black', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (11, 25, 1, N'Ruby-throated Hummingbird', N'none', N'50', N'50', N'green', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (12, 5, 1, N'Lion', N'image/Lion.jpg', N'50', N'50', N'yellow', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (13, 8, 1, N'Tiger', N'image/Tiger.jpg', N'50', N'50', N'white', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (14, 4, 1, N'Berry', N'image/Berry.jpg', N'50', N'50', N'yellow', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (15, 29, 1, N'American Crow', N'none', N'50', N'50', N'black', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (16, 30, 1, N'Common Raven', N'none', N'50', N'50', N'black', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (17, 31, 1, N'Mourning Dove', N'none', N'50', N'50', N'brown', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (18, 32, 1, N'Rock Pigeon', N'none', N'50', N'50', N'gray', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (19, 33, 1, N'Snowy Egret', N'none', N'50', N'50', N'white', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (20, 34, 1, N'Great Blue Heron', N'none', N'50', N'50', N'gray-blue', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (21, 35, 1, N'Osprey', N'none', N'50', N'50', N'brown', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (22, 36, 1, N'Bald Eagle', N'none', N'50', N'50', N'brown', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (23, 37, 1, N'Peregrine Falcon', N'none', N'50', N'50', N'blue-gray', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (24, 38, 1, N'American Kestrel', N'none', N'50', N'50', N'rusty and blue-gray', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (25, 39, 1, N'Northern Flicker', N'none', N'50', N'50', N'brown', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (26, 40, 1, N'Downy Woodpecker', N'none', N'50', N'50', N'black and white', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (27, 41, 1, N'Barn Owl', N'none', N'50', N'50', N'brown', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (28, 42, 1, N'Great Horned Owl', N'none', N'50', N'50', N'brown', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (29, 43, 1, N'Eastern Screech-Owl', N'none', N'50', N'50', N'brown or gray', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (30, 44, 1, N'Barred Owl', N'none', N'50', N'50', N'brown', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (31, 45, 1, N'Ruby-throated Hummingbird', N'none', N'50', N'50', N'green', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (32, 46, 1, N'Belted Kingfisher', N'none', N'50', N'50', N'blue-gray and white', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (33, 47, 1, N'American Robin', N'none', N'50', N'50', N'gray-brown', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (34, 48, 1, N'Eastern Bluebird', N'none', N'50', N'50', N'blue', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (35, 49, 1, N'Black-capped Chickadee', N'none', N'50', N'50', N'black and white', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (36, 50, 1, N'Tufted Titmouse', N'none', N'50', N'50', N'gray', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (37, 51, 1, N'Mourning Dove', N'none', N'50', N'50', N'gray-brown', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (38, 52, 1, N'Rock Pigeon', N'none', N'50', N'50', N'gray', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (39, 53, 1, N'Bald Eagle', N'none', N'50', N'50', N'brown and white', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (40, 54, 1, N'Red-tailed Hawk', N'none', N'50', N'50', N'brown', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (41, 55, 1, N'Ring-necked Pheasant', N'none', N'50', N'50', N'brown and gold', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (42, 56, 1, N'Wild Turkey', N'none', N'50', N'50', N'black and brown', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (43, 57, 1, N'Killdeer', N'none', N'50', N'50', N'brown and white', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (44, 58, 1, N'American Woodcock', N'none', N'50', N'50', N'brown and white', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (45, 59, 1, N'Common Snipe', N'none', N'50', N'50', N'brown and white', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (46, 60, 1, N'Canada Goose', N'none', N'50', N'50', N'brown and white', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (47, 61, 1, N'Mallard Duck', N'none', N'50', N'50', N'brown and green', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (48, 62, 1, N'Hooded Merganser', N'none', N'50', N'50', N'black and white', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (49, 63, 1, N'Common Loon', N'none', N'50', N'50', N'black and white', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (50, 64, 1, N'Great Blue Heron', N'none', N'50', N'50', N'gray and blue', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (51, 24, 1, N'Great Horned Owl', N'none', N'50', N'50', N'brown', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (52, 26, 1, N'Belted Kingfisher', N'none', N'50', N'50', N'blue-gray', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (53, 27, 1, N'Baltimore Oriole', N'none', N'50', N'50', N'orange', N'body', 1)
INSERT [dbo].[Bird] ([birdID], [accountID], [categoriesID], [birdName], [birdPhoto], [height], [weight], [color], [dentification], [birdStatus]) VALUES (54, 28, 1, N'House Finch', N'none', N'50', N'50', N'red', N'body', 1)
SET IDENTITY_INSERT [dbo].[Bird] OFF
SET IDENTITY_INSERT [dbo].[BirdCategories] ON 

INSERT [dbo].[BirdCategories] ([categoriesID], [categoriesName]) VALUES (1, N'Red-whiskered')
INSERT [dbo].[BirdCategories] ([categoriesID], [categoriesName]) VALUES (2, N'Madagascar')
SET IDENTITY_INSERT [dbo].[BirdCategories] OFF
SET IDENTITY_INSERT [dbo].[Blog] ON 

INSERT [dbo].[Blog] ([blogID], [accountID], [Body], [Title], [Media], [createTime]) VALUES (1, 9, N'First, prepare necessary equipment such as bird cages, food, and water.Second, place the bird cage in a warm and safe environment.
Third, provide fresh food and water daily, such as insects, worms, and seeds. Fourth, train the bird to sing by playing songs or imitating other birds, but avoid overtraining. Fifth,regularly clean the bird cage to maintain a healthy living environment for the bird.', N'Tips for raising Red-whiskered Bulbu birds for beginners', N'image/blog(1).jpg', CAST(N'2023-04-02T12:30:00.000' AS DateTime))
INSERT [dbo].[Blog] ([blogID], [accountID], [Body], [Title], [Media], [createTime]) VALUES (3, 9, N'Red-whiskered birds are small birds with amazing singing abilities. They are found throughout Asia, including Vietnam, China, Thailand, Cambodia, Indonesia, and the Philippines. Hwamei birds are about 10-15cm in size, with a variety of colors in their feathers, ranging from brown to black, gray, and white.

One of the notable features of Red-whiskered birds is their incredible singing ability. They can learn and mimic the calls of other bird species in their natural environment. Red-whiskered birds often sing at night or early in the morning, and their calls can be heard up to hundreds of meters away.

Red-whiskeredbirds typically live in forested areas, grasslands, or areas with trees and bushes. They feed on natural food sources such as insects, worms, and small seeds. Red-whiskered birds are one of the bird species that require protection and are threatened by habitat loss, hunting, and attacks by other animals.

If you love birds and want to keep Red-whiskered birds at home, please note that they are a species that requires careful care and needs a spacious living environment to ensure their health and development. With their unique features, Red-whiskered birds are a species that is definitely worth exploring and learning more about.', N'Red-whiskered Bulbul - What You Need to Know About These Wonderful Singing Birds', N'image/blog(2).jpg', CAST(N'2023-03-28T21:00:00.000' AS DateTime))
INSERT [dbo].[Blog] ([blogID], [accountID], [Body], [Title], [Media], [createTime]) VALUES (6, 9, N'Food is an important factor in maintaining the health and growth of pet birds. If you are keeping birds, let''s learn about the essential types of bird food they need.

Seed Food
Seeds are the primary source of nutrition for most bird species, including wheat, sunflower seeds, corn, and peas. Choose high-quality seeds and make sure they are stored properly to avoid mold or bacterial contamination.

Fresh Food
Birds also need vegetables and fruits to supplement their nutrition. They can be chopped or ground into powder to mix with seed food. Some suitable vegetables and fruits for birds include carrots, spinach, red pumpkin, apples, and pineapple.

Protein Food
Omnivorous birds need to supplement protein to maintain health and growth. Suitable protein food for birds includes fish, eggs, insects, worms, and food containing protein.

Drinking Water
Drinking water is an essential factor in maintaining the health of birds. They need to be provided with clean and fresh water to drink. Use water dishes or water bottles to ensure that they always have water throughout the day.

Note that some bird species may have different dietary requirements, so research carefully about the diet of the bird species you are keeping to ensure that they receive adequate essential nutrients.', N'Essential Types of Bird Food - Understanding the Diet of Pet Birds', N'image/blog(3).jpg', CAST(N'2023-04-12T23:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Blog] OFF
SET IDENTITY_INSERT [dbo].[RegistrationForm] ON 

INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (18, 3, 5, 12, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (19, 3, 17, 3, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (20, 3, 18, 4, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (21, 3, 19, 5, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (22, 3, 20, 6, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (23, 3, 21, 7, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (24, 3, 22, 8, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (25, 3, 23, 9, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (27, 3, 24, 51, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (28, 3, 40, 26, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (29, 3, 47, 33, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (31, 3, 48, 34, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (32, 3, 49, 35, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (33, 3, 50, 36, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (34, 3, 51, 37, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (35, 3, 52, 38, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (36, 24, 53, 39, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (37, 24, 54, 40, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (38, 24, 55, 41, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (39, 24, 56, 42, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (41, 24, 57, 43, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (43, 24, 59, 45, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (45, 24, 60, 46, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (46, 24, 61, 47, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (47, 24, 62, 48, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (48, 24, 63, 49, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (49, 24, 64, 50, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (50, 24, 24, 51, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (51, 24, 26, 52, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (52, 24, 27, 53, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (53, 24, 28, 54, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (57, 24, 5, 12, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (58, 24, 17, 3, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (59, 24, 18, 4, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (60, 24, 19, 5, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (61, 24, 21, 7, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (62, 24, 23, 9, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (63, 24, 40, 26, 1)
INSERT [dbo].[RegistrationForm] ([formID], [tournamentID], [accountID], [birdID], [formStatus]) VALUES (64, 24, 47, 33, 1)
SET IDENTITY_INSERT [dbo].[RegistrationForm] OFF
SET IDENTITY_INSERT [dbo].[Tournament] ON 

INSERT [dbo].[Tournament] ([tournamentID], [categoriesID], [tournamentName], [description], [sponsor], [prize], [minParticipant], [maxParticipant], [dateTime], [fee], [location], [image], [tournamentStatus]) VALUES (3, 1, N'SPRING 2023', N'The rounds will depend on the players who participated. The warm-up category that will be harsh compared to the top 4 is Knock Out. When entering the top 4, 4 birds will be graded and ranked by the judges. Join us to find the champion !', N'image/farm.jpg', N'90.000.000', 50, 100, CAST(N'2023-04-23T00:00:00.000' AS DateTime), N'500.000', N'Ha Noi', N'image/HaNoi.jpg', 1)
INSERT [dbo].[Tournament] ([tournamentID], [categoriesID], [tournamentName], [description], [sponsor], [prize], [minParticipant], [maxParticipant], [dateTime], [fee], [location], [image], [tournamentStatus]) VALUES (5, 1, N'FALL 2023', N'The rounds will depend on the players who participated. The warm-up category that will be harsh compared to the top 4 is Knock Out. When entering the top 4, 4 birds will be graded and ranked by the judges. Join us to find the champion !', N'image/Starbucks.jpg', N'25.000.000', 30, 60, CAST(N'2023-04-12T00:00:00.000' AS DateTime), N'300.000', N'HCM', N'image/HCM.jpg', 5)
INSERT [dbo].[Tournament] ([tournamentID], [categoriesID], [tournamentName], [description], [sponsor], [prize], [minParticipant], [maxParticipant], [dateTime], [fee], [location], [image], [tournamentStatus]) VALUES (6, 1, N'SUMMER 2023', N'The rounds will depend on the players who participated. The warm-up category that will be harsh compared to the top 4 is Knock Out. When entering the top 4, 4 birds will be graded and ranked by the judges. Join us to find the champion !', N'image/shark.jpg', N'40.000.000', 45, 70, CAST(N'2023-05-12T00:00:00.000' AS DateTime), N'350.000', N'Da Nang', N'image/DaNang.jpg', 1)
INSERT [dbo].[Tournament] ([tournamentID], [categoriesID], [tournamentName], [description], [sponsor], [prize], [minParticipant], [maxParticipant], [dateTime], [fee], [location], [image], [tournamentStatus]) VALUES (7, 1, N'SEA GAME 2023', N'The rounds will depend on the players who participated. The warm-up category that will be harsh compared to the top 4 is Knock Out. When entering the top 4, 4 birds will be graded and ranked by the judges. Join us to find the champion !', N'image/7up.jpg', N'100.000.000', 50, 150, CAST(N'2022-04-12T00:00:00.000' AS DateTime), N'1.000.000', N'Mong Cai', N'image/MongCai.jpg', 2)
INSERT [dbo].[Tournament] ([tournamentID], [categoriesID], [tournamentName], [description], [sponsor], [prize], [minParticipant], [maxParticipant], [dateTime], [fee], [location], [image], [tournamentStatus]) VALUES (8, 1, N'DISTRICT 2024', N'The rounds will depend on the players who participated. The warm-up category that will be harsh compared to the top 4 is Knock Out. When entering the top 4, 4 birds will be graded and ranked by the judges. Join us to find the champion !', N'image/CoCaCola.png', N'50.000.000', 30, 80, CAST(N'2023-07-12T00:00:00.000' AS DateTime), N'600.000', N'Luong Son Bac', N'image/LuongSonBac.jpg', 3)
INSERT [dbo].[Tournament] ([tournamentID], [categoriesID], [tournamentName], [description], [sponsor], [prize], [minParticipant], [maxParticipant], [dateTime], [fee], [location], [image], [tournamentStatus]) VALUES (10, 1, N'AFF 2023', N'The rounds will depend on the players who participated. The warm-up category that will be harsh compared to the top 4 is Knock Out. When entering the top 4, 4 birds will be graded and ranked by the judges. Join us to find the champion !', N'image/birdline.jpg', N'30.000.000', 30, 70, CAST(N'2023-08-12T00:00:00.000' AS DateTime), N'300.000', N'Ha Noi', N'image/HaNoi(2).jpg', 4)
INSERT [dbo].[Tournament] ([tournamentID], [categoriesID], [tournamentName], [description], [sponsor], [prize], [minParticipant], [maxParticipant], [dateTime], [fee], [location], [image], [tournamentStatus]) VALUES (20, 1, N'North 2023', N'The rounds will depend on the players who participated. The warm-up category that will be harsh compared to the top 4 is Knock Out. When entering the top 4, 4 birds will be graded and ranked by the judges. Join us to find the champion !', N'image/facebook.png', N'50.000.000', 40, 60, CAST(N'2023-10-12T12:30:00.000' AS DateTime), N'200.000', N'Binh Duong La', N'image/BinhDuong.jpg', 3)
INSERT [dbo].[Tournament] ([tournamentID], [categoriesID], [tournamentName], [description], [sponsor], [prize], [minParticipant], [maxParticipant], [dateTime], [fee], [location], [image], [tournamentStatus]) VALUES (24, 1, N'SON DONG 2023', N'The rounds will depend on the players who participated. The warm-up category that will be harsh compared to the top 4 is Knock Out. When entering the top 4, 4 birds will be graded and ranked by the judges. Join us to find the champion !', N'image/womentqueen.png', N'100.000.000', 20, 50, CAST(N'2023-10-21T17:30:00.000' AS DateTime), N'500.000', N'HCM', N'image/SonDongTournament.jpg', 1)
SET IDENTITY_INSERT [dbo].[Tournament] OFF
ALTER TABLE [dbo].[Achievement]  WITH CHECK ADD  CONSTRAINT [FK__Achieveme__birdI__48CFD27E] FOREIGN KEY([birdID])
REFERENCES [dbo].[Bird] ([birdID])
GO
ALTER TABLE [dbo].[Achievement] CHECK CONSTRAINT [FK__Achieveme__birdI__48CFD27E]
GO
ALTER TABLE [dbo].[Bird]  WITH CHECK ADD  CONSTRAINT [FK__Bird__accountID__4F7CD00D] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Bird] CHECK CONSTRAINT [FK__Bird__accountID__4F7CD00D]
GO
ALTER TABLE [dbo].[Bird]  WITH CHECK ADD  CONSTRAINT [FK__Bird__categories__4AB81AF0] FOREIGN KEY([categoriesID])
REFERENCES [dbo].[BirdCategories] ([categoriesID])
GO
ALTER TABLE [dbo].[Bird] CHECK CONSTRAINT [FK__Bird__categories__4AB81AF0]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK__Blog__accountID__571DF1D5] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK__Blog__accountID__571DF1D5]
GO
ALTER TABLE [dbo].[Candidates]  WITH CHECK ADD  CONSTRAINT [FK__Candidate__formI__4CA06362] FOREIGN KEY([formID])
REFERENCES [dbo].[RegistrationForm] ([formID])
GO
ALTER TABLE [dbo].[Candidates] CHECK CONSTRAINT [FK__Candidate__formI__4CA06362]
GO
ALTER TABLE [dbo].[Candidates]  WITH CHECK ADD  CONSTRAINT [FK__Candidate__round__4D94879B] FOREIGN KEY([roundID])
REFERENCES [dbo].[Round] ([roundID])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Candidates] CHECK CONSTRAINT [FK__Candidate__round__4D94879B]
GO
ALTER TABLE [dbo].[Candidates]  WITH CHECK ADD  CONSTRAINT [FK__Candidate__tourn__4E88ABD4] FOREIGN KEY([tournamentID])
REFERENCES [dbo].[Tournament] ([tournamentID])
GO
ALTER TABLE [dbo].[Candidates] CHECK CONSTRAINT [FK__Candidate__tourn__4E88ABD4]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK__Feedback__accoun__5DCAEF64] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK__Feedback__accoun__5DCAEF64]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK__Feedback__tourna__5070F446] FOREIGN KEY([tournamentID])
REFERENCES [dbo].[Tournament] ([tournamentID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK__Feedback__tourna__5070F446]
GO
ALTER TABLE [dbo].[RegistrationForm]  WITH CHECK ADD  CONSTRAINT [FK__Registrat__accou__628FA481] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[RegistrationForm] CHECK CONSTRAINT [FK__Registrat__accou__628FA481]
GO
ALTER TABLE [dbo].[RegistrationForm]  WITH CHECK ADD  CONSTRAINT [FK__Registrat__birdI__52593CB8] FOREIGN KEY([birdID])
REFERENCES [dbo].[Bird] ([birdID])
GO
ALTER TABLE [dbo].[RegistrationForm] CHECK CONSTRAINT [FK__Registrat__birdI__52593CB8]
GO
ALTER TABLE [dbo].[RegistrationForm]  WITH CHECK ADD  CONSTRAINT [FK__Registrat__tourn__534D60F1] FOREIGN KEY([tournamentID])
REFERENCES [dbo].[Tournament] ([tournamentID])
GO
ALTER TABLE [dbo].[RegistrationForm] CHECK CONSTRAINT [FK__Registrat__tourn__534D60F1]
GO
ALTER TABLE [dbo].[Round]  WITH CHECK ADD  CONSTRAINT [FK__Round__tournamen__5441852A] FOREIGN KEY([tournamentID])
REFERENCES [dbo].[Tournament] ([tournamentID])
GO
ALTER TABLE [dbo].[Round] CHECK CONSTRAINT [FK__Round__tournamen__5441852A]
GO
ALTER TABLE [dbo].[Tournament]  WITH CHECK ADD  CONSTRAINT [FK__Tournamen__birdC__5535A963] FOREIGN KEY([categoriesID])
REFERENCES [dbo].[BirdCategories] ([categoriesID])
GO
ALTER TABLE [dbo].[Tournament] CHECK CONSTRAINT [FK__Tournamen__birdC__5535A963]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [CK__Account__account__4AB81AF0] CHECK  (([accountStatus]=(1) OR [accountStatus]=(0)))
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [CK__Account__account__4AB81AF0]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [CK__Account__role__49C3F6B7] CHECK  (([role]=(1) OR [role]=(0)))
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [CK__Account__role__49C3F6B7]
GO
ALTER TABLE [dbo].[Bird]  WITH CHECK ADD  CONSTRAINT [CK__Bird__birdStatus__5812160E] CHECK  (([birdStatus]=(0) OR [birdStatus]=(1) OR [birdStatus]=(2)))
GO
ALTER TABLE [dbo].[Bird] CHECK CONSTRAINT [CK__Bird__birdStatus__5812160E]
GO
ALTER TABLE [dbo].[Candidates]  WITH CHECK ADD  CONSTRAINT [CK__Candidate__candi__59063A47] CHECK  (([candidatesStatus]=(0) OR [candidatesStatus]=(1) OR [candidatesStatus]=(2)))
GO
ALTER TABLE [dbo].[Candidates] CHECK CONSTRAINT [CK__Candidate__candi__59063A47]
GO
ALTER TABLE [dbo].[RegistrationForm]  WITH CHECK ADD CHECK  (([formStatus]=(1) OR [formStatus]=(2) OR [formStatus]=(3)))
GO
ALTER TABLE [dbo].[Round]  WITH CHECK ADD  CONSTRAINT [CK__Round__roundStat__5AEE82B9] CHECK  (([roundStatus]=(0) OR [roundStatus]=(1) OR [roundStatus]=(2)))
GO
ALTER TABLE [dbo].[Round] CHECK CONSTRAINT [CK__Round__roundStat__5AEE82B9]
GO
ALTER TABLE [dbo].[Tournament]  WITH CHECK ADD  CONSTRAINT [CK__Tournamen__tourn__5BE2A6F2] CHECK  (([tournamentStatus]=(0) OR [tournamentStatus]=(1) OR [tournamentStatus]=(2) OR [tournamentStatus]=(3) OR [tournamentStatus]=(4) OR [tournamentStatus]=(5)))
GO
ALTER TABLE [dbo].[Tournament] CHECK CONSTRAINT [CK__Tournamen__tourn__5BE2A6F2]
GO
USE [master]
GO
ALTER DATABASE [BirdTournament] SET  READ_WRITE 
GO
