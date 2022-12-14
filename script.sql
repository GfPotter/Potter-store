USE [master]
GO
/****** Object:  Database [Shopping]    Script Date: 7/19/2022 3:48:21 PM ******/
CREATE DATABASE [Shopping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Shopping', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Shopping.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Shopping_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Shopping_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Shopping] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Shopping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Shopping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Shopping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Shopping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Shopping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Shopping] SET ARITHABORT OFF 
GO
ALTER DATABASE [Shopping] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Shopping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Shopping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Shopping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Shopping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Shopping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Shopping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Shopping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Shopping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Shopping] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Shopping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Shopping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Shopping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Shopping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Shopping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Shopping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Shopping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Shopping] SET RECOVERY FULL 
GO
ALTER DATABASE [Shopping] SET  MULTI_USER 
GO
ALTER DATABASE [Shopping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Shopping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Shopping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Shopping] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Shopping] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Shopping] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Shopping', N'ON'
GO
ALTER DATABASE [Shopping] SET QUERY_STORE = OFF
GO
USE [Shopping]
GO
/****** Object:  Table [dbo].[checkout]    Script Date: 7/19/2022 3:48:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[checkout](
	[user_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[size] [nvarchar](50) NOT NULL,
	[quantity] [int] NULL,
	[city] [nvarchar](50) NULL,
	[address] [nvarchar](100) NULL,
	[phone] [char](10) NULL,
 CONSTRAINT [checkout_key] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC,
	[product_id] ASC,
	[size] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[member]    Script Date: 7/19/2022 3:48:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[member](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 7/19/2022 3:48:21 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[product_id] [int] IDENTITY(1,1) NOT NULL,
	[img] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[des] [nvarchar](50) NULL,
	[detail] [nvarchar](500) NULL,
	[moreinf] [nvarchar](500) NULL,
	[price] [nvarchar](50) NULL,
	[gender] [nvarchar](50) NULL,
	[img2] [nvarchar](50) NULL,
	[img3] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[checkout] ([user_id], [product_id], [size], [quantity], [city], [address], [phone]) VALUES (1, 4, N'S', 2, N'An Giang', N'1', N'0704673865')
GO
SET IDENTITY_INSERT [dbo].[member] ON 

INSERT [dbo].[member] ([user_id], [userName], [email], [password]) VALUES (1, N'quanha1', N'quanha@gmail.com', N'1')
INSERT [dbo].[member] ([user_id], [userName], [email], [password]) VALUES (2, N'quanha1', N'1@a.com', N'1')
INSERT [dbo].[member] ([user_id], [userName], [email], [password]) VALUES (3, N'quanha2', N'quanha@gmail.com', N'1')
INSERT [dbo].[member] ([user_id], [userName], [email], [password]) VALUES (4, N'admin', N'admin@gmail.com', N'123456')
SET IDENTITY_INSERT [dbo].[member] OFF
GO
SET IDENTITY_INSERT [dbo].[product] ON 

INSERT [dbo].[product] ([product_id], [img], [name], [des], [detail], [moreinf], [price], [gender], [img2], [img3]) VALUES (1, N'images/p1d1.jpg', N'Eric Shirt', N'cotton linen tencel twill', N'Camp shirt with long sleeves. Loose fit. Chest pockets with buttons. Straight bottom with side slits. Tabs at side sleeves to roll them up. Pigment garment dye. Cotton linen tencel twill.', N'• 50% cotton 25% tencel 25% linen
• Camp collar
• Loose fit
• Straight bottom
• Side slits
• Chest patch pockets
• Tab at side sleeves
• Pigment garment dye
• Machine washable with similar colors, 30°.
• Made in Portugal', N'235', N'Men', N'images/p1d2.jpg', N'images/p1d3.jpg')
INSERT [dbo].[product] ([product_id], [img], [name], [des], [detail], [moreinf], [price], [gender], [img2], [img3]) VALUES (2, N'images/p2d1.jpg', N'Pierre Pants', N'italian fresco wool', N'Two pleats pant. Loose at top leg tapered at bottom. 5 CM hem cuffed. Removable self fabric belt. 4 holes covered buttons. Italian fresco wool. Matching jacket available.', N'• 100% Virgin wool
• Two pleats
• Loose at top leg tapered at bottom
• 5 CM hem cuffed
• Buttoned fly
• Self fabric removable belt
• 4 holes covered buttons
• Dry cleaning only
• Made in Portugal', N'250', N'Men', N'images/p2d2.jpg', N'images/p2d3.jpg')
INSERT [dbo].[product] ([product_id], [img], [name], [des], [detail], [moreinf], [price], [gender], [img2], [img3]) VALUES (3, N'images/p3d1.jpg', N'Leo Jacket', N'italian cotton twill', N'Inspired from 50s denim jacket. Pleats at front body. Front buttons closure. Patch pockets. Yoke at top jacket. Belted bottom. Adjustable tab at waist. Unlined. Pigment garment dye. Italian cotton twill.', N'• 100% Coton
• Pleats at front body
• Front buttons closure
• Patch pockets
• Yoke at top jacket
• Belted bottom
• Adjustable tab at waist
• Unlined
• Dry cleaning only
• Made in Portugal', N'285', N'Men', N'images/p3d2.jpg', N'images/p3d3.jpg')
INSERT [dbo].[product] ([product_id], [img], [name], [des], [detail], [moreinf], [price], [gender], [img2], [img3]) VALUES (4, N'images/p4d1.jpg', N'Chris Sweatshirt', N'cotton', N'Raglan short sleeves crewneck sweatshirt. Chest pocket. Rib at collar and bottom. Flatlock stitching at collar, armhole and cuffs. Pigment garment dye. Loopback fleece with carbon finsih', N'• 100% cotton
• Round neck with rib collar
• Raglan sleeves
• Chest pocket
• Rib at collar and bottom
• Flatlock detail on cuffs, collar, and armholes
• Pigment garment dye
• Carbon finish
• 100% cotton
• Machine washable with similar colors, 30°.
• Made in Portugal', N'125', N'Men', N'images/p4d2.jpg', N'images/p4d3.jpg')
INSERT [dbo].[product] ([product_id], [img], [name], [des], [detail], [moreinf], [price], [gender], [img2], [img3]) VALUES (5, N'images/p5d1.jpg', N'Esteban Shirt', N'lightweight cotton', N'Long sleeves shirt with slightly tapered collar. Gathered pleats on cuffs. Chest pocket. Contrasted stitching details. Straight bottom with side slits. Pigment garment dye. Lightweight cotton', N'• 100% cotton
• Slightly tapered collar
• Gathered pleats on cuffs.
• Straight bottom
• Side slits
• Chest pocket
• Contrasted stitching details
• Pigment garment dye
• 100% cotton
• Machine washable with similar colors, 30°.
• Made in Portugal', N'175', N'Men', N'images/p5d2.jpg', N'images/p5d3.jpg')
INSERT [dbo].[product] ([product_id], [img], [name], [des], [detail], [moreinf], [price], [gender], [img2], [img3]) VALUES (6, N'images/p6d1.jpg', N'Juan Boots', N'cow leather', N'Boots inspired by mexicans horse rider in smooth leather. Leather straps around the boots that maintain it closed. Leather sole.', N'• 100% cow leather
• Leather straps
• Leather sole
• Do not wash.
• Made in Portugal', N'655', N'Men', N'images/p6d2.jpg', N'images/p6d3.jpg')
INSERT [dbo].[product] ([product_id], [img], [name], [des], [detail], [moreinf], [price], [gender], [img2], [img3]) VALUES (7, N'images/p7d1.jpg', N'Owen Pants', N'italian wool', N'Plain front pants. Slightly looser fit. Removable self fabric belt. Flap pockets at back. Italian wool.', N'• 100% Virgin wool
• Plain front.
• Slightly cropped
• Loose at top leg tapered at bottom.
• Zipped fly.
• Self fabric removable belt
• Flap pockets
• Dry cleaning only
• Made in Portugal', N'285', N'Men', N'images/p7d2.jpg', N'images/p7d3.jpg')
INSERT [dbo].[product] ([product_id], [img], [name], [des], [detail], [moreinf], [price], [gender], [img2], [img3]) VALUES (8, N'images/p8d1.jpg', N'375 Jacket', N'italian wool', N'Single breasted two buttons jacket, soft shoulder. Flap pockets, double vents at back. 4 holes self fabric covered buttons. Italian wool. Matching pants available.', N'• 100% Virgin wool
• Single breasted
• 2 buttons
• Flap pockets
• Chest pocket
• 4 holes self fabric covered buttons
• Sleeves lined
• Dry cleaning only
• Made in Portugal', N'560', N'Men', N'images/p8d2.jpg', N'images/p8d3.jpg')
INSERT [dbo].[product] ([product_id], [img], [name], [des], [detail], [moreinf], [price], [gender], [img2], [img3]) VALUES (9, N'images/p9d1.jpg', N'Chore Jacket', N'denim', N'Workwear inspired jacket, 4 buttons. Three patch pockets, topstitching details on chest. Body and sleeves unlined. Enzyme stone wash denim', N'•100% cotton
• 4 buttons
• 3 Patch pockets
• Topstitching details on chest
• Inside patch pockets
• Enzyme stone wash
• 100% cotton
• Dry cleaning only
• Made in Portugal', N'295', N'Men', N'images/p9d2.jpg', N'images/p9d3.jpg')
INSERT [dbo].[product] ([product_id], [img], [name], [des], [detail], [moreinf], [price], [gender], [img2], [img3]) VALUES (10, N'images/p10d1.jpg', N'Miles Cardigan', N'italian cotton tencel', N'Cardigan in italian cotton tencel. Jersey stitch at body and placket. Slightly looser fit. 2X2 ribs at bottom and cuffs. Front buttons closure. Two patch pockets. Yarn dye. Made in Italy.', N'• 50% Cotton 50% Tencel
• Jersey stitch at body and collar
• Slightly looser fit
• 4 buttons
• 2X2 ribs at bottom and cuffs
• Two patch pockets
• Yarn dye
• Machine washable with similar colors, 30°.
• Made in Italy', N'315', N'Men', N'images/p10d2.jpg', N'images/p10d3.jpg')
INSERT [dbo].[product] ([product_id], [img], [name], [des], [detail], [moreinf], [price], [gender], [img2], [img3]) VALUES (11, N'images/p11d1.jpg', N'Marcelle Parka', N'waterproof nylon', N'Wide rain cape with RIRI waterproof 2 way zipper front closure. Gathers all around neckline with raglan seams. Hood with adjustable gros grain drawstring. Elasticated wrist at sleeve. Inclinated side entry pockets. Waterproof italian nylon', N'• 100% polyamide
• Wide rain cape with RIRI waterproof 2 way zipper front closure.
• Gathers all around neckline with raglan seams.
• Hood with adjustable gros grain drawstring.
• Elasticated wrist at sleeve.
• Inclinated side entry pockets.
• Waterproof italian nylon.
• Dry cleaning only
• Made in Portugal', N'440', N'Women', N'images/p11d2.jpg', N'images/p11d3.jpg')
INSERT [dbo].[product] ([product_id], [img], [name], [des], [detail], [moreinf], [price], [gender], [img2], [img3]) VALUES (12, N'images/p12d1.jpg', N'Kho Jumsuit', N'gmt dye tencell', N'Jumpsuit with shoulder patches and RIRI zipper front closure. Two chest patch pockets with applied zips. Two patch pockets at front and back. Shirt collar. Long sleeves with adjustable tab inside. Tunnel around the waist with drawstring. Garment dye. 100% tencel.', N'• 100% lyocell
• Jumpsuit with shoulder patches and RIRI zipper front closure.
• Two chest patch pockets with applied zips.
• Two patch pockets at front and back.
• Shirt collar.
• Long sleeves with adjustable tab inside.
• Tunnel around the waist with drawstring.
• Garment dye.
• Machine washable with similar colors, 30°.
• Made in Portugal', N'435', N'Women', N'images/p12d2.jpg', N'images/p12d3.jpg')
INSERT [dbo].[product] ([product_id], [img], [name], [des], [detail], [moreinf], [price], [gender], [img2], [img3]) VALUES (13, N'images/p13d1.jpg', N'Marlene Skirt', N'piece dye cotton', N'Skirt with elastic waistband. Slightly A-shape with side seam pockets. Unlined. Piece dye.', N'• 100% cotton
• Slightly A-shape.
• Side seam pockets.					
• Elastic waistband.
• Unlined.
• Piece dyed.
• Machine washable with similar colors, 30°.
• Made in Portugal', N'225', N'Women', N'images/p13d2.jpg', N'images/p13d3.jpg')
INSERT [dbo].[product] ([product_id], [img], [name], [des], [detail], [moreinf], [price], [gender], [img2], [img3]) VALUES (14, N'images/p14d1.jpg', N'Calypso Tee-Shirt', N'garment dye cotton', N'Long sleeves hanley. Buttonned placket. Shoulder patch. Slighlty fitted. Flatlock finishing. Garment dye.', N'• 50% cotton 50% lyocell
• Crewneck.
• Long sleeves.
• Buttonned placket.
• Shoulder patch.
• Slighlty fitted.
• Flatlock finishing.
• Garment dye.
• Machine washable with similar colors, 30°.
• Made in Portugal', N'145', N'Women', N'images/p14d2.jpg', N'images/p14d3.jpg')
INSERT [dbo].[product] ([product_id], [img], [name], [des], [detail], [moreinf], [price], [gender], [img2], [img3]) VALUES (15, N'images/p15d1.jpg', N'Manon Jacket', N'italian wool', N'Double breasted six buttons jacket. Regular padding at shoulder.
Flap pockets, double vents at back. Italian wool. Matching pant available.', N'• 100% wool
• Double breasted with six buttons
• Regular padding at shoulder
• Flap pockets
• Double vents at back
• Matching pant available.
• Dry cleaning only
• Made in Portugal', N'450', N'Women', N'images/p15d2.jpg', N'images/p15d3.jpg')
INSERT [dbo].[product] ([product_id], [img], [name], [des], [detail], [moreinf], [price], [gender], [img2], [img3]) VALUES (16, N'images/p16d1.jpg', N'New Sophie Pants', N'italian wool', N'One pleat high waisted pant with wide leg. Side entry pockets and welt back pockets. Italian wool. Matching jacket available.', N'• 100% wool
• One pleat high waisted pant
• Wide leg
• Side entry pockets
• Welt back pockets
• Matching jacket available
• Dry cleaning only
• Made in Portugal', N'250', N'Women', N'images/p16d2.jpg', N'images/p16d3.jpg')
INSERT [dbo].[product] ([product_id], [img], [name], [des], [detail], [moreinf], [price], [gender], [img2], [img3]) VALUES (17, N'images/p17d1.jpg', N'Mathilde Jacket', N'organic cotton', N'Double breasted four buttons jacket.
Regular padding at shoulder. Patch pockets with money pocket.
Double vents at back. Matching pant available.', N'• 100% organic cotton
• Double breasted with four buttons
• Regular padding at shoulder
• Patch pockets with one patch money pocket
• Double vents at back.
• Matching pant available.
• Dry cleaning only
• Made in Portugal', N'425', N'Women', N'images/p17d2.jpg', N'images/p17d3.jpg')
INSERT [dbo].[product] ([product_id], [img], [name], [des], [detail], [moreinf], [price], [gender], [img2], [img3]) VALUES (18, N'images/p18d1.jpg', N'Dana Denim', N'denim cotton', N'One pleat 5 pockets denim with curved leg. Loose fit. One wash. Denim cotton.', N'• 100% cotton
• One pleat 5 pockets denim with curved leg.
• Loose fit.
• One wash.
• Denim cotton.
• Machine washable with similar colors, 30°.
• Made in Portugal', N'185', N'Women', N'images/p18d2.jpg', N'images/p18d3.jpg')
INSERT [dbo].[product] ([product_id], [img], [name], [des], [detail], [moreinf], [price], [gender], [img2], [img3]) VALUES (19, N'images/p19d1.jpg', N'Daisy Shirt', N'cdc silk', N'Classic collar shirt with batwing sleeve. Loose on top, slighty fitted at the waist and hip. Fold over buttoned placket. Small cuffs. Gathered pleats at cuffs. French silk.', N'• 100% silk
• Loose fit, slighty fitted at the waist and hip.
• Classic collar.
• Batwing sleeves.
• Gathered pleats at cuffs.
• Fold over button placket.
• Straight hem.
• Small cuffs.
• Piece dyed.
• Dry cleaning only
• Made in Portugal', N'435', N'Women', N'images/p19d2.jpg', N'images/p19d3.jpg')
INSERT [dbo].[product] ([product_id], [img], [name], [des], [detail], [moreinf], [price], [gender], [img2], [img3]) VALUES (20, N'images/p20d1.jpg', N'Manuela Short', N'heather tye dye co', N'Plain front short with stitched crease. Side entry pockets and welt back pockets. Adjustable waistband with drawstring. Heather tye dye cotton. Loose fit.', N'• 100% cotton
• Loose fit.
• Plain front pant with stitched crease
• Side entry pockets and welt back pockets.
• Adjustable waistband with drawstring.
• Tye dye.
• Machine washable with similar colors, 30°.
• Made in Portugal', N'145', N'Women', N'images/p20d2.jpg', N'images/p20d3.jpg')
SET IDENTITY_INSERT [dbo].[product] OFF
GO
USE [master]
GO
ALTER DATABASE [Shopping] SET  READ_WRITE 
GO
