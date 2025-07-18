USE [DrugUsePreventionDB1]
GO
/****** Object:  Schema [HangFire]    Script Date: 7/10/2025 12:31:03 AM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/10/2025 12:31:03 AM ******/
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
/****** Object:  Table [dbo].[AnswerOptions]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnswerOptions](
	[optionID] [int] IDENTITY(1,1) NOT NULL,
	[questionID] [int] NOT NULL,
	[optionText] [nvarchar](max) NOT NULL,
	[scoreValue] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[optionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[appointmentID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[consultantID] [int] NOT NULL,
	[startDateTime] [datetime2](7) NOT NULL,
	[endDateTime] [datetime2](7) NOT NULL,
	[price] [decimal](10, 2) NOT NULL,
	[status] [nvarchar](20) NOT NULL,
	[note] [nvarchar](max) NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[ScheduleIds] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[appointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssessmentResults]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssessmentResults](
	[resultID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[assessmentID] [int] NOT NULL,
	[courseID] [int] NULL,
	[resultName] [nvarchar](255) NULL,
	[score] [float] NOT NULL,
	[takeTime] [datetime2](7) NOT NULL,
	[AssessmentStage] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[resultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assessments]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assessments](
	[assessmentID] [int] IDENTITY(1,1) NOT NULL,
	[assessmentName] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
	[assessmentType] [nvarchar](10) NOT NULL,
	[minAge] [int] NULL,
	[maxAge] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[AssessmentStage] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[assessmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[blogID] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[content] [nvarchar](max) NOT NULL,
	[authorID] [int] NOT NULL,
	[publishDate] [datetime2](7) NOT NULL,
	[status] [nvarchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[blogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Certificates]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificates](
	[certificateID] [int] IDENTITY(1,1) NOT NULL,
	[certificateName] [nvarchar](255) NOT NULL,
	[dateAcquired] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[certificateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommunicationPrograms]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommunicationPrograms](
	[programID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
	[startDate] [datetime2](7) NULL,
	[endDate] [datetime2](7) NULL,
	[location] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[programID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConsultantAppointmentEvaluations]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultantAppointmentEvaluations](
	[evaluationID] [int] IDENTITY(1,1) NOT NULL,
	[appointmentID] [int] NOT NULL,
	[userID] [int] NOT NULL,
	[rating] [int] NOT NULL,
	[comment] [nvarchar](max) NULL,
	[evaluationDate] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[evaluationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consultants]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultants](
	[consultantID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[certificateID] [int] NULL,
	[specialty] [nvarchar](255) NULL,
	[degree] [nvarchar](255) NULL,
	[experience] [nvarchar](max) NULL,
	[hourlyRate] [decimal](10, 2) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[GoogleMeetLink] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[consultantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConsultantSchedules]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultantSchedules](
	[scheduleID] [int] IDENTITY(1,1) NOT NULL,
	[consultantID] [int] NOT NULL,
	[dayOfWeek] [nvarchar](50) NOT NULL,
	[date] [datetime2](7) NOT NULL,
	[startTime] [time](7) NOT NULL,
	[endTime] [time](7) NOT NULL,
	[isAvailable] [bit] NOT NULL,
	[notes] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[scheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseAssessments]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseAssessments](
	[courseID] [int] NOT NULL,
	[assessmentID] [int] NOT NULL,
 CONSTRAINT [PK_CourseAssessments] PRIMARY KEY CLUSTERED 
(
	[courseID] ASC,
	[assessmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseRegistrations]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseRegistrations](
	[userID] [int] NOT NULL,
	[courseID] [int] NOT NULL,
	[registerTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CourseRegistrations] PRIMARY KEY CLUSTERED 
(
	[userID] ASC,
	[courseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[courseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NOT NULL,
	[status] [nvarchar](10) NOT NULL,
	[ageMin] [int] NOT NULL,
	[ageMax] [int] NULL,
	[capacity] [int] NULL,
	[price] [decimal](10, 2) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[Type] [nchar](10) NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[courseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[paymentID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[courseID] [int] NULL,
	[appointmentID] [int] NULL,
	[amount] [decimal](10, 2) NOT NULL,
	[paymentDate] [datetime2](7) NOT NULL,
	[paymentMethod] [nvarchar](50) NULL,
	[status] [nvarchar](10) NOT NULL,
	[transactionID] [nvarchar](100) NULL,
	[RetryCount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[paymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgramParticipations]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramParticipations](
	[userID] [int] NOT NULL,
	[programID] [int] NOT NULL,
	[joinTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProgramParticipations] PRIMARY KEY CLUSTERED 
(
	[userID] ASC,
	[programID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[questionID] [int] IDENTITY(1,1) NOT NULL,
	[surveyID] [int] NULL,
	[questionText] [nvarchar](max) NOT NULL,
	[questionType] [nvarchar](50) NULL,
	[AssessmentID] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[questionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [nvarchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyResponses]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyResponses](
	[responseID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[surveyID] [int] NOT NULL,
	[programID] [int] NULL,
	[responseData] [nvarchar](max) NULL,
	[submitTime] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[responseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Surveys]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Surveys](
	[surveyID] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](255) NOT NULL,
	[type] [nvarchar](50) NULL,
	[authorID] [int] NOT NULL,
	[description] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[surveyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](100) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[fullName] [nvarchar](150) NULL,
	[dateOfBirth] [date] NULL,
	[phone] [nvarchar](20) NULL,
	[address] [nvarchar](255) NULL,
	[status] [nvarchar](50) NULL,
	[roleID] [int] NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[AggregatedCounter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [bigint] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_CounterAggregated] PRIMARY KEY CLUSTERED 
(
	[Key] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Counter]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Counter](
	[Key] [nvarchar](100) NOT NULL,
	[Value] [int] NOT NULL,
	[ExpireAt] [datetime] NULL,
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_HangFire_Counter] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Hash]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Hash](
	[Key] [nvarchar](100) NOT NULL,
	[Field] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime2](7) NULL,
 CONSTRAINT [PK_HangFire_Hash] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Field] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Job]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Job](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[StateId] [bigint] NULL,
	[StateName] [nvarchar](20) NULL,
	[InvocationData] [nvarchar](max) NOT NULL,
	[Arguments] [nvarchar](max) NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Job] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobParameter](
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](40) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_JobParameter] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[JobQueue](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Queue] [nvarchar](50) NOT NULL,
	[FetchedAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_JobQueue] PRIMARY KEY CLUSTERED 
(
	[Queue] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[List]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[List](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](max) NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_List] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Schema]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Schema](
	[Version] [int] NOT NULL,
 CONSTRAINT [PK_HangFire_Schema] PRIMARY KEY CLUSTERED 
(
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Server]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Server](
	[Id] [nvarchar](200) NOT NULL,
	[Data] [nvarchar](max) NULL,
	[LastHeartbeat] [datetime] NOT NULL,
 CONSTRAINT [PK_HangFire_Server] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[Set]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[Set](
	[Key] [nvarchar](100) NOT NULL,
	[Score] [float] NOT NULL,
	[Value] [nvarchar](256) NOT NULL,
	[ExpireAt] [datetime] NULL,
 CONSTRAINT [PK_HangFire_Set] PRIMARY KEY CLUSTERED 
(
	[Key] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = ON, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[State]    Script Date: 7/10/2025 12:31:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HangFire].[State](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[JobId] [bigint] NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Reason] [nvarchar](100) NULL,
	[CreatedAt] [datetime] NOT NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_HangFire_State] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250602060849_init', N'9.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250606035952_update', N'9.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250606051112_update1', N'9.0.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250616064457_update3', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250616070119_update4', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250616070628_update5', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250616075527_update6', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250623044009_update7', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250624045850_update8', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250624101046_update9', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250624112144_update10', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250624201935_update11', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250627065819_update12', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250627083559_update13', N'8.0.8')
GO
SET IDENTITY_INSERT [dbo].[AnswerOptions] ON 

INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1, 13, N'yes', 2, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (2, 13, N'no', 0, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (3, 14, N'yes', 2, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (4, 14, N'no', 0, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (5, 15, N'yes', 2, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (6, 15, N'no', 0, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (7, 16, N'yes', 2, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (8, 16, N'no', 0, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1002, 1013, N'yes', 2, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1003, 1013, N'no', 0, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1004, 1014, N'yes', 2, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1005, 1014, N'no', 0, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1006, 1015, N'yes', 2, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1007, 1015, N'no', 0, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1008, 1016, N'yes', 2, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1009, 1016, N'no', 0, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1010, 1017, N'yes', 2, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1011, 1017, N'no', 0, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1012, 1018, N'yes', 8, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1013, 1018, N'no', 0, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1014, 1019, N'yes', 2, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1015, 1019, N'no', 0, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1016, 1020, N'yes', 8, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1017, 1020, N'no', 0, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1018, 1021, N'yes', 4, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1019, 1021, N'no', 0, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1020, 1022, N'yes', 4, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1021, 1022, N'no', 0, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1022, 1023, N'yes', 0, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1023, 1023, N'no', 0, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1024, 1024, N'yes', 4, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1025, 1024, N'no', 0, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1026, 1025, N'yes', 2, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1027, 1025, N'no', 0, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1028, 1026, N'yes', 0, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1029, 1026, N'no', 0, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1030, 1027, N'yes', 6, 1)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1031, 1027, N'no', 0, 1)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1032, 1028, N'yes', 2, 1)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1033, 1028, N'no', 4, 1)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1034, 1029, N'yes', 0, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1035, 1029, N'no', 4, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1036, 1030, N'yes', 10, 1)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1037, 1030, N'no', 0, 1)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1038, 1031, N'yes', 8, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1039, 1031, N'no', 7, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1040, 1032, N'yes', 8, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1041, 1032, N'no', 0, 0)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1042, 1033, N'yes', 8, 1)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1043, 1033, N'no', 0, 1)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1044, 1034, N'yes', 2, 1)
INSERT [dbo].[AnswerOptions] ([optionID], [questionID], [optionText], [scoreValue], [IsDeleted]) VALUES (1045, 1034, N'no', 0, 1)
SET IDENTITY_INSERT [dbo].[AnswerOptions] OFF
GO
SET IDENTITY_INSERT [dbo].[Appointments] ON 

INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (1, 3, 1, CAST(N'2025-07-05T14:00:00.0000000' AS DateTime2), CAST(N'2025-07-05T15:00:00.0000000' AS DateTime2), CAST(50.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', NULL, CAST(N'2025-06-24T14:26:43.9433333' AS DateTime2), CAST(N'2025-06-24T14:26:43.9433333' AS DateTime2), NULL)
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (2, 5, 2, CAST(N'2025-07-01T13:00:00.0000000' AS DateTime2), CAST(N'2025-07-01T14:00:00.0000000' AS DateTime2), CAST(9999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-24T09:16:31.0781597' AS DateTime2), CAST(N'2025-06-24T09:16:31.0781599' AS DateTime2), NULL)
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (3, 5, 2, CAST(N'2025-07-01T14:00:00.0000000' AS DateTime2), CAST(N'2025-07-01T15:00:00.0000000' AS DateTime2), CAST(9999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-24T09:22:11.1756657' AS DateTime2), CAST(N'2025-06-24T09:22:11.1756660' AS DateTime2), NULL)
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (4, 5, 2, CAST(N'2025-07-01T15:00:00.0000000' AS DateTime2), CAST(N'2025-07-01T16:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-24T09:40:44.6396008' AS DateTime2), CAST(N'2025-06-24T09:40:44.6396009' AS DateTime2), NULL)
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (5, 5, 2, CAST(N'2025-07-01T16:00:00.0000000' AS DateTime2), CAST(N'2025-07-01T17:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-24T09:46:46.4089594' AS DateTime2), CAST(N'2025-06-24T09:46:46.4089595' AS DateTime2), N'5')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (6, 5, 2, CAST(N'2025-06-27T07:00:00.0000000' AS DateTime2), CAST(N'2025-06-27T09:00:00.0000000' AS DateTime2), CAST(199998.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'Tan dan', CAST(N'2025-06-26T15:09:59.0561451' AS DateTime2), CAST(N'2025-06-26T15:09:59.0562268' AS DateTime2), N'138,139')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (7, 5, 2, CAST(N'2025-06-27T15:00:00.0000000' AS DateTime2), CAST(N'2025-06-27T16:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-27T04:53:31.3348025' AS DateTime2), CAST(N'2025-06-27T04:53:31.3348555' AS DateTime2), N'146')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (8, 5, 2, CAST(N'2025-06-27T16:00:00.0000000' AS DateTime2), CAST(N'2025-06-27T17:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-27T06:03:18.0321456' AS DateTime2), CAST(N'2025-06-27T06:03:18.0321459' AS DateTime2), N'147')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (9, 5, 2, CAST(N'2025-06-27T17:00:00.0000000' AS DateTime2), CAST(N'2025-06-27T18:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-27T06:10:50.4195880' AS DateTime2), CAST(N'2025-06-27T06:10:50.4195882' AS DateTime2), N'148')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (10, 5, 2, CAST(N'2025-06-27T18:00:00.0000000' AS DateTime2), CAST(N'2025-06-27T19:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-27T06:34:15.8153270' AS DateTime2), CAST(N'2025-06-27T06:34:15.8153799' AS DateTime2), N'149')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (11, 5, 2, CAST(N'2025-06-28T07:00:00.0000000' AS DateTime2), CAST(N'2025-06-28T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-27T07:23:27.9563757' AS DateTime2), CAST(N'2025-06-27T07:23:27.9564255' AS DateTime2), N'150')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (12, 5, 2, CAST(N'2025-06-28T08:00:00.0000000' AS DateTime2), CAST(N'2025-06-28T09:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-27T07:56:26.6762435' AS DateTime2), CAST(N'2025-06-27T07:56:26.6762948' AS DateTime2), N'151')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (13, 5, 2, CAST(N'2025-06-28T09:00:00.0000000' AS DateTime2), CAST(N'2025-06-28T10:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-27T08:00:56.3653343' AS DateTime2), CAST(N'2025-06-27T08:00:56.3655255' AS DateTime2), N'152')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (14, 5, 2, CAST(N'2025-06-28T10:00:00.0000000' AS DateTime2), CAST(N'2025-06-28T11:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-27T08:04:51.9234233' AS DateTime2), CAST(N'2025-06-27T08:04:51.9234740' AS DateTime2), N'153')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (15, 5, 2, CAST(N'2025-06-28T11:00:00.0000000' AS DateTime2), CAST(N'2025-06-28T12:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-27T08:26:59.2264410' AS DateTime2), CAST(N'2025-06-27T08:26:59.2264840' AS DateTime2), N'154')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (16, 5, 2, CAST(N'2025-06-28T12:00:00.0000000' AS DateTime2), CAST(N'2025-06-28T13:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-27T08:35:09.1866132' AS DateTime2), CAST(N'2025-06-27T08:35:09.1866134' AS DateTime2), N'155')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (17, 5, 3, CAST(N'2025-06-28T07:00:00.0000000' AS DateTime2), CAST(N'2025-06-28T08:00:00.0000000' AS DateTime2), CAST(8888.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-27T17:28:48.1932281' AS DateTime2), CAST(N'2025-06-27T17:28:48.1932925' AS DateTime2), N'277')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (18, 5, 2, CAST(N'2025-06-29T07:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T16:55:03.6218322' AS DateTime2), CAST(N'2025-06-28T16:55:03.6218871' AS DateTime2), N'162')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (19, 5, 2, CAST(N'2025-06-29T09:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T10:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T16:57:07.1538402' AS DateTime2), CAST(N'2025-06-28T16:57:07.1538410' AS DateTime2), N'164')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (20, 5, 2, CAST(N'2025-06-29T08:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T09:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T17:35:50.1242035' AS DateTime2), CAST(N'2025-06-28T17:35:50.1242039' AS DateTime2), N'163')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (21, 5, 2, CAST(N'2025-06-29T10:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T11:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T17:36:13.5347516' AS DateTime2), CAST(N'2025-06-28T17:36:13.5347517' AS DateTime2), N'165')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (22, 5, 2, CAST(N'2025-06-29T11:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T12:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T17:42:54.4405369' AS DateTime2), CAST(N'2025-06-28T17:42:54.4405373' AS DateTime2), N'166')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (23, 5, 2, CAST(N'2025-06-29T12:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T13:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T17:43:22.5023129' AS DateTime2), CAST(N'2025-06-28T17:43:22.5023130' AS DateTime2), N'167')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (24, 5, 2, CAST(N'2025-06-29T13:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T14:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T17:43:30.0789282' AS DateTime2), CAST(N'2025-06-28T17:43:30.0789283' AS DateTime2), N'168')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (25, 5, 2, CAST(N'2025-06-29T14:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T15:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T17:45:59.1945205' AS DateTime2), CAST(N'2025-06-28T17:45:59.1945210' AS DateTime2), N'169')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (26, 5, 2, CAST(N'2025-06-29T15:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T16:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T17:52:23.5663431' AS DateTime2), CAST(N'2025-06-28T17:52:23.5663435' AS DateTime2), N'170')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (27, 5, 2, CAST(N'2025-06-29T16:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T17:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T17:52:50.9975125' AS DateTime2), CAST(N'2025-06-28T17:52:50.9975126' AS DateTime2), N'171')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (28, 5, 2, CAST(N'2025-06-30T07:00:00.0000000' AS DateTime2), CAST(N'2025-06-30T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T17:53:08.7966177' AS DateTime2), CAST(N'2025-06-28T17:53:08.7966178' AS DateTime2), N'174')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (29, 5, 2, CAST(N'2025-06-30T13:00:00.0000000' AS DateTime2), CAST(N'2025-06-30T14:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T18:18:31.0135268' AS DateTime2), CAST(N'2025-06-28T18:18:31.0135271' AS DateTime2), N'180')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (30, 5, 2, CAST(N'2025-06-29T17:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T18:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T18:25:58.7534826' AS DateTime2), CAST(N'2025-06-28T18:25:58.7534829' AS DateTime2), N'172')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (31, 5, 2, CAST(N'2025-06-30T08:00:00.0000000' AS DateTime2), CAST(N'2025-06-30T09:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T18:30:20.2770829' AS DateTime2), CAST(N'2025-06-28T18:30:20.2770831' AS DateTime2), N'175')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (32, 5, 2, CAST(N'2025-06-30T14:00:00.0000000' AS DateTime2), CAST(N'2025-06-30T15:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T18:41:04.4396847' AS DateTime2), CAST(N'2025-06-28T18:41:04.4396851' AS DateTime2), N'181')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (33, 5, 2, CAST(N'2025-07-01T09:00:00.0000000' AS DateTime2), CAST(N'2025-07-01T10:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T18:42:44.4004480' AS DateTime2), CAST(N'2025-06-28T18:42:44.4004482' AS DateTime2), N'188')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (34, 5, 2, CAST(N'2025-06-30T09:00:00.0000000' AS DateTime2), CAST(N'2025-06-30T10:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T18:49:42.3689397' AS DateTime2), CAST(N'2025-06-28T18:49:42.3689399' AS DateTime2), N'176')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (35, 5, 2, CAST(N'2025-07-02T08:00:00.0000000' AS DateTime2), CAST(N'2025-07-02T09:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T18:53:28.4249434' AS DateTime2), CAST(N'2025-06-28T18:53:28.4249436' AS DateTime2), N'206')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (36, 10, 5, CAST(N'2025-06-30T07:00:00.0000000' AS DateTime2), CAST(N'2025-06-30T08:00:00.0000000' AS DateTime2), CAST(8989.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T02:19:39.5677296' AS DateTime2), CAST(N'2025-06-29T02:19:39.5677827' AS DateTime2), N'698')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (37, 10, 2, CAST(N'2025-06-29T18:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T19:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T02:21:11.3131578' AS DateTime2), CAST(N'2025-06-29T02:21:11.3131579' AS DateTime2), N'173')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (38, 10, 2, CAST(N'2025-07-06T07:00:00.0000000' AS DateTime2), CAST(N'2025-07-06T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T06:13:59.5567048' AS DateTime2), CAST(N'2025-06-29T06:13:59.5567056' AS DateTime2), N'578')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (39, 5, 2, CAST(N'2025-06-30T12:00:00.0000000' AS DateTime2), CAST(N'2025-06-30T13:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T06:20:17.0895829' AS DateTime2), CAST(N'2025-06-29T06:20:17.0895830' AS DateTime2), N'179')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (40, 5, 3, CAST(N'2025-06-29T14:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T15:00:00.0000000' AS DateTime2), CAST(8888.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T06:23:05.7418516' AS DateTime2), CAST(N'2025-06-29T06:23:05.7418518' AS DateTime2), N'296')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (41, 5, 2, CAST(N'2025-07-02T07:00:00.0000000' AS DateTime2), CAST(N'2025-07-02T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T06:23:16.0840200' AS DateTime2), CAST(N'2025-06-29T06:23:16.0840201' AS DateTime2), N'205')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (42, 5, 2, CAST(N'2025-07-02T09:00:00.0000000' AS DateTime2), CAST(N'2025-07-02T10:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T06:26:21.8793443' AS DateTime2), CAST(N'2025-06-29T06:26:21.8793445' AS DateTime2), N'207')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (43, 5, 2, CAST(N'2025-07-03T08:00:00.0000000' AS DateTime2), CAST(N'2025-07-03T09:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T06:36:11.8415302' AS DateTime2), CAST(N'2025-06-29T06:36:11.8415304' AS DateTime2), N'242')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (44, 5, 2, CAST(N'2025-07-01T07:00:00.0000000' AS DateTime2), CAST(N'2025-07-01T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T06:43:00.7469979' AS DateTime2), CAST(N'2025-06-29T06:43:00.7469983' AS DateTime2), N'186')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (45, 5, 2, CAST(N'2025-07-02T10:00:00.0000000' AS DateTime2), CAST(N'2025-07-02T11:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T06:43:30.2199868' AS DateTime2), CAST(N'2025-06-29T06:43:30.2199868' AS DateTime2), N'208')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (46, 5, 2, CAST(N'2025-07-02T11:00:00.0000000' AS DateTime2), CAST(N'2025-07-02T12:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T06:49:10.6555696' AS DateTime2), CAST(N'2025-06-29T06:49:10.6555702' AS DateTime2), N'209')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (47, 5, 2, CAST(N'2025-07-03T09:00:00.0000000' AS DateTime2), CAST(N'2025-07-03T10:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T07:06:03.6197919' AS DateTime2), CAST(N'2025-06-29T07:06:03.6197922' AS DateTime2), N'243')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (48, 5, 2, CAST(N'2025-07-03T07:00:00.0000000' AS DateTime2), CAST(N'2025-07-03T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T07:09:37.7472240' AS DateTime2), CAST(N'2025-06-29T07:09:37.7472242' AS DateTime2), N'241')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (49, 5, 2, CAST(N'2025-07-03T10:00:00.0000000' AS DateTime2), CAST(N'2025-07-03T11:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T07:36:55.1823618' AS DateTime2), CAST(N'2025-06-29T07:36:55.1823620' AS DateTime2), N'244')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (50, 5, 2, CAST(N'2025-07-02T12:00:00.0000000' AS DateTime2), CAST(N'2025-07-02T13:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T08:15:55.2001434' AS DateTime2), CAST(N'2025-06-29T08:15:55.2001442' AS DateTime2), N'210')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (51, 5, 2, CAST(N'2025-07-03T12:00:00.0000000' AS DateTime2), CAST(N'2025-07-03T13:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T08:23:18.3604486' AS DateTime2), CAST(N'2025-06-29T08:23:18.3604490' AS DateTime2), N'246')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (52, 5, 2, CAST(N'2025-06-30T10:00:00.0000000' AS DateTime2), CAST(N'2025-06-30T11:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T08:31:10.2762727' AS DateTime2), CAST(N'2025-06-29T08:31:10.2762729' AS DateTime2), N'177')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (53, 5, 2, CAST(N'2025-07-03T13:00:00.0000000' AS DateTime2), CAST(N'2025-07-03T14:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T08:49:46.6615643' AS DateTime2), CAST(N'2025-06-29T08:49:46.6615645' AS DateTime2), N'247')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (54, 5, 2, CAST(N'2025-07-04T07:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T13:35:36.9893110' AS DateTime2), CAST(N'2025-06-29T13:35:36.9893112' AS DateTime2), N'253')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (55, 5, 2, CAST(N'2025-07-01T08:00:00.0000000' AS DateTime2), CAST(N'2025-07-01T09:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T17:23:07.6855169' AS DateTime2), CAST(N'2025-06-29T17:23:07.6855691' AS DateTime2), N'187')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (56, 5, 2, CAST(N'2025-07-02T13:00:00.0000000' AS DateTime2), CAST(N'2025-07-02T14:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T17:28:17.1106692' AS DateTime2), CAST(N'2025-06-29T17:28:17.1106693' AS DateTime2), N'211')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (57, 5, 2, CAST(N'2025-07-03T14:00:00.0000000' AS DateTime2), CAST(N'2025-07-03T15:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T17:31:32.3099943' AS DateTime2), CAST(N'2025-06-29T17:31:32.3099945' AS DateTime2), N'248')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (58, 5, 2, CAST(N'2025-07-03T15:00:00.0000000' AS DateTime2), CAST(N'2025-07-03T16:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T17:39:56.2283076' AS DateTime2), CAST(N'2025-06-29T17:39:56.2283079' AS DateTime2), N'249')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (59, 5, 2, CAST(N'2025-07-01T12:00:00.0000000' AS DateTime2), CAST(N'2025-07-01T13:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T17:41:45.2054319' AS DateTime2), CAST(N'2025-06-29T17:41:45.2054322' AS DateTime2), N'191')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (60, 5, 2, CAST(N'2025-07-02T14:00:00.0000000' AS DateTime2), CAST(N'2025-07-02T15:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T17:43:58.7168627' AS DateTime2), CAST(N'2025-06-29T17:43:58.7168628' AS DateTime2), N'212')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (61, 5, 2, CAST(N'2025-07-03T11:00:00.0000000' AS DateTime2), CAST(N'2025-07-03T12:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T17:44:59.3337201' AS DateTime2), CAST(N'2025-06-29T17:44:59.3337203' AS DateTime2), N'245')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (62, 5, 2, CAST(N'2025-07-03T16:00:00.0000000' AS DateTime2), CAST(N'2025-07-03T17:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T17:53:11.9346967' AS DateTime2), CAST(N'2025-06-29T17:53:11.9346970' AS DateTime2), N'250')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (63, 5, 2, CAST(N'2025-07-04T08:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T09:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T17:53:57.8231777' AS DateTime2), CAST(N'2025-06-29T17:53:57.8231777' AS DateTime2), N'254')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (64, 5, 2, CAST(N'2025-07-03T17:00:00.0000000' AS DateTime2), CAST(N'2025-07-03T18:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T17:59:13.6360039' AS DateTime2), CAST(N'2025-06-29T17:59:13.6360040' AS DateTime2), N'251')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (65, 5, 2, CAST(N'2025-07-04T09:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T10:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-30T13:51:31.1904611' AS DateTime2), CAST(N'2025-06-30T13:51:31.1905581' AS DateTime2), N'255')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (66, 5, 2, CAST(N'2025-07-04T10:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T11:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-30T13:54:18.5553598' AS DateTime2), CAST(N'2025-06-30T13:54:18.5554043' AS DateTime2), N'256')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (67, 5, 2, CAST(N'2025-07-02T15:00:00.0000000' AS DateTime2), CAST(N'2025-07-02T16:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-30T14:27:21.2647122' AS DateTime2), CAST(N'2025-06-30T14:27:21.2647130' AS DateTime2), N'213')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (68, 5, 2, CAST(N'2025-07-07T07:00:00.0000000' AS DateTime2), CAST(N'2025-07-07T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-04T17:37:22.0297537' AS DateTime2), CAST(N'2025-07-04T17:37:22.0298298' AS DateTime2), N'794')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (69, 5, 2, CAST(N'2025-07-10T08:00:00.0000000' AS DateTime2), CAST(N'2025-07-10T09:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-04T17:44:43.7468251' AS DateTime2), CAST(N'2025-07-04T17:44:43.7468256' AS DateTime2), N'915')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (70, 5, 2, CAST(N'2025-07-09T07:00:00.0000000' AS DateTime2), CAST(N'2025-07-09T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-04T17:47:53.2168446' AS DateTime2), CAST(N'2025-07-04T17:47:53.2168451' AS DateTime2), N'902')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (71, 5, 2, CAST(N'2025-07-08T07:00:00.0000000' AS DateTime2), CAST(N'2025-07-08T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-04T17:59:41.7532248' AS DateTime2), CAST(N'2025-07-04T17:59:41.7532258' AS DateTime2), N'842')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (72, 5, 2, CAST(N'2025-07-11T07:00:00.0000000' AS DateTime2), CAST(N'2025-07-11T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-04T18:03:29.1216104' AS DateTime2), CAST(N'2025-07-04T18:03:29.1216118' AS DateTime2), N'986')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (73, 5, 3, CAST(N'2025-07-06T07:00:00.0000000' AS DateTime2), CAST(N'2025-07-06T08:00:00.0000000' AS DateTime2), CAST(8888.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-04T18:14:30.5106787' AS DateTime2), CAST(N'2025-07-04T18:14:30.5106789' AS DateTime2), N'674')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (74, 5, 2, CAST(N'2025-07-05T07:00:00.0000000' AS DateTime2), CAST(N'2025-07-05T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-04T18:17:46.8747034' AS DateTime2), CAST(N'2025-07-04T18:17:46.8747037' AS DateTime2), N'373')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (75, 5, 2, CAST(N'2025-07-06T08:00:00.0000000' AS DateTime2), CAST(N'2025-07-06T09:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-04T18:29:29.4687953' AS DateTime2), CAST(N'2025-07-04T18:29:29.4687957' AS DateTime2), N'579')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (76, 5, 2, CAST(N'2025-07-05T09:00:00.0000000' AS DateTime2), CAST(N'2025-07-05T10:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-04T18:37:21.7752687' AS DateTime2), CAST(N'2025-07-04T18:37:21.7752689' AS DateTime2), N'375')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (77, 5, 2, CAST(N'2025-07-05T13:00:00.0000000' AS DateTime2), CAST(N'2025-07-05T14:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-04T18:42:32.6792244' AS DateTime2), CAST(N'2025-07-04T18:42:32.6792249' AS DateTime2), N'379')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (78, 5, 2, CAST(N'2025-07-09T09:00:00.0000000' AS DateTime2), CAST(N'2025-07-09T10:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-04T18:43:36.6951646' AS DateTime2), CAST(N'2025-07-04T18:43:36.6951647' AS DateTime2), N'904')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (79, 5, 2, CAST(N'2025-07-05T12:00:00.0000000' AS DateTime2), CAST(N'2025-07-05T13:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-05T04:03:11.8377574' AS DateTime2), CAST(N'2025-07-05T04:03:11.8378284' AS DateTime2), N'378')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (80, 5, 2, CAST(N'2025-07-05T14:00:00.0000000' AS DateTime2), CAST(N'2025-07-05T15:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-05T04:05:55.2302397' AS DateTime2), CAST(N'2025-07-05T04:05:55.2302400' AS DateTime2), N'380')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (81, 5, 2, CAST(N'2025-07-05T15:00:00.0000000' AS DateTime2), CAST(N'2025-07-05T16:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-05T04:10:42.2877759' AS DateTime2), CAST(N'2025-07-05T04:10:42.2878033' AS DateTime2), N'381')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (82, 5, 2, CAST(N'2025-07-05T16:00:00.0000000' AS DateTime2), CAST(N'2025-07-05T17:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-05T04:13:04.1540069' AS DateTime2), CAST(N'2025-07-05T04:13:04.1540070' AS DateTime2), N'382')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (83, 5, 2, CAST(N'2025-07-07T08:00:00.0000000' AS DateTime2), CAST(N'2025-07-07T09:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-05T06:17:03.4322718' AS DateTime2), CAST(N'2025-07-05T06:17:03.4323193' AS DateTime2), N'795')
INSERT [dbo].[Appointments] ([appointmentID], [userID], [consultantID], [startDateTime], [endDateTime], [price], [status], [note], [createdAt], [updatedAt], [ScheduleIds]) VALUES (84, 5, 2, CAST(N'2025-07-05T17:00:00.0000000' AS DateTime2), CAST(N'2025-07-05T18:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-05T06:19:04.6517188' AS DateTime2), CAST(N'2025-07-05T06:19:04.6517908' AS DateTime2), N'383')
SET IDENTITY_INSERT [dbo].[Appointments] OFF
GO
SET IDENTITY_INSERT [dbo].[Assessments] ON 

INSERT [dbo].[Assessments] ([assessmentID], [assessmentName], [description], [assessmentType], [minAge], [maxAge], [IsDeleted], [AssessmentStage]) VALUES (1, N'kt đầu vào', N'bài kiểm tra đánh giá sự hiểu biết', N'Crafft', 19, 25, 0, N'Input')
INSERT [dbo].[Assessments] ([assessmentID], [assessmentName], [description], [assessmentType], [minAge], [maxAge], [IsDeleted], [AssessmentStage]) VALUES (2, N'BAN DA THU DA CHUA', N'aaaaaaaa', N'Assist', 12, 18, 0, N'Input')
INSERT [dbo].[Assessments] ([assessmentID], [assessmentName], [description], [assessmentType], [minAge], [maxAge], [IsDeleted], [AssessmentStage]) VALUES (3, N'BAN DA THU DA CHUA', N'sáds', N'Assist', 12, 18, 0, N'Output')
INSERT [dbo].[Assessments] ([assessmentID], [assessmentName], [description], [assessmentType], [minAge], [maxAge], [IsDeleted], [AssessmentStage]) VALUES (1002, N'BAN DA THU DA CHUAaaaaaaa', N'aaaaaaaaaaaaa', N'Crafft', 12, 18, 0, N'Output')
INSERT [dbo].[Assessments] ([assessmentID], [assessmentName], [description], [assessmentType], [minAge], [maxAge], [IsDeleted], [AssessmentStage]) VALUES (1003, N'999', N'999', N'Crafft', 19, 25, 1, N'Output')
INSERT [dbo].[Assessments] ([assessmentID], [assessmentName], [description], [assessmentType], [minAge], [maxAge], [IsDeleted], [AssessmentStage]) VALUES (1004, N'999', N'999', N'Assist', 26, 200, 1, N'Output')
INSERT [dbo].[Assessments] ([assessmentID], [assessmentName], [description], [assessmentType], [minAge], [maxAge], [IsDeleted], [AssessmentStage]) VALUES (1005, N'9999', N'99999', N'Crafft', 12, 18, 1, N'Output')
SET IDENTITY_INSERT [dbo].[Assessments] OFF
GO
SET IDENTITY_INSERT [dbo].[Certificates] ON 

INSERT [dbo].[Certificates] ([certificateID], [certificateName], [dateAcquired]) VALUES (1, N'Psychology Degree', CAST(N'2015-06-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Certificates] ([certificateID], [certificateName], [dateAcquired]) VALUES (2, N'Mental Health Training', CAST(N'2019-11-30T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Certificates] OFF
GO
SET IDENTITY_INSERT [dbo].[Consultants] ON 

INSERT [dbo].[Consultants] ([consultantID], [userID], [certificateID], [specialty], [degree], [experience], [hourlyRate], [createdAt], [updatedAt], [GoogleMeetLink]) VALUES (1, 2, 1, N'Substance Abuse Counseling', N'PhD in Psychology', N'10 years in mental health support.', CAST(50.00 AS Decimal(10, 2)), CAST(N'2025-06-24T14:26:43.9433333' AS DateTime2), CAST(N'2025-06-24T14:26:43.9433333' AS DateTime2), N'https://meet.google.com/yco-awfm-miz')
INSERT [dbo].[Consultants] ([consultantID], [userID], [certificateID], [specialty], [degree], [experience], [hourlyRate], [createdAt], [updatedAt], [GoogleMeetLink]) VALUES (2, 6, 1, N'10', N'King', N'10', CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-24T08:57:30.8418666' AS DateTime2), CAST(N'2025-06-24T08:57:30.8419054' AS DateTime2), N'https://meet.google.com/yco-awfm-miz')
INSERT [dbo].[Consultants] ([consultantID], [userID], [certificateID], [specialty], [degree], [experience], [hourlyRate], [createdAt], [updatedAt], [GoogleMeetLink]) VALUES (3, 7, 1, N'Good', N'Top1', N'10 year ', CAST(8888.00 AS Decimal(10, 2)), CAST(N'2025-06-26T16:18:49.7388089' AS DateTime2), CAST(N'2025-06-26T16:18:49.7388922' AS DateTime2), NULL)
INSERT [dbo].[Consultants] ([consultantID], [userID], [certificateID], [specialty], [degree], [experience], [hourlyRate], [createdAt], [updatedAt], [GoogleMeetLink]) VALUES (5, 9, 1, N'football', N'Of life', N'20 year', CAST(8989.00 AS Decimal(10, 2)), CAST(N'2025-06-28T08:28:41.2776860' AS DateTime2), CAST(N'2025-06-28T08:30:13.3556849' AS DateTime2), N'https://meet.google.com/rqt-crtr-xsi')
SET IDENTITY_INSERT [dbo].[Consultants] OFF
GO
SET IDENTITY_INSERT [dbo].[ConsultantSchedules] ON 

INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1, 1, N'Monday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2, 2, N'Monday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (3, 2, N'Monday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (4, 2, N'Monday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (5, 2, N'Monday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (6, 2, N'Monday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (7, 1, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (8, 1, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (9, 1, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (10, 1, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (11, 1, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (12, 1, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (13, 1, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (14, 1, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (15, 1, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (16, 1, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (17, 1, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (18, 1, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (19, 1, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (20, 1, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (21, 1, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (22, 1, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (23, 1, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (24, 1, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (25, 1, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (26, 1, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (27, 1, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (28, 1, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (29, 1, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (30, 1, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (31, 1, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (32, 1, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (33, 1, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (34, 1, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (35, 1, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (36, 1, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (37, 1, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (38, 1, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (39, 1, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (40, 1, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (41, 1, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (42, 1, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (43, 1, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (44, 1, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (45, 1, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (46, 1, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (47, 1, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (48, 1, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (49, 1, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (50, 1, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (51, 1, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (52, 1, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (53, 1, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (54, 1, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (55, 1, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (56, 1, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (57, 1, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (58, 1, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (59, 1, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (60, 1, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (61, 1, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (62, 1, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (63, 1, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (64, 1, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (65, 1, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (66, 1, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (67, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (68, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (69, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (70, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (71, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (72, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (73, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (74, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (75, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (76, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (77, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (78, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (79, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (80, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (81, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (82, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (83, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (84, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (85, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (86, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (87, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (88, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (89, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (90, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (91, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (92, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (93, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (94, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (95, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (96, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (97, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (98, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (99, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (100, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (101, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (102, 2, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (103, 2, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (104, 2, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (105, 2, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (106, 2, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (107, 2, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (108, 2, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (109, 2, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (110, 2, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (111, 2, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (112, 2, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (113, 2, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (114, 2, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (115, 2, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (116, 2, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (117, 2, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (118, 2, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (119, 2, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (120, 2, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (121, 2, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (122, 2, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (123, 2, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (124, 2, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (125, 2, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (126, 2, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (127, 2, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (128, 2, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (129, 2, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (130, 2, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (131, 2, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (132, 2, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (133, 2, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (134, 2, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (135, 2, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (136, 2, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (137, 2, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (138, 2, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (139, 2, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (140, 2, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (141, 2, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (142, 2, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (143, 2, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (144, 2, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (145, 2, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (146, 2, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (147, 2, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (148, 2, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (149, 2, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (150, 2, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (151, 2, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (152, 2, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (153, 2, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (154, 2, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (155, 2, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (156, 2, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (157, 2, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (158, 2, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (159, 2, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (160, 2, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (161, 2, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (162, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (163, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (164, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (165, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (166, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (167, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (168, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (169, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (170, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (171, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (172, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (173, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (174, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (175, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (176, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (177, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (178, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (179, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (180, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (181, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (182, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (183, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (184, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (185, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (186, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (187, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (188, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (189, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (190, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (191, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (192, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (193, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (194, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (195, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (196, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (197, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (198, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (199, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (200, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (201, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (202, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (203, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (204, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (205, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (206, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (207, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (208, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (209, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (210, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (211, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (212, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (213, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (214, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (215, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (216, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (217, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (218, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (219, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (220, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (221, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (222, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (223, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (224, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (225, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (226, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (227, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (228, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (229, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (230, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (231, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (232, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (233, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (234, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (235, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (236, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (237, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (238, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (239, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (240, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (241, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (242, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (243, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (244, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (245, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (246, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (247, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (248, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (249, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (250, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (251, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (252, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (253, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (254, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (255, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (256, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (257, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (258, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (259, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (260, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (261, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (262, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (263, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (264, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (265, 3, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (266, 3, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (267, 3, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (268, 3, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (269, 3, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (270, 3, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (271, 3, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (272, 3, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (273, 3, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (274, 3, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (275, 3, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (276, 3, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (277, 3, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (278, 3, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (279, 3, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (280, 3, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (281, 3, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (282, 3, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (283, 3, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (284, 3, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (285, 3, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (286, 3, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (287, 3, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (288, 3, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (289, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (290, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (291, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (292, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (293, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (294, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (295, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (296, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (297, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (298, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (299, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (300, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (301, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (302, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (303, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (304, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (305, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (306, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (307, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (308, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (309, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (310, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (311, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (312, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (313, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (314, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (315, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (316, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (317, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (318, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (319, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (320, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (321, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (322, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (323, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (324, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (325, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (326, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (327, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (328, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (329, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (330, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (331, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (332, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (333, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (334, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (335, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (336, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (337, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (338, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (339, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (340, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (341, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (342, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (343, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (344, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (345, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (346, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (347, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (348, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (349, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (350, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (351, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (352, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (353, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (354, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (355, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (356, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (357, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (358, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (359, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (360, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (361, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (362, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (363, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (364, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (365, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (366, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (367, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (368, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (369, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (370, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (371, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (372, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (373, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (374, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (375, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (376, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (377, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (378, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (379, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (380, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (381, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (382, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (383, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (384, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (385, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (386, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (387, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (388, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (389, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (390, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (391, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (392, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (393, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (394, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (395, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (396, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (397, 5, N'Staturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (398, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (399, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (400, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (401, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (402, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (403, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (404, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (405, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (406, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (407, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (408, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (409, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (410, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (411, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (412, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (413, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (414, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (415, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (416, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (417, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (418, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (419, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (420, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (421, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (422, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (423, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (424, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (425, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (426, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (427, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (428, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (429, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (430, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (431, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (432, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (433, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (434, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (435, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (436, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (437, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (438, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (439, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (440, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (441, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (442, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (443, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (444, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (445, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (446, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (447, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (448, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (449, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (450, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (451, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (452, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (453, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (454, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (455, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (456, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (457, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (458, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (459, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (460, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (461, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (462, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (463, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (464, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (465, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (466, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (467, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (468, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (469, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (470, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (471, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (472, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (473, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (474, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (475, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (476, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (477, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (478, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (479, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (480, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (481, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (482, 1, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (483, 1, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (484, 1, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (485, 1, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (486, 1, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (487, 1, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (488, 1, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (489, 1, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (490, 1, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (491, 1, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (492, 1, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (493, 1, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (494, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (495, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (496, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (497, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (498, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (499, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (500, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (501, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (502, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (503, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (504, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (505, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (506, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (507, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (508, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (509, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (510, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (511, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (512, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (513, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (514, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (515, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (516, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (517, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (518, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (519, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (520, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (521, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (522, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (523, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (524, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (525, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (526, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (527, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (528, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (529, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (530, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (531, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (532, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (533, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (534, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (535, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (536, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (537, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (538, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (539, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (540, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (541, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (542, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (543, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (544, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (545, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (546, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (547, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (548, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (549, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (550, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (551, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (552, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (553, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (554, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (555, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (556, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (557, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (558, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (559, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (560, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (561, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (562, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (563, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (564, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (565, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (566, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (567, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (568, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (569, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (570, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (571, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (572, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (573, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (574, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (575, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (576, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (577, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (578, 2, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (579, 2, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (580, 2, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (581, 2, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (582, 2, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (583, 2, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (584, 2, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (585, 2, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (586, 2, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (587, 2, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (588, 2, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (589, 2, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (590, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (591, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (592, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (593, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (594, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (595, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (596, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (597, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (598, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (599, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (600, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (601, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (602, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (603, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (604, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (605, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (606, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (607, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (608, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (609, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (610, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (611, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (612, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (613, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (614, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (615, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (616, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (617, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (618, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (619, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (620, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (621, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (622, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (623, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (624, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (625, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (626, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (627, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (628, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (629, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (630, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (631, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (632, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (633, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (634, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (635, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (636, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (637, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (638, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (639, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (640, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (641, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (642, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (643, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (644, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (645, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (646, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (647, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (648, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (649, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (650, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (651, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (652, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (653, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (654, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (655, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (656, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (657, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (658, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (659, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (660, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (661, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (662, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (663, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (664, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (665, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (666, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (667, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (668, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (669, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (670, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (671, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (672, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (673, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (674, 3, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (675, 3, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (676, 3, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (677, 3, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (678, 3, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (679, 3, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (680, 3, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (681, 3, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (682, 3, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (683, 3, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (684, 3, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (685, 3, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (686, 5, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (687, 5, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (688, 5, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (689, 5, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (690, 5, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (691, 5, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (692, 5, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (693, 5, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (694, 5, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (695, 5, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (696, 5, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (697, 5, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (698, 5, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (699, 5, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (700, 5, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (701, 5, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (702, 5, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (703, 5, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (704, 5, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (705, 5, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (706, 5, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (707, 5, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (708, 5, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (709, 5, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (710, 5, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (711, 5, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (712, 5, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (713, 5, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (714, 5, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (715, 5, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (716, 5, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (717, 5, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (718, 5, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (719, 5, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (720, 5, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (721, 5, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (722, 5, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (723, 5, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (724, 5, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (725, 5, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (726, 5, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (727, 5, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (728, 5, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (729, 5, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (730, 5, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (731, 5, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (732, 5, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (733, 5, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (734, 5, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (735, 5, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (736, 5, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (737, 5, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (738, 5, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (739, 5, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (740, 5, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (741, 5, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (742, 5, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (743, 5, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (744, 5, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (745, 5, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (746, 5, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (747, 5, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (748, 5, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (749, 5, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (750, 5, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (751, 5, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (752, 5, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (753, 5, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (754, 5, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (755, 5, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (756, 5, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (757, 5, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (758, 5, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (759, 5, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (760, 5, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (761, 5, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (762, 5, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (763, 5, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (764, 5, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (765, 5, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (766, 5, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (767, 5, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (768, 5, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (769, 5, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (770, 5, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (771, 5, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (772, 5, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (773, 5, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (774, 5, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (775, 5, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (776, 5, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (777, 5, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (778, 5, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (779, 5, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (780, 5, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (781, 5, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (782, 1, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (783, 1, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (784, 1, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (785, 1, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (786, 1, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (787, 1, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (788, 1, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (789, 1, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (790, 1, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (791, 1, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (792, 1, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (793, 1, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (794, 2, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (795, 2, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (796, 2, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (797, 2, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (798, 2, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (799, 2, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (800, 2, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (801, 2, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (802, 2, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (803, 2, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (804, 2, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (805, 2, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (806, 3, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (807, 3, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (808, 3, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (809, 3, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (810, 3, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (811, 3, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (812, 3, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (813, 3, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (814, 3, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (815, 3, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (816, 3, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (817, 3, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (818, 5, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (819, 5, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (820, 5, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (821, 5, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (822, 5, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (823, 5, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (824, 5, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (825, 5, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (826, 5, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (827, 5, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (828, 5, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (829, 5, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (830, 1, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (831, 1, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (832, 1, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (833, 1, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (834, 1, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (835, 1, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (836, 1, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (837, 1, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (838, 1, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (839, 1, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (840, 1, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (841, 1, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (842, 2, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (843, 2, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (844, 2, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (845, 2, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (846, 2, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (847, 2, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (848, 2, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (849, 2, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (850, 2, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (851, 2, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (852, 2, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (853, 2, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (854, 3, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (855, 3, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (856, 3, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (857, 3, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (858, 3, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (859, 3, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (860, 3, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (861, 3, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (862, 3, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (863, 3, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (864, 3, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (865, 3, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (866, 5, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (867, 5, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (868, 5, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (869, 5, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (870, 5, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (871, 5, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (872, 5, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (873, 5, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (874, 5, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (875, 5, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (876, 5, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (877, 5, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (878, 1, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (879, 1, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (880, 1, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (881, 1, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (882, 1, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (883, 1, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (884, 1, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (885, 1, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (886, 1, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (887, 1, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (888, 1, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (889, 1, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (890, 1, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (891, 1, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (892, 1, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (893, 1, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (894, 1, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (895, 1, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (896, 1, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (897, 1, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (898, 1, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (899, 1, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (900, 1, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (901, 1, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (902, 2, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (903, 2, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (904, 2, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (905, 2, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (906, 2, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (907, 2, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (908, 2, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (909, 2, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (910, 2, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (911, 2, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (912, 2, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (913, 2, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (914, 2, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (915, 2, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (916, 2, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (917, 2, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (918, 2, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (919, 2, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (920, 2, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (921, 2, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (922, 2, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (923, 2, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (924, 2, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (925, 2, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (926, 3, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (927, 3, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (928, 3, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (929, 3, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (930, 3, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (931, 3, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (932, 3, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (933, 3, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (934, 3, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (935, 3, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (936, 3, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (937, 3, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (938, 3, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (939, 3, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (940, 3, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (941, 3, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (942, 3, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (943, 3, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (944, 3, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (945, 3, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (946, 3, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (947, 3, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (948, 3, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (949, 3, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (950, 5, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (951, 5, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (952, 5, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (953, 5, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (954, 5, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (955, 5, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (956, 5, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (957, 5, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (958, 5, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (959, 5, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (960, 5, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (961, 5, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (962, 5, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (963, 5, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (964, 5, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (965, 5, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (966, 5, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (967, 5, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (968, 5, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (969, 5, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (970, 5, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (971, 5, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (972, 5, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (973, 5, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (974, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (975, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (976, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (977, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (978, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (979, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (980, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (981, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (982, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (983, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (984, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (985, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (986, 2, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (987, 2, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (988, 2, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (989, 2, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (990, 2, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (991, 2, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (992, 2, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (993, 2, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (994, 2, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (995, 2, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (996, 2, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (997, 2, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (998, 3, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (999, 3, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1000, 3, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1001, 3, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1002, 3, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1003, 3, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1004, 3, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1005, 3, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1006, 3, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1007, 3, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1008, 3, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1009, 3, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1010, 5, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1011, 5, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1012, 5, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1013, 5, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1014, 5, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1015, 5, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1016, 5, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1017, 5, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1018, 5, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1019, 5, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1020, 5, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1021, 5, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1830, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1831, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1832, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1833, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1834, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1835, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1836, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1837, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1838, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1839, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1840, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1841, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1842, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1843, 2, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1844, 2, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1845, 2, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1846, 2, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1847, 2, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1848, 2, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1849, 2, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1850, 2, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1851, 2, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1852, 2, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1853, 2, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1854, 2, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1855, 3, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1856, 3, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1857, 3, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1858, 3, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1859, 3, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1860, 3, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1861, 3, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1862, 3, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1863, 3, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1864, 3, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1865, 3, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1866, 3, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1867, 5, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1868, 5, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1869, 5, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1870, 5, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1871, 5, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1872, 5, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1873, 5, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1874, 5, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1875, 5, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1876, 5, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1877, 5, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1878, 5, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1879, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1880, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1881, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1882, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1883, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1884, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1885, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1886, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1887, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1888, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1889, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1890, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1891, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1892, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1893, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1894, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1895, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1896, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1897, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1898, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1899, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1900, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1901, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1902, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1903, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1904, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1905, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1906, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1907, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1908, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1909, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1910, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1911, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1912, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1913, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1914, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1915, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1916, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1917, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1918, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1919, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1920, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1921, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1922, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1923, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1924, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1925, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1926, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1927, 2, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1928, 2, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1929, 2, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1930, 2, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1931, 2, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1932, 2, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1933, 2, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1934, 2, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1935, 2, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1936, 2, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1937, 2, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1938, 2, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1939, 2, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1940, 2, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1941, 2, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1942, 2, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1943, 2, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1944, 2, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1945, 2, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1946, 2, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1947, 2, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1948, 2, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1949, 2, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1950, 2, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1951, 2, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1952, 2, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1953, 2, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1954, 2, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1955, 2, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1956, 2, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1957, 2, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1958, 2, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1959, 2, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1960, 2, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1961, 2, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1962, 2, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1963, 2, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1964, 2, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1965, 2, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1966, 2, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1967, 2, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1968, 2, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1969, 2, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1970, 2, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1971, 2, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1972, 2, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1973, 2, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1974, 2, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1975, 3, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1976, 3, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1977, 3, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1978, 3, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1979, 3, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1980, 3, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1981, 3, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1982, 3, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1983, 3, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1984, 3, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1985, 3, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1986, 3, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1987, 3, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1988, 3, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1989, 3, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1990, 3, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1991, 3, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1992, 3, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1993, 3, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1994, 3, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1995, 3, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1996, 3, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1997, 3, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1998, 3, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (1999, 3, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2000, 3, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2001, 3, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2002, 3, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2003, 3, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2004, 3, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2005, 3, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2006, 3, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2007, 3, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2008, 3, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2009, 3, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2010, 3, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2011, 3, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2012, 3, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2013, 3, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2014, 3, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2015, 3, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2016, 3, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2017, 3, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2018, 3, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2019, 3, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2020, 3, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2021, 3, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2022, 3, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2023, 5, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2024, 5, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2025, 5, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2026, 5, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2027, 5, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2028, 5, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2029, 5, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2030, 5, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2031, 5, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2032, 5, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2033, 5, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2034, 5, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2035, 5, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2036, 5, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2037, 5, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2038, 5, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2039, 5, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2040, 5, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2041, 5, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2042, 5, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2043, 5, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2044, 5, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2045, 5, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2046, 5, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2047, 5, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2048, 5, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2049, 5, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2050, 5, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2051, 5, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2052, 5, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2053, 5, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2054, 5, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2055, 5, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2056, 5, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2057, 5, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2058, 5, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2059, 5, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2060, 5, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2061, 5, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2062, 5, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2063, 5, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2064, 5, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2065, 5, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2066, 5, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2067, 5, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2068, 5, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2069, 5, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([scheduleID], [consultantID], [dayOfWeek], [date], [startTime], [endTime], [isAvailable], [notes]) VALUES (2070, 5, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
SET IDENTITY_INSERT [dbo].[ConsultantSchedules] OFF
GO
INSERT [dbo].[CourseAssessments] ([courseID], [assessmentID]) VALUES (5, 3)
INSERT [dbo].[CourseAssessments] ([courseID], [assessmentID]) VALUES (5, 1002)
INSERT [dbo].[CourseAssessments] ([courseID], [assessmentID]) VALUES (1002, 1003)
INSERT [dbo].[CourseAssessments] ([courseID], [assessmentID]) VALUES (1002, 1004)
INSERT [dbo].[CourseAssessments] ([courseID], [assessmentID]) VALUES (1008, 1005)
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([courseID], [CourseName], [description], [startDate], [endDate], [status], [ageMin], [ageMax], [capacity], [price], [createdAt], [updatedAt], [Type], [IsDeleted]) VALUES (1, N'matuy2', N'hhh', CAST(N'2025-07-01' AS Date), CAST(N'2025-09-01' AS Date), N'Open', 2, 18, 0, CAST(100000.00 AS Decimal(10, 2)), CAST(N'2025-07-01T09:23:21.7547741' AS DateTime2), CAST(N'2025-07-01T09:26:07.2609346' AS DateTime2), N'HocSinh   ', 1)
INSERT [dbo].[Courses] ([courseID], [CourseName], [description], [startDate], [endDate], [status], [ageMin], [ageMax], [capacity], [price], [createdAt], [updatedAt], [Type], [IsDeleted]) VALUES (2, N'ma tuy', N'kkkk', CAST(N'2025-07-01' AS Date), CAST(N'2025-08-01' AS Date), N'Open', 12, 18, 20, CAST(100000.00 AS Decimal(10, 2)), CAST(N'2025-07-01T14:07:34.7999067' AS DateTime2), CAST(N'2025-07-01T14:07:34.8002622' AS DateTime2), N'HocSinh   ', 1)
INSERT [dbo].[Courses] ([courseID], [CourseName], [description], [startDate], [endDate], [status], [ageMin], [ageMax], [capacity], [price], [createdAt], [updatedAt], [Type], [IsDeleted]) VALUES (5, N'sâsdssaas', N'âsasasasasassas', CAST(N'2025-07-07' AS Date), CAST(N'2025-07-18' AS Date), N'CLOSED', 19, 25, 12334, CAST(1000000.00 AS Decimal(10, 2)), CAST(N'2025-07-03T10:15:33.5688585' AS DateTime2), CAST(N'2025-07-05T07:01:58.9204949' AS DateTime2), N'SinhVien  ', 0)
INSERT [dbo].[Courses] ([courseID], [CourseName], [description], [startDate], [endDate], [status], [ageMin], [ageMax], [capacity], [price], [createdAt], [updatedAt], [Type], [IsDeleted]) VALUES (1002, N'ggghhhh', N'fffggg', CAST(N'2025-06-30' AS Date), CAST(N'2025-07-21' AS Date), N'Open', 19, 25, 99, CAST(999.00 AS Decimal(10, 2)), CAST(N'2025-07-05T06:27:56.8384656' AS DateTime2), CAST(N'2025-07-05T06:36:31.0932909' AS DateTime2), N'SinhVien  ', 0)
INSERT [dbo].[Courses] ([courseID], [CourseName], [description], [startDate], [endDate], [status], [ageMin], [ageMax], [capacity], [price], [createdAt], [updatedAt], [Type], [IsDeleted]) VALUES (1003, N'6999', N'9******', CAST(N'2025-06-30' AS Date), CAST(N'2025-07-17' AS Date), N'Open', 12, 18, 999, CAST(9999.00 AS Decimal(10, 2)), CAST(N'2025-07-05T06:55:45.7800321' AS DateTime2), CAST(N'2025-07-05T06:55:45.7800322' AS DateTime2), N'HocSinh   ', 0)
INSERT [dbo].[Courses] ([courseID], [CourseName], [description], [startDate], [endDate], [status], [ageMin], [ageMax], [capacity], [price], [createdAt], [updatedAt], [Type], [IsDeleted]) VALUES (1004, N'6999999', N'999', CAST(N'2025-06-18' AS Date), CAST(N'2025-07-25' AS Date), N'Open', 26, 200, 999, CAST(9999.00 AS Decimal(10, 2)), CAST(N'2025-07-05T06:57:34.2021478' AS DateTime2), CAST(N'2025-07-05T06:57:34.2021479' AS DateTime2), N'PhuHuynh  ', 0)
INSERT [dbo].[Courses] ([courseID], [CourseName], [description], [startDate], [endDate], [status], [ageMin], [ageMax], [capacity], [price], [createdAt], [updatedAt], [Type], [IsDeleted]) VALUES (1005, N'8598/98*', N'58758698599999', CAST(N'2025-07-09' AS Date), CAST(N'2025-07-22' AS Date), N'Open', 19, 25, 999, CAST(999.00 AS Decimal(10, 2)), CAST(N'2025-07-05T06:58:01.0300220' AS DateTime2), CAST(N'2025-07-05T07:01:19.0767377' AS DateTime2), N'SinhVien  ', 0)
INSERT [dbo].[Courses] ([courseID], [CourseName], [description], [startDate], [endDate], [status], [ageMin], [ageMax], [capacity], [price], [createdAt], [updatedAt], [Type], [IsDeleted]) VALUES (1006, N'8598/98*', N'99999', CAST(N'2025-07-09' AS Date), CAST(N'2025-07-22' AS Date), N'Open', 19, 25, 999, CAST(999.00 AS Decimal(10, 2)), CAST(N'2025-07-05T06:58:40.1100020' AS DateTime2), CAST(N'2025-07-05T07:01:09.2320500' AS DateTime2), N'SinhVien  ', 0)
INSERT [dbo].[Courses] ([courseID], [CourseName], [description], [startDate], [endDate], [status], [ageMin], [ageMax], [capacity], [price], [createdAt], [updatedAt], [Type], [IsDeleted]) VALUES (1007, N'8598/98*', N'', CAST(N'2025-07-10' AS Date), CAST(N'2025-07-23' AS Date), N'Open', 12, 18, 999, CAST(999.00 AS Decimal(10, 2)), CAST(N'2025-07-05T06:58:49.5208670' AS DateTime2), CAST(N'2025-07-05T06:58:49.5208670' AS DateTime2), N'HocSinh   ', 0)
INSERT [dbo].[Courses] ([courseID], [CourseName], [description], [startDate], [endDate], [status], [ageMin], [ageMax], [capacity], [price], [createdAt], [updatedAt], [Type], [IsDeleted]) VALUES (1008, N'8598/98*gggggg', N'', CAST(N'2025-07-09' AS Date), CAST(N'2025-07-22' AS Date), N'Open', 19, 25, 999, CAST(999.00 AS Decimal(10, 2)), CAST(N'2025-07-05T06:58:58.0867961' AS DateTime2), CAST(N'2025-07-05T07:01:37.7373819' AS DateTime2), N'SinhVien  ', 0)
INSERT [dbo].[Courses] ([courseID], [CourseName], [description], [startDate], [endDate], [status], [ageMin], [ageMax], [capacity], [price], [createdAt], [updatedAt], [Type], [IsDeleted]) VALUES (1009, N'máaaaa', N'598989+9', CAST(N'2025-07-11' AS Date), CAST(N'2025-07-30' AS Date), N'Open', 12, 18, 999, CAST(9999.00 AS Decimal(10, 2)), CAST(N'2025-07-05T07:03:35.3922001' AS DateTime2), CAST(N'2025-07-05T07:03:35.3922001' AS DateTime2), N'HocSinh   ', 0)
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (1, 5, NULL, 3, CAST(9999.00 AS Decimal(10, 2)), CAST(N'2025-06-24T09:22:11.1919174' AS DateTime2), N'VNPAY', N'PENDING', N'500fbc94-084f-4c46-9484-efc1fb71b105-3', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (2, 5, NULL, 4, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-24T09:40:44.6587791' AS DateTime2), N'VNPAY', N'PENDING', N'5f9df9bd-6e33-431f-ba28-5d3c39faa21a-4', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (3, 5, NULL, 5, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-24T09:46:46.4194767' AS DateTime2), N'VNPAY', N'SUCCESS', N'01609f7c-293c-4f3f-84aa-523d582c0ff7-5', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (4, 5, NULL, 6, CAST(199998.00 AS Decimal(10, 2)), CAST(N'2025-06-26T15:09:59.4827192' AS DateTime2), N'VNPAY', N'SUCCESS', N'42efd495-d2ff-4017-b1a0-985611e3a436-6', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (5, 5, NULL, 7, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-27T04:53:31.4091642' AS DateTime2), N'VNPAY', N'PENDING', N'8ed48bef-f305-4f23-a2a9-5239875d8de9-7', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (6, 5, NULL, 8, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-27T06:03:18.1001058' AS DateTime2), N'VNPAY', N'PENDING', N'd1862665-da2c-4c9e-ae38-2a1b12da7138-8', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (7, 5, NULL, 9, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-27T06:10:50.4483111' AS DateTime2), N'VNPAY', N'PENDING', N'74d57939-3c5e-45d0-9717-c461fda9447d-9', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (8, 5, NULL, 10, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-27T06:34:16.0122583' AS DateTime2), N'VNPAY', N'PENDING', N'90de7cfd-a6c7-4313-ab9c-e53ca07b0ec5-10', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (9, 5, NULL, 11, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-27T07:23:28.1645398' AS DateTime2), N'VNPAY', N'PENDING', N'97b60f80-5645-4e95-ae68-342975e281c8-11', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (10, 5, NULL, 12, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-27T07:56:26.9098816' AS DateTime2), N'VNPAY', N'PENDING', N'd956b8ac-0a52-4edb-bd5b-e6dca2d80e04-12', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (11, 5, NULL, 13, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-27T08:00:56.5337670' AS DateTime2), N'VNPAY', N'PENDING', N'd269d032-c6af-46e8-8f00-1622f53d192e-13', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (12, 5, NULL, 14, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-27T08:04:52.1363298' AS DateTime2), N'VNPAY', N'SUCCESS', N'1f71e9bf-36ef-4f08-a2a2-3411f5c71577-14', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (13, 5, NULL, 15, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-27T08:26:59.4357322' AS DateTime2), N'VNPAY', N'PENDING', N'13aec7b3-9d12-48df-8b13-1bf38a267f88-15', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (14, 5, NULL, 16, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-27T08:35:09.2329388' AS DateTime2), N'VNPAY', N'PENDING', N'09bd709f-8693-4ace-b703-aeaa2a9c5e60-16', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (15, 5, NULL, 17, CAST(8888.00 AS Decimal(10, 2)), CAST(N'2025-06-27T17:28:48.3574882' AS DateTime2), N'VNPAY', N'PENDING', N'365fa9d0-6519-4e6a-b05a-d401c0083a83-17', 1)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (16, 5, NULL, 18, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T16:55:03.8500997' AS DateTime2), N'VNPAY', N'PENDING', N'705ff51a-1911-40ae-bae6-e09f5e72f542-18', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (17, 5, NULL, 19, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T16:57:07.1627568' AS DateTime2), N'VNPAY', N'SUCCESS', N'05dffb0a-8f72-484e-8655-ef241863b4fb-19', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (18, 5, NULL, 20, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T17:35:50.2104727' AS DateTime2), N'VNPAY', N'PENDING', N'8280a6fb-bd70-4858-b440-ef654f1efe55-20', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (19, 5, NULL, 21, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T17:36:13.5475235' AS DateTime2), N'VNPAY', N'SUCCESS', N'0ef8f05a-026c-40c4-966e-a557357ac89a-21', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (20, 5, NULL, 22, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T17:42:54.4949710' AS DateTime2), N'VNPAY', N'PENDING', N'7ef588df-7493-4daf-9a1e-864cebdc3def-22', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (21, 5, NULL, 23, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T17:43:22.5091722' AS DateTime2), N'VNPAY', N'PENDING', N'66054c6a-5ed2-4809-bb86-89e8de124144-23', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (22, 5, NULL, 24, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T17:43:30.0828806' AS DateTime2), N'VNPAY', N'PENDING', N'65259e30-4b46-427e-a6be-fec681dc355d-24', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (23, 5, NULL, 25, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T17:45:59.2896056' AS DateTime2), N'VNPAY', N'PENDING', N'4e61827a-fa5b-48ed-bd4f-e462527d01cc-25', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (24, 5, NULL, 26, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T17:52:23.6299940' AS DateTime2), N'VNPAY', N'PENDING', N'46224f72-063c-40ed-8074-1e79c975ccf2-26', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (25, 5, NULL, 27, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T17:52:51.0151323' AS DateTime2), N'VNPAY', N'PENDING', N'93e840f6-a154-4028-9c85-f07b7afacdd3-27', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (26, 5, NULL, 28, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T17:53:08.8155564' AS DateTime2), N'VNPAY', N'SUCCESS', N'2645c95d-d904-429a-9926-91fc61a2fe90-28', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (27, 5, NULL, 29, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T18:18:31.0685874' AS DateTime2), N'VNPAY', N'PENDING', N'b15f69af-a92e-4d9b-89dc-f268c4ad5780-29', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (28, 5, NULL, 30, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T18:25:58.8192377' AS DateTime2), N'VNPAY', N'SUCCESS', N'982b775c-e877-4e1d-9cfb-32a6400b1f6f-30', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (29, 5, NULL, 31, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T18:30:20.3129800' AS DateTime2), N'VNPAY', N'SUCCESS', N'92d80f45-a5d9-4008-a763-fcde16754d2a-31', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (30, 5, NULL, 32, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T18:41:04.4905647' AS DateTime2), N'VNPAY', N'SUCCESS', N'13d7fa5a-d7cf-4b42-9597-de8e613ffe3f-32', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (31, 5, NULL, 33, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T18:42:44.4148023' AS DateTime2), N'VNPAY', N'PENDING', N'3c856d38-9038-4653-af8a-15f2b1df0967-33', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (32, 5, NULL, 34, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T18:49:42.4222559' AS DateTime2), N'VNPAY', N'PENDING', N'1b4ca853-c8cb-43aa-b48c-54bca2acd612-34', 2)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (33, 5, NULL, 35, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T18:53:28.4557130' AS DateTime2), N'VNPAY', N'PENDING', N'b4bf03eb-0dc6-4d86-81d6-75bfe851c6d0-35', 1)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (34, 10, NULL, 36, CAST(8989.00 AS Decimal(10, 2)), CAST(N'2025-06-29T02:19:39.6224603' AS DateTime2), N'VNPAY', N'PENDING', N'5311ad7f-393c-48a3-b6b8-023b6737978d-36', 1)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (35, 10, NULL, 37, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T02:21:11.3167111' AS DateTime2), N'VNPAY', N'SUCCESS', N'706cb3ac-f816-4807-9b06-02cce75cc571-37', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (36, 10, NULL, 38, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T06:13:59.6327731' AS DateTime2), N'VNPAY', N'SUCCESS', N'07233e48-f91b-4478-904e-5244f6e52e15-38', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (37, 5, NULL, 39, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T06:20:17.1139829' AS DateTime2), N'VNPAY', N'SUCCESS', N'a4899e65-47ea-4110-aaa2-594a0c2c65d8-39', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (38, 5, NULL, 40, CAST(8888.00 AS Decimal(10, 2)), CAST(N'2025-06-29T06:23:05.7680520' AS DateTime2), N'VNPAY', N'PENDING', N'550c8107-094b-4704-9e4c-9661fab5e90a-40', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (39, 5, NULL, 41, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T06:23:16.0872228' AS DateTime2), N'VNPAY', N'SUCCESS', N'86d7b42d-029a-4dc0-a9b1-262d7ed3062e-41', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (40, 5, NULL, 42, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T06:26:21.9026261' AS DateTime2), N'VNPAY', N'SUCCESS', N'd5cb70bb-bba2-4d9f-a6d4-5abc94b6e016-42', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (41, 5, NULL, 43, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T06:36:11.8700034' AS DateTime2), N'VNPAY', N'SUCCESS', N'5e97733e-5b75-495b-a16c-ce525f7921af-43', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (42, 5, NULL, 44, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T06:43:00.7848039' AS DateTime2), N'VNPAY', N'PENDING', N'd4ab155b-e7e0-4776-8880-85bd4ac6b376-44', 1)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (43, 5, NULL, 45, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T06:43:30.2242259' AS DateTime2), N'VNPAY', N'SUCCESS', N'987547bd-294c-4dab-a257-a278243cccfe-45', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (44, 5, NULL, 46, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T06:49:10.6861863' AS DateTime2), N'VNPAY', N'SUCCESS', N'8fd443a5-1bf9-4adc-8fad-3a7bf236fe85-46', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (45, 5, NULL, 47, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T07:06:03.6730917' AS DateTime2), N'VNPAY', N'SUCCESS', N'80546047-2a2c-4284-ae5d-cd59dbd13d3a-47', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (46, 5, NULL, 48, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T07:09:37.7656325' AS DateTime2), N'VNPAY', N'SUCCESS', N'07d8deb8-7f2a-4dff-a465-265666045a55-48', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (47, 5, NULL, 49, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T07:36:55.2147943' AS DateTime2), N'VNPAY', N'SUCCESS', N'66ef7e76-4188-46bb-b287-d73d3946fa50-49', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (48, 5, NULL, 50, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T08:15:55.2703497' AS DateTime2), N'VNPAY', N'SUCCESS', N'1a3c3207-06b8-4968-8a10-4057d8c009b1-50', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (49, 5, NULL, 51, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T08:23:18.4003745' AS DateTime2), N'VNPAY', N'SUCCESS', N'76486b9e-4ce3-477f-af73-b7e79143eba6-51', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (50, 5, NULL, 52, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T08:31:10.3056873' AS DateTime2), N'VNPAY', N'SUCCESS', N'8b61e0c3-abc5-45c0-a7d2-ca5d6430b1d1-52', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (51, 5, NULL, 53, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T08:49:46.7007117' AS DateTime2), N'VNPAY', N'PENDING', N'73988a4f-70b1-4b70-b43b-859a50665b52-53', 1)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (52, 5, NULL, 54, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T13:35:37.0177903' AS DateTime2), N'VNPAY', N'SUCCESS', N'2683a7de-1907-40b4-a09a-943ab8918858-54', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (53, 5, NULL, 55, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T17:23:07.9542330' AS DateTime2), N'VNPAY', N'SUCCESS', N'20d2bba9-6c74-4872-bb2a-aff125bb75ee-55', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (54, 5, NULL, 56, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T17:28:17.1547925' AS DateTime2), N'VNPAY', N'SUCCESS', N'895d7e62-0e68-47dd-9fcb-a2727c3f9af6-56', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (55, 5, NULL, 57, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T17:31:32.3406208' AS DateTime2), N'VNPAY', N'SUCCESS', N'78d29cd8-9ffc-4668-9f27-da3db59659a0-57', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (56, 5, NULL, 58, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T17:39:56.2563978' AS DateTime2), N'VNPAY', N'SUCCESS', N'de7a4448-9df5-41ad-920e-cf4aaed25205-58', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (57, 5, NULL, 59, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T17:41:45.2239109' AS DateTime2), N'VNPAY', N'SUCCESS', N'360d6547-ddc3-4d56-ba2f-45e85c1ce7aa-59', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (58, 5, NULL, 60, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T17:43:58.7224235' AS DateTime2), N'VNPAY', N'SUCCESS', N'39b06db8-230e-4b5b-9cee-7c18e8f26cb8-60', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (59, 5, NULL, 61, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T17:44:59.3450545' AS DateTime2), N'VNPAY', N'SUCCESS', N'ff9a5cec-0070-4d13-8728-34dd10e11887-61', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (60, 5, NULL, 62, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T17:53:11.9969463' AS DateTime2), N'VNPAY', N'SUCCESS', N'a002289b-3863-4300-93bc-8eea28d91d11-62', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (61, 5, NULL, 63, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T17:53:57.8462846' AS DateTime2), N'VNPAY', N'SUCCESS', N'b14a5be1-1883-47f5-8967-cfba65ee4341-63', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (62, 5, NULL, 64, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T17:59:13.6570395' AS DateTime2), N'VNPAY', N'SUCCESS', N'50768c08-4f51-42a0-91a6-86aa8410779f-64', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (63, 5, NULL, 65, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-30T13:51:31.2938828' AS DateTime2), N'VNPAY', N'PENDING', N'd3f9528c-8cd1-47d0-baa7-17040823af67-65', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (64, 5, NULL, 66, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-30T13:54:18.7967448' AS DateTime2), N'VNPAY', N'SUCCESS', N'0581729e-2864-4eb9-9d41-a0bced7f67b0-66', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (65, 5, NULL, 67, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-30T14:27:21.3162266' AS DateTime2), N'VNPAY', N'SUCCESS', N'9b194dc8-7134-4a24-a433-67923f6ba74e-67', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (66, 5, NULL, 68, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-04T17:37:22.4181751' AS DateTime2), N'VNPAY', N'SUCCESS', N'b37d7c68-69f2-4622-9f85-136223b7051b-68', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (67, 5, NULL, 69, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-04T17:44:43.8701109' AS DateTime2), N'VNPAY', N'SUCCESS', N'f8760430-694f-4364-a315-e429e6d76fba-69', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (68, 5, NULL, 70, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-04T17:47:53.2984245' AS DateTime2), N'VNPAY', N'SUCCESS', N'749b2dae-d8e7-4aa7-ac87-3fea79d17c4e-70', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (69, 5, NULL, 71, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-04T17:59:41.8495153' AS DateTime2), N'VNPAY', N'SUCCESS', N'9febf6a7-79b3-4164-9a97-21d4805d55cc-71', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (70, 5, NULL, 72, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-04T18:03:29.1832143' AS DateTime2), N'VNPAY', N'SUCCESS', N'312d346d-8bae-44fd-a199-7bb1ab9f787b-72', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (71, 5, NULL, 73, CAST(8888.00 AS Decimal(10, 2)), CAST(N'2025-07-04T18:14:30.5822432' AS DateTime2), N'VNPAY', N'PENDING', N'21f7e596-3b56-4b9e-89da-d2966ed9371b-73', 1)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (72, 5, NULL, 74, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-04T18:17:46.9253052' AS DateTime2), N'VNPAY', N'SUCCESS', N'bfe5977d-a2a6-42ba-8494-aa950d69f0e6-74', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (73, 5, NULL, 75, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-04T18:29:29.5410134' AS DateTime2), N'VNPAY', N'SUCCESS', N'4f0bdcba-9ce5-4dad-b3ba-4309f338c376-75', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (74, 5, NULL, 76, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-04T18:37:21.8651786' AS DateTime2), N'VNPAY', N'SUCCESS', N'2564437e-1ddc-47c6-95d2-9591604c4cb0-76', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (75, 5, NULL, 77, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-04T18:42:32.7203477' AS DateTime2), N'VNPAY', N'SUCCESS', N'06b76cf5-b781-4ed8-9308-78e8d9958205-77', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (76, 5, NULL, 78, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-04T18:43:36.7029000' AS DateTime2), N'VNPAY', N'SUCCESS', N'02620672-0e45-4223-ad85-8d5f2fcfb911-78', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (77, 5, NULL, 79, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-05T04:03:11.9159509' AS DateTime2), N'VNPAY', N'SUCCESS', N'016c7133-5449-496c-b1d7-c02976bd09d7-79', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (78, 5, NULL, 80, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-05T04:05:55.2482257' AS DateTime2), N'VNPAY', N'SUCCESS', N'20e0f4dc-03ad-4c69-86f9-6c8aa19666d7-80', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (79, 5, NULL, 81, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-05T04:10:42.4864290' AS DateTime2), N'VNPAY', N'SUCCESS', N'fb5d768c-8aee-4ec5-a6a7-804bd6589243-81', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (80, 5, NULL, 82, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-05T04:13:04.1585823' AS DateTime2), N'VNPAY', N'SUCCESS', N'4dfe7603-02d3-400c-bd90-e6dc5b2e9084-82', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (81, 5, NULL, 83, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-05T06:17:03.6200543' AS DateTime2), N'VNPAY', N'PENDING', N'0e70e2e6-5e51-424b-b663-40af9092749c-83', 0)
INSERT [dbo].[Payments] ([paymentID], [userID], [courseID], [appointmentID], [amount], [paymentDate], [paymentMethod], [status], [transactionID], [RetryCount]) VALUES (82, 5, NULL, 84, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-05T06:19:04.8829300' AS DateTime2), N'VNPAY', N'SUCCESS', N'1ede746e-20bb-4d63-b5bf-4a64f59f47e0-84', 0)
SET IDENTITY_INSERT [dbo].[Payments] OFF
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (13, NULL, N'aaaaaa11223376665', N'yes/no', 2, 0)
INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (14, NULL, N'sdsafdffsss', N'yes/no', 2, 0)
INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (15, NULL, N'sasaassdsassa', N'yes/no', 3, 0)
INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (16, NULL, N'sdsadasdsad', N'yes/no', 3, 0)
INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (1013, NULL, N'adasdasd', N'yes/no', 2, 1)
INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (1014, NULL, N'adasdasd', N'yes/no', 2, 0)
INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (1015, NULL, N'adasdasd', N'yes/no', 2, 0)
INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (1016, NULL, N'aaaaa', N'yes/no', 2, 0)
INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (1017, NULL, N'asssss', N'yes/no', 1002, 0)
INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (1018, NULL, N'ádsadas', N'yes/no', 1002, 1)
INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (1019, NULL, N'sádsadsa', N'yes/no', 1, 0)
INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (1020, NULL, N'sấdssd', N'yes/no', 1, 1)
INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (1021, NULL, N'sâsaasas', N'yes/no', 1002, 0)
INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (1022, NULL, N'ssssss', N'yes/no', 1002, 0)
INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (1023, NULL, N'âssas', N'yes/no', 1002, 1)
INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (1024, NULL, N'ddfffg', N'yes/no', 3, 1)
INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (1025, NULL, N'fffff', N'yes/no', 3, 0)
INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (1026, NULL, N'sss', N'yes/no', 3, 1)
INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (1027, NULL, N'9999', N'yes/no', 1003, 1)
INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (1028, NULL, N'999', N'yes/no', 1003, 1)
INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (1029, NULL, N'jjj', N'yes/no', 3, 0)
INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (1030, NULL, N'99999', N'yes/no', 1004, 1)
INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (1031, NULL, N'99999', N'yes/no', 1, 1)
INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (1032, NULL, N'9999', N'yes/no', 1, 0)
INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (1033, NULL, N'999999', N'yes/no', 1005, 1)
INSERT [dbo].[Questions] ([questionID], [surveyID], [questionText], [questionType], [AssessmentID], [IsDeleted]) VALUES (1034, NULL, N'99999', N'yes/no', 1005, 1)
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([roleID], [roleName], [description]) VALUES (1, N'Guest', N'Người dùng chưa đăng nhập')
INSERT [dbo].[Roles] ([roleID], [roleName], [description]) VALUES (2, N'Member', N'Người dùng đăng kí thành công')
INSERT [dbo].[Roles] ([roleID], [roleName], [description]) VALUES (3, N'Staff', N'Nhân viên tổ chức')
INSERT [dbo].[Roles] ([roleID], [roleName], [description]) VALUES (4, N'Consultant', N'Chuyên gia tư vấn')
INSERT [dbo].[Roles] ([roleID], [roleName], [description]) VALUES (5, N'Manager', N'Quản lý')
INSERT [dbo].[Roles] ([roleID], [roleName], [description]) VALUES (6, N'Admin', N'Quản trị viên')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([userID], [userName], [password], [email], [fullName], [dateOfBirth], [phone], [address], [status], [roleID], [createdAt], [updatedAt]) VALUES (2, N'consult01', N'consultpass', N'consult01@example.com', N'Dr. Smith', NULL, NULL, NULL, NULL, 2, CAST(N'2025-06-24T14:26:43.9400000' AS DateTime2), CAST(N'2025-06-24T14:26:43.9400000' AS DateTime2))
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [fullName], [dateOfBirth], [phone], [address], [status], [roleID], [createdAt], [updatedAt]) VALUES (3, N'user01', N'userpass', N'user01@example.com', N'Jane Doe', NULL, NULL, NULL, NULL, 3, CAST(N'2025-06-24T14:26:43.9400000' AS DateTime2), CAST(N'2025-06-24T14:26:43.9400000' AS DateTime2))
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [fullName], [dateOfBirth], [phone], [address], [status], [roleID], [createdAt], [updatedAt]) VALUES (4, N'admin', N'$2a$11$8mCzd3GRz68wFJKff8IIJuml1MwRV9Fp95VXjEXCaRIWOTVzd5keW', N'admin@example.com', N'Administrator', NULL, NULL, NULL, N'Active', 6, CAST(N'2025-06-24T07:33:16.0896753' AS DateTime2), CAST(N'2025-06-24T07:33:16.0897480' AS DateTime2))
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [fullName], [dateOfBirth], [phone], [address], [status], [roleID], [createdAt], [updatedAt]) VALUES (5, N'Tan', N'$2a$11$eFVN8CPi7S6XeC2n4vcfbuG7.SDCF//nbvBodOH6tRW3YEOqRqzae', N'tanphse180176@fpt.edu.vn', N'Tan dz', CAST(N'2020-06-24' AS Date), N'0566887569', N'Binh Phước', N'Active', 2, CAST(N'2025-06-24T08:21:13.8029227' AS DateTime2), CAST(N'2025-06-24T08:21:13.8032522' AS DateTime2))
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [fullName], [dateOfBirth], [phone], [address], [status], [roleID], [createdAt], [updatedAt]) VALUES (6, N'Consultan2', N'$2a$11$QvhZvHMM4YGkgkraynzbte.3cG3ovsmIGyYUlrGfWZ64sry8jxxo.', N'user@example.com', N'CR7', NULL, NULL, NULL, N'Active', 4, CAST(N'2025-06-24T08:57:30.6893456' AS DateTime2), CAST(N'2025-06-24T08:57:30.6893928' AS DateTime2))
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [fullName], [dateOfBirth], [phone], [address], [status], [roleID], [createdAt], [updatedAt]) VALUES (7, N'ConsultantHN', N'$2a$11$dthsWcVUUJdUzPzCkz8lVuEw0ypXM74OCQVxHdIiuOykK1auMGlEG', N'Consultant@gmail.com', N'Consultant', NULL, NULL, NULL, N'Active', 4, CAST(N'2025-06-26T16:18:49.3334696' AS DateTime2), CAST(N'2025-06-26T16:18:49.3335515' AS DateTime2))
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [fullName], [dateOfBirth], [phone], [address], [status], [roleID], [createdAt], [updatedAt]) VALUES (8, N'nguyendan', N'$2a$11$ALeuwR1UbEFD4SpsI48uje0XMpxu5b/bPOn5KQF3PtX99anRO4LQW', N'nguyendan@example.com', N'string', NULL, NULL, NULL, N'Active', 4, CAST(N'2025-06-28T06:02:33.3706256' AS DateTime2), CAST(N'2025-06-28T06:02:33.3706258' AS DateTime2))
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [fullName], [dateOfBirth], [phone], [address], [status], [roleID], [createdAt], [updatedAt]) VALUES (9, N'ConsultantQ2', N'$2a$11$tEY7G02oNO0Pbe7T4RsKqOVIOCUw24SBjenTN3edJmTBmd7c7Id2G', N'ConsutantQ2@gmail.com', N'Nermar', NULL, NULL, NULL, N'Active', 4, CAST(N'2025-06-28T08:28:41.0978961' AS DateTime2), CAST(N'2025-06-28T08:30:13.3556844' AS DateTime2))
INSERT [dbo].[Users] ([userID], [userName], [password], [email], [fullName], [dateOfBirth], [phone], [address], [status], [roleID], [createdAt], [updatedAt]) VALUES (10, N'KingKAKA', N'$2a$11$g2FolOPAcLL5On8d.NUp0.7rMyJT4yLRC9xJaOLfb/piUkqJDOFG.', N'buitham8758@gmail.com', N'KAKA', CAST(N'2020-06-29' AS Date), N'0999999999', N'Sai Gon', N'Active', 2, CAST(N'2025-06-29T02:18:35.7334392' AS DateTime2), CAST(N'2025-06-29T02:18:35.7334758' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded', 11, NULL)
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2025-06-25', 1, CAST(N'2025-07-25T01:34:00.427' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2025-06-26', 1, CAST(N'2025-07-26T06:49:30.123' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2025-06-27', 1, CAST(N'2025-07-27T04:05:24.787' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2025-06-28', 1, CAST(N'2025-07-28T05:36:16.307' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2025-06-29', 1, CAST(N'2025-07-29T01:58:11.130' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2025-06-30', 1, CAST(N'2025-07-30T13:49:48.740' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2025-07-01', 1, CAST(N'2025-08-01T09:13:41.793' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2025-07-03', 1, CAST(N'2025-08-03T10:03:53.833' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2025-07-04', 1, CAST(N'2025-08-04T05:42:06.020' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2025-07-05', 1, CAST(N'2025-08-05T04:01:43.273' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2025-07-09', 1, CAST(N'2025-08-09T09:27:30.970' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2025-07-09-09', 1, CAST(N'2025-07-10T09:27:30.970' AS DateTime))
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-schedules', N'CreatedAt', N'1750750047506', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-schedules', N'Cron', N'0 0 * * *', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-schedules', N'Job', N'{"t":"DrugUsePreventionAPI.Controllers.Data.ScheduleGenerator, DrugUsePreventionAPI","m":"GenerateDailySchedulesAsync","p":["System.DateTime, mscorlib"],"a":["\"2025-07-09T00:00:00Z\""]}', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-schedules', N'LastExecution', N'1752053245882', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-schedules', N'LastJobId', N'10008', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-schedules', N'NextExecution', N'1752105600000', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-schedules', N'Queue', N'default', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-schedules', N'TimeZoneId', N'UTC', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-schedules', N'V', N'2', NULL)
GO
SET IDENTITY_INSERT [HangFire].[Job] ON 

INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (10008, 10024, N'Succeeded', N'{"t":"DrugUsePreventionAPI.Controllers.Data.ScheduleGenerator, DrugUsePreventionAPI","m":"GenerateDailySchedulesAsync","p":["System.DateTime, mscorlib"]}', N'["\"2025-07-09T00:00:00Z\""]', CAST(N'2025-07-09T09:27:26.007' AS DateTime), CAST(N'2025-07-10T09:27:30.973' AS DateTime))
SET IDENTITY_INSERT [HangFire].[Job] OFF
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10008, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10008, N'RecurringJobId', N'"generate-daily-schedules"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (10008, N'Time', N'1752053245')
GO
INSERT [HangFire].[Schema] ([Version]) VALUES (9)
GO
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'tan:7056:b1d27538-358d-401c-91f9-e50f94917b2c', N'{"WorkerCount":20,"Queues":["default"],"StartedAt":"2025-07-09T13:43:27.1348878Z"}', CAST(N'2025-07-09T17:31:02.080' AS DateTime))
GO
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'recurring-jobs', 1752105600, N'generate-daily-schedules', NULL)
GO
SET IDENTITY_INSERT [HangFire].[State] ON 

INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10022, 10008, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2025-07-09T09:27:26.160' AS DateTime), N'{"EnqueuedAt":"1752053246153","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10023, 10008, N'Processing', NULL, CAST(N'2025-07-09T09:27:26.860' AS DateTime), N'{"StartedAt":"1752053246204","ServerId":"tan:23300:aec9020f-154b-4bde-ac39-9074b4781cb9","WorkerId":"24f5f8a8-0373-4c55-aec1-6809df6e8620"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (10024, 10008, N'Succeeded', NULL, CAST(N'2025-07-09T09:27:30.970' AS DateTime), N'{"SucceededAt":"1752053250924","PerformanceDuration":"3809","Latency":"1107"}')
SET IDENTITY_INSERT [HangFire].[State] OFF
GO
/****** Object:  Index [UQ__Consulta__CB9A1CDE8C195FF9]    Script Date: 7/10/2025 12:31:04 AM ******/
ALTER TABLE [dbo].[Consultants] ADD UNIQUE NONCLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Roles__B194786183DC909E]    Script Date: 7/10/2025 12:31:04 AM ******/
ALTER TABLE [dbo].[Roles] ADD UNIQUE NONCLUSTERED 
(
	[roleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__66DCF95C9DB03F08]    Script Date: 7/10/2025 12:31:04 AM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__AB6E616490414151]    Script Date: 7/10/2025 12:31:04 AM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AnswerOptions] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Appointments] ADD  DEFAULT ((0.0)) FOR [price]
GO
ALTER TABLE [dbo].[Appointments] ADD  DEFAULT ('PENDING_PAYMENT') FOR [status]
GO
ALTER TABLE [dbo].[Appointments] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Appointments] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[AssessmentResults] ADD  DEFAULT (getdate()) FOR [takeTime]
GO
ALTER TABLE [dbo].[AssessmentResults] ADD  DEFAULT ('') FOR [AssessmentStage]
GO
ALTER TABLE [dbo].[Assessments] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Assessments] ADD  DEFAULT ('') FOR [AssessmentStage]
GO
ALTER TABLE [dbo].[Blogs] ADD  DEFAULT ('PENDING') FOR [status]
GO
ALTER TABLE [dbo].[ConsultantAppointmentEvaluations] ADD  DEFAULT (getdate()) FOR [evaluationDate]
GO
ALTER TABLE [dbo].[Consultants] ADD  DEFAULT ((0.0)) FOR [hourlyRate]
GO
ALTER TABLE [dbo].[Consultants] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Consultants] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[ConsultantSchedules] ADD  DEFAULT ((1)) FOR [isAvailable]
GO
ALTER TABLE [dbo].[CourseRegistrations] ADD  DEFAULT (getdate()) FOR [registerTime]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT ('OPEN') FOR [status]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT ((0.0)) FOR [price]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[Courses] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT ((0.0)) FOR [amount]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT (getdate()) FOR [paymentDate]
GO
ALTER TABLE [dbo].[Payments] ADD  DEFAULT ('PENDING') FOR [status]
GO
ALTER TABLE [dbo].[ProgramParticipations] ADD  DEFAULT (getdate()) FOR [joinTime]
GO
ALTER TABLE [dbo].[Questions] ADD  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[SurveyResponses] ADD  DEFAULT (getdate()) FOR [submitTime]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [createdAt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [updatedAt]
GO
ALTER TABLE [dbo].[AnswerOptions]  WITH CHECK ADD  CONSTRAINT [FK_AnswerOptions_Questions] FOREIGN KEY([questionID])
REFERENCES [dbo].[Questions] ([questionID])
GO
ALTER TABLE [dbo].[AnswerOptions] CHECK CONSTRAINT [FK_AnswerOptions_Questions]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Consultants] FOREIGN KEY([consultantID])
REFERENCES [dbo].[Consultants] ([consultantID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Consultants]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Users] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Users]
GO
ALTER TABLE [dbo].[AssessmentResults]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentResults_Assessments] FOREIGN KEY([assessmentID])
REFERENCES [dbo].[Assessments] ([assessmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AssessmentResults] CHECK CONSTRAINT [FK_AssessmentResults_Assessments]
GO
ALTER TABLE [dbo].[AssessmentResults]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentResults_Courses] FOREIGN KEY([courseID])
REFERENCES [dbo].[Courses] ([courseID])
GO
ALTER TABLE [dbo].[AssessmentResults] CHECK CONSTRAINT [FK_AssessmentResults_Courses]
GO
ALTER TABLE [dbo].[AssessmentResults]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentResults_Users] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AssessmentResults] CHECK CONSTRAINT [FK_AssessmentResults_Users]
GO
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [FK_Blogs_Users] FOREIGN KEY([authorID])
REFERENCES [dbo].[Users] ([userID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [FK_Blogs_Users]
GO
ALTER TABLE [dbo].[ConsultantAppointmentEvaluations]  WITH CHECK ADD  CONSTRAINT [FK_Evaluations_Appointments] FOREIGN KEY([appointmentID])
REFERENCES [dbo].[Appointments] ([appointmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ConsultantAppointmentEvaluations] CHECK CONSTRAINT [FK_Evaluations_Appointments]
GO
ALTER TABLE [dbo].[ConsultantAppointmentEvaluations]  WITH CHECK ADD  CONSTRAINT [FK_Evaluations_Users] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ConsultantAppointmentEvaluations] CHECK CONSTRAINT [FK_Evaluations_Users]
GO
ALTER TABLE [dbo].[Consultants]  WITH CHECK ADD  CONSTRAINT [FK_Consultants_Certificates] FOREIGN KEY([certificateID])
REFERENCES [dbo].[Certificates] ([certificateID])
GO
ALTER TABLE [dbo].[Consultants] CHECK CONSTRAINT [FK_Consultants_Certificates]
GO
ALTER TABLE [dbo].[Consultants]  WITH CHECK ADD  CONSTRAINT [FK_Consultants_Users] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Consultants] CHECK CONSTRAINT [FK_Consultants_Users]
GO
ALTER TABLE [dbo].[ConsultantSchedules]  WITH CHECK ADD  CONSTRAINT [FK_ConsultantSchedules_Consultants] FOREIGN KEY([consultantID])
REFERENCES [dbo].[Consultants] ([consultantID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ConsultantSchedules] CHECK CONSTRAINT [FK_ConsultantSchedules_Consultants]
GO
ALTER TABLE [dbo].[CourseAssessments]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssessments_Assessments] FOREIGN KEY([assessmentID])
REFERENCES [dbo].[Assessments] ([assessmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseAssessments] CHECK CONSTRAINT [FK_CourseAssessments_Assessments]
GO
ALTER TABLE [dbo].[CourseAssessments]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssessments_Courses] FOREIGN KEY([courseID])
REFERENCES [dbo].[Courses] ([courseID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseAssessments] CHECK CONSTRAINT [FK_CourseAssessments_Courses]
GO
ALTER TABLE [dbo].[CourseRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_CourseRegistrations_Courses] FOREIGN KEY([courseID])
REFERENCES [dbo].[Courses] ([courseID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseRegistrations] CHECK CONSTRAINT [FK_CourseRegistrations_Courses]
GO
ALTER TABLE [dbo].[CourseRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_CourseRegistrations_Users] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseRegistrations] CHECK CONSTRAINT [FK_CourseRegistrations_Users]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Appointments] FOREIGN KEY([appointmentID])
REFERENCES [dbo].[Appointments] ([appointmentID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Appointments]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Courses] FOREIGN KEY([courseID])
REFERENCES [dbo].[Courses] ([courseID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Courses]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Users] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Users]
GO
ALTER TABLE [dbo].[ProgramParticipations]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipations_Programs] FOREIGN KEY([programID])
REFERENCES [dbo].[CommunicationPrograms] ([programID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProgramParticipations] CHECK CONSTRAINT [FK_ProgramParticipations_Programs]
GO
ALTER TABLE [dbo].[ProgramParticipations]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipations_Users] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProgramParticipations] CHECK CONSTRAINT [FK_ProgramParticipations_Users]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Assessments_AssessmentID] FOREIGN KEY([AssessmentID])
REFERENCES [dbo].[Assessments] ([assessmentID])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Assessments_AssessmentID]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Surveys] FOREIGN KEY([surveyID])
REFERENCES [dbo].[Surveys] ([surveyID])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Surveys]
GO
ALTER TABLE [dbo].[SurveyResponses]  WITH CHECK ADD  CONSTRAINT [FK_SurveyResponses_Programs] FOREIGN KEY([programID])
REFERENCES [dbo].[CommunicationPrograms] ([programID])
GO
ALTER TABLE [dbo].[SurveyResponses] CHECK CONSTRAINT [FK_SurveyResponses_Programs]
GO
ALTER TABLE [dbo].[SurveyResponses]  WITH CHECK ADD  CONSTRAINT [FK_SurveyResponses_Surveys] FOREIGN KEY([surveyID])
REFERENCES [dbo].[Surveys] ([surveyID])
GO
ALTER TABLE [dbo].[SurveyResponses] CHECK CONSTRAINT [FK_SurveyResponses_Surveys]
GO
ALTER TABLE [dbo].[SurveyResponses]  WITH CHECK ADD  CONSTRAINT [FK_SurveyResponses_Users] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[SurveyResponses] CHECK CONSTRAINT [FK_SurveyResponses_Users]
GO
ALTER TABLE [dbo].[Surveys]  WITH CHECK ADD  CONSTRAINT [FK_Surveys_Users] FOREIGN KEY([authorID])
REFERENCES [dbo].[Users] ([userID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Surveys] CHECK CONSTRAINT [FK_Surveys_Users]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles] FOREIGN KEY([roleID])
REFERENCES [dbo].[Roles] ([roleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles]
GO
ALTER TABLE [HangFire].[JobParameter]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_JobParameter_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[JobParameter] CHECK CONSTRAINT [FK_HangFire_JobParameter_Job]
GO
ALTER TABLE [HangFire].[State]  WITH CHECK ADD  CONSTRAINT [FK_HangFire_State_Job] FOREIGN KEY([JobId])
REFERENCES [HangFire].[Job] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [HangFire].[State] CHECK CONSTRAINT [FK_HangFire_State_Job]
GO
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [CHK_Blogs_Status] CHECK  (([status]='REJECTED' OR [status]='APPROVED' OR [status]='PENDING'))
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [CHK_Blogs_Status]
GO
ALTER TABLE [dbo].[ConsultantAppointmentEvaluations]  WITH CHECK ADD CHECK  (([rating]>=(1) AND [rating]<=(5)))
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [CHK_Payments_Status] CHECK  (([status]='FAILED' OR [status]='SUCCESS' OR [status]='PENDING'))
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [CHK_Payments_Status]
GO
/****** Object:  StoredProcedure [dbo].[GetConsultantSchedulesWithStatus]    Script Date: 7/10/2025 12:31:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[GetConsultantSchedulesWithStatus]
    @ConsultantId INT,
    @StartDate DATE,
    @EndDate DATE
AS
BEGIN
    SET NOCOUNT ON;

    -- Tạo bảng tạm để lưu kết quả
    CREATE TABLE #TempSchedules (
        ScheduleID INT,
        ConsultantID INT,
        DayOfWeek NVARCHAR(50),
        Date DATE,
        StartTime TIME,
        EndTime TIME,
        IsAvailable BIT,
        Notes NVARCHAR(MAX),
        AppointmentStatus NVARCHAR(20),
        PaymentStatus NVARCHAR(10)
    );

    -- Lấy tất cả lịch trong khoảng thời gian
    INSERT INTO #TempSchedules (ScheduleID, ConsultantID, DayOfWeek, Date, StartTime, EndTime, IsAvailable, Notes)
    SELECT 
        s.ScheduleID,
        s.ConsultantID,
        s.DayOfWeek,
        s.Date,
        s.StartTime,
        s.EndTime,
        s.IsAvailable,
        s.Notes
    FROM ConsultantSchedules s
    WHERE s.ConsultantID = @ConsultantId
        AND s.Date BETWEEN @StartDate AND @EndDate;

    -- Cập nhật trạng thái cuộc hẹn và thanh toán
    UPDATE t
    SET 
        t.AppointmentStatus = a.Status,
        t.PaymentStatus = p.Status
    FROM #TempSchedules t
    LEFT JOIN Appointments a ON (
        (a.ScheduleIds LIKE '%,' + CAST(t.ScheduleID AS VARCHAR(10)) + ',%' 
         OR a.ScheduleIds = CAST(t.ScheduleID AS VARCHAR(10))
         OR (a.ScheduleIds IS NULL AND t.ScheduleID IS NULL))
        AND a.consultantID = t.ConsultantID -- Đảm bảo khớp ConsultantID
    )
    LEFT JOIN Payments p ON a.AppointmentID = p.AppointmentID
    WHERE (a.Status IN ('PENDING_PAYMENT', 'CONFIRMED') OR a.Status IS NULL)
        AND (p.Status IN ('PENDING', 'SUCCESS', 'FAILED') OR p.Status IS NULL);

    -- Trả về kết quả
    SELECT 
        ScheduleID,
        ConsultantID,
        DayOfWeek,
        Date,
        StartTime,
        EndTime,
        IsAvailable,
        Notes,
        AppointmentStatus,
        PaymentStatus
    FROM #TempSchedules;

    DROP TABLE #TempSchedules;
END;
GO
