USE [master]
GO
/****** Object:  Database [CameranaVillageDB]    Script Date: 19/06/2023 20:17:47 ******/
CREATE DATABASE [CameranaVillageDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CameranaVillageDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CameranaVillageDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CameranaVillageDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\CameranaVillageDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CameranaVillageDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CameranaVillageDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CameranaVillageDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CameranaVillageDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CameranaVillageDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CameranaVillageDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CameranaVillageDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CameranaVillageDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CameranaVillageDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CameranaVillageDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CameranaVillageDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CameranaVillageDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CameranaVillageDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CameranaVillageDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CameranaVillageDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CameranaVillageDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CameranaVillageDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CameranaVillageDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CameranaVillageDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CameranaVillageDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CameranaVillageDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CameranaVillageDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CameranaVillageDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CameranaVillageDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CameranaVillageDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CameranaVillageDB] SET  MULTI_USER 
GO
ALTER DATABASE [CameranaVillageDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CameranaVillageDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CameranaVillageDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CameranaVillageDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CameranaVillageDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CameranaVillageDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CameranaVillageDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [CameranaVillageDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CameranaVillageDB]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 19/06/2023 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 19/06/2023 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 19/06/2023 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 19/06/2023 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 19/06/2023 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 19/06/2023 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[UserName] [nvarchar](max) NOT NULL,
	[FirstName] [varchar](max) NULL,
	[LastName] [varchar](max) NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 19/06/2023 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attivita]    Script Date: 19/06/2023 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attivita](
	[IdAttivita] [uniqueidentifier] NOT NULL,
	[NomeAttivita] [nvarchar](50) NOT NULL,
	[DescrizioneAttivita] [varchar](max) NOT NULL,
	[DataInizio] [datetime] NOT NULL,
	[DataFine] [datetime] NOT NULL,
	[NumeroPosti] [int] NOT NULL,
	[PrezzoAttivita] [decimal](18, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdAttivita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PrenotazioneAttivita]    Script Date: 19/06/2023 20:17:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PrenotazioneAttivita](
	[IdPrenotazioneAttivita] [uniqueidentifier] NOT NULL,
	[IdUtente] [nvarchar](450) NOT NULL,
	[IdAttivita] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPrenotazioneAttivita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'7e5bf5d3-2243-4780-ac19-25a4d9f4f953', N'301dc1ca-1811-4016-b9c1-ef23a2505d9f', N'Admin', N'ADMIN')
GO
INSERT [dbo].[AspNetRoles] ([Id], [ConcurrencyStamp], [Name], [NormalizedName]) VALUES (N'9190a5ad-2425-44c3-a8d9-76704e4de424', N'8919abf7-4cc4-4d21-88ce-82ed1c11790b', N'utente', N'UTENTE')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'79429397-5d87-4d1c-b0ac-afece3dd24bc', N'7e5bf5d3-2243-4780-ac19-25a4d9f4f953')
GO
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [FirstName], [LastName]) VALUES (N'245051e0-6bd8-4200-9319-6caafde07a93', 0, N'f42b0853-149e-4358-a152-1b9d8ae21a5b', N'ciccio@ciccio.it', 0, 1, NULL, N'CICCIO@CICCIO.IT', N'CICCIO', N'AQAAAAEAACcQAAAAEIS5JSXdvaDXcBtHOOWlfb2+GuUuFmjAdD0/8olni4grAEX8Y/8CYO6iYEzHzeI2Ew==', NULL, 0, N'FU2KOHIVB7MUSXPPY3L2XBWNP3Z26FVR', 0, N'ciccio', NULL, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [FirstName], [LastName]) VALUES (N'4094320b-2ebc-4778-bdee-40294f64513f', 0, N'469c66aa-4419-4a49-8836-6773917c4ca9', N'francy@francy.francy', 0, 1, NULL, N'FRANCY@FRANCY.FRANCY', N'FRANCY', N'AQAAAAEAACcQAAAAENaWbmzq9uxi92/me8/6wuRsZKI7zxQRsZh2izmaUtzRMXpVnru/Yjb8OWOW6p+Mqw==', NULL, 0, N'NDQYSUOUY262GQB6Q2FUMGYFKTH5VR5L', 0, N'francy', NULL, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [FirstName], [LastName]) VALUES (N'62c5442d-680b-4300-9bbb-028ab1af4513', 0, N'496d9a95-0c3c-4cc1-a72e-2a2059a363f2', N'pluto@pluto.it', 0, 1, NULL, N'PLUTO@PLUTO.IT', N'PLUTO', N'AQAAAAEAACcQAAAAEO4Ws0DXBWNqR52lRBDej00GiEZ+Lx463Q6eHrlCDkff1FAwwRBTIdz5nszRUjqhmw==', NULL, 0, N'L7REFJO2EAULFMAQSN2M7XGSZJMQJZHY', 0, N'pluto', NULL, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [FirstName], [LastName]) VALUES (N'79429397-5d87-4d1c-b0ac-afece3dd24bc', 0, N'9cfbdd19-27be-4d18-9d78-694b79ebc269', N'Admin@admin.it', 0, 1, NULL, N'ADMIN@ADMIN.IT', N'ADMIN', N'AQAAAAEAACcQAAAAEPRSPv1DLMXJJG7C2A3TvRBtujS4kY/tHeVl9lnyBwf4Mdgvn4w4EuG7opxViD8cww==', NULL, 0, N'I5OQOYRZYDPSNYXEOYNLKV7WLWN557LG', 0, N'Admin', N'Nome', N'Cognome')
GO
INSERT [dbo].[AspNetUsers] ([Id], [AccessFailedCount], [ConcurrencyStamp], [Email], [EmailConfirmed], [LockoutEnabled], [LockoutEnd], [NormalizedEmail], [NormalizedUserName], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [SecurityStamp], [TwoFactorEnabled], [UserName], [FirstName], [LastName]) VALUES (N'e67af59c-6aec-4638-8fd0-223671920171', 0, N'6b3662e4-56ac-4f59-aed4-4fab75952d20', N'pino@pino.it', 0, 1, NULL, N'PINO@PINO.IT', N'PINO', N'AQAAAAEAACcQAAAAEA1WfAqmJtILxhxtDnINWNj++eBoYqC2VQXON9ec9yXYAxJB/0vrl4gE1uDKdeWpbQ==', NULL, 0, N'JZ4WYJUAN6AQA6ECFEEGSKLN64V3IQ4A', 0, N'pino', NULL, NULL)
GO
INSERT [dbo].[Attivita] ([IdAttivita], [NomeAttivita], [DescrizioneAttivita], [DataInizio], [DataFine], [NumeroPosti], [PrezzoAttivita]) VALUES (N'480455a7-c698-4e95-aa6f-00265dc5cf13', N'Lezione di tiro con l''arco con Legolas', N'Il leggendario arciere elfico Legolas vi aspetta per un''esperienza unica di tiro con l''arco. Preparatevi a immergervi nel mondo di fantasia e ad affinare le vostre abilità di tiro con uno dei più famosi arcieri di tutti i tempi.', CAST(N'2023-07-18T10:30:00.000' AS DateTime), CAST(N'2023-07-20T12:00:00.000' AS DateTime), 20, CAST(13.70 AS Decimal(18, 2)))
GO
INSERT [dbo].[Attivita] ([IdAttivita], [NomeAttivita], [DescrizioneAttivita], [DataInizio], [DataFine], [NumeroPosti], [PrezzoAttivita]) VALUES (N'e29604e5-8fbd-4ccc-af8d-03e34867cc0f', N'Gita in barca sul fiume Anduin', N'Mentre salite a bordo della nostra imbarcazione, sentirete l''energia del fiume Anduin che scorre sotto di voi, portandovi verso nuove e affascinanti destinazioni. I paesaggi che si estendono lungo le sue sponde vi lasceranno senza fiato, con le loro verdi colline, le foreste rigogliose e le valli incantate. Osservate gli antichi ponti elfici che si riflettono sull''acqua e lasciate che la magia della Terra di Mezzo vi avvolga.', CAST(N'2023-07-15T10:30:00.000' AS DateTime), CAST(N'2023-07-20T12:00:00.000' AS DateTime), 10, CAST(42.50 AS Decimal(18, 2)))
GO
INSERT [dbo].[Attivita] ([IdAttivita], [NomeAttivita], [DescrizioneAttivita], [DataInizio], [DataFine], [NumeroPosti], [PrezzoAttivita]) VALUES (N'2cae3b87-efcb-4d50-9d88-32fe41e8487a', N'Serata al  puledro impennato', N'Appena varcherete la porta del Puledro Impennato, vi ritroverete avvolti dalla sua atmosfera accogliente e festosa. Il suono di risate e di note musicali vi accompagnerà mentre vi sedete ai tavoli di legno intagliato, pronti a vivere un''esperienza unica.', CAST(N'2023-12-31T21:30:00.000' AS DateTime), CAST(N'2024-01-01T12:00:00.000' AS DateTime), 40, CAST(15.90 AS Decimal(18, 2)))
GO
INSERT [dbo].[Attivita] ([IdAttivita], [NomeAttivita], [DescrizioneAttivita], [DataInizio], [DataFine], [NumeroPosti], [PrezzoAttivita]) VALUES (N'df96c7b7-826f-434b-b2a1-42d6dc17c51b', N'Gita a Gran Burrone', N'La vostra avventura inizia quando raggiungete il punto di partenza per la gita a Gran Burrone. Qui, sarete accolti da una guida esperta, pronta a condurvi attraverso i sentieri tortuosi e le alte pareti rocciose che circondano questa meraviglia naturale. Lasciatevi conquistare dalla maestosità del paesaggio e dall''atmosfera carica di storia che permea l''aria.', CAST(N'2023-12-15T10:30:00.000' AS DateTime), CAST(N'2023-12-16T12:00:00.000' AS DateTime), 15, CAST(15.90 AS Decimal(18, 2)))
GO
INSERT [dbo].[Attivita] ([IdAttivita], [NomeAttivita], [DescrizioneAttivita], [DataInizio], [DataFine], [NumeroPosti], [PrezzoAttivita]) VALUES (N'79b9e010-9a77-411f-9043-5e66011508a2', N'Visita alle miniere di Moria con Gandalf', N'L''atmosfera che vi circonderà durante la visita alle miniere di Moria sarà carica di mistero e di storia. Potrete ammirare le imponenti strutture di pietra e osservare le tracce degli antichi abitanti, che hanno lavorato duramente per estrarre i minerali preziosi presenti nelle profondità della terra. Gandalf vi svelerà dettagli e leggende che rendono queste miniere un luogo tanto affascinante quanto pericoloso.', CAST(N'2023-11-12T00:00:00.000' AS DateTime), CAST(N'2023-12-12T00:00:00.000' AS DateTime), 20, CAST(12.90 AS Decimal(18, 2)))
GO
INSERT [dbo].[Attivita] ([IdAttivita], [NomeAttivita], [DescrizioneAttivita], [DataInizio], [DataFine], [NumeroPosti], [PrezzoAttivita]) VALUES (N'f6cdb38a-6dab-4542-95a4-972197eac2b9', N'La Battaglia al Nero Cancello', N'Prima della battaglia, riceverete addestramento da valorosi capitani, esperti nel combattimento e nella strategia. Imparerete le mosse di spada, gli incantesimi magici e le tattiche di guerra necessarie per fronteggiare le orde nemiche. Sotto la guida di questi maestri, vi preparerete per il conflitto imminente, affinando le vostre abilità e forgiando l''unione con i vostri compagni d''armi.', CAST(N'2023-10-07T21:00:00.000' AS DateTime), CAST(N'2023-11-07T01:30:00.000' AS DateTime), 20, CAST(10.90 AS Decimal(18, 2)))
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[PrenotazioneAttivita]  WITH CHECK ADD FOREIGN KEY([IdAttivita])
REFERENCES [dbo].[Attivita] ([IdAttivita])
GO
ALTER TABLE [dbo].[PrenotazioneAttivita]  WITH CHECK ADD FOREIGN KEY([IdUtente])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
USE [master]
GO
ALTER DATABASE [CameranaVillageDB] SET  READ_WRITE 
GO
