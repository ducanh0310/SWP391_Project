USE [master]
GO
/****** Object:  Database [SWP391_Project]    Script Date: 15/05/2024 8:36:42 SA ******/
IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'SWP391_Project')
BEGIN
	ALTER DATABASE SWP391_Project SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE SWP391_Project SET ONLINE;
	DROP DATABASE SWP391_Project;
END

GO
create database SWP391_Project
GO
USE [SWP391_Project]
GO

CREATE TABLE [dbo].[Representative](
	[representativeID] [int] IDENTITY(1,1) PRIMARY KEY,
	[name] [varchar](255) NULL,
	[phone] [varchar](20) NULL,
	[email] [varchar](255) NULL,
	[relationship] [varchar](255) NULL,
) 
/****** Object:  Table [dbo].[Appointment]    Script Date: 15/05/2024 8:36:43 SA ******/
/****** Object:  Table [dbo].[Patient_info]    Script Date: 15/05/2024 8:36:43 SA ******/

CREATE TABLE [dbo].[Patient](
	[Patient_id] [int] IDENTITY(1,1) PRIMARY KEY,
	[patient_sin] [int] NULL,
	[address] [varchar](255) NULL,
	[name] [varchar](255) NOT NULL,
	[gender] [varchar](1) NULL,
	[email] [varchar](255) NOT NULL,
	[phone] [varchar](20) NULL,
	[date_of_birth] [date] NULL,
	[insurance] [varchar](255) NULL,
	[rep_id] [int] NULL FOREIGN KEY REFERENCES [Representative] ([representativeID]),
)
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 15/05/2024 8:36:43 SA ******/
CREATE TABLE [dbo].[Employee](
	[employee_id] [int] IDENTITY(1,1) PRIMARY KEY,
	[employee_sin] [int] NULL,
	[employee_type] [varchar](1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[address] [varchar](255) NOT NULL,
	[annual_salary] [numeric](10, 2) NOT NULL,
	[branch_id] [int] NOT NULL,
)
GO
/****** Object:  Table [dbo].[Procedure_codes]    Script Date: 15/05/2024 8:36:43 SA ******/

CREATE TABLE [dbo].[Procedure_codes](
	[procedure_id] [int] IDENTITY(1,1) PRIMARY KEY,
	[procedure_name] [varchar](255) NULL,
)
GO
/****** Object:  Table [dbo].[Invoice]    Script Date: 15/05/2024 8:36:43 SA ******/
CREATE TABLE [dbo].[Invoice](
	[invoice_id] [int] IDENTITY(1,1) PRIMARY KEY,
	[date_of_issue] [date] NOT NULL,
	[contact_info] [varchar](255) NOT NULL,
	[patient_charge] [numeric](10, 2) NOT NULL,
	[insurance_charge] [numeric](10, 2) NOT NULL,
	[discount] [numeric](10, 2) NOT NULL,
	[penalty] [numeric](10, 2) NOT NULL,
	[patient_id] [int] NOT NULL FOREIGN KEY REFERENCES [Patient]([patient_id]),
)
GO
/****** Object:  Table [dbo].[Insurance_claim]    Script Date: 15/05/2024 8:36:43 SA ******/
CREATE TABLE [dbo].[Insurance_claim](
	[claim_id] [int] IDENTITY(1,1) PRIMARY KEY,
	[Patient_id] [int] NOT NULL FOREIGN KEY REFERENCES [Patient]([patient_id]),
	[insurance_company] [varchar](255) NOT NULL,
	[plan_number] [int] NOT NULL,
	[coverage] [numeric](10, 2) NOT NULL,
	[invoice_id] [int] NOT NULL FOREIGN KEY REFERENCES [Invoice] ([invoice_id]),
) 
GO
CREATE TABLE [dbo].[Appointment](
	[appointment_id] [int] IDENTITY(1,1) PRIMARY KEY,
	[patient_id] [int] NOT NULL FOREIGN KEY REFERENCES [Patient]([patient_id]),
	[dentist_id] [int] NOT NULL FOREIGN KEY REFERENCES [Employee]([employee_id]),
	[date_of_appointment] [date] NOT NULL,
	[start_time] [time](7) NOT NULL,
	[end_time] [time](7) NOT NULL,
	[appointment_type] [varchar](255) NOT NULL,
	[appointment_status] [varchar](255) NOT NULL,
	[room] [int] NOT NULL,
)
GO
/****** Object:  Table [dbo].[Appointment_procedure]    Script Date: 15/05/2024 8:36:43 SA ******/

CREATE TABLE [dbo].[Appointment_procedure](
	[Appointment_procedure_id] [int] IDENTITY(1,1) PRIMARY KEY,
	[appointment_id] [int] NOT NULL FOREIGN KEY REFERENCES [dbo].[Appointment] ([appointment_id]),
	[patient_id] [int] NOT NULL FOREIGN KEY REFERENCES [Patient]([patient_id]),
	[date_of_procedure] [date] NOT NULL,
	[invoice_id] [int] NULL  FOREIGN KEY REFERENCES [Invoice]([invoice_id]),
	[procedure_id] [int]  FOREIGN KEY REFERENCES [Procedure_codes] ([procedure_id]),
	[appointment_description] [varchar](255) NOT NULL,
	[tooth] [int] NOT NULL,
	[amount_of_procedure] [int] NOT NULL,
	[patient_charge] [numeric](10, 2) NULL,
	[insurance_charge] [numeric](10, 2) NULL,
	[total_charge] [numeric](10, 2) NOT NULL,
	[insurance_claim_id] [int] NULL FOREIGN KEY REFERENCES [dbo].[Insurance_claim] ([claim_id]),
)
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 15/05/2024 8:36:43 SA ******/

CREATE TABLE [dbo].[Branch](
	[branch_id] [int] IDENTITY(1,1) PRIMARY KEY,
	[city] [varchar](255) NOT NULL,
	[manager_id] [int] FOREIGN KEY REFERENCES [Employee]([employee_id]),
	[receptionist1_id] [int] FOREIGN KEY REFERENCES [Employee]([employee_id]),
	[receptionist2_id] [int] FOREIGN KEY REFERENCES [Employee]([employee_id]),
) 
GO

GO
/****** Object:  Table [dbo].[Fee_charge]    Script Date: 15/05/2024 8:36:43 SA ******/
CREATE TABLE [dbo].[Fee_charge](
	[fee_id] [int] IDENTITY(1,1) PRIMARY KEY,
	[procedure_id] [int] NOT NULL  FOREIGN KEY REFERENCES [Appointment_procedure]([Appointment_procedure_id]),
	[fee_code] [int] NOT NULL,
	[charge] [numeric](10, 2) NOT NULL,
)
GO
/****** Object:  Table [dbo].[Patient_billing]    Script Date: 15/05/2024 8:36:43 SA ******/

CREATE TABLE [dbo].[Patient_billing](
	[bill_id] [int]IDENTITY(1,1) PRIMARY KEY,
	[patient_id] [int] NOT NULL FOREIGN KEY REFERENCES [Patient]([patient_id]),
	[patient_amount] [numeric](10, 2) NOT NULL,
	[insurance_amount] [numeric](10, 2) NOT NULL,
	[total_amount] [numeric](10, 2) NOT NULL,
	[payment_type] [varchar](255) NOT NULL,
)
GO
GO
/****** Object:  Table [dbo].[Patient_records]    Script Date: 15/05/2024 8:36:43 SA ******/

CREATE TABLE [dbo].[Patient_records](
	[record_id] [int] IDENTITY(1,1) PRIMARY KEY,
	[patient_details] [text] NOT NULL,
	[patient_id] [int] NOT NULL FOREIGN KEY REFERENCES [Patient]([patient_id]),
	)
GO
/****** Object:  Table [dbo].[Representative]    Script Date: 15/05/2024 8:36:43 SA ******/
GO
/****** Object:  Table [dbo].[Review]    Script Date: 15/05/2024 8:36:43 SA ******/

CREATE TABLE [dbo].[Review](
	[review_id] [int] IDENTITY(1,1) PRIMARY KEY,
	[dentist_name] [varchar](30) NULL,
	[review_description] [varchar](255) NULL,
	[professionalism] [int] NULL,
	[communication] [int] NULL,
	[cleanliness] [int] NULL,
	[date_of_review] [date] NULL,
	[procedure_id] [int] NOT NULL FOREIGN KEY REFERENCES [dbo].[Appointment] ([appointment_id]),
)
GO
/****** Object:  Table [dbo].[Treatment]    Script Date: 15/05/2024 8:36:43 SA ******/

CREATE TABLE [dbo].[Treatment](
	[treatment_id] [int] IDENTITY(1,1) PRIMARY KEY,
	[treatment_type] [varchar](255) NOT NULL,
	[medication] [varchar](255) NOT NULL,
	[symptoms] [varchar](255) NOT NULL,
	[tooth] [int] NOT NULL,
	[comments] [varchar](255) NOT NULL,
	[patient_id] [int] NOT NULL FOREIGN KEY REFERENCES [Patient]([patient_id]),
	[appointment_id] [int] NOT NULL FOREIGN KEY REFERENCES [Appointment]([appointment_id]),
)
GO
/****** Object:  Table [dbo].[User_account]    Script Date: 15/05/2024 8:36:43 SA ******/
CREATE TABLE [dbo].[User_account](
	[username] [varchar](255) NOT NULL,
	[password] [varchar](255) NOT NULL,
	[type_id] [smallint] NULL,
	[patient_id] [int] NULL FOREIGN KEY REFERENCES [Patient]([patient_id]),
	[employee_id] [int] NULL FOREIGN KEY REFERENCES [Employee]([employee_id]),
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
GO
INSERT [dbo].[Patient] ( [patient_sin], [address], [name], [gender], [email], [phone], [date_of_birth], [insurance], [rep_id]) VALUES (164645466, N'123 Sesame Street', N'Elmo Lee', N'M', N'elmo@elmail.com', N'6664206969', CAST(N'2000-01-01' AS Date), NULL, NULL)
INSERT [dbo].[Patient] ( [patient_sin], [address], [name], [gender], [email], [phone], [date_of_birth], [insurance], [rep_id]) VALUES ( 111111111, N'529 Random Road', N'Stephie McRandom', N'F', N'random@gmail.com', N'1231231234', CAST(N'2012-01-01' AS Date), N'Random Insurance Company Inc.', 1)
INSERT [dbo].[Patient] ( [patient_sin], [address], [name], [gender], [email], [phone], [date_of_birth], [insurance], [rep_id]) VALUES ( 111111112, N'529 Random Road', N'Paul McRandomee', N'M', N'randomee@gmail.com', N'5551231234', CAST(N'2008-01-01' AS Date), N'Random Insurance Company Inc.', 2)
INSERT [dbo].[Patient] ( [patient_sin], [address], [name], [gender], [email], [phone], [date_of_birth], [insurance], [rep_id]) VALUES ( 515151547, N'525 Elgin Street', N'Brooke Lay', N'F', N'brooke@gamil.com', N'3436589636', CAST(N'2002-06-08' AS Date), NULL, NULL)
INSERT [dbo].[Patient] ( [patient_sin], [address], [name], [gender], [email], [phone], [date_of_birth], [insurance], [rep_id]) VALUES ( 388498874, N'1225 Imaginary Street, Toronto, ON, Canada', N'John Li', N'M', N'john@gmail.com', N'3437826548', CAST(N'2000-09-03' AS Date), NULL, NULL)
GO
SET IDENTITY_INSERT [Appointment] on
INSERT [dbo].[Appointment] ([appointment_id], [patient_id], [dentist_id], [date_of_appointment], [start_time], [end_time], [appointment_type], [appointment_status], [room]) VALUES (1, 3, 3, CAST(N'2022-04-14' AS Date), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), N'3', N'Completed', 5)
INSERT [dbo].[Appointment] ([appointment_id], [patient_id], [dentist_id], [date_of_appointment], [start_time], [end_time], [appointment_type], [appointment_status], [room]) VALUES (2, 2, 3, CAST(N'2022-04-02' AS Date), CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), N'2', N'Cancelled', 1)
INSERT [dbo].[Appointment] ([appointment_id], [patient_id], [dentist_id], [date_of_appointment], [start_time], [end_time], [appointment_type], [appointment_status], [room]) VALUES (3, 2, 3, CAST(N'2022-04-03' AS Date), CAST(N'08:30:00' AS Time), CAST(N'09:00:00' AS Time), N'3', N'No Show', 2)
INSERT [dbo].[Appointment] ([appointment_id], [patient_id], [dentist_id], [date_of_appointment], [start_time], [end_time], [appointment_type], [appointment_status], [room]) VALUES (4, 2, 2, CAST(N'2022-04-04' AS Date), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), N'3', N'Completed', 23)
INSERT [dbo].[Appointment] ([appointment_id], [patient_id], [dentist_id], [date_of_appointment], [start_time], [end_time], [appointment_type], [appointment_status], [room]) VALUES (5, 2, 2, CAST(N'2022-04-05' AS Date), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), N'4', N'Completed', 21)
INSERT [dbo].[Appointment] ([appointment_id], [patient_id], [dentist_id], [date_of_appointment], [start_time], [end_time], [appointment_type], [appointment_status], [room]) VALUES (6, 2, 3, CAST(N'2022-04-06' AS Date), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), N'1', N'Completed', 13)
INSERT [dbo].[Appointment] ([appointment_id], [patient_id], [dentist_id], [date_of_appointment], [start_time], [end_time], [appointment_type], [appointment_status], [room]) VALUES (7, 2, 6, CAST(N'2022-05-20' AS Date), CAST(N'14:00:00' AS Time), CAST(N'14:30:00' AS Time), N'2', N'Booked', 11)
INSERT [dbo].[Appointment] ([appointment_id], [patient_id], [dentist_id], [date_of_appointment], [start_time], [end_time], [appointment_type], [appointment_status], [room]) VALUES (8, 2, 3, CAST(N'2022-09-15' AS Date), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), N'8', N'Booked', 15)
INSERT [dbo].[Appointment] ([appointment_id], [patient_id], [dentist_id], [date_of_appointment], [start_time], [end_time], [appointment_type], [appointment_status], [room]) VALUES (9, 1, 6, CAST(N'2022-10-01' AS Date), CAST(N'11:00:00' AS Time), CAST(N'13:00:00' AS Time), N'10', N'Completed', 8)
INSERT [dbo].[Appointment] ([appointment_id], [patient_id], [dentist_id], [date_of_appointment], [start_time], [end_time], [appointment_type], [appointment_status], [room]) VALUES (10, 3, 3, CAST(N'2022-11-10' AS Date), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), N'6', N'Booked', 10)
INSERT [dbo].[Appointment] ([appointment_id], [patient_id], [dentist_id], [date_of_appointment], [start_time], [end_time], [appointment_type], [appointment_status], [room]) VALUES (11, 4, 4, CAST(N'2022-06-10' AS Date), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), N'8', N'Booked', 8)
INSERT [dbo].[Appointment] ([appointment_id], [patient_id], [dentist_id], [date_of_appointment], [start_time], [end_time], [appointment_type], [appointment_status], [room]) VALUES (12, 5, 4, CAST(N'2022-04-15' AS Date), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), N'2', N'Completed', 3)
INSERT [dbo].[Appointment] ([appointment_id], [patient_id], [dentist_id], [date_of_appointment], [start_time], [end_time], [appointment_type], [appointment_status], [room]) VALUES (13, 5, 4, CAST(N'2022-07-21' AS Date), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), N'1', N'Booked', 2)
SET IDENTITY_INSERT [Appointment] OFF
GO
SET IDENTITY_INSERT [Appointment_procedure] ON
INSERT [dbo].[Appointment_procedure] ([Appointment_procedure], [appointment_id], [patient_id], [date_of_procedure], [invoice_id], [procedure_id], [appointment_description], [tooth], [amount_of_procedure], [patient_charge], [insurance_charge], [total_charge], [insurance_claim_id]) VALUES (1, 1, 3, CAST(N'2022-04-14' AS Date), 1, 3, N'We need to remove the wisdom tooth of the patient', 8, 1, CAST(500.00 AS Numeric(10, 2)), NULL, CAST(500.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Appointment_procedure] ([Appointment_procedure], [appointment_id], [patient_id], [date_of_procedure], [invoice_id], [procedure_id], [appointment_description], [tooth], [amount_of_procedure], [patient_charge], [insurance_charge], [total_charge], [insurance_claim_id]) VALUES (2, 2, 2, CAST(N'2022-04-02' AS Date), 2, 2, N'Annual patient dental cleaning', 999, 1, CAST(0.00 AS Numeric(10, 2)), NULL, CAST(0.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Appointment_procedure] ([Appointment_procedure], [appointment_id], [patient_id], [date_of_procedure], [invoice_id], [procedure_id], [appointment_description], [tooth], [amount_of_procedure], [patient_charge], [insurance_charge], [total_charge], [insurance_claim_id]) VALUES (3, 3, 2, CAST(N'2022-04-03' AS Date), 3, 2, N'Annual patient dental cleaning', 999, 1, CAST(14.00 AS Numeric(10, 2)), NULL, CAST(14.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Appointment_procedure] ([Appointment_procedure], [appointment_id], [patient_id], [date_of_procedure], [invoice_id], [procedure_id], [appointment_description], [tooth], [amount_of_procedure], [patient_charge], [insurance_charge], [total_charge], [insurance_claim_id]) VALUES (4, 4, 2, CAST(N'2022-04-04' AS Date), 4, 2, N'Annual patient dental cleaning', 999, 1, CAST(20.00 AS Numeric(10, 2)), CAST(80.00 AS Numeric(10, 2)), CAST(100.00 AS Numeric(10, 2)), 2)
INSERT [dbo].[Appointment_procedure] ([Appointment_procedure], [appointment_id], [patient_id], [date_of_procedure], [invoice_id], [procedure_id], [appointment_description], [tooth], [amount_of_procedure], [patient_charge], [insurance_charge], [total_charge], [insurance_claim_id]) VALUES (5, 5, 2, CAST(N'2022-04-05' AS Date), 5, 2, N'Teeth Whitening appointment', 999, 1, CAST(100.00 AS Numeric(10, 2)), CAST(900.00 AS Numeric(10, 2)), CAST(1000.00 AS Numeric(10, 2)), 3)
INSERT [dbo].[Appointment_procedure] ([Appointment_procedure], [appointment_id], [patient_id], [date_of_procedure], [invoice_id], [procedure_id], [appointment_description], [tooth], [amount_of_procedure], [patient_charge], [insurance_charge], [total_charge], [insurance_claim_id]) VALUES (6, 6, 2, CAST(N'2022-04-06' AS Date), 6, 9, N'Bonding appointment', 21, 1, CAST(300.00 AS Numeric(10, 2)), CAST(200.00 AS Numeric(10, 2)), CAST(500.00 AS Numeric(10, 2)), 4)
INSERT [dbo].[Appointment_procedure] ([Appointment_procedure], [appointment_id], [patient_id], [date_of_procedure], [invoice_id], [procedure_id], [appointment_description], [tooth], [amount_of_procedure], [patient_charge], [insurance_charge], [total_charge], [insurance_claim_id]) VALUES (7, 7, 2, CAST(N'2022-09-15' AS Date), NULL, 8, N'Invisalign appointment', 999, 1, NULL, NULL, CAST(7200.00 AS Numeric(10, 2)), NULL)
INSERT [dbo].[Appointment_procedure] ([Appointment_procedure], [appointment_id], [patient_id], [date_of_procedure], [invoice_id], [procedure_id], [appointment_description], [tooth], [amount_of_procedure], [patient_charge], [insurance_charge], [total_charge], [insurance_claim_id]) VALUES (8, 12, 5, CAST(N'2022-04-15' AS Date), 7, 2, N'Teeth whitening appointment', 999, 1, CAST(200.00 AS Numeric(10, 2)), NULL, CAST(200.00 AS Numeric(10, 2)), NULL)
SET IDENTITY_INSERT [Appointment_procedure] OFF
GO
INSERT [dbo].[Employee] ([employee_sin], [employee_type], [name], [address], [annual_salary], [branch_id]) VALUES (123456789, N'r', N'Bob Marley', N'123 Postgres Street, Ottawa, ON, Canada', CAST(60000.25 AS Numeric(10, 2)), 1)
INSERT [dbo].[Employee] ([employee_sin], [employee_type], [name], [address], [annual_salary], [branch_id]) VALUES (141286236, N'd', N'Tisham Islam', N'123 Postgres Street, Ottawa, ON, Canada', CAST(75000.50 AS Numeric(10, 2)), 1)
INSERT [dbo].[Employee] ([employee_sin], [employee_type], [name], [address], [annual_salary], [branch_id]) VALUES (158453648, N'd', N'C�line Wan', N'123 Postgres Street, Ottawa, ON, Canada', CAST(75000.50 AS Numeric(10, 2)), 1)
INSERT [dbo].[Employee] ([employee_sin], [employee_type], [name], [address], [annual_salary], [branch_id]) VALUES (198523644, N'h', N'Amy Kkiti', N'123 Postgres Street, Ottawa, ON, Canada', CAST(65000.50 AS Numeric(10, 2)), 1)
INSERT [dbo].[Employee] ([employee_sin], [employee_type], [name], [address], [annual_salary], [branch_id]) VALUES (165984846, N'b', N'Kien Do', N'523 Sesame Street, Ottawa, ON, Canada', CAST(83000.50 AS Numeric(10, 2)), 1)
INSERT [dbo].[Employee] ([employee_sin], [employee_type], [name], [address], [annual_salary], [branch_id]) VALUES (388498874, N'd', N'John Li', N'1225 Imaginary Street, Toronto, ON, Canada', CAST(70000.50 AS Numeric(10, 2)), 2)
INSERT [dbo].[Employee] ([employee_sin], [employee_type], [name], [address], [annual_salary], [branch_id]) VALUES (432364646, N'd', N'Samy Touabi', N'5346 Postgres Avenue, Toronto, ON, Canada', CAST(70000.50 AS Numeric(10, 2)), 2)
INSERT [dbo].[Employee] ([employee_sin], [employee_type], [name], [address], [annual_salary], [branch_id]) VALUES (665946369, N'r', N'Oliva Mars', N'355 MySQL Road, Toronto, ON, Canada', CAST(55000.50 AS Numeric(10, 2)), 2)
INSERT [dbo].[Employee] ([employee_sin], [employee_type], [name], [address], [annual_salary], [branch_id]) VALUES (135941655, N'r', N'Christopher Castillo', N'885 NoSQL Drive, Toronto, ON, Canada', CAST(55000.50 AS Numeric(10, 2)), 2)
INSERT [dbo].[Employee] ([employee_sin], [employee_type], [name], [address], [annual_salary], [branch_id]) VALUES (256356565, N'h', N'Nakul Lover', N'5243 MariaDB Crossing, Toronto, ON, Canada', CAST(60000.50 AS Numeric(10, 2)), 2)
INSERT [dbo].[Employee] ([employee_sin], [employee_type], [name], [address], [annual_salary], [branch_id]) VALUES (956233565, N'b', N'Bruno Bale', N'420 Oracle Street, Toronto, ON, Canada', CAST(83000.50 AS Numeric(10, 2)), 2)
GO
INSERT [dbo].[Branch] ([city], [manager_id], [receptionist1_id], [receptionist2_id]) VALUES ( N'Ottawa', 5, 1, NULL)
INSERT [dbo].[Branch] ([city], [manager_id], [receptionist1_id], [receptionist2_id]) VALUES ( N'Toronto', 11, 8, 9)
GO
INSERT [dbo].[Fee_charge] ( [procedure_id], [fee_code], [charge]) VALUES ( 1, 123, CAST(400.00 AS Numeric(10, 2)))
INSERT [dbo].[Fee_charge] ( [procedure_id], [fee_code], [charge]) VALUES ( 1, 124, CAST(100.00 AS Numeric(10, 2)))
INSERT [dbo].[Fee_charge] ( [procedure_id], [fee_code], [charge]) VALUES ( 2, -100, CAST(0.00 AS Numeric(10, 2)))
INSERT [dbo].[Fee_charge] ( [procedure_id], [fee_code], [charge]) VALUES ( 3, 94303, CAST(14.00 AS Numeric(10, 2)))
INSERT [dbo].[Fee_charge] ( [procedure_id], [fee_code], [charge]) VALUES ( 4, 100, CAST(100.00 AS Numeric(10, 2)))
INSERT [dbo].[Fee_charge] ( [procedure_id], [fee_code], [charge]) VALUES ( 5, 107, CAST(800.00 AS Numeric(10, 2)))
INSERT [dbo].[Fee_charge] ( [procedure_id], [fee_code], [charge]) VALUES ( 5, 125, CAST(200.00 AS Numeric(10, 2)))
INSERT [dbo].[Fee_charge] ( [procedure_id], [fee_code], [charge]) VALUES ( 6, 109, CAST(500.00 AS Numeric(10, 2)))
INSERT [dbo].[Fee_charge] ( [procedure_id], [fee_code], [charge]) VALUES ( 8, 3423, CAST(200.00 AS Numeric(10, 2)))
GO
INSERT [dbo].[Insurance_claim] ( [patient_id], [insurance_company], [plan_number], [coverage], [invoice_id]) VALUES ( 1, N'SunLife Insurance', 91833, CAST(200.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Insurance_claim] ( [patient_id], [insurance_company], [plan_number], [coverage], [invoice_id]) VALUES ( 2, N'Random Insurance Company Inc.', 11111, CAST(80.00 AS Numeric(10, 2)), 4)
INSERT [dbo].[Insurance_claim] ( [patient_id], [insurance_company], [plan_number], [coverage], [invoice_id]) VALUES ( 2, N'Random Insurance Company Inc.', 11111, CAST(900.00 AS Numeric(10, 2)), 5)
INSERT [dbo].[Insurance_claim] ([patient_id], [insurance_company], [plan_number], [coverage], [invoice_id]) VALUES ( 2, N'Random Insurance Company Inc.', 11111, CAST(200.00 AS Numeric(10, 2)), 6)
GO
SET IDENTITY_INSERT [Invoice] ON
INSERT [dbo].[Invoice] ([invoice_id], [date_of_issue], [contact_info], [patient_charge], [insurance_charge], [discount], [penalty], [patient_id]) VALUES (1, CAST(N'2022-04-05' AS Date), N'The Downtown Dental Clinic
  Ottawa ON K1P 6L7
  (613) 234-0792
  ', CAST(500.00 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), 1)
INSERT [dbo].[Invoice] ([invoice_id], [date_of_issue], [contact_info], [patient_charge], [insurance_charge], [discount], [penalty], [patient_id]) VALUES (2, CAST(N'2022-04-02' AS Date), N'The Downtown Dental Clinic
  Ottawa ON K1P 6L7
  (613) 234-0792
  ', CAST(0.00 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), 2)
INSERT [dbo].[Invoice] ([invoice_id], [date_of_issue], [contact_info], [patient_charge], [insurance_charge], [discount], [penalty], [patient_id]) VALUES (3, CAST(N'2022-04-03' AS Date), N'The Downtown Dental Clinic
  Ottawa ON K1P 6L7
  (613) 234-0792
  ', CAST(0.00 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), CAST(14.00 AS Numeric(10, 2)), 2)
INSERT [dbo].[Invoice] ([invoice_id], [date_of_issue], [contact_info], [patient_charge], [insurance_charge], [discount], [penalty], [patient_id]) VALUES (4, CAST(N'2022-04-04' AS Date), N'The Downtown Dental Clinic
  Ottawa ON K1P 6L7
  (613) 234-0792
  ', CAST(20.00 AS Numeric(10, 2)), CAST(80.00 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), 2)
INSERT [dbo].[Invoice] ([invoice_id], [date_of_issue], [contact_info], [patient_charge], [insurance_charge], [discount], [penalty], [patient_id]) VALUES (5, CAST(N'2022-04-05' AS Date), N'The Downtown Dental Clinic
  Ottawa ON K1P 6L7
  (613) 234-0792
  ', CAST(100.00 AS Numeric(10, 2)), CAST(900.00 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), 2)
INSERT [dbo].[Invoice] ([invoice_id], [date_of_issue], [contact_info], [patient_charge], [insurance_charge], [discount], [penalty], [patient_id]) VALUES (6, CAST(N'2022-04-06' AS Date), N'The Downtown Dental Clinic
  Ottawa ON K1P 6L7
  (613) 234-0792
  ', CAST(300.00 AS Numeric(10, 2)), CAST(200.00 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), 2)
INSERT [dbo].[Invoice] ([invoice_id], [date_of_issue], [contact_info], [patient_charge], [insurance_charge], [discount], [penalty], [patient_id]) VALUES (7, CAST(N'2022-04-15' AS Date), N'Regional Dental Clinic
  Ottawa ON K1N 3M7
  (613) 985-1853
  ', CAST(200.00 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), 5)
  SET IDENTITY_INSERT [Invoice] OFF
GO
INSERT [dbo].[Patient_billing] ([patient_id], [patient_amount], [insurance_amount], [total_amount], [payment_type]) VALUES ( 1, CAST(300.00 AS Numeric(10, 2)), CAST(200.00 AS Numeric(10, 2)), CAST(500.00 AS Numeric(10, 2)), N'Visa')
INSERT [dbo].[Patient_billing] ( [patient_id], [patient_amount], [insurance_amount], [total_amount], [payment_type]) VALUES ( 2, CAST(14.00 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), CAST(14.00 AS Numeric(10, 2)), N'Cash/Debit')
INSERT [dbo].[Patient_billing] ( [patient_id], [patient_amount], [insurance_amount], [total_amount], [payment_type]) VALUES ( 2, CAST(20.00 AS Numeric(10, 2)), CAST(80.00 AS Numeric(10, 2)), CAST(100.00 AS Numeric(10, 2)), N'Visa')
INSERT [dbo].[Patient_billing] ( [patient_id], [patient_amount], [insurance_amount], [total_amount], [payment_type]) VALUES ( 2, CAST(100.00 AS Numeric(10, 2)), CAST(900.00 AS Numeric(10, 2)), CAST(1000.00 AS Numeric(10, 2)), N'Mastercard')
INSERT [dbo].[Patient_billing] ( [patient_id], [patient_amount], [insurance_amount], [total_amount], [payment_type]) VALUES ( 2, CAST(300.00 AS Numeric(10, 2)), CAST(200.00 AS Numeric(10, 2)), CAST(500.00 AS Numeric(10, 2)), N'Mastercard')
INSERT [dbo].[Patient_billing] ( [patient_id], [patient_amount], [insurance_amount], [total_amount], [payment_type]) VALUES ( 5, CAST(200.00 AS Numeric(10, 2)), CAST(0.00 AS Numeric(10, 2)), CAST(200.00 AS Numeric(10, 2)), N'Amex')
GO
  SET IDENTITY_INSERT [Patient_records] ON
INSERT [dbo].[Patient_records] ([record_id], [patient_details], [patient_id]) VALUES (1, N'Patient is going lose their teeth in 2 years if they do not book another appointment with us.', 1)
INSERT [dbo].[Patient_records] ([record_id], [patient_details], [patient_id]) VALUES (2, N'Stephie current has healthy teeth. Only requires annual cleaning. Her last cleaning was 1 year ago.', 2)
INSERT [dbo].[Patient_records] ([record_id], [patient_details], [patient_id]) VALUES (3, N'Paul Sr. had an annual teeth cleaning last year.', 3)
INSERT [dbo].[Patient_records] ([record_id], [patient_details], [patient_id]) VALUES (4, N'Brooke needs invisalign because her teeth is crooked.', 4)
INSERT [dbo].[Patient_records] ([record_id], [patient_details], [patient_id]) VALUES (5, N'John needs cleaning. Last cleaning was last year. We also did teeth whitening with him recently.', 5)
 SET IDENTITY_INSERT [Patient_records] OFF
GO
 SET IDENTITY_INSERT [Procedure_codes] ON
INSERT [dbo].[Procedure_codes] ([procedure_id], [procedure_name]) VALUES (1, N'Teeth Cleanings')
INSERT [dbo].[Procedure_codes] ([procedure_id], [procedure_name]) VALUES (2, N'Teeth Whitening')
INSERT [dbo].[Procedure_codes] ([procedure_id], [procedure_name]) VALUES (3, N'Extractions')
INSERT [dbo].[Procedure_codes] ([procedure_id], [procedure_name]) VALUES (4, N'Veneers')
INSERT [dbo].[Procedure_codes] ([procedure_id], [procedure_name]) VALUES (5, N'Fillings')
INSERT [dbo].[Procedure_codes] ([procedure_id], [procedure_name]) VALUES (6, N'Crowns')
INSERT [dbo].[Procedure_codes] ([procedure_id], [procedure_name]) VALUES (7, N'Root Canal')
INSERT [dbo].[Procedure_codes] ([procedure_id], [procedure_name]) VALUES (8, N'Braces/invisalign')
INSERT [dbo].[Procedure_codes] ([procedure_id], [procedure_name]) VALUES (9, N'Bonding')
INSERT [dbo].[Procedure_codes] ([procedure_id], [procedure_name]) VALUES (10, N'Dentures')
 SET IDENTITY_INSERT [Procedure_codes] OFF
GO
INSERT [dbo].[Representative] ([name], [phone], [email], [relationship]) VALUES (N'Pat McRandom Sr.', N'1231231234', N'randomsenior@gmail.com', N'Dad')
INSERT [dbo].[Representative] ([name], [phone], [email], [relationship]) VALUES ( N'Bob McRandomee Sr.', N'1231231234', N'randomsenior@gmail.com', N'Dad')
GO
INSERT [dbo].[Review] ([dentist_name], [review_description], [professionalism], [communication], [cleanliness], [date_of_review], [procedure_id]) VALUES ( N'Tisham Islam', N'The dentist was very professional and clean, but he did not communicate with me very well', 5, 2, 4, CAST(N'2022-04-09' AS Date), 1)
INSERT [dbo].[Review] ( [dentist_name], [review_description], [professionalism], [communication], [cleanliness], [date_of_review], [procedure_id]) VALUES ( N'C�line Wan', N'I could not believe the service I received for this appointment. Absolutely horrible. You will be hearing about me on Yelp!!!', 1, 1, 2, CAST(N'2022-04-10' AS Date), 2)
INSERT [dbo].[Review] ( [dentist_name], [review_description], [professionalism], [communication], [cleanliness], [date_of_review], [procedure_id]) VALUES ( N'Amy Kkiti', N'Amy is a very gentle and kind hygienist. The best out there! I definitely recommend taking an appointment with her!', 5, 5, 4, CAST(N'2022-04-24' AS Date), 1)
GO
 SET IDENTITY_INSERT [Treatment] ON
INSERT [dbo].[Treatment] ([treatment_id], [treatment_type], [medication], [symptoms], [tooth], [comments], [patient_id], [appointment_id]) VALUES (1, N'Extractions', N'Midazolam', N'Tooth ache', 23, N'Do not eat food 24 hours before the procedure.', 1, 1)
INSERT [dbo].[Treatment] ([treatment_id], [treatment_type], [medication], [symptoms], [tooth], [comments], [patient_id], [appointment_id]) VALUES (2, N'Teeth Whitening', N'No medications administered', N'No symptoms', 999, N'No comments', 2, 2)
INSERT [dbo].[Treatment] ([treatment_id], [treatment_type], [medication], [symptoms], [tooth], [comments], [patient_id], [appointment_id]) VALUES (3, N'Root Canal', N'Anesthesia', N'Dysarthria (Temporary speech impairment)', 33, N'Do not eat food 24 hours before the procedure. Cannot drive after the treatment.', 2, 3)
INSERT [dbo].[Treatment] ([treatment_id], [treatment_type], [medication], [symptoms], [tooth], [comments], [patient_id], [appointment_id]) VALUES (4, N'Bonding', N'No medications administered', N'No symptoms', 21, N'No comments', 2, 5)
INSERT [dbo].[Treatment] ([treatment_id], [treatment_type], [medication], [symptoms], [tooth], [comments], [patient_id], [appointment_id]) VALUES (5, N'Braces/invisalign', N'No medications administered', N'No symptoms', 999, N'Await further instructions from the orthodonist.', 2, 7)
INSERT [dbo].[Treatment] ([treatment_id], [treatment_type], [medication], [symptoms], [tooth], [comments], [patient_id], [appointment_id]) VALUES (6, N'Teeth Whitening', N'No medication administered', N'No symptoms', 999, N'Use the toothpaste recommended by the hygienist.', 5, 12)
 SET IDENTITY_INSERT [Treatment] OFF
GO
INSERT [dbo].[User_account] ([username], [password], [type_id], [patient_id], [employee_id]) VALUES (N'akiti7935', N'akiti7935', 1, NULL, 4)
INSERT [dbo].[User_account] ([username], [password], [type_id], [patient_id], [employee_id]) VALUES (N'bobmley1', N'bobmley1', 1, NULL, 1)
INSERT [dbo].[User_account] ([username], [password], [type_id], [patient_id], [employee_id]) VALUES (N'CrsClo9', N'CrsClo9', 1, NULL, 9)
INSERT [dbo].[User_account] ([username], [password], [type_id], [patient_id], [employee_id]) VALUES (N'cwmk3565', N'cwmk3565', 1, NULL, 3)
INSERT [dbo].[User_account] ([username], [password], [type_id], [patient_id], [employee_id]) VALUES (N'elmurder666', N'elmurder666', 0, 1, NULL)
INSERT [dbo].[User_account] ([username], [password], [type_id], [patient_id], [employee_id]) VALUES (N'johnli255a', N'johnli255a', 1, NULL, 6)
INSERT [dbo].[User_account] ([username], [password], [type_id], [patient_id], [employee_id]) VALUES (N'johnli255b', N'johnli255b', 0, 5, NULL)
INSERT [dbo].[User_account] ([username], [password], [type_id], [patient_id], [employee_id]) VALUES (N'kdo2342', N'kdo2342', 1, NULL, 5)
INSERT [dbo].[User_account] ([username], [password], [type_id], [patient_id], [employee_id]) VALUES (N'olvMar8', N'olvMar8', 1, NULL, 8)
INSERT [dbo].[User_account] ([username], [password], [type_id], [patient_id], [employee_id]) VALUES (N'randomeemd6', N'randomeemd6', 0, 3, NULL)
INSERT [dbo].[User_account] ([username], [password], [type_id], [patient_id], [employee_id]) VALUES (N'randommd5', N'randommd5', 0, 2, NULL)
INSERT [dbo].[User_account] ([username], [password], [type_id], [patient_id], [employee_id]) VALUES (N'stoua0809', N'stoua0809', 1, NULL, 7)
INSERT [dbo].[User_account] ([username], [password], [type_id], [patient_id], [employee_id]) VALUES (N'tisla2714', N'tisla2714', 1, NULL, 2)
INSERT [dbo].[User_account] ([username], [password], [type_id], [patient_id], [employee_id]) VALUES (N'xXx_blayde_xXx', N'blayde', 0, 4, NULL)
GO
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[Patient_info] ([patient_id])
--
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
REFERENCES [dbo].[Patient_info] ([patient_id])
ON UPDATE CASCADE
ON DELETE CASCADE
--
GO
ALTER TABLE [dbo].[Appointment_procedure]  WITH CHECK ADD FOREIGN KEY([procedure_id])
REFERENCES [dbo].[Procedure_codes] ([procedure_id])
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
-- RUN 
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD FOREIGN KEY([branch_id])
REFERENCES [dbo].[Branch] ([branch_id])
GO
ALTER TABLE [dbo].[Fee_charge]  WITH CHECK ADD FOREIGN KEY([procedure_id])
REFERENCES [dbo].[Appointment_procedure] ([procedure_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Insurance_claim]  WITH CHECK ADD FOREIGN KEY([invoice_id])
REFERENCES [dbo].[Invoice] ([invoice_id])
GO
ALTER TABLE [dbo].[Insurance_claim]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[Patient_info] ([patient_id])
--
--
GO
ALTER TABLE [dbo].[Invoice]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[Patient_info] ([patient_id])
GO
ALTER TABLE [dbo].[Patient_billing]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[Patient_info] ([patient_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Patient_info]  WITH CHECK ADD FOREIGN KEY([rep_id])
REFERENCES [dbo].[Representative] ([representativeID])
GO
ALTER TABLE [dbo].[Patient_records]  WITH CHECK ADD  CONSTRAINT [FK_patient_id] FOREIGN KEY([patient_id])
REFERENCES [dbo].[Patient_info] ([patient_id])
--
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
REFERENCES [dbo].[Patient_info] ([patient_id])
--
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User_account]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[Employee] ([employee_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User_account]  WITH CHECK ADD FOREIGN KEY([patient_id])
REFERENCES [dbo].[Patient_info] ([patient_id])
--
ON UPDATE CASCADE
ON DELETE CASCADE
GO

--OK
ALTER TABLE [dbo].[Appointment]  WITH CHECK ADD CHECK  (([appointment_status]='Booked' OR [appointment_status]='Completed' OR [appointment_status]='Cancelled' OR [appointment_status]='No Show'))
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD CONSTRAINT [employee_type] CHECK  (([employee_type]='b' OR [employee_type]='h' OR [employee_type]='d' OR [employee_type]='r'))
--
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [employee_type]
GO
ALTER TABLE [dbo].[Patient_billing]  WITH CHECK ADD  CONSTRAINT [Payment_type_check] CHECK  (([payment_type]='Mastercard' OR [payment_type]='Visa' OR [payment_type]='Amex' OR [payment_type]='Cash/Debit'))
--
GO
ALTER TABLE [dbo].[Patient_billing] CHECK CONSTRAINT [Payment_type_check]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [Age_and_representative_check] CHECK  (([date_of_birth]<=dateadd(year,(-15),getdate()) OR [date_of_birth]>dateadd(year,(-15),getdate()) AND [rep_id] IS NOT NULL))
--
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [Age_and_representative_check]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD  CONSTRAINT [Gender_check] CHECK  (([gender]='X' OR [gender]='F' OR [gender]='M'))
GO
ALTER TABLE [dbo].[Patient] CHECK CONSTRAINT [Gender_check]
GO
ALTER TABLE [dbo].[Procedure_codes]  WITH CHECK ADD  CONSTRAINT [procedure_code_check] CHECK  (([procedure_id]>=(1) AND [procedure_id]<=(10)))
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
