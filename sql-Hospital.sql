USE [master]
GO
/****** Object:  Database [Hospital]    Script Date: 11/09/2022 01:30:33 ******/
CREATE DATABASE [Hospital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Hospital', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Hospital.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Hospital_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Hospital_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Hospital] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Hospital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Hospital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Hospital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Hospital] SET ARITHABORT OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Hospital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Hospital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Hospital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Hospital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Hospital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Hospital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Hospital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Hospital] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Hospital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Hospital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Hospital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Hospital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Hospital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Hospital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Hospital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Hospital] SET RECOVERY FULL 
GO
ALTER DATABASE [Hospital] SET  MULTI_USER 
GO
ALTER DATABASE [Hospital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Hospital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Hospital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Hospital] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Hospital] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Hospital', N'ON'
GO
ALTER DATABASE [Hospital] SET QUERY_STORE = OFF
GO
USE [Hospital]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 11/09/2022 01:30:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentId] [int] IDENTITY(1,1) NOT NULL,
	[HospitalId] [int] NOT NULL,
	[DepartmentTypeId] [int] NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[DepartmentUrl] [nvarchar](max) NULL,
	[DepartmentManagerName] [nvarchar](50) NULL,
	[IsConfirmed] [bit] NOT NULL,
	[VisitTime] [text] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Tel] [nvarchar](50) NULL,
 CONSTRAINT [PK__Departme__B2079BED957C1CF6] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DepartmentType]    Script Date: 11/09/2022 01:30:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DepartmentType](
	[DepartmentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[DepTypeName] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Hospitals]    Script Date: 11/09/2022 01:30:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hospitals](
	[HospitalId] [int] IDENTITY(1,1) NOT NULL,
	[HospitalName] [nvarchar](50) NOT NULL,
	[UrlAddress] [nvarchar](50) NULL,
	[IsConfirmed] [bit] NOT NULL,
	[Tel] [nvarchar](50) NOT NULL,
	[HosImage] [nvarchar](max) NULL,
	[HospitalAddress] [nvarchar](50) NULL,
 CONSTRAINT [PK__Hospital__38C2E5AF97280A8C] PRIMARY KEY CLUSTERED 
(
	[HospitalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Opinion]    Script Date: 11/09/2022 01:30:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Opinion](
	[OpinionId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Summary] [nvarchar](max) NOT NULL,
	[Rating1GeneralSatisfaction] [int] NOT NULL,
	[Rating2ListenAndRelate] [int] NOT NULL,
	[Rating3GettingHelpEasily] [int] NOT NULL,
	[Rating4SharingInformation] [int] NOT NULL,
	[Rating5AnEfficientProcess] [int] NOT NULL,
	[Rating6ConditionsOfHospitalization] [int] NOT NULL,
	[Rating7PreventionOfMedicalErrors] [int] NOT NULL,
	[IsConfirmed] [bit] NOT NULL,
	[TotalRating] [int] NULL,
 CONSTRAINT [PK__Opinion__75B357C5505A0358] PRIMARY KEY CLUSTERED 
(
	[OpinionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/09/2022 01:30:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
	[UserImage] [nvarchar](max) NULL,
	[CreateDate] [datetime] NOT NULL,
	[Summary] [nvarchar](max) NULL,
	[IsDisabled] [bit] NOT NULL,
	[IsAdmin] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (4, 38, 1, N'קרדיולוגיה', N'https://www.mymc.co.il/department/cardiology/', N'ד”ר אורן אגרנט', 1, N'צהריים – 14:45-15:00', 0, N'03-5771102

')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (24, 38, 8, N'ילודים א', N'mymc.co.il/department/postnatal-department/', N'ד”ר דניאל לובין', 1, N'-', 0, N'03-5771118

03-5771263')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (27, 38, 8, N'ילודים ב', N'mymc.co.il/department/postnatal-department/', N'ד"ר דניאל לובין', 1, N'-', 0, N'03-5771118

03-5771263')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (32, 38, 8, N'יולדות א', N'mymc.co.il/department/postnatal-department', N'פרופ'' ברי קפלן', 1, N':בוקר
10:30 – ביקור בעלים בלבד.
12:00 – 11:00 – ביקור ללא ילדים

 

אחה"צ:
17:00 – 16:00 – עם ילדים

:ערב
19:30 – ביקור בעלים בלבד
20:00-21:00 – ביקור ללא ילדים

:יום ו''
15:00 – 14:00 – ביקור עם ילדים

מוצ"ש חורף:
21:00 – 20:00    (מ- 19:30 בעלים בלבד)
מוצ"ש קיץ:
22:15 – 21:30   (מ-21:00 בעלים בלבד)', 0, N'5771180')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (35, 38, 8, N'יולדות ב', N'mymc.co.il/department/postnatal-department', N'ד”ר מירב רז', 1, N':בוקר
10:30 – ביקור בעלים בלבד.
12:00 – 11:00 – ביקור ללא ילדים

 

אחה"צ:
17:00 – 16:00 – עם ילדים

:ערב
19:30 – ביקור בעלים בלבד
20:00-21:00 – ביקור ללא ילדים

:יום ו''
15:00 – 14:00 – ביקור עם ילדים

מוצ"ש חורף:
21:00 – 20:00    (מ- 19:30 בעלים בלבד)
מוצ"ש קיץ:
22:15 – 21:30   (מ-21:00 בעלים בלבד)', 0, N'03-5771159')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (36, 38, 8, N'פגיה', N'mymc.co.il/department/neonatal-intensive-care-department', N'ד"ר דניאל לובין', 1, N'08:00- 12:00

שיחה עם רופא
15:00- 12:00.', 0, N'03-5771228

03-6153722')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (38, 38, 7, N'הרדמה', N'https://www.mymc.co.il/department/anesthesiology-and-intensive-care-department', N'פרופ'' נתן וקסלר', 1, N'כל ימות השבוע
13:00-14:00
18:30-19:30', 0, N'03-5771114

03-5771278')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (40, 38, 12, N'כירוגיה ילדים', N'https://www.mymc.co.il/department/pediatric-surgery', N'

ד”ר ענת לאור', 1, N'יום א'':
14:00-16:15

יום ד'':
08:30-11:15', 0, N'03-5770535

 
03-5770556')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (42, 38, 6, N'רפואה דחופה מיון', N'https://www.mymc.co.il/department/department-of-emergency-medicine', N'ד”ר רונן ליבסטר', 1, N'-', 0, N'03-5771130

03-5771120

')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (45, 38, 9, N'ילדים', N'https://www.mymc.co.il/department/kids-department/', N'פרופ'' אלי סומך', 1, N'08:30-11:30', 0, N'03-5771117

')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (46, 38, 20, N'נשים', N'https://www.mymc.co.il/department/gynecology-department/', N'
פרופ'' גבריאל אלסנר
פרופ'' גבריאל אלסנר', 0, N'שעות ביקור:
כל ימות השבוע
7:00-9:00
13:00-22:30

שעות ביקור רופאים:
12:00 -09:30
בשעות אחה"צ נערך ביקור ערב ע"י רופא תורן הדואג להמשך טיפול שוטף ונותן מענה לבעיות המתעוררות.', 0, N'03-5771192')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (47, 38, 8, N'חדרי לידה', N'https://www.mymc.co.il/department/delivery-room/', N'
ד”ר יוהנה אולטיאנו', 1, N'אנו שמחים על בחירתך ללדת במרכז הרפואי מעיני הישועה ומאחלים לך חוויה נעימה, במהלך שהותך. צוות חדר הלידה יעמוד לשרותך וישתדל להעניק לך ולעוברך את הטיפול המקצועי והמסור ביותר.', 0, N'03-5771112

03-5771170')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (48, 38, 8, N'הריון בר סיכון – רפואת האם והעובר', N'https://www.mymc.co.il/department/high-risk-pregnancy-perinatology-department/', N'
ד”ר דורון רוזן  גב'' סימה זיו', 1, N'-', 0, N'03-5771192, 03-5771188')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (49, 38, 10, N'הפרעות אכילה', N'https://www.mymc.co.il/department/mental-health-marbe-daat-department/', N'פרופ'' דניאל שטיין', 1, N'-', 0, N'073-3398031')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (52, 38, 10, N'פסיכיאטריה אשפוז נשים', N'https://www.mymc.co.il/department/mental-health-marbe-daat-department/', N'ד”ר משה לוי', 1, N'-', 0, N'
073-3398031')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (53, 38, 10, N'בריאות הנפש', N'https://www.mymc.co.il/department/mental-health-marbe-daat-department/', N'פרופ'' ישראל שטראוס', 1, N'-', 0, N'
073-3398031')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (54, 38, 6, N'מיון ילדים ', N'https://www.mymc.co.il/department/childrens-emergency-room/', N'
ד”ר גלייזר אלכסנדרה', 1, N'24 שעות ביממה', 0, N'03-5775447, 03-6153772

פקס 03-5775403')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (55, 38, 11, N'מחלקה אורתופדית', N'https://www.mymc.co.il/department/department-of-orthopedics/', N'ד”ר איתי הולצר', 1, N'-', 0, N'03-5771102

03-5775478')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (57, 38, 11, N'כירוגיית כף רגל וקרסול', N'https://www.mymc.co.il/department/department-of-orthopedics/', N'
ד”ר אלון בורג', 1, N'-', 0, N'03-5771102

03-5775478')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (59, 38, 11, N'ארתרוסקופיה ופגיעות ספורט', N'https://www.mymc.co.il/department/department-of-orthopedics/', N'ד”ר סוזנה הורביץ', 1, N'-', 0, N'03-5771102

03-5775478')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (62, 38, 11, N'אורתופדיית ילדים', N'https://www.mymc.co.il/department/department-of-orthopedics/', N'
ד”ר ניר כהן', 1, N'-', 0, N'03-5771102

03-5775478')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (65, 38, 12, N'כירוגית', N'https://www.mymc.co.il/department/medical-surgical-ward/', N'ד”ר משה קולר', 1, N'בוקר – 08:00-08:30
ערב – 14:45-15:00', 0, N'03-5771102

03-5771176')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (66, 38, 4, N'תזונה ודיאטה', N'https://www.mymc.co.il/department/department-of-humanities/', N'גב'' שרון אברמצ''יק', 1, N'-', 0, N'-')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (67, 38, 26, N'פנימית', N'https://www.mymc.co.il/department/internal-department/', N'ד”ר חיים ישראל סטרו', 1, N'א''-ש''
9:00 – 7:00
21:00 – 12:30', 0, N'
03-5771116

03-5771260')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (68, 38, 27, N'בעיות נשימתיות', N'https://www.mymc.co.il/department/intermediate-care-facility', N'-', 1, N'-', 0, N'03-5771510')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (69, 38, 9, N'מחלות זיהומיות-ילדים', N'https://www.mymc.co.il/department/kids-department/', N'פרופ'' יעקב אמיר', 1, N'08:30-11:30', 0, N'03-5771117')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (107, 44, 6, N'רפואה דחופה – מיון', N'https://www.sheba.co.il/%D7%A8%D7%A4%D7%95%D7%90%D7%94_%D7%93%D7%97%D7%95%D7%A4%D7%94', N'ד"ר אבינח עירוני', 1, N'7/24', 0, N'03-5303101, 03-5302503')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (108, 44, 13, N'אונקולוגיה דחופה', N'https://cancer.sheba.co.il/%D7%9E%D7%93%D7%A8%D7%99%D7%9A_%D7%9C%D7%9E%D7%98%D7%95%D7%A4%D7%9C_%D7%94%D7%97%D7%93%D7%A9_%D7%9E%D7%99%D7%95%D7%9F_%D7%90%D7%95%D7%A0%D7%A7%D7%95%D7%9C%D7%95%D7%92%D7%99', N'ד"ר עמית איתי', 1, N'ימי ראשון עד חמישי, בשעות 8:00 - 18:00', 0, N'03-5304861')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (109, 44, 13, N' אונקולוגית', N'https://cancer.sheba.co.il/%D7%9E%D7%A8%D7%9B%D7%96_%D7%94%D7%A1%D7%A8%D7%98%D7%9F_%D7%94%D7%9E%D7%97%D7%9C%D7%A7%D7%94_%D7%94%D7%90%D7%95%D7%A0%D7%A7%D7%95%D7%9C%D7%95%D7%92%D7%99%D7%AA_%D7%A8%D7%90%D7%A9%D7%99', N'ד"ר דיימיאן אורבן', 1, N'-', 0, N'03-5302512')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (111, 44, 13, N'אשפוז יום אונקולוגי', N'https://cancer.sheba.co.il/%D7%99%D7%97%D7%99%D7%93%D7%95%D7%AA_%D7%9E%D7%A8%D7%9B%D7%96_%D7%94%D7%A1%D7%A8%D7%98%D7%9F_%D7%98%D7%99%D7%A4%D7%95%D7%9C%D7%99_%D7%9B%D7%9E%D7%95%D7%AA%D7%A8%D7%A4%D7%99%D7%94', N'ד"ר עינב נילי גל-ים', 1, N'ימי ראשון, שני, שלישי וחמישי, בשעות 8:00 - 14:00

ימי רביעי, בשעות 8:00 - 18:00', 0, N'03-5303112/2249')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (112, 44, 15, N'המערך הגריאטרי', N'https://shikum.sheba.co.il/%D7%94%D7%9E%D7%A2%D7%A8%D7%9A_%D7%94%D7%92%D7%A8%D7%99%D7%90%D7%98%D7%A8%D7%99', N'פרופ'' דן ג''וסטו', 1, N'-', 0, N'03-5305108')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (121, 44, 12, N'יחידת האשפוז לנפגעי טראומה וכירורגיה קריטית', N'https://www.sheba.co.il/%D7%9E%D7%A2%D7%A8%D7%9A_%D7%94%D7%98%D7%A8%D7%90%D7%95%D7%9E%D7%94_%D7%95%D7%99%D7%97%D7%99%D7%93%D7%AA_%D7%94%D7%90%D7%A9%D7%A4%D7%95%D7%96_%D7%9C%D7%A0%D7%A4%D7%92%D7%A2%D7%99_%D7%98%D7%A8%D7%90%D7%95%D7%9E%D7%94', N'ד"ר יורם קליין', 1, N'-', 0, N' 03-5304538')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (122, 44, 12, N'כירורגית ב – כללית והשתלות', N'https://www.sheba.co.il/%D7%9B%D7%99%D7%A8%D7%95%D7%A8%D7%92%D7%99%D7%AA_%D7%9B%D7%9C%D7%9C%D7%99%D7%AA_%D7%95%D7%94%D7%A9%D7%AA%D7%9C%D7%95%D7%AA', N'  פרופ'' מרדכי גוטמן', 1, N'-', 0, N'03-5302415 (אגף מערבי), 03-5305774 (אגף מזרחי)')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (123, 44, 12, N'כירורגית ג – כללית ואונקולוגית', N'https://www.sheba.co.il/%D7%9B%D7%99%D7%A8%D7%95%D7%A8%D7%92%D7%99%D7%AA_%D7%9B%D7%9C%D7%9C%D7%99%D7%AA_%D7%95%D7%90%D7%95%D7%A0%D7%A7%D7%95%D7%9C%D7%95%D7%92%D7%99%D7%AA', N'פרופ'' אבירם ניסן', 1, N'-', 0, N'03-5302714, 03-5307908')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (128, 44, 14, N'כירורגית אורולוגית', N'https://www.sheba.co.il/%D7%90%D7%95%D7%A8%D7%95%D7%9C%D7%95%D7%92%D7%99%D7%AA', N'ד"ר זהר דותן', 1, N'פעילות ניתוחית בחדר ניתוח – ראשון עד רביעי

ריסוקי אבנים בגישה חוץ-גופית (במרכז לטכנולוגיות מתקדמות) – ימי ראשון ושלישי', 0, N'03-5302413/2239')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (130, 44, 12, N'כירורגיית כבד ולבלב – הפטוביליארית', N'https://www.sheba.co.il/%D7%94%D7%9E%D7%A8%D7%A4%D7%90%D7%94_%D7%94%D7%94%D7%A4%D7%98%D7%95%D7%91%D7%99%D7%9C%D7%99%D7%90%D7%A8%D7%99%D7%AA_%D7%9B%D7%99%D7%A8%D7%95%D7%A8%D7%92%D7%99%D7%AA_%D7%9B%D7%91%D7%93_%D7%95%D7%9C%D7%91%D7%9C%D7%91', N'פרופ'' מרדכי גוטמן', 1, N'ימי שני, בשעות 11:30-10:00
 ', 0, N'03-5305000 או במוקד הדיגיטלי')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (131, 44, 11, N'המערך האורתופדי', N'https://www.sheba.co.il/%D7%94%D7%9E%D7%A2%D7%A8%D7%9A_%D7%94%D7%90%D7%95%D7%A8%D7%98%D7%95%D7%A4%D7%93%D7%99', N'ד"ר משה לוינקופף', 1, N'-', 0, N'03-5302417, 5302420- 03')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (132, 44, 23, N'כירורגיה פלסטית', N'https://www.sheba.co.il/%D7%9E%D7%97%D7%9C%D7%A7%D7%94-%D7%9C%D7%9B%D7%99%D7%A8%D7%95%D7%A8%D7%92%D7%99%D7%94-%D7%A4%D7%9C%D7%A1%D7%98%D7%99%D7%AA', N'פרופ'' יוסף חייק ', 1, N'-', 0, N' 03-5302416')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (133, 44, 12, N'כירורגיית פה ולסת', N'https://www.sheba.co.il/%D7%9E%D7%97%D7%9C%D7%A7%D7%AA-%D7%9B%D7%99%D7%A8%D7%95%D7%A8%D7%92%D7%99%D7%99%D7%AA-%D7%A4%D7%94-%D7%95%D7%9C%D7%A1%D7%AA', N'ד"ר רן יהלום  ', 1, N'-', 0, N'03-5302442')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (135, 44, 12, N'כירורגיה בריאטרית ומטבולית', N'https://www.sheba.co.il/%D7%94%D7%9E%D7%A8%D7%9B%D7%96_%D7%9C%D7%98%D7%99%D7%A4%D7%95%D7%9C_%D7%91%D7%94%D7%A9%D7%9E%D7%A0%D7%AA_%D7%99%D7%AA%D7%A8', N'NULL פרופ'' דוד גויטיין ', 1, N'ימים ראשון-חמישי, בשעות 15:00-08:00', 0, N'03-5308493')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (137, 44, 7, N'המערך להרדמה
', N'https://www.sheba.co.il/%D7%94%D7%9E%D7%A2%D7%A8%D7%9A_%D7%9C%D7%94%D7%A8%D7%93%D7%9E%D7%94', N'פרופ'' חיים ברקנשטט', 1, N'-', 0, N'03-5302754')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (139, 44, 12, N'כירורגיית כלי דם', N'https://heart.sheba.co.il/%D7%9B%D7%99%D7%A8%D7%95%D7%A8%D7%92%D7%99%D7%AA_%D7%9B%D7%9C%D7%99_%D7%93%D7%9D', N'ד"ר משה חלק', 1, N'מרפאת סקר – ימי חמישי, בשעות 12:00 - 13:00

מרפאת מעקב לחולי המודיאליזה – ימי חמישי, בשעות  11:00 - 13:30

מרפאת ייעוץ וסקולרי – ימי ראשון, בשעות  10:30- 15:00, ימי שלישי, בשעות 15:00 - 18:00', 0, N'03-5302412')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (140, 44, 12, N'כירורגיית חזה', N'https://heart.sheba.co.il/%D7%94%D7%9E%D7%97%D7%9C%D7%A7%D7%94_%D7%9C%D7%9B%D7%99%D7%A8%D7%95%D7%A8%D7%92%D7%99%D7%AA_%D7%97%D7%96%D7%94', N'ד"ר רן קרמר', 1, N'ימים שני ורביעי, בשעות
8:00 - 14:00.', 0, N'03-5303495  ')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (142, 44, 17, N'נוירוכירורגיה – ניתוחי מוח ועמוד שדרה', N'https://www.sheba.co.il/%D7%A0%D7%95%D7%99%D7%A8%D7%95%D7%9B%D7%99%D7%A8%D7%95%D7%A8%D7%92%D7%99%D7%94', N'ד"ר נחשון קנולר', 1, N'12:00 - 13:30, 17:00 - 19:00', 0, N'03-5302650')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (143, 44, 10, N'פסיכיטריה א', N'https://shikum.sheba.co.il/%D7%A9%D7%99%D7%A7%D7%95%D7%9D_%D7%A4%D7%A1%D7%99%D7%9B%D7%99%D7%90%D7%98%D7%A8%D7%99%D7%94_%D7%90', N'ד"ר אסף כספי', 1, N'-', 0, N' 03-5303318 ')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (145, 44, 10, N'פסיכיטריה ב', N'https://shikum.sheba.co.il/%D7%A9%D7%99%D7%A7%D7%95%D7%9D_%D7%A4%D7%A1%D7%99%D7%9B%D7%99%D7%90%D7%98%D7%A8%D7%99_%D7%91', N'ר רויטל עמיעז', 1, N'-', 0, N'03-5303434')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (146, 44, 10, N'פסיכיאטריה ג', N'https://shikum.sheba.co.il/%D7%A9%D7%99%D7%A7%D7%95%D7%9D_%D7%A4%D7%A1%D7%99%D7%9B%D7%99%D7%90%D7%98%D7%A8%D7%99%D7%94_%D7%92', N' פרופ'' מרק וייזר', 1, N'-', 0, N'03-5303765')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (147, 44, 15, N'גריאטריה שיקומית א', N'https://shikum.sheba.co.il/%D7%92%D7%A8%D7%99%D7%90%D7%98%D7%A8%D7%99%D7%94_%D7%90', N'ד"ר מרינה ערד', 1, N'-', 0, N'03-5303534, 03-5303532')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (148, 44, 15, N'גריאטריה שיקומית ב', N'https://shikum.sheba.co.il/%D7%A9%D7%99%D7%A7%D7%95%D7%9E%D7%99%D7%AA_%D7%91', N'פרופ'' דן ג''וסטו', 1, N'-', 0, N'03-5303429')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (149, 44, 15, N'גריאטריה פנימית ג', N'https://shikum.sheba.co.il/%D7%A9%D7%99%D7%A7%D7%95%D7%9D_%D7%92%D7%A8%D7%99%D7%90%D7%98%D7%A8%D7%99%D7%94_%D7%A4%D7%A0%D7%99%D7%9E%D7%99%D7%AA_%D7%92', N'ד"ר אירינה גרינגאוז', 1, N'-', 0, N'03-5303491')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (151, 44, 15, N'רפואה פנימית גריאטרית ד', N'https://shikum.sheba.co.il/%D7%A9%D7%99%D7%A7%D7%95%D7%9D_%D7%92%D7%A8%D7%99%D7%90%D7%98%D7%A8%D7%99%D7%94_%D7%A4%D7%A0%D7%99%D7%9E%D7%99%D7%AA_%D7%93', N' ד"ר אנה ויצמן', 1, N'-', 0, N'03-5305171')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (152, 44, 8, N' יולדות א', N'https://maternity.sheba.co.il/%D7%9E%D7%97%D7%9C%D7%A7%D7%95%D7%AA_%D7%99%D7%95%D7%9C%D7%93%D7%95%D7%AA_%D7%A8%D7%A4%D7%95%D7%90%D7%94_%D7%A1%D7%91_%D7%9C%D7%99%D7%93%D7%AA%D7%99%D7%AA', N'מריה ברזאני  ', 1, N'ראשון-שבת, בשעות 13:00-11:00, ו-21:00-16:00.', 0, N'03-5302774')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (153, 44, 8, N'יולדות ב', N'https://maternity.sheba.co.il/%D7%9E%D7%97%D7%9C%D7%A7%D7%95%D7%AA_%D7%99%D7%95%D7%9C%D7%93%D7%95%D7%AA_%D7%A8%D7%A4%D7%95%D7%90%D7%94_%D7%A1%D7%91_%D7%9C%D7%99%D7%93%D7%AA%D7%99%D7%AA', N'זהבה שיץ פוחיל', 1, N'ראשון-שבת, בשעות 13:00-11:00, ו-21:00-16:00.

', 0, N'03-5302776')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (154, 44, 8, N'פגים וטיפול נמרץ ילודים (פגייה)', N'https://yeladim.sheba.co.il/%D7%9E%D7%97%D7%9C%D7%A7%D7%AA_%D7%A4%D7%92%D7%99%D7%9D', N' ד"ר ציפי שטראוס ', 1, N'-', 0, N'03-5302424 , 03-5302133')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (156, 44, 9, N'ילדים א', N'https://yeladim.sheba.co.il/%D7%9E%D7%97%D7%9C%D7%A7%D7%AA_%D7%99%D7%9C%D7%93%D7%99%D7%9D_%D7%90_%D7%A6%D7%A4%D7%95%D7%9F', N' פרופ'' רז סומך ', 1, N'-', 0, N'03-5302446, 03-5302447')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (158, 44, 9, N' ילדים ב', N'https://yeladim.sheba.co.il/%D7%99%D7%9C%D7%93%D7%99%D7%9D_%D7%91_%D7%93%D7%A8%D7%95%D7%9D', N'ד"ר אסף ויונטה', 1, N'-', 0, N'03-5302450/2446')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (162, 44, 9, N'טיפול בהפרעות אכילה בילדים ונוער – ילדים ג', N'https://yeladim.sheba.co.il/%D7%9E%D7%97%D7%9C%D7%A7%D7%AA-%D7%94%D7%A4%D7%A8%D7%A2%D7%95%D7%AA-%D7%90%D7%9B%D7%99%D7%9C%D7%94-%D7%99%D7%9C%D7%93%D7%99%D7%9D', N'ד"ר עדי חנוך-לוי', 1, N'-', 0, N'03-5302690')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (163, 44, 9, N' שיקום ילדים', N'https://yeladim.sheba.co.il/%D7%A9%D7%99%D7%A7%D7%95%D7%9D_%D7%99%D7%9C%D7%93%D7%99%D7%9D', N'ד"ר ז''אנה לנדה', 1, N'-', 0, N'03-5302597, 03-5302933')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (167, 44, 9, N'כירורגיית ילדים', N'https://yeladim.sheba.co.il/%D7%9B%D7%99%D7%A8%D7%95%D7%A8%D7%92%D7%99%D7%AA_%D7%99%D7%9C%D7%93%D7%99%D7%9D', N'ד"ר דניאל שינהר', 1, N'-', 0, N'03-5302444/8')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (168, 44, 9, N'המטואונקולוגיה והשתלות מח עצם', N'https://yeladim.sheba.co.il/%D7%94%D7%9E%D7%97%D7%9C%D7%A7%D7%94-%D7%9C%D7%94%D7%9E%D7%98%D7%95%D7%90%D7%95%D7%A0%D7%A7%D7%95%D7%9C%D7%95%D7%92%D7%99%D7%94-%D7%95%D7%94%D7%A9%D7%AA%D7%9C%D7%95%D7%AA-%D7%9E%D7%95%D7%97-%D7%A2%D7%A6%D7%9D', N'פרופ'' עמוס תורן', 1, N'-', 0, N'03-5302937, 03-5302934')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (169, 35, 1, N'קרדיולוגיה', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/cardiology/Pages/default.aspx', N'פרופ'' רן קורנובסקי', 1, N'-', 0, N'03-9377107')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (170, 35, 2, N'כבד', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/liver/Pages/national_liver_institute.aspx', N'ד''''ר מריוס בראון', 1, N'מים א''-ה'' בשעות 08:00 - 15:30', 0, N'03-9377250/77')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (171, 35, 3, N'עור ומין', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/dermatology/Pages/dermatology_department_beilinson.aspx', N'פרופ'' אמיליה חודק', 1, N'19:00-16:00', 0, N'03-9376658')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (172, 35, 6, N'רפואה דחופה(מיון)', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/emergency-medicine/Pages/emergency_medicine_department_beilinson.aspx', N'פרופ'' מיכאל דרשר', 1, N'-', 0, N'03-9377011')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (173, 35, 7, N'הרדמה', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/anesthesiology-introduction/Pages/anesthesiology_beilinson.aspx', N'פרופ'' ליאוניד אידלמן', 1, N'-', 0, N'03-9376811/50')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (175, 35, 8, N'יולדות', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/neonates/Pages/neonates_dept.aspx', N'ד"ר מיקי אוסובסקי', 1, N'בימים א''-ה'' בשעות 20:00-18:00
בימי שישי ושבת בשעות 14:00-13:00 ובשעות 20:00-18:00.
אין כניסה למחלקה בשעות 12:00-10:00, שהן שעות ביקור רופאים.', 0, N'03-9377472/3')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (176, 35, 11, N'אורתופדיה', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/orthopedics/Pages/orthopedics_department_beilinson.aspx', N'ד"ר סטיבן וולקס', 1, N'12:00 - 20:00', 0, N'03-9376158/0')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (177, 35, 12, N'כרורגיה א', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/surgery/Pages/surgery_a_dept_beilinson.aspx', N'ד''''ר ניקולאי מנשרוב   פרופ'' חנוך קשתן', 1, N'10:30–21:00', 0, N'03-9376257/8')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (178, 35, 12, N'כרורגיה ב', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/surgery/Pages/surgery_a_dept_beilinson.aspx', N'ד''''ר ניקולאי מנשרוב   פרופ'' חנוך קשתן', 1, N'10:30–21:00', 0, N'03-9376206/8')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (179, 35, 13, N'אונקולוגיה', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/dvidoff-center/Pages/Oncology.aspx', N'פרופ'' ברוך ברנר', 1, N'ימים א'' - ה'' בשעות 07:30 - 15:00', 0, N'03-9378055')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (180, 35, 14, N'אורולוגיה', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/urology/Pages/default.aspx', N'פרופ'' ג''ק בניאל', 1, N'ימים א''-ה'' בשעות 08:00 - 14:00', 0, N'03-9376563')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (181, 35, 15, N'גריאטריה', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/geriatrics/Pages/geriatrics_department.aspx', N'פרופ'' ישעיהו בלוססקי פרופ'' אברהם וייס ', 1, N'12:00 - 20:00', 0, N'03-9376818')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (182, 35, 16, N'יחידה למחלות קרישת הדם', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/hematology/Pages/coagulation.aspx', N' ד"ר גליה ספקטר', 1, N'ימים א'' - ה'' בשעות 07:30 - 15:00', 0, N'03-9378200/21')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (183, 35, 17, N'נוירוכרורגיה', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/neurosurgery/Pages/neurosurgery_dept.aspx', N'ד"ר שגיא הרנוף', 1, N'20:00-07:00', 0, N'03-9376408/6')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (184, 35, 18, N'המחלקה לנוירולוגיה', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/neurology/Pages/neurology_dept_beilinson.aspx', N'פרופ'' איתן אוריאל ד"ר פליקס בנינגר', 1, N'12:00 - 21:00', 0, N'03-9376358/5')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (185, 35, 18, N'המרפאה לנוירולוגיה', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/neurology/Pages/neurology_clinic_beilinson.aspx', N'פרופ'' איתן אוריאל', 1, N'ימים א''-ה'' בשעות 08:00 - 14:00', 0, N'03-9377080')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (186, 35, 18, N'מרפאה לטרשת נפוצה ולנוירואימונולוגיה', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/neurology/Pages/multiple_sclerosis_neuro_immunology.aspx', N'ד"ר מרק הלמן', 1, N'ימים א''-ה'' , בשעות 08:00 - 15:00', 0, N'03-9377080')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (187, 35, 18, N'המרפאה לנוירולוגיה קוגניטיבית והפרעות קשב וריכוז', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/neurology/Pages/cognitive_neurology.aspx', N'ד"ר אמיר גליק', 1, N'ימים א''-ה'' , בשעות 08:00 - 15:00

', 0, N'03-9377080')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (188, 35, 18, N'המרכז לשבץ מוחי ומחלות כלי הדם המוחיים', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/neurology/Pages/stroke_center.aspx', N'ד"ר שלומי פרץ', 1, N'ימים א-ה'' בשעות 14:00-08:00', 0, N'03-9377080')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (189, 35, 18, N'מרפאה לשבץ מוחי בצעירים', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/neurology/Pages/Young-Brain-Stroke-Clinic.aspx', N'ד"ר שלומי פרץ', 1, N'ימים א-ה'' בשעות 14:00-08:00', 0, N'03-9377080')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (190, 35, 19, N'פתולוגיה', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/pathology/Pages/pathology.aspx', N'פרופ'' מאורה פיינמסר', 1, N'בילינסון:
ימים א'', ד'' – סגור לקבלת קהל ומענה טלפוני
ימים ב'', ג'', ה'' – קבלת קהל ומענה טלפוני בשעות 12:00-09:00
בכל הימים ניתן לפנות אלינו במייל.', 0, N'03-9376196/85/87')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (191, 35, 21, N'המערך למחלות ריאה ולאלרגיה  ', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/pulmonary/Pages/pulmonary_and_allergies_institute.aspx', N'פרופ'' מרדכי קרמר', 1, N'בילינסון:
ימים א'', ד'' – סגור לקבלת קהל ומענה טלפוני
ימים ב'', ג'', ה'' – קבלת קהל ומענה טלפוני בשעות 12:00-09:00
בכל הימים ניתן לפנות אלינו במייל.', 0, N'  03-9377221')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (192, 35, 22, N'מחלקה לכירורגיה פלסטית ויחידת כוויות -', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/plastic-surgery-and-burns/Pages/plastic_surgery_dept_and_burns_unit.aspx', N' ד"ר דין עד-אל', 1, N'יום ב'' בשעות 12:30-09:00
יום ד'' בשעות 13:30-10:00
חדר ניתוח אמבולטורי בימים ג'', ה'' בשעות 15:00-08:00
מרפאת לייזר - יום א'' בשעות 11:30-10:00
מרפאת טרום ניתוח - יום ג'' בשעות 13:00-09:30 ', 0, N'03-9376366 ')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (193, 35, 22, N'מרפאה לכירורגיה פלסטית -', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/plastic-surgery-and-burns/Pages/plastic_surgery_clinic.aspx', N'ד"ר דין עד-אל', 1, N'יום ב'' בשעות 12:30-09:00
יום ד'' בשעות 13:30-10:00
חדר ניתוח אמבולטורי בימים ג'', ה'' בשעות 15:00-08:00
מרפאת לייזר - יום א'' בשעות 11:30-10:00
מרפאת טרום ניתוח - יום ג'' בשעות 13:00-09:30 ', 0, N'03-9377166')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (194, 35, 22, N'המרפאה לכירורגיה פלסטית של הפנים והצוואר', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/plastic-surgery-and-burns/Pages/reconstructive_aesthetic_surgery_clinic.aspx', N'ד"ר אהרון עמיר', 1, N'ימי ד'' 13:00-09:00', 0, N'03-9377166')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (195, 35, 23, N'מכון דימות (רנטגן) - בילינסון', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/imaging/Pages/imaging_beilinson.aspx', N'פרופ'' אלי עטר', 1, N'ימי ד'' 13:00-09:00', 0, N'03-9376344')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (196, 35, 23, N'מכון MRI ', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/imaging/Pages/mri.aspx', N'פרופ'' אלי עטר', 1, N'-', 0, N'03-9376171/2')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (197, 35, 23, N'המכון לטומוגרפיה ממוחשבת (CT)', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/imaging/Pages/ct.aspx', N'ד"ר יוסף אקשטיין', 1, N'-', 0, N'03-9376485')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (198, 35, 16, N'המערך להמטולוגיה', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/hematology/Pages/hematology.aspx', N'פרופ'' פיה רענני', 1, N'ימים א'' - ה'' בשעות 08:00 - 16:00, ערבי חג בין השעות 08:00 - 13:00 - בתיאום מראש', 0, N'03-9378200/2/21')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (200, 35, 16, N'המרפאה להמטולוגיה שפירה', N'https://hospitals.clalit.co.il/rabin/he/departments-and-clinics/hematology/Pages/benign_hematology.aspx', N'פרופ'' פיה רענני', 1, N'ימים א'' - ה'' בשעות 08:00 - 16:00, ערבי חג בין השעות 08:00 - 13:00 - בתיאום מראש', 0, N'03-9378200/2/21')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (201, 40, 1, N'קרדיולוגיה - מערך', N'https://www.tasmc.org.il/Internalmed/Cardiology/Pages/Cardiology.aspx', N'פרופ'' שמואל בנאי', 1, N'-', 0, N'03-6974250, 03-6974762')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (202, 40, 2, N'מחלות כבד - יחידה', N'https://www.tasmc.org.il/Internalmed/Gastroenterology/Pages/Gastro-Liver.aspx', N'ד''''ר הלנה קצמן', 1, N'-', 0, N'03-6973984')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (203, 40, 2, N'המכון למחלות דרכי העיכול והכבד (גסטרו)', N'https://www.tasmc.org.il/Internalmed/Gastroenterology/Pages/Gastroenterology.aspx', N'פרופ'' אורן שבולת', 1, N'-', 0, N'03-6974280')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (205, 40, 3, N'עור ומין', N'https://www.tasmc.org.il/Internalmed/Dermatology/Pages/Dermatology-Clinics.aspx', N'ד''''ר שמיר גלר גב'' ורד אוליד', 1, N'24 שעות ביממה', 0, N'03-6973585')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (206, 40, 5, N'חדרי נתוח', N'https://www.tasmc.org.il/Surgery/Anesthesiology/Pages/OR.aspx', N'ד''''ר דניאל אוגורק גב'' ז''אנה ספקטור', 1, N'-', 0, N'03-6925669 03-6925674')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (208, 40, 6, N'מיון כללי', N'https://www.tasmc.org.il/ER-Hospitalization-Office/Pages/ER-Office.aspx', N'-', 1, N'24 שעות ביממה', 0, N'03-6973933')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (209, 40, 6, N'מיון נשים ויולדות "ליס"', N'https://www.tasmc.org.il/ER-Hospitalization-Office/Pages/ER-Office.aspx', N'-', 1, N'24 שעות ביממה', 0, N'03-6925676')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (210, 40, 6, N'מיון ילדים "דנה-דואק"', N'https://www.tasmc.org.il/ER-Hospitalization-Office/Pages/ER-Office.aspx', N'-', 1, N'24 שעות ביממה', 0, N'03-6974504')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (211, 40, 6, N'מיון שוכבים', N'https://www.tasmc.org.il/ER/Pages/Internal-Surgical-ER.aspx', N'ד''''ר קרין ויסקין הלר', 1, N'24 שעות ביממה', 0, N'03-6973686')
GO
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (212, 40, 7, N'הרדמה וטיפול נמרץ', N'https://www.tasmc.org.il/Surgery/Anesthesiology/Pages/Anesthesiology.aspx', N'פרופ'' עידית מטות', 1, N'24 שעות ביממה', 0, N'03-6974758')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (213, 40, 7, N'טיפול נמרץ כללי', N'https://www.tasmc.org.il/Surgery/Anesthesiology/Pages/Intensive-Care.aspx', N'ד''''ר נמרוד עדי גב'' איריס ברמן', 1, N'07:45-08:15 13:00-14:00 19:00-20:00', 0, N'03-6973247')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (214, 40, 8, N'יולדות א''', N'https://www.tasmc.org.il/Lis/Obstetrics-pregnancy/Post-Partum-A/Pages/Post-Partum-A.aspx', N'ד''''ר מיכאל שנהב גב'' אילת גרינפלד', 1, N'10:30-12:00; 16:00-18:00; 19:00-20:30. ?? ??? ???? ????? ??? ????? ???', 0, N'03-6925643')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (217, 40, 8, N'ילודים ופגים', N'https://www.tasmc.org.il/Lis/Newborns-Neonatology/Pages/newborns.aspx', N'ד''''ר רונלה מרום גב'' ג''ני פלדמן', 0, N'-', 0, N'03-6925669 03-6925674')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (219, 40, 9, N'ילדים (מחלקת אשפוז)', N'https://www.tasmc.org.il/Dana-Dwek/peds-general/Pages/peds-general.aspx', N'פרופ'' רונית לובצקי גב'' שושי איסמאילוב', 1, N'שעות קבלת מידע מהרופאים: מידי יום בין השעות 14:00-13:00
שעות ביקור: 08:00-20:00', 0, N'03-6974747 03-6973131')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (221, 40, 10, N'מרפאה לבריאות הנפש מבוגרים', N'https://www.tasmc.org.il/Rehabilitation-Hospital/Psychiatry/Pages/Psychiatry-Clinic.aspx', N'ד''''ר אורן טנא גב'' שרונה אבן טוב', 1, N'-', 0, N'03-6974707')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (222, 40, 10, N'פסיכיאטריה', N'https://www.tasmc.org.il/Rehabilitation-Hospital/Psychiatry/Pages/Psychiatry.aspx', N'פרופ'' שאול שרייבר ד''''ר בן-יצחק שולמית', 1, N'-', 0, N'03-6974707')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (223, 40, 10, N'השירות לבריאות הנפש של האשה', N'https://www.tasmc.org.il/Rehabilitation-Hospital/Psychiatry/Woman-Psychiatry/Pages/Woman-Psychiatry.aspx', N'ד''''ר גבי אייזנברג-רומנו', 1, N'-', 0, N'
03-6974707')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (224, 40, 10, N'פסיכיאטריה', N'https://www.tasmc.org.il/Rehabilitation-Hospital/Psychiatry/Pages/Psychiatry-Treatment.aspx', N'פרופ'' מיקי בלוך ד''''ר מיכאל קרסנושטיין', 1, N'-', 0, N'03-6972080')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (225, 40, 10, N'בריאות הנפש - טיפול יום', N'https://www.tasmc.org.il/Rehabilitation-Hospital/Psychiatry/Pages/Psychiatry-DayTreatment.aspx', N'פרופ'' שאול שרייבר גב'' ספיר רבין ', 1, N'-', 0, N'03-6973485')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (226, 40, 10, N'פסיכיאטריה של הילד והמתבגר - בריאות הנפש', N'https://www.tasmc.org.il/Rehabilitation-Hospital/Psychiatry/Peds-Psychiatry/Pages/Peds-Psychiatry.aspx', N'ד''''ר רוני ורד', 1, N'-', 0, N'03-6973733')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (227, 40, 11, N'אורתופדיה - חטיבה', N'https://www.tasmc.org.il/Surgery/Orthopedics/Pages/Orthopedics.aspx', N'ד''''ר אמל חורי גב'' הילה איטינג', 1, N'07:30-21:30', 0, N'03-6973484 03-6974727 03-6974000')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (228, 40, 12, N'כירורגית א'' ', N'https://www.tasmc.org.il/Surgery/General-Surgery/Pages/Surgical-Ward-a.aspx', N'פרופ'' גיא להט מר מוחמד מרדאווי', 1, N'12:00-20:00 ', 0, N'
03-6973255')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (229, 40, 12, N'כירורגית ב''', N'https://www.tasmc.org.il/Surgery/General-Surgery/Pages/Surgical-Ward-b.aspx', N'מילנה אברמוב', 1, N'07:30-21:30', 0, N'03-6973315')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (230, 40, 13, N'אונקולוגיה', N'https://www.tasmc.org.il/Internalmed/Oncology/Pages/Oncology.aspx', N'פרופ'' עידו וולף', 1, N'17:00 – 8:00', 0, N'03-6947628')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (231, 40, 14, N'אורולוגיה', N'https://www.tasmc.org.il/Surgery/Urology/Pages/Urology.aspx', N'פרופ'' עופר יוספוביץ גב'' נטליה יארסקו', 1, N'07:30-21:30', 0, N'03-6973359 03-6974186')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (232, 40, 15, N'גריאטריה א''', N'https://www.tasmc.org.il/Rehabilitation-Hospital/Geriatrics/Pages/GeriatricsA.aspx', N'ד''''ר רון צ''ליק גב'' זינה גורביץ', 1, N'10:00-20:00', 0, N'03-6973230')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (233, 40, 15, N'פנימית גריאטרית - מחלקה', N'tasmc.org.il/Internalmed/Internal-Geriatric/Pages/default.aspx', N'ד''''ר יעל אוריון גב'' סווטלנה קור', 1, N'-', 0, N'03-6972930')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (234, 40, 15, N'גריאטריה - מערך', N'https://www.tasmc.org.il/Rehabilitation-Hospital/Geriatrics/Pages/Geriatrics.aspx', N'ד''''ר ברק אורלי', 1, N'-', 0, N'03-6974074,')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (235, 40, 16, N'המטולוגיה', N'tasmc.org.il/Internalmed/Hematology/Pages/Hematology-Hospitalization.aspx', N'פרופ'' עירית אביבי גב'' ברוריה יכיני', 1, N'07:30-21:30', 0, N'03-6974140')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (236, 40, 17, N'נוירוכירורגיה ילדים', N'https://www.tasmc.org.il/Dana-Dwek/peds-neurosurgery/Pages/peds-neurosurgery.aspx', N'פרופ'' שלומי קונסטנטיני גב'' אורנה פרידמן', 1, N'מידע רפואי ניתן לקבל בכל יום בטלפון: 03-6974686', 0, N'03-6974686 03-6974000')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (237, 40, 17, N'נוירוכירורגיה', N'https://www.tasmc.org.il/Surgery/Neurosurgery/Pages/hospitalization.aspx', N'פרופ'' צבי רם גב'' אנה סטולוב ', 1, N' 07:30-21:30', 0, N'03-6973269')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (238, 40, 18, N'נוירולוגיה', N'https://www.tasmc.org.il/Internalmed/Neurology/Pages/Neurology.aspx', N'פרופ'' ניר גלעדי גב'' לואיזה דדבייב', 1, N'-', 0, N'03-6973495 03-6973424')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (240, 40, 19, N'פתולוגיה', N'https://www.tasmc.org.il/Internalmed/Pathology/Pages/Pathology.aspx', N'פרופ'' דב הרשקוביץ', 1, N' מדי יום בין השעות 06:00-21:00.', 0, N'03-6974298 03-6973530')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (241, 40, 20, N'נשים', N'https://www.tasmc.org.il/Lis/Gynecology/Pages/Obstetrics-Gynecology.aspx', N'פרופ'' ישי לוין ד''''ר אביעד כהן', 1, N' מדי יום בין השעות 06:00-21:00.', 0, N'03-6925621
03-6925622')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (243, 40, 21, N'ראומטולוגיה', N'https://www.tasmc.org.il/Internalmed/Rheumatology/Pages/Rheumatology.aspx', N'פרופ'' אורי אלקיים גב'' מזל סלומון', 1, N'ימים א''-ד'', בין השעות 08:00-15:00; ימי ה'', בין השעות 15:00-12:00; ימי ו'' - שרות רופא תורן למקרים דחופים (דרך חדר מיון).', 0, N'03-6973243 03-6973668 ')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (244, 40, 22, N'ריאות', N'https://www.tasmc.org.il/Internalmed/Pulmonary/Pages/Pulmonary.aspx', N'ד''''ר יהודה שוורץ גב'' תמרה פרידקין', 1, N'-', 0, N'03-6973591
')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (246, 40, 22, N'ריאות ילדים', N'https://www.tasmc.org.il/Dana-Dwek/peds-lungs-sleep/Pages/peds-lungs-sleep.aspx', N'ד''''ר מורן לביא גב'' עמליה ישראל', 1, N'-', 0, N'03-6973975')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (247, 40, 23, N'כירורגיה פלסטית משחזרת ואסתטית - מערך', N'https://www.tasmc.org.il/Surgery/Plastic-Surgery/Pages/Plastic-Surgery.aspx', N'פרופ'' אייל גור גב'' ויקטוריה קבנובסקי', 1, N'-', 0, N'
03-6973402')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (248, 40, 24, N'אגף דימות', N'https://www.tasmc.org.il/Imaging/Pages/Imaging.aspx', N'פרופ'' אריק בלשר מר דוד ויזל', 1, N'ימים א''-ד'', בין השעות 08:00-15:00; ימי ה'', בין השעות 15:00-12:00; ימי ו'' - שרות רופא תורן למקרים דחופים (דרך חדר מיון).', 0, N'03-6973316 03-6974392')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (251, 49, 1, N'קרדיולוגיה', N'https://www.rambam.org.il/departmentsandclinics/internaldivision/cardiology/', N'פרופ'' ליאור גפשטיין', 1, N'א-ש 10:00-14:00
16:00-21:00', 0, N'04-7772180')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (253, 49, 2, N'כבד', N'https://www.rambam.org.il/departmentsandclinics/internaldivision/liver/', N'ד"ר אלה ויצמן', 1, N'ד 09:00-12:00 ה 09:00-12:00', 0, N' 04-7772017 04-7773049')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (254, 49, 5, N'חדר נתוח', N'https://www.rambam.org.il/departmentsandclinics/surgicaldivision/ambulatory_operating-room/', N'בלה ברויר', 1, N'א-ה 7:30-15:30', 0, N'04-7773178')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (255, 49, 6, N'מיון נשים', N'https://www.rambam.org.il/?catid=%7B86FA477A-C8BF-4271-BDD7-F9EE7FC9396B%7D', N'ד"ר מאיר נוי-נזרי', 1, N'24 שעות ביממה', 0, N'04-7771779')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (256, 49, 6, N'מיון יולדות', N'https://www.rambam.org.il/woomen_emergency/', N'ד"ר נדיר גאנם', 1, N'24 שעות ביממה', 0, N'04-7772315')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (257, 49, 7, N'הרדמה', N'https://www.rambam.org.il/departmentsandclinics/surgicaldivision/recovery_and_anesthesia/', N'ד"ר איל רז יאנה רבינוביץ', 1, N'24 שעות ביממה', 0, N'04-7772487')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (259, 49, 8, N'יולדות', N'https://www.rambam.org.il/departmentsandclinics/womenandobstetrics/maternityward/', N'ד"ר פטר יעקובי ד"ר אודי ארגז', 1, N'א-ש 10:00-14:00
16:00-21:00', 0, N' 04-7772339')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (260, 49, 9, N'ילדים', N'https://www.rambam.org.il/?catid=%7B176769CE-1765-4166-97EC-0421EE23848A%7D', N'נחמה אורדע', 1, N'א-ה 8:00-15:00', 0, N'04-7774341')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (261, 49, 10, N'בריאות הנפש', N'https://www.rambam.org.il/departmentsandclinics/mental-health-division/', N'ד"ר איל פרוכטר רינה אסולין אופיר קדם', 1, N'-', 0, N'04-7772251')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (262, 49, 10, N'פסיכיאטריה', N'https://www.rambam.org.il/departmentsandclinics/mental-health-division/emergency-psychiatry-service/', N'ד"ר אירית מרטיק', 1, N'-', 0, N' 04-7772500')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (263, 49, 11, N'אורתופדיה', N'https://www.rambam.org.il/departmentsandclinics/ruth-children-hospital/orthopedics_children/', N'פרופ'' מרק אידלמן', 1, N'א,ב,ה 12:00-14:00 ג,ד 8:00-14:00', 0, N'04-7774141')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (264, 49, 12, N'כירורגיה', N'https://www.rambam.org.il/departmentsandclinics/surgicaldivision/generalsurgery/', N'פרופ'' יורם קלוגר', 1, N'א-ה 10:00-14:00
16:00-21:00 ו 10:00-14:00
16:00-21:00 ש 10:00-14:00
16:00-21:00', 0, N'04-7772516 04-7772273')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (265, 49, 13, N'אונקולוגיה', N'rambam.org.il/?catid=%7BA01F9443-8711-44D6-AA99-06FE10F4E8F2%7D', NULL, 1, N'א-ה 08:00-15:00', 0, N'04-7772140')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (266, 49, 17, N'נוירוכירורגיה', N'https://www.rambam.org.il/?catid=%7B60F03208-4182-4023-8B6A-69EA88A0D418%7D#{54732B94-92F2-468B-8C07-170390C7C7B2}', NULL, 1, N'-', 0, N'04-7772640')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (267, 49, 18, N'נוירולוגיה', N'rambam.org.il/departmentsandclinics/internaldivision/neurology/', N'פרופ'' דוד ירניצקי יעל ספרן ', 1, N'א-ש 10:00-14:00
16:00-21:00', 0, N'04-7772830 04-7772245')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (268, 49, 19, N'פתולוגיה', N'https://www.rambam.org.il/departmentsandclinics/laboratories-division/pathological-laboratory/', N'פרופ'' עופר בן-יצחק', 1, N'-', 0, N'04-7772235')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (269, 49, 20, N'אגף נשים', N'https://www.rambam.org.il/departmentsandclinics/womenandobstetrics/women''sdivision/', N'ד"ר אמנון עמית', 1, N'-', 0, N'04-7773872')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (270, 49, 21, N'ריאמוטולוגיה', N'https://www.rambam.org.il/departmentsandclinics/internaldivision/rheumatology/rheumatology_clinic/', N'פרופ'' אלכסנדרה בלביר', 1, N'א,ג 9:00-14:00', 0, N'04-7772828 04-7772720')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (271, 49, 22, N'ריאות ילדים', N'https://www.rambam.org.il/departmentsandclinics/ruth-children-hospital/lungs_children/', N'פרופ'' לאה בנטור אירית אלישע ', 1, N'א-ה 08:00-15:00', 0, N'04-7774360')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (273, 49, 23, N'כוויות', N'https://www.rambam.org.il/?catid=%7B8CF40B0D-6C67-4387-BA2D-7E9B8503C059%7D', N'פרופ'' יהודה אולמן', 1, N'א-ש 11:00-20:00', 0, N'04-7772794 04-7772611')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (275, 50, 1, N'קרדיולוגיה', N'http://www.ziv.org.il/?CategoryID=2129&ArticleID=3048', N'ד"ר מג''די חלבי', 1, N'14:00-12:00, 21:00-16:00', 0, N'04-6828816, 077-6828844/16')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (276, 50, 2, N'כבד', N'http://www.ziv.org.il/?CategoryID=2129&ArticleID=3079&dbsAuthToken={8AB5D504-A6F4-4542-989B-2DDA3D9B7DFC}&rnd=5560736', N'ד"ר אנייס דז''יברה', 1, N'יום ה'': 9:00-12:30 יום ד'' : 9:00-14:00', 0, N'077-3631010')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (278, 50, 5, N'חדרי ניתוח', N'http://www.ziv.org.il/?CategoryID=2129&ArticleID=3799&dbsAuthToken={ADEFA496-037F-4ECF-A81B-D166E959DE88}&rnd=991159', N'מר ג''נאן נחלה', 1, N'24 שעות ביממה', 0, N'04-6828861')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (280, 50, 6, N'מיון', N'http://www.ziv.org.il/?CategoryID=2126&ArticleID=5940', N'ד"ר קרופיק דנה אוחנה אורית', 1, N'24 שעות ביממה', 0, N' 04-6828839, 077-6828836')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (282, 50, 9, N'ילדים', N'http://www.ziv.org.il/?CategoryID=2191', N'איברגימוב אלכסנדרה, ד"ר', 1, N'24 שעות ביממה', 0, N'04-6828712')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (283, 50, 10, N'פסיכיאטריה', N'http://www.ziv.org.il/?CategoryID=2126&ArticleID=3190', N'ד"ר אורי יצקר ', 1, N'8:00-16:00', 0, N'04-6828264')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (284, 50, 11, N'אורתופדיה', N'http://www.ziv.org.il/?CategoryID=2129&ArticleID=3335&dbsAuthToken={8A718C75-184B-4435-97CA-1EC9E37EB642}&rnd=6470406', N'פרופסור אלכסנדר לרנר', 1, N'א''-ש'' 14:00-12:00, 21:00-16:00', 0, N'04-6828641, 077-6828641')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (285, 50, 12, N'כירורגיה', N'http://www.ziv.org.il/?CategoryID=2129&ArticleID=3107&dbsAuthToken={59407B5E-5EEB-4DB3-BFF9-DC1C0EBAFEE3}&rnd=879564', N'ד"ר יבגני סולומונוב ד"ר אלכסיי בוקין', 1, N'ימים א''-ש'' 14:00-12:00, 21:00-16:00', 0, N'04-6828925 04-6828921')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (286, 50, 18, N'נוירולוגיה', N'http://www.ziv.org.il/?CategoryID=2126&ArticleID=5911', N' ד"ר ראדי שאהין
', 1, N'ימים א''-ש'': 12:00-14:00, 16:00-21:00.', 0, N'04-6828667')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (287, 50, 8, N'יולדות', N'http://www.ziv.org.il/?CategoryID=2246&ArticleID=3972', N'ד"ר דוד פלג גב'' רחל לוי', 1, N'24 שעות ביממה', 0, N'04-6828961')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (288, 50, 21, N'ריאמוטולוגיה', N'http://www.ziv.org.il/?CategoryID=2129&ArticleID=5730&dbsAuthToken={17011C30-6FFC-4F11-8E2A-7A3FB029B003}&rnd=6603215', N'ד"ר עדאווי מוחמד', 1, N'-', 0, N'046828726/879')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (289, 50, 22, N'ריאות', N'http://www.ziv.org.il/?CategoryID=2126&ArticleID=5937', N'ד"ר ענת עמיטל', 1, N'ימי מרפאה א ב ד', 0, NULL)
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (290, 50, 26, N'פנימית א', N'http://www.ziv.org.il/?CategoryID=2129&ArticleID=3008&dbsAuthToken={8AB5D504-A6F4-4542-989B-2DDA3D9B7DFC}&rnd=889694', N' ד"ר אוסאמה חוסין', 1, N'12:00-14:00 ו-16:00-21:00', 0, N'04-6828940/1/2')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (291, 50, 26, N'פנימית', N'http://www.ziv.org.il/?CategoryID=2129&ArticleID=3019&dbsAuthToken={8AB5D504-A6F4-4542-989B-2DDA3D9B7DFC}&rnd=1012075', N' פרופ'' ריימונד פרח', 1, N'14:00-12:00, 21:00-16:00', 0, N'04-6828949, 077-6828949')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (292, 51, 1, N'קרדיולוגיה', N'http://www.poria.health.gov.il/?CategoryID=2081&ArticleID=15', N'פרופ'' שמי קרסו', 1, N'09:30 - 07:00
20:00 - 16:00

 ', 0, N'04-6652655,

04-6652656')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (294, 51, 14, N'אורולוגיה', N'poria.health.gov.il/?CategoryID=2082&ArticleID=2', N'ד"ר קונסטנטינובסקי אלכס', 1, N'בוקר: 11:00-13:00

צהריים: 15:00-17:00

ערב: 19:00-21:00', 0, N'
04-6652640,

04-6652641

')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (296, 51, 13, N'גניקו-אונקולוגיה', N'http://www.poria.health.gov.il/?CategoryID=2082&ArticleID=3', N'ד"ר אילן אטלס', 1, N'-', 0, N'04-6652283 ,

04-6652291')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (301, 51, 16, N'המטולוגיה', N'http://www.poria.health.gov.il/?CategoryID=2082&ArticleID=13', N'ד"ר שי יגנה', 1, N'-', 0, N'04-6652291
,
04-6652283')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (302, 51, 8, N'חדר לידה', N'http://www.poria.health.gov.il/?CategoryID=2082&ArticleID=6', N'ד"ר דימטרי צ''ויין', 1, N'-', 0, N'04-6652288,
04-6652919')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (303, 51, 7, N'טיפול נמרץ לב', N'http://www.poria.health.gov.il/?CategoryID=2082&ArticleID=20', N'מר מוחמד אטרש', 1, N'08:00-09:00

12:00-13:30

16:00-17:00', 0, N'04-6652287')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (304, 51, 12, N'כירורגיה חזה', N'http://www.poria.health.gov.il/?CategoryID=2082&ArticleID=121', N'ד"ר רוני בן אבי', 1, N'-', 0, N'04-6652291,
04-6652283')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (306, 51, 18, N' נוירולוגיה', N'http://www.poria.health.gov.il/?CategoryID=2082&ArticleID=14', N'-', 1, N'-', 0, N'04-6652583 ')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (307, 51, 1, N'קרדיולוגיה ילדים', N'http://www.poria.health.gov.il/?CategoryID=2082&ArticleID=119', N'ד"ר מיינצר גור', 1, N'-', 0, N'04-6652493 
04-6652211')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (308, 51, 21, N'ראומטולוגיה', N'http://www.poria.health.gov.il/?CategoryID=2082&ArticleID=117', N'ד"ר מוחמד עדוי', 1, N'-', 0, N'04-6652211')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (309, 51, 11, N'אורטופדיה - ירך', N'http://www.poria.health.gov.il/?CategoryID=2143&ArticleID=3230', N'ד"ר יחזקאל בן יחזקאל', 1, N'-', 0, N'04-6652283')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (310, 51, 11, N'אורטופדיה - כף יד', N'http://www.poria.health.gov.il/?CategoryID=2143&ArticleID=3231', N'ד"ר מאג''ד גנאים', 1, N'-', 0, N'04-6652283')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (311, 51, 11, N'אורטופדיה - כף רגל וקרסול', N'http://www.poria.health.gov.il/?CategoryID=2143&ArticleID=3232', N'ד"ר סלמה יוסף', 1, N'-', 0, N'04-6652283')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (315, 51, 11, N'אורטופדיה - כתף', N'http://www.poria.health.gov.il/?CategoryID=2143&ArticleID=3233', N' ד"ר אליאס עובייד', 1, N'-', 0, N'04-6652283')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (317, 51, 9, N'ילדים - כללית', N'http://www.poria.health.gov.il/?CategoryID=2143&ArticleID=3225', N'ד"ר יהושע צרפין', 1, N'-', 0, N'04-6652283')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (318, 51, 9, N'ילדים - נפרולוגיה', N'http://www.poria.health.gov.il/?CategoryID=2143&ArticleID=3229', N'ד"ר ואהיל נאסר', 1, N'-', 0, N'04-6652283')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (321, 51, 1, N'ילדים - קרדיולוגיה', N'http://www.poria.health.gov.il/?CategoryID=2143&ArticleID=3227', N'ד"ר לורבר אברהם', 1, N'-', 0, N'04-6652283')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (322, 51, 8, N'פגים וילודים', N'http://www.poria.health.gov.il/?CategoryID=2143&ArticleID=3210', N'ד"ר טטיאנה סמולקין', 1, N'-', 0, N'04-6652283')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (323, 51, 15, N'גריאטריה שיקומית', N'http://www.poria.health.gov.il/?CategoryID=2081&ArticleID=6', N'ד"ר אמיתי אוברמן', 1, N'08:00-13:00

16:00-21:00

', 0, N'04-6652291,
04-6652283')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (325, 51, 7, N'הרדמה וחדר ניתוח', N'http://www.poria.health.gov.il/?CategoryID=2081&ArticleID=7', N'ד"ר מרואן ארמלי', 1, N'-', 0, N'04-6652540,

04-6652541')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (327, 51, 8, N'נשים ויולדות', N'http://www.poria.health.gov.il/?CategoryID=2081&ArticleID=11', N'פרופ'' משה בן עמי', 1, N'-', 0, N'04-6652291,
04-6652283')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (328, 51, 26, N'פנימית ב''', N'http://www.poria.health.gov.il/?CategoryID=2081&ArticleID=14', N'ד"ר סובח סובח', 1, N'07:00-08:30
12:00-20:30', 0, N'04-6652220 

04-6652302 ')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (330, 51, 26, N'פנימית א''', N'http://www.poria.health.gov.il/?CategoryID=2081&ArticleID=13', N'ד"ר וויליאם נאסיר', 1, N'07:00-08:00
12:00-21:00', 0, N'04-6652685

,04-6652686 ')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (332, 51, 6, N'רפואה דחופה (חדר מיון)', N'http://www.poria.health.gov.il/?CategoryID=2081&ArticleID=16', N'ד"ר ערן טל-אור', 1, N'-', 0, N'04-6652803,
04-6652802')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (333, 57, 13, N'אונקולוגית ילדים', N'https://hospitals.clalit.co.il/emek/he/departmentsandclinics/pediatric/Pages/children_oncology.aspx', N'ד"ר סרגיי פוסטובסקי', 1, N'א''-ה'' 8:00-15:00           ', 0, N'04-6495524, 04-6495528')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (334, 57, 13, N'טיפול יום אונקולוגי', N'https://hospitals.clalit.co.il/emek/he/departmentsandclinics/institutes/beit_shulamit/Pages/oncology_day_care.aspx', N' פרופ'' גיל בר סלע', 1, N'א''- ה'' 8:00-16:00', 0, N'04-6495540')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (335, 57, 14, N'אורולוגיה ילדים', N'https://hospitals.clalit.co.il/emek/he/departmentsandclinics/surgery/Pages/children_urology_clinic.aspx', N'ד"ר אלון משיח', 1, N'ימי א'', ג'' ', 0, N'6495000 - 04')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (336, 57, 14, N'מרפאה אורולוגית', N'https://hospitals.clalit.co.il/emek/he/departmentsandclinics/surgery/Pages/urological_clinic.aspx', N'ד"ר מיכאל כהן', 1, N'א'', ג'', ה'' 8:00-15:00', 0, N'​04-6494130')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (339, 57, 11, N'אפוסתרפיה', N'https://hospitals.clalit.co.il/emek/he/departmentsandclinics/institutes/Pages/apostherapy.aspx', N'-', 1, N'-', 0, N'2767*')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (340, 57, 11, N'אורתופדיה ילדים', N'https://hospitals.clalit.co.il/emek/he/departmentsandclinics/surgery/Pages/children_orthopedics_unit.aspx', N'ד"ר נועם בור', 1, N'8:00-12:30', 0, N'04-6494112')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (341, 57, 10, N'בריאות הנפש', N'https://hospitals.clalit.co.il/emek/he/departmentsandclinics/internal_departments/Pages/mental_healthd_department.aspx', N'ד"ר אלון רשף', 1, N'-', 0, N'04-6494351')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (342, 57, 16, N'המטולוגיה
', N'https://hospitals.clalit.co.il/emek/he/departmentsandclinics/internal_departments/Pages/hematology.aspx', N'פרופ'' גיל בר סלע', 1, N'א'' - ה'' בין השעות 07:30 - 16:00', 0, N'04-6495437')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (343, 57, 16, N'המטולוגית ילדים', N'https://hospitals.clalit.co.il/emek/he/departmentsandclinics/pediatric/Pages/pediatric_hematology.aspx', N'ד"ר קרינה לוין', 1, N'א''-ה'' 8:30-14:00', 0, N'04-6494104
')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (344, 57, 8, N'חדרי לידה', N'https://hospitals.clalit.co.il/emek/he/departmentsandclinics/women_Birth_department/moadon_yoldot_hila/Pages/delivery_rooms.aspx', N'ד"ר שבתאי רומנו', 0, N'אין ביקור אורחים במיון יולדות או בחדר לידה', 0, N'04-6494219')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (346, 57, 7, N'מחלקת הרדמה וחדרי ניתוח', N'https://hospitals.clalit.co.il/emek/he/departmentsandclinics/surgery/Pages/anesthesia_operating_rooms_department.aspx', N'ד"ר רודין מיכאל', 0, N'-', 0, N'04-6494224, 04-6494234 ')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (353, 57, 8, N'חדרי לידה', N'https://hospitals.clalit.co.il/emek/he/departmentsandclinics/women_Birth_department/moadon_yoldot_hila/Pages/delivery_rooms.aspx', N'ד"ר שבתאי רומנו', 1, N'אין ביקור אורחים במיון יולדות או בחדר לידה', 0, N'04-6494219')
GO
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (356, 57, 7, N'טיפול נמרץ כללי', N'https://hospitals.clalit.co.il/emek/he/departmentsandclinics/internal_departments/Pages/icu.aspx', N'ד"ר נצר פינקלשטיין ריצ''רד', 1, N'11:00-11:30
13:30-14:30
18:00-19:30', 0, N'04-6494353')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (358, 57, 9, N'מחלקת ילדים א''', N'https://hospitals.clalit.co.il/emek/he/departmentsandclinics/pediatric/Pages/pediatrics_department_a.aspx', N'ד"ר אבישי להד', 1, N'13:30-14:00
17:00-20:00', 0, N'04-6494010')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (359, 57, 9, N'מחלקת ילדים ב''', N'https://hospitals.clalit.co.il/emek/he/departmentsandclinics/pediatric/Pages/pediatrix_department_b.aspx', N'פרופ'' רונן שפיגל
', 1, N'מבקרים יכולים להגיע עד השעה 20:00', 0, N'04-6495512')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (361, 57, 18, N'מרפאת נוירולוגיה ילדים', N'https://hospitals.clalit.co.il/emek/he/departmentsandclinics/pediatric/Pages/pediatrix_neurology.aspx', N'-', 1, N'?ימי ראשון ורביעי        ', 0, N'04-6494123')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (363, 57, 18, N'נוירולוגיה ילדים
', N'https://hospitals.clalit.co.il/emek/he/departmentsandclinics/pediatric/Pages/pediatrix_neurology.aspx', N'-', 1, N'?ימי ראשון ורביעי               ', 0, N'04-6494123')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (366, 57, 7, N'טיפול נמרץ ילדים', N'https://hospitals.clalit.co.il/emek/he/departmentsandclinics/pediatric/Pages/pediatric_intensive_care.aspx', N'ד"ר גור זמיר', 1, N'השעות בהן רצוי לבקר הן שעות לא זוגיות:
11:00, 13:00, 17:00, 19:00, 21:00 וכו''', 0, N'04-6494409')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (367, 57, 22, N'מרפאת ריאות ילדים', N'https://hospitals.clalit.co.il/emek/he/departmentsandclinics/pediatric/Pages/pediatrix_lungs.aspx', N' ד"ר חנניה שי', 1, N'-', 0, N'6494104 -04 ')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (369, 57, 18, N'נוירולוגיה', N'https://hospitals.clalit.co.il/emek/he/departmentsandclinics/internal_departments/Pages/neurology.aspx', N'ד"ר בלוך אירינה', 1, N'-', 0, N'04-6494123, 046494228')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (370, 57, 20, N'אשפוז יום ומיון נשים
', N'https://hospitals.clalit.co.il/emek/he/departmentsandclinics/women_Birth_department/Pages/women_department_day_treatment.aspx', N' ד"ר שבתאי רומנו', 1, N'?מיון נשים נותן שירותים 24 שעות ביממה', 0, N' 04-6494036 , 04-6494495')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (373, 57, 8, N'מחלקת יולדות', N'https://hospitals.clalit.co.il/emek/he/departmentsandclinics/women_Birth_department/moadon_yoldot_hila/Pages/maternity.aspx', N'ד"ר שבתאי רומנו', 1, NULL, 0, NULL)
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (375, 58, 14, N'אורולוגיה', N'https://www.szmc.org.il/heb/Departments/Urology/About/', N'פרופ'' בוריס צ''רטין
', 1, N'-', 0, N'02-6555556')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (376, 58, 11, N'אורתופדיה ', N'https://www.szmc.org.il/heb/Departments/Orthopedics/About/', N'פרופ'' עמוס פייזר  ', 1, N'-', 0, N'02-6666470
02-6555570   ')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (377, 58, 2, N'יחידת הכבד', N'https://www.szmc.org.il/heb/Departments/Digestive-Diseases-Institute/Units/Liver-Unit/', N'ד"ר יואב לוריה', 1, N'-', 0, N'02-6555035 ')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (378, 58, 7, N'הרדמה', N'https://www.szmc.org.il/heb/Departments/Anesthesia/About/', N'פרופ'' יעקב גוזל', 1, N'-', 0, N' 02-6555104')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (379, 58, 12, N'כירורגיה כללית', N'https://www.szmc.org.il/heb/Departments/General-Surgery/About/', N'פרופ'' פתחיה רייסמן', 1, N'-', 0, N'02-6555569
 ')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (380, 58, 12, N'כירורגיה פלסטית', N'https://www.szmc.org.il/heb/Departments/Plastic-Surgery/About/', N'ד"ר יואב גרונוביץ''', 1, N'-', 0, N'02-6666375  ')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (382, 58, 12, N'כירורגית ילדים', N'https://www.szmc.org.il/heb/Departments/Peds-Surgery/About/', N'ד"ר ירון ארמון', 1, N'-', 0, N'02-6666147')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (383, 58, 17, N'נוירוכירורגיה', N'https://www.szmc.org.il/heb/Departments/Neurosurgery/ABOUT/', N'ד"ר נבו מרגלית ', 1, N'-', 0, N'02-5645722')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (384, 58, 24, N'מכון הרנטגן', N'https://www.szmc.org.il/heb/Departments/Imaging-Institute/About/', N'ד"ר עופר בנימינוב', 1, N'-', 0, N'02-6555514')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (385, 58, 15, N'גריאטריה - המערך הגריאטרי', N'https://www.szmc.org.il/heb/Departments/Geriatrics/About/', N'ד"ר ראובן פרידמן', 1, N'א''-ה'', 08:00-16:00', 0, N' 02-6555772,
02-6555572')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (386, 58, 6, N'המחלקה לרפואה דחופה (מיון)', N'https://www.szmc.org.il/heb/Departments/Department-Of-Emergency-Medicine/About/', N'ד"ר טוד זלוט', 1, N'-', 0, N'02-6555509
, 02-6555249')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (387, 58, 16, N'המטולוגיה', N'https://www.szmc.org.il/heb/Departments/Hematology/About/', N'פרופ'' יעקב רואו', 1, N'-', 0, N'02-6555204')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (388, 58, 7, N'טיפול נמרץ כללי', N'https://www.szmc.org.il/heb/Departments/ICU/About/', N'פיליפ לוין', 1, N'ימים א''-ש'':
12:00-15:00 
19:00-21:00 
22:00-23:00', 0, N'02-6555564,
02-6555764')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (390, 58, 18, N'נוירולוגיה', N'https://www.szmc.org.il/heb/Departments/Neurology/About/', N'ד"ר רוני אייכל', 1, N'-', 0, N'02-6555279, 02-5645041')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (391, 58, 22, N'מכון הריאות', N'https://www.szmc.org.il/heb/Departments/Pulmonary-Institute/About/', N'פרופ'' גבריאל איזביצקי', 1, N'א''-ה'', 08:00-20:00', 0, N'02-6555999')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (392, 58, 21, N'ראומטולוגיה', N'https://www.szmc.org.il/heb/Departments/Rheumatology/About/', N'ד"ר גבריאל ברויאר', 1, N'א''-ה'', שעות הבוקר', 0, N'02-6555999')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (393, 58, 17, N'נוירוכירורגיה', N'https://www.szmc.org.il/heb/Departments/Neurosurgery/ABOUT/', N'ד"ר נבו מרגלית 
', 1, N'-', 0, N'02-5645722')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (396, 58, 17, N'נוירוכירורגיה ילדים', N'https://www.szmc.org.il/heb/Departments/Pediatric_Neurosurgery/About/', N'ד"ר גוסטבו רייז

', 1, N'-', 0, N'-')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (397, 58, 8, N'יולדות', N'https://www.szmc.org.il/heb/Departments/Birth-At-SZ/After-The-Birth/', N'פרופ'' סורינה גריסרו גרנובסקי
', 1, N'ימים א''-ה'':
07:00-16:00 בעל ומבקר נוסף
16:30-20:30 ביקור משפחות
יום ו'' וערבי חג:
07:00-12:00 בעל ומבקר נוסף
12:00-16:00 ביקור משפחות
16:00-18:00 בעל ומבקר נוסף
18:00-20:30 ביקור משפחות
שבת וחג:
07:00-10:00 בעל ומבקר נוסף
10:00-14:00 ביקור משפחות
14:00-17:00 בעל ומבקר נוסף
17:00-21:00 ביקור משפחות (שעון חורף)
17:00-22:00 ביקור משפחות (שעון קיץ)', 0, N'02-6464252, 02-6464365')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (398, 58, 9, N'רפואה דחופה (מיון) ילדים', N'https://www.szmc.org.il/heb/Departments/Peds-Emergency-Medicine/About/', N'ד"ר גיורא חנן וייזר
', 1, N'-', 0, N'02-6555510')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (401, 58, 9, N'אורתופדית ילדים
', N'szmc.org.il/heb/Departments/Peds-Orthopedics/About/', N'ד"ר אהוד לבל', 1, N'-', 0, N'02-6555307
,02-6555634')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (405, 70, 13, N'אשפוז יום אונקולוגי', N'https://hospitals.clalit.co.il/soroka/he/med-units/oncology-inst/Pages/onco-day-care1.aspx', N'ד"ר אלכסנדר יעקובסון', 1, N'-', 0, N'08-6245000')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (406, 70, 13, N'אונקולוגית - מחלקת אשפוז', N'https://hospitals.clalit.co.il/soroka/he/med-units/oncology-inst/Pages/oncology-ward.aspx', N'ד"ר מרגריטה טוקר', 1, N'בכל יום בשעות 
7:00 - 8:00 , 12:00 - 20:30. ', 0, N' 08-6400407 ,08-6400949')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (409, 70, 14, N'אורולוגית', N'https://hospitals.clalit.co.il/soroka/he/med-units/surgery-division/Pages/urology.aspx', N' פרופ'' ניקולא מבג''יש', 1, N'בכל יום בשעות  7:30 - 21:00.', 0, N'08-6400421')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (411, 70, 11, N'אורתופדיה', N'https://hospitals.clalit.co.il/soroka/he/med-units/surgery-division/Pages/orthopedics.aspx', N'ד"ר תאי פריזם', 1, N'צוות המחלקה מעודד את בני המשפחה לשהות לצד החולה בכל שעות היממה - גם בזמן ביקור הרופאים - רצוי מלווה אחד בכל פעם כדי למנוע עומס מיותר על החולה ועל מחלקה.', 0, N'08-6403964')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (412, 70, 8, N'יולדות א', N'https://hospitals.clalit.co.il/soroka/he/med-units/ob-gyn-division/Pages/obstetrics-a.aspx', N'ד"ר דוד יוחאי', 1, N'13:00 - 14:00, 19:00 - 21:00.', 0, N'08-6400651, 08-6400655')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (413, 70, 8, N'יולדות ב', N'https://hospitals.clalit.co.il/soroka/he/med-units/ob-gyn-division/Pages/obstetrics-b.aspx', N' פרופ'' אייל שיינר', 1, N'13:00 - 14:00,
19:00 - 21:00 ', 0, N'08-6400860, 08-6400763')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (415, 70, 8, N'יולדות ג', N'https://hospitals.clalit.co.il/soroka/he/med-units/ob-gyn-division/Pages/obstetrics-c.aspx', N'פרופ'' אשר בשירי', 1, N'13:00 - 14:00,
19:00 - 20:30.', 0, N'08-6400842, 08-6400619')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (418, 70, 16, N'מכון המטולוגי - מרפאת המטולוגיה וקרישה', N'https://hospitals.clalit.co.il/soroka/he/med-units/medicine-division/Pages/coag-hema-clin.aspx', N'ד"ר איתי לוי', 1, N'-', 0, N'08-6400554')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (419, 70, 7, N'טיפול-נמרץ כללי', N'https://hospitals.clalit.co.il/soroka/he/med-units/anesthesiology-division/Pages/gicu.aspx', N'פרופ'' מוטי קליין
', 1, N'בכל יום בשעות: 
7:30 - 8:00 בבוקר
12:00 - 13:00 בצהריים 
19:00 - 20:00 בערב', 0, N'08-6403277')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (420, 70, 7, N'היחידה לטיפול-נמרץ ילדים', N'https://hospitals.clalit.co.il/soroka/he/med-units/pediatrics-division/Pages/picu.aspx', N'ד"ר יצחק לזר', 1, NULL, 0, N'08-6400223, 08-6400553')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (421, 70, 7, N'היחידה לטיפול-נמרץ פנימי', N'https://hospitals.clalit.co.il/soroka/he/med-units/medicine-division/Pages/micu.aspx', N'פרופ'' יניב אלמוג', 1, N'בכל יום בשעות 
7:30 - 8:15, 13:30 - 14:30, 19:00 - 20:00

', 0, N'08-6403389')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (423, 70, 9, N' ילדים א', N'https://hospitals.clalit.co.il/soroka/he/med-units/pediatrics-division/Pages/pediatrics-a.aspx', N'ד"ר עמית נחום', 1, N'בימים א''-ו'' בשעות 9:00 - 20:00. בימי שבת בשעות  9:00 - 21:00.', 0, N'08-6400671, 08-6400364')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (425, 70, 9, N' ילדים ב''', N'https://hospitals.clalit.co.il/soroka/he/med-units/pediatrics-division/Pages/pediatrics-b.aspx', N' פרופ'' אביב גולדברט', 1, N'בימים א''-ו'' בשעות 9:00 - 20:00. בימי שבת בשעות  9:00 - 21:00.', 0, N' 08-6400671, 08-6400364')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (427, 70, 2, N'מכון גסטרואנטרולוגיה ומחלות כבד', N'https://hospitals.clalit.co.il/soroka/he/med-units/medicine-division/Pages/gastro-institute.aspx', N'ד"ר אוהד עציון', 1, N'בימים א''-ה'' בשעות 8:00 - 16:00.

', 0, N'08-6400739,08-6403178 ')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (430, 70, 12, N'כירורגית א', N'https://hospitals.clalit.co.il/soroka/he/med-units/surgery-division/Pages/surgery-a.aspx', N'פרופ'' יצחק אביטל', 1, N'בכל יום בשעות
11:00 - 12:00, 19:00 - 20:00', 0, N'08-6403270')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (435, 70, 12, N'כירורגית ב', N'https://hospitals.clalit.co.il/soroka/he/med-units/surgery-division/Pages/surgery-b.aspx', N'פרופ'' ג''ילברט סבג', 1, N'בכל יום בשעות
11:00 - 12:00, 19:00 - 20:00', 0, N'08-6403246, 08-6400561')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (437, 70, 17, N' נוירוכירורגית', N'https://hospitals.clalit.co.il/soroka/he/med-units/surgery-division/Pages/neurosurgery.aspx', N'ד"ר ישראל מלמד', 1, N'בכל יום בשעות
11:00 - 12:00, 15:00 - 16:00,
19:00 - 20:00', 0, N'08-6400781')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (438, 70, 17, N'כירורגיית ילדים', N'https://hospitals.clalit.co.il/soroka/he/med-units/pediatrics-division/Pages/pedsurg.aspx', N'ד"ר זכי עאסי', 1, N'בכל יום בשעות 11:00 - 13:00, 16:00 - 19:00.', 0, N'08-6400661, 08-6400386')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (441, 70, 1, N'קרדיולוגיית ילדים', N'https://hospitals.clalit.co.il/soroka/he/med-units/cardiology/Pages/ped-cardio.aspx', N'ד"ר אביבה לויטס', 1, N'בימים א''-ה''
בשעות 8:00 - 16:00', 0, N'08-6245046')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (443, 70, 6, N'מיון ילדים', N'https://hospitals.clalit.co.il/soroka/he/med-units/pediatrics-division/Pages/ped-ed.aspx', N'ד"ר מיכל מימון', 1, N'-', 0, N'08-6400471, 08-6403388   ')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (444, 70, 6, N' מיון נשים', N'https://hospitals.clalit.co.il/soroka/he/med-units/ob-gyn-division/Pages/gyn-ed.aspx', N'ד"ר רועי קסוס', 1, N'?מיון נשים פועל בכל ימות השנה, 24 שעות ביממה', 0, N'08-6400462, 08-6400414')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (445, 70, 18, N'נוירולוגיה', N'https://hospitals.clalit.co.il/soroka/he/med-units/medicine-division/Pages/neurology.aspx', N'פרופ'' גל איפרגן', 1, N'בכל יום בשעות 13:00 - 20:00.0', 0, N'08-6400554')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (446, 70, 3, N' עור ומין', N'https://hospitals.clalit.co.il/soroka/he/med-units/medicine-division/Pages/dermatology.aspx', N'פרופ'' אלכסנדר זבולונוב
', 1, N'בכל יום בשעות 7:00 - 8:30, 15:00 - 16:00, 19:00 - 20:00', 0, N' 08-6400269')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (467, 61, 1, N'קרדיולוגיה', N'https://www.mymc.co.il/department/cardiology/', N'ד”ר אורן אגרנט', 1, N'צהריים – 14:45-15:00', 0, N'03-5771102')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (468, 61, 8, N'ילודים א', N'mymc.co.il/department/postnatal-department/', N'ד”ר דניאל לובין', 1, N'-', 0, N'03-5771118')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (469, 61, 8, N'ילודים ב', N'mymc.co.il/department/postnatal-department/', N'ד"ר דניאל לובין', 1, N'-', 0, N'03-5771118')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (476, 61, 6, N'רפואה דחופה מיון', N'https://www.mymc.co.il/department/department-of-emergency-medicine', N'ד”ר רונן ליבסטר', 1, N'-', 0, N'03-5771130')
INSERT [dbo].[Departments] ([DepartmentId], [HospitalId], [DepartmentTypeId], [FullName], [DepartmentUrl], [DepartmentManagerName], [IsConfirmed], [VisitTime], [IsDeleted], [Tel]) VALUES (477, 61, 9, N'ילדים', N'https://www.mymc.co.il/department/kids-department/', N'פרופ'' אלי סומך', 1, N'08:30-11:30', 0, N'03-5771117')
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[DepartmentType] ON 

INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (1, N'קרדיולוגיה – צינתורים')
INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (2, N'כבד')
INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (3, N'עור ומין')
INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (4, N' פרא רפואי')
INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (5, N'חדרי ניתוח')
INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (6, N'  מיון')
INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (7, N' הרדמה וטיפול נמרץ')
INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (8, N' יולדות')
INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (9, N'ילדים')
INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (10, N' בריאות הנפש – פסיכיאטריה')
INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (11, N'אורתופדיה')
INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (12, N'כירורגיה')
INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (13, N'אונקולוגיה')
INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (14, N'אורולוגיה')
INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (15, N'גריאטריה')
INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (16, N'המטולוגיה')
INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (17, N'נוירוכירוגיה')
INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (18, N'נוירולוגיה')
INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (19, N'פתולוגיה')
INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (20, N'נשים')
INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (21, N'ראומטולוגיה')
INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (22, N'ריאות')
INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (23, N'פלסטיקה וכוויות')
INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (24, N'דימות(רנטגן)')
INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (26, N'רפואה פנימית')
INSERT [dbo].[DepartmentType] ([DepartmentTypeId], [DepTypeName]) VALUES (27, N'טיפול ביניים')
SET IDENTITY_INSERT [dbo].[DepartmentType] OFF
SET IDENTITY_INSERT [dbo].[Hospitals] ON 

INSERT [dbo].[Hospitals] ([HospitalId], [HospitalName], [UrlAddress], [IsConfirmed], [Tel], [HosImage], [HospitalAddress]) VALUES (35, N'בלינסון', N'https://hospitals.clalit.co.il/rabin', 1, N'03-9376666', N'7c362e03-29e2-4b38-9f14-8b0e1819b9ef.jpg,04ae45aa-eaf1-4091-ace9-53c71476e78d.jpg,07b24a99-efca-4e7e-9466-829324c168f1.jpg,df17a5e4-5ea4-4446-9d34-f031c0a0dee3.jpg', N'זאב ז''בוטינסקי 39, פתח תקווה')
INSERT [dbo].[Hospitals] ([HospitalId], [HospitalName], [UrlAddress], [IsConfirmed], [Tel], [HosImage], [HospitalAddress]) VALUES (38, N'מעייני הישועה

', N'https://www.mymc.co.il/', 1, N' 03-5771111', N'8dd86ed1-7adb-4c30-971c-7d2c8e98cc01.jpeg,b1d22335-4687-40aa-a17c-6705cce20eae.jpg,dc8ba4a7-7366-475a-a4b6-132d3c103af0.jpg,4d11d459-2c90-41a0-b513-f07225585741.jpg', N'הרב פוברסקי 17, בני ברק')
INSERT [dbo].[Hospitals] ([HospitalId], [HospitalName], [UrlAddress], [IsConfirmed], [Tel], [HosImage], [HospitalAddress]) VALUES (40, N'איכילוב', N'https://www.tasmc.org.il/', 1, N'03-6974444', N'aee9bb0b-7da5-4bca-b234-8a11bcf265e0.jpg,a72c76d0-142c-4f88-a0b1-77a130c6ab5b.jpg,8eed8a1f-273c-4951-87c6-b11e527d7b4e.jpg,5a0f6f59-3a76-4389-b6b9-a0cd10e0d142.png', N' ויצמן‬ 6, תל אביב יפו')
INSERT [dbo].[Hospitals] ([HospitalId], [HospitalName], [UrlAddress], [IsConfirmed], [Tel], [HosImage], [HospitalAddress]) VALUES (44, N'שיבא-תל השומר', N'https://www.sheba.co.il/', 1, N'03-5305000', N'abc2c596-c904-4385-96fd-f5ddcff4d6ff.jpg,4e42c040-d167-448d-a5c2-f6dcbad86c1a.jpeg,fcab0348-06cf-4c8d-95d0-46662c9766b7.jpg,61b44692-298f-4622-9c52-7a886c1fe5a3.jpg', N'רמת גן 52620')
INSERT [dbo].[Hospitals] ([HospitalId], [HospitalName], [UrlAddress], [IsConfirmed], [Tel], [HosImage], [HospitalAddress]) VALUES (49, N'רמב"ם', N'https://www.rambam.org.il/', 1, N'1-700-50-51-50', N'f6835626-0932-4aae-8798-d6280a1b7a24.jpg,261e852a-f22f-42e4-acb8-53170f4a6046.jpg,20ed59ec-8e48-4310-9a0d-78102842f082.jpg,a9a5f597-4ea0-4f62-8739-6c4547235bb3.jpg', N'העליה השניה 8 בת גלים,חיפה')
INSERT [dbo].[Hospitals] ([HospitalId], [HospitalName], [UrlAddress], [IsConfirmed], [Tel], [HosImage], [HospitalAddress]) VALUES (50, N'זיו', N'http://www.ziv.org.il/', 1, N'04-682-8811', N'6002095c-cf05-47bc-af29-c4b3c07a115e.jpg,64cad490-1f88-48c8-9956-4fff0675e008.jpg,7a92f9ca-2c91-42c5-97b7-66117201af08.jpg,0d816cd6-58b6-4387-8ee7-4b0c56372c18.jpg', N' דרך הרמב"ם, צפת')
INSERT [dbo].[Hospitals] ([HospitalId], [HospitalName], [UrlAddress], [IsConfirmed], [Tel], [HosImage], [HospitalAddress]) VALUES (51, N'פוריה', N'http://www.poria.health.gov.il/', 1, N'04-665-2211', N'1ff80735-df09-4ef5-baa5-b662793e0893.png,c08c6a45-2f1e-4780-8ad6-6233ac908200.png,d80e1799-8f91-4352-b7e8-c0a6e7c1173b.jpg,0e5dbdb0-c076-4053-991d-0d5a48823ebe.png', N'דב הוז 0, טבריה')
INSERT [dbo].[Hospitals] ([HospitalId], [HospitalName], [UrlAddress], [IsConfirmed], [Tel], [HosImage], [HospitalAddress]) VALUES (57, N'העמק', N'https://hospitals.clalit.co.il/', 1, N'04-649-5000', N'c5f1b60b-89c6-46dc-8488-42b871329582.jpg,ee879f12-9694-4f5f-8724-e5f041242726.jpg,92b95be8-7046-4723-9e0a-02102b0da1ef.jpg,9f3de3c9-982b-49d8-8593-1960411bf260.jpg', N' שדרות יצחק רבין 21, עפולה')
INSERT [dbo].[Hospitals] ([HospitalId], [HospitalName], [UrlAddress], [IsConfirmed], [Tel], [HosImage], [HospitalAddress]) VALUES (58, N'שערי צדק', N'https://www.szmc.org.il/', 1, N'02-666-6666', N'a69757d3-ba97-403f-925a-37f14a387fce.jpg,942348c2-8592-4f79-a861-857342310344.jpg,61858f69-e283-4645-bea3-4150382de078.jpg,b68c7ab1-0dff-4c2e-a899-a319bbcba21c.jpg', N'שמואל בייט 12, ירושלים')
INSERT [dbo].[Hospitals] ([HospitalId], [HospitalName], [UrlAddress], [IsConfirmed], [Tel], [HosImage], [HospitalAddress]) VALUES (61, N'הדסה עין כרם', N'https://www.hadassah.org.il/', 1, N'02-677-7111', NULL, N'ירושלים')
INSERT [dbo].[Hospitals] ([HospitalId], [HospitalName], [UrlAddress], [IsConfirmed], [Tel], [HosImage], [HospitalAddress]) VALUES (65, N'משגב לדך', N'www.meuhedet.co.il', 1, N'02-567-8444', N'334cc280-e8b4-43bb-b928-76c3888b7807.jpg,9dd8a4eb-668e-43bf-9115-4b0aa893c87d.jpg,8f13672e-4fd5-4aff-899b-975f7fd68c98.jpg,372af363-08a4-4d90-8b06-7f40131cf62e.jpg', N'חזקיהו המלך 27, ירושלים')
INSERT [dbo].[Hospitals] ([HospitalId], [HospitalName], [UrlAddress], [IsConfirmed], [Tel], [HosImage], [HospitalAddress]) VALUES (70, N'המרכז הרפואי -סורוקה', N'hospitals.clalit.co.il/soroka', 1, N'08-640-0111
', N'7a1dc617-f4ca-4033-86ff-3d2ad2573f49.jpg,0ffa7b49-8333-42b4-99a6-a64e353d74d6.jpg,a39d0a81-af8a-4a40-8e5d-c1bca003440c.jpg,0d2a9502-5adc-48c5-8bbc-a4cc547bf230.jpg', N'שדרות יצחק רגר 151, באר שבע')
SET IDENTITY_INSERT [dbo].[Hospitals] OFF
SET IDENTITY_INSERT [dbo].[Opinion] ON 

INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (87, 3, 27, N'מומלץץץ!!!', N'כמעט 6 שנים אחרי קיסרי חירום בתל-השומר, הגעתי ל"מעייני הישועה" כדי למקסם את סיכויי ללידה רגילה ואני מברכת על הבחירה. על אף נתוני פתיחה מורכבים ומהלך שארך 3 ימים, הגשימו את משאלתי ויצרו לי חוויה מתקנת. לאורך כל התהליך זכיתי ליחס מכבד, רגיש והכי תומך שאפשר לבקש. אותו היחס היה מנת חלקי גם במהלך האשפוז לאחר הלידה. ממליצה בחום!!!', 5, 0, 5, 5, 5, 5, 5, 0, 5)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (88, 4, 45, N'מחלקה כמו בבית!', N'שירות מדהים,יחס חם ואוהב לילדים,דאגה ומסירות,ממליצה בחום!!', 5, 4, 5, 4, 5, 4, 5, 1, 4)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (89, 2, 66, N'התהפכו היוצרות!', N'לפני כשנתיים היו לי בעיות בריאותיות עקב משקל עודף באתי לטיפול במחלקת התזונה והדיאטה של מעיני הישועה ופשוט התהפכו היוצרות ממליצה בחום יחס מוששששש,', 4, 0, 5, 0, 5, 0, 5, 1, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (92, 6, 152, N'לידה שניה בשיבא', N'תותחיות!!לידה שניה לא מזמן מיילדת תותחית סבלנית האחיות קצת פחות אבל בסך הכל מושלם', 5, 5, 4, 4, 3, 3, 3, 1, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (93, 3, 153, N'השיעמום כלא קיים', N'המחלקה משופצת מאד! מעסיקים את הילדים 24/7 ממש הייתי מרוצה מכל הבחינות', 5, 5, 5, 5, 5, 5, 5, 1, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (94, 7, 151, N'רפואה פינימית-שיבא', N'לצערי הייתי צריך לקבל טיפול ברפואה הפנימית בבית החולים שיבא אך מרב היחס החם והטיפול המסור שקיבלתי שכחתי מכל הכאבים והצער ', 5, 5, 5, 5, 5, 4, 4, 1, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (95, 8, 171, N'הכוויות נעלמו', N'לפני כחצי שנה נשפך עלי סיר עם מים רותחים באתי מידית לשיבא למחלקת עור ומין לקבלת טיפול הייתי בטוח שישארו לי מלא צלקות כתוצאה מהכויה ,אך הצוות היה מסור ומנוסה מאדד  שלא נשאר לי זכר למה שהיה אני מודה לכל הצוות של מחלקת עור ומין על הטיפול המסור והמקצועי תודה רבה!!!', 4, 0, 4, 5, 5, 5, 5, 1, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (96, 15, 175, N'מחלקת יולדות-בלינסון', N'בית חולים מעולה! צוות במחלקת היולדות מקצועי, מתחשב, יחס מאוד אישי. מיילדות ואחיות מאוד נעימות ויוצרות חווית לידה טובה יותר.', 5, 5, 5, 5, 5, 5, 5, 1, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (99, 18, 175, N'גרוע', N'היה לא יותר מסביר, הגעתי בלילה עם דימום, בקושי התייחסו אלי עד שהתחילו לי צירים חזקים ורק אז הם הסכימו לבדוק אותי וראו פתיחה של 2 וחצי. הכניסו אותי לחדר לידה בלי שום הסברים או התחשבות. בקיצור יחס לא משהו… מיילדת לא משהו.. המחלקה הייתה בסדר. בלידה השניה אבחר מקום אחר.', 3, 3, 2, 2, 3, 1, 3, 0, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (100, 13, 176, N'שרות אדיב ומקצועי', N'מחלקה חדשה ומאובזרת,צוות אמין מסור ומקצועי ביותר ממליצה בחום רואים שיפור מידי!!!', 4, 5, 3, 4, 3, 5, 5, 1, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (101, 16, 176, NULL, N'היו לי כאבים נוראיים בגב,באתי לטיפול במחלקת אורתופדיה של בלינסון ותוך זמן קצר מאד ראיתי שפור מדהים ואני בטוח שכל זה בזכות הצוות המקצועי והמסור שדואגים לכל מטופל באופן יוצא מן הכלל', 5, 5, 5, 5, 4, 4, 0, 1, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (102, 9, 187, N'יחס מעולה', N'נהנתי מאד מכל טיפול יחס מאד טוב וצוות נחמד.', 3, 0, 4, 4, 4, 5, 2, 1, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (103, 22, 205, N'כל הכתמים נעלמו', N'היו לי כתמים נוראים בפנים כתוצאה מנטילת תרופה מסוימת,באתי לטיפול במחלקת עור ומין באיכילוב התיחסו אלי מדהים הצוות הראה נכונות לעזור לי וחל שיפור מדהים תוך זמן קצר והיום הכל חלק', 5, 5, 5, 0, 3, 4, 5, 1, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (104, 23, 206, N'מחלקה מעולה!!', N'שרות מדהים,צוות מקצועי,המקום נקי ומטופח', 4, 4, 4, 4, 4, 4, 4, 1, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (105, 23, 209, N'ממליצה בחום!', N'לא היה צריך לחכות הרבה זמן במיון כמו הכל שאר בתי החולים צוות מקצועי ואמין', 4, 0, 5, 5, 5, 3, 1, 1, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (108, 25, 217, N'למרות הקושי נהנתי מהשרות', N'סך הכל חוויה נעימה. היתה לידה לא פשוטה אבל חייבת לציין שהרופאים היו נחמדים ומקצועיים, האחיות תמכו והיו מקצועיות, ולמרות החידה הקשה, הייתי מרוצה מאוד מבית החולים.', 5, 5, 4, 4, 3, 5, 0, 1, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (109, 26, 253, N'שווה כל רגע..', N'שרות אמין,מקצועי ומסור ביותר', 5, 4, 4, 5, 5, 5, 5, 1, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (114, 7, 273, N'ממליצה לכל המחפשים את הטוב בשבילם', N'שרות אדיב,מקצועי,אמין,נחמד,מסור בקיצור המקום המושלם למי שמחפש את הטופ שבטופ', 5, 5, 5, 5, 5, 0, 5, 1, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (115, 29, 280, N'ממליצה בחום!', N'צוות מקצועי יודע להתיחס מעולה למטופלים הצוות עושה הכל כדי לתת שרות טוב נותן את כל ליבו,מקום נקי ומטופח,אפשר לסמוך עליהם ב100%', 5, 5, 5, 5, 5, 5, 5, 1, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (116, 16, 282, NULL, N'לא מומלץ,אין כמעט משחקים לילדים מקום לא כ"כ מטופח והצוות לא יודע להתיחס בחום לילדים ', 1, 1, 1, 1, 1, 0, 1, 1, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (119, 31, 292, N'ממליץ בחום!', N'שרות,מקצועיות,אמינות ואחראיות ברמה ממש טובה!', 4, 4, 4, 3, 4, 5, 5, 0, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (122, 20, 303, N'מומלץץ', N'אמא שלי היתה בטיפול נמרץ ואני הייתי איתה וכמובן היסטרית ובלחץ הצוות ידע להרגיע ולתת תחושה הכי טובה בעולם הרגשתי שפשוט אמא שלי בידיים טובות ויש על מי לסמוך תודה רבה לכל אנשי הצוות', 5, 5, 5, 5, 5, 4, 0, 1, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (123, 21, 330, NULL, N'צוות מדהים ומיוחד!', 3, 3, 3, 3, 4, 5, 3, 0, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (124, 19, 353, N'במיוחד מצפת...', N'אני מאוד אוהבת את בית חולים עפולה. באה במיוחד מצפת', 5, 5, 5, 0, 5, 0, 5, 0, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (125, 36, 356, N'טיפול מסור', N'טיפול מסור ומקצועי,ולא רק במקצועיות גם ביחס בני אנוש הצוות מדהים', 5, 5, 5, 5, 5, 3, 0, 0, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (131, 1, 27, N'מחלקה מקצועית וואנושית', N'שרות טוב מאד!,דברו איתנו בגובה העניים,ענו לנו מפורטות ובסבלנות כל מה ששאלנו ,הצוות מסור ממש,אוהב ומטפח ,ממליצה בחום', 4, 5, 4, 0, 4, 4, 4, 0, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (135, 13, 382, N'מחלקה מצוינת!', N'הצוות במחלקה עובד מסביב לשעון בשלוש משמרות,כל אחת מהאחיות מקבלת לאחריותה מספר ילדים וכל ילד זוכה לטיפול אישי ומקצועי כאילו הוא הפצינט היחידי שלה,האחיות עונות בכזו חמימות על כל שאלה ועוזרות בכל מה שנצרך.ממליצה בחום! ', 5, 5, 4, 5, 5, 0, 2, 1, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (139, 2, 68, N'לנשום בקלות', N'סבלתי מבעיות נשימה חמורות,הייתי מתעוררת בשינה מחוסר נשימה,ייעצו לי להגיע למעייני הישועה ,ושם מצאו פתרון לבעיה שלי,
והוקל עלי מאד.ראוי לציון שהיחס ממש טוב והסבירו כל מה שלא היה מובן.
אך כן משהו שניתן לשפור,זמן ההמתנה לקבלת תור ארוך ממש,חוץ מזה הכל בסדר.
', 4, 4, 5, 4, 2, 3, 0, 1, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (140, 2, 27, N'זה בית חולים על פי ההלכה ולא על פי הרפואה.', N'זה בית חולים על פי ההלכה ולא על פי הרפואה. יש מחסור עצום בצוות מקצועי כי משלמים שם פרוטות, והתחלופה של העובדים גבוהה. אל תתקרבו לבית חולים הזה לא בהריון וגם לא אחרי הלידה. מחלקת ילדים שם היא הגרועה בארץ. צריך להחליף את הצוות שם', 1, 1, 1, 1, 1, 1, 1, 0, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (141, 40, 27, N'עומס מטורף,!!!', N'הגעתי כשהיה עומס מטורף, היו לי צירים כל פחות מחמש דקות ולא קיבלו אותי לחדר במחלקה. מהשעה 12 בבוקר ועד 8 בערב בערך הסתובבתי במסדרונות ובכיתי…
המילדת היתה מקסימה לא עזבה אותי רגע.
חיכיתי כמעט שעה לתפירות.
אח"כ שכחו אותי בחדר התאוששות 6.5 שעות!!!!!!!!!!!!!!!! ולא נספר לכם באיזו צורה..
המחלקה נקיה ודי בסדר יחס נחמד.
חדר תינוקות לא מאוד נהנתי מהיחס.
אבל- לא בטוחה שלא אלך לשם שוב כי זה בבני ברק…..', 1, 1, 1, 1, 1, 1, 1, 1, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (142, 2, 169, N'ניסוי', N'ניסוי', 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (143, 2, 169, N'ניסוי ב', N'ניסוי ב', 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (144, 2, 169, N'ניסוי ג', N'ניסוי ג', 0, 0, 0, 0, 0, 0, 0, 0, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (145, 2, 170, N'אאאאא', N'עעעע', 3, 3, 3, 2, 4, 0, 3, 0, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (147, 2, 27, N'חויה מדהימה!!!', N'לדתי בקיסרי את תמר שלי
והיה מדהים התחשבו ברצון שלי ללדעת הפעם בקיסרי והיה מנש מדהים המיילדת צילמה אותי ביחד עם הקטנה בחדר ניתוח היה ממש צחוקים בקיצור מומלץ בחום', 4, 5, 2, 4, 3, 5, 3, 1, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (149, 2, 170, N'חע', N'טןכ', 0, 0, 0, 0, 0, 0, 0, 1, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (158, 2, 27, N'שרות מעולה', N'תנאים טובים,יחס מאד טוב!', 4, 4, 4, 4, 4, 4, 5, 1, 0)
INSERT [dbo].[Opinion] ([OpinionId], [UserId], [DepartmentId], [Title], [Summary], [Rating1GeneralSatisfaction], [Rating2ListenAndRelate], [Rating3GettingHelpEasily], [Rating4SharingInformation], [Rating5AnEfficientProcess], [Rating6ConditionsOfHospitalization], [Rating7PreventionOfMedicalErrors], [IsConfirmed], [TotalRating]) VALUES (159, 44, 203, N'פצצה!', N'אין כמו הצוות במחלקה!', 4, 3, 4, 4, 4, 5, 4, 1, 0)
SET IDENTITY_INSERT [dbo].[Opinion] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (1, N'יעל וינוגרד', N'yaelv0704@gmail.com', N'111', NULL, CAST(N'2020-07-19T00:00:00.000' AS DateTime), NULL, 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (2, N'יהודית פוקס', N'yeuditm123@gmail.com', N'222', NULL, CAST(N'2019-05-10T00:00:00.000' AS DateTime), NULL, 1, 1)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (3, N'רות לנדאו', N'rutlandau@gmail.com', N'333', NULL, CAST(N'2020-07-16T00:00:00.000' AS DateTime), NULL, 1, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (4, N'משה לוי', N'ml@gmail.com', N'123', NULL, CAST(N'2018-03-02T00:00:00.000' AS DateTime), NULL, 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (5, N'שירה וינוגרד', N'shv189@gmail.com', N'111', N' ', CAST(N'2020-07-26T19:53:49.210' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (6, N'yael', N'shv189@gmail.com', N'1234', N' ', CAST(N'2020-07-26T20:00:43.933' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (7, N'מאיר לוי', N'meir@gmail.com', N'789', N' ', CAST(N'2020-07-27T18:16:58.063' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (8, N'מני לוי', N'm10@gmail.com', N'636', N' ', CAST(N'2020-08-23T20:05:30.163' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (9, N'dassi yanay', N'dassi6272@gmail.com', N'6272', N' ', CAST(N'2020-08-25T12:40:29.583' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (12, N'hhh', N'hh@gmail.com', N'11', N' ', CAST(N'2020-08-30T14:41:32.017' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (13, N'michal', N'm123@gmaul.com', N'369', N' ', CAST(N'2020-09-03T09:51:52.627' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (14, N'אובי', N'uvi@gmai', N'', N' ', CAST(N'2020-09-08T20:20:48.963' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (15, N'אובי', N'uvi@gmai', N'852', N' ', CAST(N'2020-09-08T20:21:04.870' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (16, N'דניאל וינוגרד', N'd0548422211@gmail.com', N'22211', N' ', CAST(N'2020-09-09T08:19:32.410' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (17, N'chani', N'chani1@gmail.com', N'333', N' ', CAST(N'2020-09-09T16:52:09.350' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (18, N'שושי', N'shoshi@gmail.com', N'122', N' ', CAST(N'2020-09-14T11:31:53.100' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (19, N'hhh', N'h@gmail.com', N'323', N' ', CAST(N'2020-09-14T19:03:05.877' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (20, N'gg', N'fvf@gmail.com', N'121', N' ', CAST(N'2020-09-14T19:04:46.137' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (21, N'gg', N'gggg@gmail.com', N'121', N' ', CAST(N'2020-09-14T19:06:20.630' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (22, N'יהונתן', N'yv111@gmail.com', N'258', N' ', CAST(N'2020-09-24T11:23:18.527' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (23, N'עדי לרנר', N'adilerner10@gmail.com', N'1010', N' ', CAST(N'2020-10-01T11:03:40.173' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (24, N'שלומית בינדר', N'shlomitb125@gmail.com', N'125', N' ', CAST(N'2020-10-01T11:29:29.420' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (25, N'אילה גייר', N'ayalegaier695@gmail.com', N'695', N' ', CAST(N'2020-10-01T12:49:35.200' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (26, N'תמר בירינצוויג', N'tamar3269@gmail.com', N'3269', N' ', CAST(N'2020-10-01T13:14:31.667' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (27, N'תמי', N't123@gmail.com', N'236', N' ', CAST(N'2020-10-13T07:26:12.303' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (28, N'vnh', N'v@gmail.com', N'777', N' ', CAST(N'2020-10-13T07:48:09.370' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (29, N'יעלי פרדס', N'yaeliyy6@gmail.com', N'1111', NULL, CAST(N'2020-10-13T07:48:09.370' AS DateTime), NULL, 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (30, N'אביטל דודיאן', N'avitald1111@gmail.com', N'3333', NULL, CAST(N'2020-10-13T07:48:09.370' AS DateTime), NULL, 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (31, N'יהונתן ', N'yonim@gmail.com', N'554', NULL, CAST(N'2020-10-13T07:48:09.370' AS DateTime), NULL, 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (32, N'יעקב ', N'4113105@gmail.com', N'654', NULL, CAST(N'2020-10-15T12:49:35.200' AS DateTime), NULL, 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (33, N'shifi markus', N'markus.shifi@gmail.com', N'333444', NULL, CAST(N'2020-10-16T12:49:35.200' AS DateTime), NULL, 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (34, N'אלה', N'elasss@gmail.com', N'ghf', NULL, CAST(N'2020-10-15T00:00:00.000' AS DateTime), NULL, 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (35, N'michal', N'mnb@gmqil.com', N'mnb', NULL, CAST(N'2020-10-15T17:30:00.000' AS DateTime), NULL, 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (36, N'ירדן בר', N'yarden12@gmail.com', N'yarden', NULL, CAST(N'2020-09-24T11:23:18.527' AS DateTime), NULL, 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (37, N'מיקי', N'miki@gmail.com', N'257', NULL, CAST(N'2020-09-24T11:23:18.527' AS DateTime), NULL, 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (38, N'אביגיל ', N'avigail3@gmail.com', N'987', N' ', CAST(N'2020-10-20T15:42:58.437' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (39, N'sarit', N'saritzuberi@gmail.com', N'4577', N' ', CAST(N'2020-10-31T22:09:48.507' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (40, N'jakov', N'4113105@gmail.com', N'0504113105', N' ', CAST(N'2020-11-17T18:00:44.187' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (41, N'rut', N'rutlandau@gmail.com', N'526', N' ', CAST(N'2020-11-18T07:20:44.590' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (42, N'רבקי', N'rivky@gmail.com', N'058', N' ', CAST(N'2020-11-18T07:28:13.947' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (43, N'chana', N'chanaHolzer@gmail.com', N'789', N' ', CAST(N'2020-12-12T22:42:11.600' AS DateTime), N'', 0, 0)
INSERT [dbo].[Users] ([UserId], [UserName], [Email], [UserPassword], [UserImage], [CreateDate], [Summary], [IsDisabled], [IsAdmin]) VALUES (44, N'יפה', N'מאיר', N'254', N' ', CAST(N'2020-12-12T22:52:39.020' AS DateTime), N'', 0, 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Departments] ADD  CONSTRAINT [DF__Departmen__IsCon__3F466844]  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[Departments] ADD  CONSTRAINT [DF__Departmen__IsDel__403A8C7D]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Hospitals] ADD  CONSTRAINT [DF__Hospitals__IsCon__3A81B327]  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[Opinion] ADD  CONSTRAINT [DF__Opinion__IsConfi__44FF419A]  DEFAULT ((0)) FOR [IsConfirmed]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [IsDisabled]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_IsAdmin]  DEFAULT ((0)) FOR [IsAdmin]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK__Departmen__Depar__4222D4EF] FOREIGN KEY([DepartmentTypeId])
REFERENCES [dbo].[DepartmentType] ([DepartmentTypeId])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK__Departmen__Depar__4222D4EF]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD  CONSTRAINT [FK__Departmen__Hospi__412EB0B6] FOREIGN KEY([HospitalId])
REFERENCES [dbo].[Hospitals] ([HospitalId])
GO
ALTER TABLE [dbo].[Departments] CHECK CONSTRAINT [FK__Departmen__Hospi__412EB0B6]
GO
ALTER TABLE [dbo].[Opinion]  WITH CHECK ADD  CONSTRAINT [FK__Opinion__Departm__46E78A0C] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([DepartmentId])
GO
ALTER TABLE [dbo].[Opinion] CHECK CONSTRAINT [FK__Opinion__Departm__46E78A0C]
GO
ALTER TABLE [dbo].[Opinion]  WITH CHECK ADD  CONSTRAINT [FK__Opinion__UserId__45F365D3] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[Opinion] CHECK CONSTRAINT [FK__Opinion__UserId__45F365D3]
GO
USE [master]
GO
ALTER DATABASE [Hospital] SET  READ_WRITE 
GO
