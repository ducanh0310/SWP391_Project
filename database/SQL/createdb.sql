
USE [master]
GO
/****** Object:  Database [SWP391_Project]    Script Date: 14/05/2024 9:27:59 CH ******/

CREATE DATABASE [SWP391_Project]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SWP391_Project', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.NAMNP\MSSQL\DATA\SWP391_Project.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SWP391_Project_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.NAMNP\MSSQL\DATA\SWP391_Project_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SWP391_Project] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SWP391_Project].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SWP391_Project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SWP391_Project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SWP391_Project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SWP391_Project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SWP391_Project] SET ARITHABORT OFF 
GO
ALTER DATABASE [SWP391_Project] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [SWP391_Project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SWP391_Project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SWP391_Project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SWP391_Project] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SWP391_Project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SWP391_Project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SWP391_Project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SWP391_Project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SWP391_Project] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SWP391_Project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SWP391_Project] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SWP391_Project] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SWP391_Project] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SWP391_Project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SWP391_Project] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SWP391_Project] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SWP391_Project] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SWP391_Project] SET  MULTI_USER 
GO
ALTER DATABASE [SWP391_Project] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SWP391_Project] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SWP391_Project] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SWP391_Project] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SWP391_Project] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SWP391_Project] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SWP391_Project] SET QUERY_STORE = ON
GO
ALTER DATABASE [SWP391_Project] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SWP391_Project]
GO
/****** Object:  Table [dbo].[Appointment]    Script Date: 14/05/2024 9:27:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment](
	[appointment_id] [int] NOT NULL,
	[patient_id] [int] NOT NULL,
	[dentist_id] [int] NOT NULL,
	[date_of_appointment] [date] NOT NULL,
	[start_time] [time](7) NOT NULL,
	[end_time] [time](7) NOT NULL,
	[appointment_type] [varchar](255) NOT NULL,
	[appointment_status] [varchar](255) NOT NULL,
	[room] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[appointment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointment_procedure]    Script Date: 14/05/2024 9:27:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointment_procedure](
	[procedure_id] [int] NOT NULL,
	[appointment_id] [int] NOT NULL,
	[patient_id] [int] NOT NULL,
	[date_of_procedure] [date] NOT NULL,
	[invoice_id] [int] NULL,
	[procedure_code] [int] NOT NULL,
	[appointment_description] [varchar](255) NOT NULL,
	[tooth] [int] NOT NULL,
	[amount_of_procedure] [int] NOT NULL,
	[patient_charge] [numeric](10, 2) NULL,
	[insurance_charge] [numeric](10, 2) NULL,
	[total_charge] [numeric](10, 2) NOT NULL,
	[insurance_claim_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[procedure_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 14/05/2024 9:27:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[branch_id] [int] NOT NULL,
	[city] [varchar](255) NOT NULL,
	[manager_id] [int] NULL,
	[receptionist1_id] [int] NULL,
	[receptionist2_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 14/05/2024 9:27:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[employee_id] [int] NOT NULL,
	[employee_sin] [int] NOT NULL,
	[branch_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee_info]    Script Date: 14/05/2024 9:27:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_info](
	[employee_sin] [int] NOT NULL,
	[employee_type] [varchar](1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[address] [varchar](255) NOT NULL,
	[annual_salary] [numeric](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_sin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fee_charge]    Script Date: 14/05/2024 9:27:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fee_charge](
	[fee_id] [int] NOT NULL,
	[procedure_id] [int] NOT NULL,
	[fee_code] [int] NOT NULL,
	[charge] [numeric](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[fee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Insurance_claim]    Script Date: 14/05/2024 9:27:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insurance_claim](
	[claim_id] [int] NOT NULL,
	[patient_sin] [int] NOT NULL,
	[insurance_company] [varchar](255) NOT NULL,
	[plan_number] [int] NOT NULL,
	[coverage] [numeric](10, 2) NOT NULL,
	[invoice_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[claim_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 14/05/2024 9:27:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice](
	[invoice_id] [int] NOT NULL,
	[date_of_issue] [date] NOT NULL,
	[contact_info] [varchar](255) NOT NULL,
	[patient_charge] [numeric](10, 2) NOT NULL,
	[insurance_charge] [numeric](10, 2) NOT NULL,
	[discount] [numeric](10, 2) NOT NULL,
	[penalty] [numeric](10, 2) NOT NULL,
	[patient_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[invoice_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 14/05/2024 9:27:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[patient_id] [int] NOT NULL,
	[sin_info] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[patient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient_billing]    Script Date: 14/05/2024 9:27:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient_billing](
	[bill_id] [int] NOT NULL,
	[patient_id] [int] NOT NULL,
	[patient_amount] [numeric](10, 2) NOT NULL,
	[insurance_amount] [numeric](10, 2) NOT NULL,
	[total_amount] [numeric](10, 2) NOT NULL,
	[payment_type] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[bill_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient_info]    Script Date: 14/05/2024 9:27:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient_info](
	[patient_sin] [int] NOT NULL,
	[address] [varchar](255) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[gender] [varchar](1) NOT NULL,
	[email] [varchar](255) NOT NULL,
	[phone] [varchar](20) NOT NULL,
	[date_of_birth] [date] NOT NULL,
	[insurance] [varchar](255) NULL,
	[rep_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[patient_sin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient_records]    Script Date: 14/05/2024 9:27:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient_records](
	[record_id] [int] NOT NULL,
	[patient_details] [text] NOT NULL,
	[patient_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[record_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Procedure_codes]    Script Date: 14/05/2024 9:27:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Procedure_codes](
	[procedure_code] [int] NOT NULL,
	[procedure_name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[procedure_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Representative]    Script Date: 14/05/2024 9:27:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Representative](
	[representativeID] [int] NOT NULL,
	[name] [varchar](255) NULL,
	[phone] [varchar](20) NULL,
	[email] [varchar](255) NULL,
	[relationship] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[representativeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 14/05/2024 9:27:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[review_id] [int] NOT NULL,
	[dentist_name] [varchar](30) NOT NULL,
	[review_description] [varchar](255) NULL,
	[professionalism] [int] NOT NULL,
	[communication] [int] NOT NULL,
	[cleanliness] [int] NOT NULL,
	[date_of_review] [date] NOT NULL,
	[procedure_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Treatment]    Script Date: 14/05/2024 9:27:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Treatment](
	[treatment_id] [int] NOT NULL,
	[treatment_type] [varchar](255) NOT NULL,
	[medication] [varchar](255) NOT NULL,
	[symptoms] [varchar](255) NOT NULL,
	[tooth] [int] NOT NULL,
	[comments] [varchar](255) NOT NULL,
	[patient_id] [int] NOT NULL,
	[appointment_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[treatment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User_account]    Script Date: 14/05/2024 9:27:59 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_account](
	[username] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[type_id] [smallint] NULL,
	[patient_id] [int] NULL,
	[employee_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[Patient] ([patient_id])
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD  CONSTRAINT [FK_dentist_id] FOREIGN KEY([dentist_id])
REFERENCES [dbo].[Employee] ([employee_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Appointment] CHECK CONSTRAINT [FK_dentist_id]
GO
ALTER TABLE [dbo].[Appointment_procedure]  WITH CHECK ADD FOREIGN KEY([appointment_id])
REFERENCES [dbo].[Appointment] ([appointment_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Appointment_procedure]  WITH CHECK ADD FOREIGN KEY([insurance_claim_id])
REFERENCES [dbo].[Insurance_claim] ([claim_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Appointment_procedure]  WITH CHECK ADD FOREIGN KEY([invoice_id])
REFERENCES [dbo].[Invoice] ([invoice_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Appointment_procedure]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[Patient] ([patient_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Appointment_procedure]  WITH CHECK ADD FOREIGN KEY([procedure_code])
REFERENCES [dbo].[Procedure_codes] ([procedure_code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD FOREIGN KEY([manager_id])
REFERENCES [dbo].[Employee] ([employee_id])
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD FOREIGN KEY([receptionist1_id])
REFERENCES [dbo].[Employee] ([employee_id])
GO
ALTER TABLE [dbo].[Branch]  WITH CHECK ADD FOREIGN KEY([receptionist2_id])
REFERENCES [dbo].[Employee] ([employee_id])
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([branch_id])
REFERENCES [dbo].[Branch] ([branch_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([employee_sin])
REFERENCES [dbo].[Employee_info] ([employee_sin])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Fee_charge]  WITH CHECK ADD FOREIGN KEY([procedure_id])
REFERENCES [dbo].[Appointment_procedure] ([procedure_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Insurance_claim]  WITH CHECK ADD FOREIGN KEY([invoice_id])
REFERENCES [dbo].[Invoice] ([invoice_id])
GO
ALTER TABLE [dbo].[Insurance_claim]  WITH CHECK ADD FOREIGN KEY([patient_sin])
REFERENCES [dbo].[Patient_info] ([patient_sin])
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[Patient] ([patient_id])
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [FK_patient_sin] FOREIGN KEY([sin_info])
REFERENCES [dbo].[Patient_info] ([patient_sin])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [FK_patient_sin]
GO
ALTER TABLE [dbo].[Patient_billing]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[Patient] ([patient_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Patient_info]  WITH CHECK ADD FOREIGN KEY([rep_id])
REFERENCES [dbo].[Representative] ([representativeID])
GO
ALTER TABLE [dbo].[Patient_records]  WITH CHECK ADD  CONSTRAINT [FK_patient_id] FOREIGN KEY([patient_id])
REFERENCES [dbo].[Patient] ([patient_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Patient_records] CHECK CONSTRAINT [FK_patient_id]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([procedure_id])
REFERENCES [dbo].[Appointment_procedure] ([procedure_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Treatment]  WITH CHECK ADD FOREIGN KEY([appointment_id])
REFERENCES [dbo].[Appointment] ([appointment_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Treatment]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[Patient] ([patient_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User_account]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employee] ([employee_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User_account]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[Patient] ([patient_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD CHECK  (([appointment_status]='Booked' OR [appointment_status]='Completed' OR [appointment_status]='Cancelled' OR [appointment_status]='No Show'))
GO
ALTER TABLE [dbo].[Employee_info]  WITH CHECK ADD  CONSTRAINT [employee_type] CHECK  (([employee_type]='b' OR [employee_type]='h' OR [employee_type]='d' OR [employee_type]='r'))
GO
ALTER TABLE [dbo].[Employee_info] CHECK CONSTRAINT [employee_type]
GO
ALTER TABLE [dbo].[Patient_billing]  WITH CHECK ADD  CONSTRAINT [Payment_type_check] CHECK  (([payment_type]='Mastercard' OR [payment_type]='Visa' OR [payment_type]='Amex' OR [payment_type]='Cash/Debit'))
GO
ALTER TABLE [dbo].[Patient_billing] CHECK CONSTRAINT [Payment_type_check]
GO
ALTER TABLE [dbo].[Patient_info]  WITH CHECK ADD  CONSTRAINT [Age_and_representative_check] CHECK  (([date_of_birth]<=dateadd(year,(-15),getdate()) OR [date_of_birth]>dateadd(year,(-15),getdate()) AND [rep_id] IS NOT NULL))
GO
ALTER TABLE [dbo].[Patient_info] CHECK CONSTRAINT [Age_and_representative_check]
GO
ALTER TABLE [dbo].[Patient_info]  WITH CHECK ADD  CONSTRAINT [Gender_check] CHECK  (([gender]='X' OR [gender]='F' OR [gender]='M'))
GO
ALTER TABLE [dbo].[Patient_info] CHECK CONSTRAINT [Gender_check]
GO
ALTER TABLE [dbo].[Procedure_codes]  WITH CHECK ADD  CONSTRAINT [procedure_code_check] CHECK  (([procedure_code]>=(1) AND [procedure_code]<=(10)))
GO
ALTER TABLE [dbo].[Procedure_codes] CHECK CONSTRAINT [procedure_code_check]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD CHECK  (([cleanliness]>=(0) AND [cleanliness]<=(5)))
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD CHECK  (([communication]>=(0) AND [communication]<=(5)))
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD CHECK  (([professionalism]>=(0) AND [professionalism]<=(5)))
GO
ALTER TABLE [dbo].[User_account]  WITH CHECK ADD CHECK  (([type_id]>=(0) AND [type_id]<=(2)))
GO
USE [master]
GO
ALTER DATABASE [SWP391_Project] SET  READ_WRITE 
GO
