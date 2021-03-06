USE [master]
GO
/****** Object:  Database [Библиотека]    Script Date: 29.04.2020 13:56:18 ******/
CREATE DATABASE [Библиотека]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Библиотека', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Библиотека.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Библиотека_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Библиотека_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Библиотека] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Библиотека].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Библиотека] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Библиотека] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Библиотека] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Библиотека] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Библиотека] SET ARITHABORT OFF 
GO
ALTER DATABASE [Библиотека] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Библиотека] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Библиотека] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Библиотека] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Библиотека] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Библиотека] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Библиотека] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Библиотека] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Библиотека] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Библиотека] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Библиотека] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Библиотека] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Библиотека] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Библиотека] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Библиотека] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Библиотека] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Библиотека] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Библиотека] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Библиотека] SET  MULTI_USER 
GO
ALTER DATABASE [Библиотека] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Библиотека] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Библиотека] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Библиотека] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Библиотека] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Библиотека] SET QUERY_STORE = OFF
GO
USE [Библиотека]
GO
/****** Object:  Table [dbo].[Автор]    Script Date: 29.04.2020 13:56:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Автор](
	[название] [varchar](70) NOT NULL,
 CONSTRAINT [PK_Автор] PRIMARY KEY CLUSTERED 
(
	[название] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Жанр]    Script Date: 29.04.2020 13:56:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Жанр](
	[название] [varchar](70) NOT NULL,
 CONSTRAINT [PK_Жанр] PRIMARY KEY CLUSTERED 
(
	[название] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заказ]    Script Date: 29.04.2020 13:56:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказ](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[книга] [int] NOT NULL,
	[читатель] [int] NOT NULL,
	[дата_выд] [date] NOT NULL,
	[дата_воз] [date] NOT NULL,
 CONSTRAINT [PK_Заказ] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Издательство]    Script Date: 29.04.2020 13:56:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Издательство](
	[название] [varchar](70) NOT NULL,
 CONSTRAINT [PK_Издательство] PRIMARY KEY CLUSTERED 
(
	[название] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Книга]    Script Date: 29.04.2020 13:56:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Книга](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[название] [varchar](70) NOT NULL,
	[автор] [varchar](70) NOT NULL,
	[год_изд] [date] NOT NULL,
	[жанр] [varchar](70) NOT NULL,
	[издательство] [varchar](70) NOT NULL,
	[место_изд] [varchar](70) NOT NULL,
	[язык] [varchar](70) NOT NULL,
	[формат_книги] [varchar](70) NOT NULL,
	[пер_выхода] [varchar](70) NOT NULL,
	[место_хран] [varchar](70) NOT NULL,
 CONSTRAINT [PK_Книга] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Место_изд]    Script Date: 29.04.2020 13:56:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Место_изд](
	[название] [varchar](70) NOT NULL,
 CONSTRAINT [PK_Место_изд] PRIMARY KEY CLUSTERED 
(
	[название] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Место_хран]    Script Date: 29.04.2020 13:56:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Место_хран](
	[название] [varchar](70) NOT NULL,
 CONSTRAINT [PK_Место_хран] PRIMARY KEY CLUSTERED 
(
	[название] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ПарольАдмин]    Script Date: 29.04.2020 13:56:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ПарольАдмин](
	[пароль] [varchar](70) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Периодичность]    Script Date: 29.04.2020 13:56:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Периодичность](
	[название] [varchar](70) NOT NULL,
 CONSTRAINT [PK_Периодичность] PRIMARY KEY CLUSTERED 
(
	[название] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Формат]    Script Date: 29.04.2020 13:56:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Формат](
	[название] [varchar](70) NOT NULL,
 CONSTRAINT [PK_Формат] PRIMARY KEY CLUSTERED 
(
	[название] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Читатель]    Script Date: 29.04.2020 13:56:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Читатель](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[фамилия] [varchar](70) NOT NULL,
	[имя] [varchar](70) NOT NULL,
	[отчество] [varchar](70) NOT NULL,
	[адрес] [varchar](70) NOT NULL,
	[телефон] [varchar](70) NOT NULL,
	[пароль] [varchar](70) NOT NULL,
 CONSTRAINT [PK_Читатель] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Язык]    Script Date: 29.04.2020 13:56:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Язык](
	[название] [varchar](70) NOT NULL,
 CONSTRAINT [PK_Язык] PRIMARY KEY CLUSTERED 
(
	[название] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Автор] ([название]) VALUES (N'Гоголь')
INSERT [dbo].[Автор] ([название]) VALUES (N'Даня')
INSERT [dbo].[Автор] ([название]) VALUES (N'Иванов')
INSERT [dbo].[Автор] ([название]) VALUES (N'Кирилл')
INSERT [dbo].[Автор] ([название]) VALUES (N'Петров')
INSERT [dbo].[Автор] ([название]) VALUES (N'Пушкин')
INSERT [dbo].[Автор] ([название]) VALUES (N'Сидоров')
INSERT [dbo].[Автор] ([название]) VALUES (N'Смыслов')
INSERT [dbo].[Автор] ([название]) VALUES (N'Толстой')
INSERT [dbo].[Автор] ([название]) VALUES (N'Хабибулин')
INSERT [dbo].[Автор] ([название]) VALUES (N'Чехов')
GO
INSERT [dbo].[Жанр] ([название]) VALUES (N'Детектив')
INSERT [dbo].[Жанр] ([название]) VALUES (N'Классика')
INSERT [dbo].[Жанр] ([название]) VALUES (N'Комедия')
INSERT [dbo].[Жанр] ([название]) VALUES (N'Наука')
INSERT [dbo].[Жанр] ([название]) VALUES (N'Повесть')
INSERT [dbo].[Жанр] ([название]) VALUES (N'Поэма')
INSERT [dbo].[Жанр] ([название]) VALUES (N'Рассказ')
INSERT [dbo].[Жанр] ([название]) VALUES (N'Религия')
INSERT [dbo].[Жанр] ([название]) VALUES (N'Роман')
GO
SET IDENTITY_INSERT [dbo].[Заказ] ON 

INSERT [dbo].[Заказ] ([id], [книга], [читатель], [дата_выд], [дата_воз]) VALUES (14, 1007, 3, CAST(N'2020-04-20' AS Date), CAST(N'2020-04-29' AS Date))
INSERT [dbo].[Заказ] ([id], [книга], [читатель], [дата_выд], [дата_воз]) VALUES (15, 1007, 4, CAST(N'2020-04-16' AS Date), CAST(N'2020-04-19' AS Date))
INSERT [dbo].[Заказ] ([id], [книга], [читатель], [дата_выд], [дата_воз]) VALUES (16, 1007, 5, CAST(N'2020-04-19' AS Date), CAST(N'2020-04-20' AS Date))
INSERT [dbo].[Заказ] ([id], [книга], [читатель], [дата_выд], [дата_воз]) VALUES (17, 1007, 3, CAST(N'2020-04-22' AS Date), CAST(N'2020-04-24' AS Date))
INSERT [dbo].[Заказ] ([id], [книга], [читатель], [дата_выд], [дата_воз]) VALUES (18, 1007, 7, CAST(N'2020-04-23' AS Date), CAST(N'2020-04-29' AS Date))
SET IDENTITY_INSERT [dbo].[Заказ] OFF
GO
INSERT [dbo].[Издательство] ([название]) VALUES (N'Бином')
INSERT [dbo].[Издательство] ([название]) VALUES (N'МТКП')
INSERT [dbo].[Издательство] ([название]) VALUES (N'Питер')
INSERT [dbo].[Издательство] ([название]) VALUES (N'Смыслофт')
INSERT [dbo].[Издательство] ([название]) VALUES (N'ЭСМО')
GO
SET IDENTITY_INSERT [dbo].[Книга] ON 

INSERT [dbo].[Книга] ([id], [название], [автор], [год_изд], [жанр], [издательство], [место_изд], [язык], [формат_книги], [пер_выхода], [место_хран]) VALUES (1007, N'Мертвые души', N'Гоголь', CAST(N'1842-01-01' AS Date), N'Поэма', N'Смыслофт', N'Москва', N'Русский', N'Крупный', N'Непериодическое', N'Склад1')
INSERT [dbo].[Книга] ([id], [название], [автор], [год_изд], [жанр], [издательство], [место_изд], [язык], [формат_книги], [пер_выхода], [место_хран]) VALUES (1008, N'Вий', N'Гоголь', CAST(N'1835-01-01' AS Date), N'Повесть', N'МТКП', N'Крым', N'Английский', N'Малый', N'Непериодическое', N'Склад2')
INSERT [dbo].[Книга] ([id], [название], [автор], [год_изд], [жанр], [издательство], [место_изд], [язык], [формат_книги], [пер_выхода], [место_хран]) VALUES (1009, N'Палата #6', N'Чехов', CAST(N'1892-01-01' AS Date), N'Повесть', N'Питер', N'Сочи', N'Украинский', N'Сверхкрупный', N'Непериодическое', N'Склад1')
INSERT [dbo].[Книга] ([id], [название], [автор], [год_изд], [жанр], [издательство], [место_изд], [язык], [формат_книги], [пер_выхода], [место_хран]) VALUES (1010, N'Хамелеон', N'Чехов', CAST(N'1884-01-01' AS Date), N'Рассказ', N'Смыслофт', N'Ростов', N'Французский', N'Малый', N'Непериодическое', N'Склад1')
INSERT [dbo].[Книга] ([id], [название], [автор], [год_изд], [жанр], [издательство], [место_изд], [язык], [формат_книги], [пер_выхода], [место_хран]) VALUES (1011, N'Ревизор', N'Гоголь', CAST(N'1835-01-01' AS Date), N'Комедия', N'Смыслофт', N'Волгоград', N'Немекий', N'Сверхкрупный', N'Непериодическое', N'Склад2')
INSERT [dbo].[Книга] ([id], [название], [автор], [год_изд], [жанр], [издательство], [место_изд], [язык], [формат_книги], [пер_выхода], [место_хран]) VALUES (1012, N'Евгений Онегин', N'Пушкин', CAST(N'1833-01-01' AS Date), N'Роман', N'Смыслофт', N'Москва', N'Английский', N'Крупный', N'Непериодическое', N'Склад2')
INSERT [dbo].[Книга] ([id], [название], [автор], [год_изд], [жанр], [издательство], [место_изд], [язык], [формат_книги], [пер_выхода], [место_хран]) VALUES (1013, N'Капитанская дочка', N'Пушкин', CAST(N'1836-01-01' AS Date), N'Роман', N'Смыслофт', N'Москва', N'Русский', N'Малый', N'Непериодическое', N'Склад2')
INSERT [dbo].[Книга] ([id], [название], [автор], [год_изд], [жанр], [издательство], [место_изд], [язык], [формат_книги], [пер_выхода], [место_хран]) VALUES (1014, N'Практика', N'Смыслов', CAST(N'2020-04-22' AS Date), N'Наука', N'Смыслофт', N'Москва', N'Русский', N'Сверхкрупный', N'Периодическое', N'Склад2')
SET IDENTITY_INSERT [dbo].[Книга] OFF
GO
INSERT [dbo].[Место_изд] ([название]) VALUES (N'Волгоград')
INSERT [dbo].[Место_изд] ([название]) VALUES (N'Крым')
INSERT [dbo].[Место_изд] ([название]) VALUES (N'Москва')
INSERT [dbo].[Место_изд] ([название]) VALUES (N'Ростов')
INSERT [dbo].[Место_изд] ([название]) VALUES (N'Сочи')
GO
INSERT [dbo].[Место_хран] ([название]) VALUES (N'Склад1')
INSERT [dbo].[Место_хран] ([название]) VALUES (N'Склад2')
GO
INSERT [dbo].[ПарольАдмин] ([пароль]) VALUES (N'15СмысловАА!')
GO
INSERT [dbo].[Периодичность] ([название]) VALUES (N'Непериодическое')
INSERT [dbo].[Периодичность] ([название]) VALUES (N'Периодическое')
GO
INSERT [dbo].[Формат] ([название]) VALUES (N'Крупный')
INSERT [dbo].[Формат] ([название]) VALUES (N'Малый')
INSERT [dbo].[Формат] ([название]) VALUES (N'Сверхкрупный')
GO
SET IDENTITY_INSERT [dbo].[Читатель] ON 

INSERT [dbo].[Читатель] ([id], [фамилия], [имя], [отчество], [адрес], [телефон], [пароль]) VALUES (3, N'Смыслов', N'Александр', N'Андреевич', N'Бездомный', N'7 (777) 777-77-77', N'15Смыслов!')
INSERT [dbo].[Читатель] ([id], [фамилия], [имя], [отчество], [адрес], [телефон], [пароль]) VALUES (4, N'Тагирова', N'Дарья', N'Артемьевна', N'Бездомная', N'7 (777) 777-77-77', N'15Тагирова%')
INSERT [dbo].[Читатель] ([id], [фамилия], [имя], [отчество], [адрес], [телефон], [пароль]) VALUES (5, N'Дуров', N'Павел', N'Валерьевич', N'Телеграм', N'6(666)6666666', N'15Dyrov$')
INSERT [dbo].[Читатель] ([id], [фамилия], [имя], [отчество], [адрес], [телефон], [пароль]) VALUES (7, N'Петров', N'Иван', N'Борисович', N'Бакунинская алея 71 корпус 59', N'7 (859) 999-77-99', N'15Иван#')
SET IDENTITY_INSERT [dbo].[Читатель] OFF
GO
INSERT [dbo].[Язык] ([название]) VALUES (N'Английский')
INSERT [dbo].[Язык] ([название]) VALUES (N'Немекий')
INSERT [dbo].[Язык] ([название]) VALUES (N'Русский')
INSERT [dbo].[Язык] ([название]) VALUES (N'Украинский')
INSERT [dbo].[Язык] ([название]) VALUES (N'Французский')
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_Книга] FOREIGN KEY([книга])
REFERENCES [dbo].[Книга] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_Книга]
GO
ALTER TABLE [dbo].[Заказ]  WITH CHECK ADD  CONSTRAINT [FK_Заказ_Читатель] FOREIGN KEY([читатель])
REFERENCES [dbo].[Читатель] ([id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Заказ] CHECK CONSTRAINT [FK_Заказ_Читатель]
GO
ALTER TABLE [dbo].[Книга]  WITH CHECK ADD  CONSTRAINT [FK_Книга_Автор] FOREIGN KEY([автор])
REFERENCES [dbo].[Автор] ([название])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Книга] CHECK CONSTRAINT [FK_Книга_Автор]
GO
ALTER TABLE [dbo].[Книга]  WITH CHECK ADD  CONSTRAINT [FK_Книга_Жанр] FOREIGN KEY([жанр])
REFERENCES [dbo].[Жанр] ([название])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Книга] CHECK CONSTRAINT [FK_Книга_Жанр]
GO
ALTER TABLE [dbo].[Книга]  WITH CHECK ADD  CONSTRAINT [FK_Книга_Издательство] FOREIGN KEY([издательство])
REFERENCES [dbo].[Издательство] ([название])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Книга] CHECK CONSTRAINT [FK_Книга_Издательство]
GO
ALTER TABLE [dbo].[Книга]  WITH CHECK ADD  CONSTRAINT [FK_Книга_Место_изд] FOREIGN KEY([место_изд])
REFERENCES [dbo].[Место_изд] ([название])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Книга] CHECK CONSTRAINT [FK_Книга_Место_изд]
GO
ALTER TABLE [dbo].[Книга]  WITH CHECK ADD  CONSTRAINT [FK_Книга_Место_хран] FOREIGN KEY([место_хран])
REFERENCES [dbo].[Место_хран] ([название])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Книга] CHECK CONSTRAINT [FK_Книга_Место_хран]
GO
ALTER TABLE [dbo].[Книга]  WITH CHECK ADD  CONSTRAINT [FK_Книга_Периодичность] FOREIGN KEY([пер_выхода])
REFERENCES [dbo].[Периодичность] ([название])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Книга] CHECK CONSTRAINT [FK_Книга_Периодичность]
GO
ALTER TABLE [dbo].[Книга]  WITH CHECK ADD  CONSTRAINT [FK_Книга_Формат] FOREIGN KEY([формат_книги])
REFERENCES [dbo].[Формат] ([название])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Книга] CHECK CONSTRAINT [FK_Книга_Формат]
GO
ALTER TABLE [dbo].[Книга]  WITH CHECK ADD  CONSTRAINT [FK_Книга_Язык] FOREIGN KEY([язык])
REFERENCES [dbo].[Язык] ([название])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Книга] CHECK CONSTRAINT [FK_Книга_Язык]
GO
USE [master]
GO
ALTER DATABASE [Библиотека] SET  READ_WRITE 
GO
