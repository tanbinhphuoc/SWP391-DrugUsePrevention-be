USE [DrugUsePreventionDB_V1]
GO
/****** Object:  Schema [HangFire]    Script Date: 6/17/2025 1:25:11 AM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/17/2025 1:25:11 AM ******/
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
/****** Object:  Table [dbo].[AnswerOptions]    Script Date: 6/17/2025 1:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnswerOptions](
	[OptionID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NOT NULL,
	[OptionText] [nvarchar](max) NOT NULL,
	[ScoreValue] [int] NULL,
 CONSTRAINT [PK_AnswerOptions] PRIMARY KEY CLUSTERED 
(
	[OptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 6/17/2025 1:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[AppointmentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ConsultantID] [int] NOT NULL,
	[StartDateTime] [datetime2](7) NOT NULL,
	[EndDateTime] [datetime2](7) NOT NULL,
	[GoogleMeetLink] [nvarchar](255) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[Note] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssessmentResults]    Script Date: 6/17/2025 1:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AssessmentResults](
	[ResultID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[AssessmentID] [int] NOT NULL,
	[CourseID] [int] NULL,
	[ResultName] [nvarchar](255) NULL,
	[Score] [float] NOT NULL,
	[TakeTime] [datetime2](7) NOT NULL,
	[AssessmentStage] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_AssessmentResults] PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assessments]    Script Date: 6/17/2025 1:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assessments](
	[AssessmentID] [int] IDENTITY(1,1) NOT NULL,
	[AssessmentName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[AssessmentType] [nvarchar](10) NOT NULL,
	[MinAge] [int] NULL,
	[MaxAge] [int] NULL,
 CONSTRAINT [PK_Assessments] PRIMARY KEY CLUSTERED 
(
	[AssessmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 6/17/2025 1:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[BlogID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[AuthorID] [int] NOT NULL,
	[PublishDate] [datetime2](7) NOT NULL,
	[Status] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Certificates]    Script Date: 6/17/2025 1:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Certificates](
	[CertificateID] [int] IDENTITY(1,1) NOT NULL,
	[CertificateName] [nvarchar](255) NOT NULL,
	[DateAcquired] [datetime2](7) NULL,
 CONSTRAINT [PK_Certificates] PRIMARY KEY CLUSTERED 
(
	[CertificateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CommunicationPrograms]    Script Date: 6/17/2025 1:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CommunicationPrograms](
	[ProgramID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[StartDate] [datetime2](7) NULL,
	[EndDate] [datetime2](7) NULL,
	[Location] [nvarchar](255) NULL,
 CONSTRAINT [PK_CommunicationPrograms] PRIMARY KEY CLUSTERED 
(
	[ProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConsultantAppointmentEvaluations]    Script Date: 6/17/2025 1:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultantAppointmentEvaluations](
	[EvaluationID] [int] IDENTITY(1,1) NOT NULL,
	[AppointmentID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[EvaluationDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ConsultantAppointmentEvaluations] PRIMARY KEY CLUSTERED 
(
	[EvaluationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Consultants]    Script Date: 6/17/2025 1:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Consultants](
	[ConsultantID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CertificateID] [int] NULL,
	[Specialty] [nvarchar](255) NULL,
	[Degree] [nvarchar](255) NULL,
	[Experience] [nvarchar](max) NULL,
	[HourlyRate] [decimal](18, 2) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Consultants] PRIMARY KEY CLUSTERED 
(
	[ConsultantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConsultantSchedules]    Script Date: 6/17/2025 1:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConsultantSchedules](
	[ScheduleID] [int] IDENTITY(1,1) NOT NULL,
	[ConsultantID] [int] NOT NULL,
	[DayOfWeek] [nvarchar](50) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[StartTime] [time](7) NOT NULL,
	[EndTime] [time](7) NOT NULL,
	[IsAvailable] [bit] NOT NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_ConsultantSchedules] PRIMARY KEY CLUSTERED 
(
	[ScheduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseAssessments]    Script Date: 6/17/2025 1:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseAssessments](
	[CourseID] [int] NOT NULL,
	[AssessmentID] [int] NOT NULL,
 CONSTRAINT [PK_CourseAssessments] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC,
	[AssessmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseRegistrations]    Script Date: 6/17/2025 1:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseRegistrations](
	[UserID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[RegisterTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_CourseRegistrations] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 6/17/2025 1:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[Status] [nvarchar](10) NOT NULL,
	[AgeMin] [int] NOT NULL,
	[AgeMax] [int] NULL,
	[Capacity] [int] NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[Type] [nchar](10) NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 6/17/2025 1:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CourseID] [int] NULL,
	[AppointmentID] [int] NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[PaymentDate] [datetime2](7) NOT NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[Status] [nvarchar](10) NOT NULL,
	[TransactionID] [nvarchar](100) NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgramParticipations]    Script Date: 6/17/2025 1:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProgramParticipations](
	[UserID] [int] NOT NULL,
	[ProgramID] [int] NOT NULL,
	[JoinTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_ProgramParticipations] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[ProgramID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 6/17/2025 1:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[QuestionID] [int] IDENTITY(1,1) NOT NULL,
	[SurveyID] [int] NULL,
	[QuestionText] [nvarchar](max) NOT NULL,
	[QuestionType] [nvarchar](50) NULL,
	[AssessmentID] [int] NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/17/2025 1:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SurveyResponses]    Script Date: 6/17/2025 1:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SurveyResponses](
	[ResponseID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SurveyID] [int] NOT NULL,
	[ProgramID] [int] NULL,
	[ResponseData] [nvarchar](max) NULL,
	[SubmitTime] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_SurveyResponses] PRIMARY KEY CLUSTERED 
(
	[ResponseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Surveys]    Script Date: 6/17/2025 1:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Surveys](
	[SurveyID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NOT NULL,
	[Type] [nvarchar](50) NULL,
	[AuthorID] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Surveys] PRIMARY KEY CLUSTERED 
(
	[SurveyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/17/2025 1:25:11 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](150) NULL,
	[DateOfBirth] [datetime2](7) NULL,
	[Phone] [nvarchar](20) NULL,
	[Address] [nvarchar](255) NULL,
	[Status] [nvarchar](50) NULL,
	[RoleID] [int] NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 6/17/2025 1:25:11 AM ******/
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
/****** Object:  Table [HangFire].[Counter]    Script Date: 6/17/2025 1:25:11 AM ******/
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
/****** Object:  Table [HangFire].[Hash]    Script Date: 6/17/2025 1:25:11 AM ******/
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
/****** Object:  Table [HangFire].[Job]    Script Date: 6/17/2025 1:25:11 AM ******/
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
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 6/17/2025 1:25:11 AM ******/
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
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 6/17/2025 1:25:11 AM ******/
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
/****** Object:  Table [HangFire].[List]    Script Date: 6/17/2025 1:25:11 AM ******/
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
/****** Object:  Table [HangFire].[Schema]    Script Date: 6/17/2025 1:25:11 AM ******/
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
/****** Object:  Table [HangFire].[Server]    Script Date: 6/17/2025 1:25:11 AM ******/
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
/****** Object:  Table [HangFire].[Set]    Script Date: 6/17/2025 1:25:11 AM ******/
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
/****** Object:  Table [HangFire].[State]    Script Date: 6/17/2025 1:25:11 AM ******/
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
GO
SET IDENTITY_INSERT [dbo].[AnswerOptions] ON 

INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue]) VALUES (1, 3, N'Yes', 2)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue]) VALUES (2, 3, N'No', 0)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue]) VALUES (3, 4, N'Yes', 2)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue]) VALUES (4, 4, N'No', 0)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue]) VALUES (5, 18, N'string', 2)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue]) VALUES (6, 18, N'avc', 0)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue]) VALUES (1002, 1006, N'Yes', 2)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue]) VALUES (1003, 1006, N'No', 0)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue]) VALUES (1004, 1007, N'No', 0)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue]) VALUES (1005, 1007, N'Yes', 2)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue]) VALUES (1006, 1008, N'Yes', 2)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue]) VALUES (1007, 1008, N'No', 0)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue]) VALUES (1008, 1009, N'No', 0)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue]) VALUES (1009, 1009, N'Yes', 2)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue]) VALUES (1010, 1010, N'Yes', 2)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue]) VALUES (1011, 1010, N'No', 0)
SET IDENTITY_INSERT [dbo].[AnswerOptions] OFF
GO
SET IDENTITY_INSERT [dbo].[AssessmentResults] ON 

INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime], [AssessmentStage]) VALUES (1, 3, 3, NULL, N'Bạn đã hoàn thành bài đánh gia với 4 điểm!', 4, CAST(N'2025-06-10T19:27:59.8581756' AS DateTime2), N'')
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime], [AssessmentStage]) VALUES (2, 3, 3, NULL, N'Bạn đã hoàn thành bài đánh gia với 2 điểm!', 2, CAST(N'2025-06-10T19:28:31.9258294' AS DateTime2), N'')
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime], [AssessmentStage]) VALUES (3, 3, 7, NULL, N'Bạn đã hoàn thành bài đánh gia với 4 điểm!', 4, CAST(N'2025-06-12T21:44:45.4586169' AS DateTime2), N'')
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime], [AssessmentStage]) VALUES (4, 2, 7, NULL, N'Bạn đã hoàn thành bài đánh gia với 2 điểm!', 2, CAST(N'2025-06-16T00:44:18.6419825' AS DateTime2), N'')
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime], [AssessmentStage]) VALUES (5, 2, 7, NULL, N'Bạn đã hoàn thành bài đánh gia với 4 điểm!', 4, CAST(N'2025-06-16T00:50:17.5845965' AS DateTime2), N'')
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime], [AssessmentStage]) VALUES (6, 2, 7, NULL, N'Bạn đã hoàn thành bài đánh gia với 2 điểm!', 2, CAST(N'2025-06-16T14:04:10.6751770' AS DateTime2), N'')
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime], [AssessmentStage]) VALUES (7, 2, 7, NULL, N'Bạn đã hoàn thành bài đánh gia với 2 điểm!', 2, CAST(N'2025-06-16T15:15:45.1164488' AS DateTime2), N'Input')
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime], [AssessmentStage]) VALUES (8, 2, 7, NULL, N'Bạn đã hoàn thành bài đánh gia với 4 điểm!', 4, CAST(N'2025-06-16T15:18:14.8026140' AS DateTime2), N'Output')
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime], [AssessmentStage]) VALUES (9, 2, 7, 1013, N'Bạn đã hoàn thành bài đánh gia với 0 điểm!', 0, CAST(N'2025-06-16T15:26:34.0476535' AS DateTime2), N'Input')
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime], [AssessmentStage]) VALUES (10, 2, 7, 1013, N'Bạn đã hoàn thành bài đánh gia với 4 điểm!', 4, CAST(N'2025-06-16T15:26:56.2094580' AS DateTime2), N'Output')
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime], [AssessmentStage]) VALUES (11, 2, 7, 1013, N'Bạn đã hoàn thành bài đánh gia với 0 điểm!', 0, CAST(N'2025-06-16T15:40:23.4690934' AS DateTime2), N'Input')
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime], [AssessmentStage]) VALUES (12, 2, 7, 1013, N'Bạn đã hoàn thành bài đánh gia với 6 điểm!', 6, CAST(N'2025-06-16T15:40:52.0087736' AS DateTime2), N'Ouput')
SET IDENTITY_INSERT [dbo].[AssessmentResults] OFF
GO
SET IDENTITY_INSERT [dbo].[Assessments] ON 

INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [MinAge], [MaxAge]) VALUES (3, N'string', N'string', N'string', 0, 0)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [MinAge], [MaxAge]) VALUES (4, N'string', N'string', N'string', 0, 0)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [MinAge], [MaxAge]) VALUES (5, N'string', N'string', N'Craft', 0, 0)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [MinAge], [MaxAge]) VALUES (6, N'Assist', N'dành cho người trên 18 tuổi', N'Assist', 19, 200)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [MinAge], [MaxAge]) VALUES (7, N'Khảo sát cho người mới', N'dành cho người dưới 18 tuổi', N'Crafft', 0, 18)
SET IDENTITY_INSERT [dbo].[Assessments] OFF
GO
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegisterTime]) VALUES (2, 1013, CAST(N'2025-06-16T14:26:21.3341718' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseID], [Title], [Description], [StartDate], [EndDate], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [Type]) VALUES (1013, N'Phòng Chống Ma Túy', N'dành cho người dưới 18 tuổi', CAST(N'2025-06-16T07:09:31.2730000' AS DateTime2), CAST(N'2025-06-16T07:09:31.2730000' AS DateTime2), N'Open', 0, 18, 0, CAST(300000.00 AS Decimal(18, 2)), CAST(N'2025-06-16T07:10:49.0804773' AS DateTime2), CAST(N'2025-06-16T07:10:49.0805004' AS DateTime2), N'COBAN     ')
INSERT [dbo].[Courses] ([CourseID], [Title], [Description], [StartDate], [EndDate], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [Type]) VALUES (1014, N'Phòng Chống Ma Túy', N'dành cho người trên 18 tuổi', CAST(N'2025-06-16T07:09:31.2730000' AS DateTime2), CAST(N'2025-06-16T07:09:31.2730000' AS DateTime2), N'Open', 19, 20, 0, CAST(500000.00 AS Decimal(18, 2)), CAST(N'2025-06-16T07:12:40.6457410' AS DateTime2), CAST(N'2025-06-16T07:12:40.6457410' AS DateTime2), N'NANGCAO   ')
INSERT [dbo].[Courses] ([CourseID], [Title], [Description], [StartDate], [EndDate], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [Type]) VALUES (1015, N'string', N'string', CAST(N'2025-06-16T08:45:04.6660000' AS DateTime2), CAST(N'2025-06-16T08:45:04.6660000' AS DateTime2), N'Open', 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-06-16T08:45:22.5495704' AS DateTime2), CAST(N'2025-06-16T08:45:22.5496487' AS DateTime2), N'addwd     ')
INSERT [dbo].[Courses] ([CourseID], [Title], [Description], [StartDate], [EndDate], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [Type]) VALUES (1016, N'string', N'string', CAST(N'2025-06-16T09:10:14.8310000' AS DateTime2), CAST(N'2025-06-16T09:10:14.8310000' AS DateTime2), N'Open', 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-06-16T09:10:56.3723670' AS DateTime2), CAST(N'2025-06-16T09:10:56.3724520' AS DateTime2), N'COBAN     ')
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID]) VALUES (2, NULL, N'string', N'string', 5)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID]) VALUES (3, NULL, N'nghiện ma túy có tốt không', N'Multiple choice', 3)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID]) VALUES (4, NULL, N'Ma túy ai cũng nên xài', N'True/False', 6)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID]) VALUES (5, NULL, N'Bạn đã từng xài ma túy chưa', N'True/False', 4)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID]) VALUES (15, NULL, N'string', N'string', 6)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID]) VALUES (16, NULL, N'string', N'string', 6)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID]) VALUES (17, NULL, N'string', N'string', 6)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID]) VALUES (18, NULL, N'string', N'string', 3)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID]) VALUES (1004, NULL, N'ma túy có lợi đúng không', N'True/False', 7)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID]) VALUES (1005, NULL, N'ma túy có lợi đúng không', N'True/False', 7)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID]) VALUES (1006, NULL, N'ma túy có lợi đúng không', N'True/False', 7)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID]) VALUES (1007, NULL, N'ma túy ai cũng phải xài thử', N'True/False', 7)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID]) VALUES (1008, NULL, N'ma túy không thử là phí', N'True/False', 7)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID]) VALUES (1009, NULL, N'ma túy chắc chắn tốt', N'True/False', 7)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID]) VALUES (1010, NULL, N'ma túy có thể chữa bệnh', N'True/False', 7)
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (1, N'Guest', N'Người dùng chưa đăng nhập')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (2, N'Member', N'Người dùng đăng kí thành công')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (3, N'Staff', N'Nhân viên tổ chức')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (4, N'Consultant', N'Chuyên gia tư vấn')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (5, N'Manager', N'Quản lý')
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (6, N'Admin', N'Quản trị viên')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Email], [FullName], [DateOfBirth], [Phone], [Address], [Status], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (2, N'admin', N'$2a$11$ORd6pzAfXzC6n4rz7CfUpe0GmSgD/ux1OSYeweYUdUTONPAOgxU2m', N'admin@example.com', N'Administrator', NULL, NULL, NULL, NULL, 6, CAST(N'2025-06-02T05:33:02.2233412' AS DateTime2), CAST(N'2025-06-02T05:33:02.2233412' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Email], [FullName], [DateOfBirth], [Phone], [Address], [Status], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (3, N'hoang', N'$2a$11$SFeB956A7Gv19lAO/JWdg.zd4dP5vhfdAuPXAQz522my8dXNbNwAO', N'hoang@example.com', N'doquochoang', CAST(N'2025-06-02T18:18:45.3210000' AS DateTime2), N'012345678', N'113', N'Active', 2, CAST(N'2025-06-02T18:19:32.7626207' AS DateTime2), CAST(N'2025-06-02T18:19:32.7627795' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Email], [FullName], [DateOfBirth], [Phone], [Address], [Status], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (11, N'kaka', N'$2a$11$ORd6pzAfXzC6n4rz7CfUpe0GmSgD/ux1OSYeweYUdUTONPAOgxU2m', N'kaka@example.com', N'Administration', NULL, NULL, NULL, NULL, 6, CAST(N'2025-06-02T05:33:02.2233412' AS DateTime2), CAST(N'2025-06-02T05:33:02.2233412' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Email], [FullName], [DateOfBirth], [Phone], [Address], [Status], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (12, N'dohoang', N'$2a$11$tz85AlMJroJjJssUr10WHONA4Pw8wtm8QWvIrB0VUBSVcZtLFRTea', N'dohoang@example.com', N'DoQuocHoang', CAST(N'2025-06-03T01:39:01.9910000' AS DateTime2), N'012345678', N'123456', N'Active', 6, CAST(N'2025-06-03T01:51:06.2746338' AS DateTime2), CAST(N'2025-06-03T01:51:06.2746855' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [HangFire].[Schema] ([Version]) VALUES (9)
GO
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'desktop-nggl106:22548:0777b622-6656-4d9c-bf32-97dac67e7f39', N'{"WorkerCount":20,"Queues":["default"],"StartedAt":"2025-06-16T08:54:26.7702139Z"}', CAST(N'2025-06-16T09:16:57.720' AS DateTime))
GO
ALTER TABLE [dbo].[AssessmentResults] ADD  DEFAULT (N'') FOR [AssessmentStage]
GO
ALTER TABLE [dbo].[AnswerOptions]  WITH CHECK ADD  CONSTRAINT [FK_AnswerOptions_Questions_QuestionID] FOREIGN KEY([QuestionID])
REFERENCES [dbo].[Questions] ([QuestionID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AnswerOptions] CHECK CONSTRAINT [FK_AnswerOptions_Questions_QuestionID]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Consultants_ConsultantID] FOREIGN KEY([ConsultantID])
REFERENCES [dbo].[Consultants] ([ConsultantID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Consultants_ConsultantID]
GO
ALTER TABLE [dbo].[Appointments]  WITH CHECK ADD  CONSTRAINT [FK_Appointments_Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Appointments] CHECK CONSTRAINT [FK_Appointments_Users_UserID]
GO
ALTER TABLE [dbo].[AssessmentResults]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentResults_Assessments_AssessmentID] FOREIGN KEY([AssessmentID])
REFERENCES [dbo].[Assessments] ([AssessmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AssessmentResults] CHECK CONSTRAINT [FK_AssessmentResults_Assessments_AssessmentID]
GO
ALTER TABLE [dbo].[AssessmentResults]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentResults_Courses_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[AssessmentResults] CHECK CONSTRAINT [FK_AssessmentResults_Courses_CourseID]
GO
ALTER TABLE [dbo].[AssessmentResults]  WITH CHECK ADD  CONSTRAINT [FK_AssessmentResults_Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AssessmentResults] CHECK CONSTRAINT [FK_AssessmentResults_Users_UserID]
GO
ALTER TABLE [dbo].[Blogs]  WITH CHECK ADD  CONSTRAINT [FK_Blogs_Users_AuthorID] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Blogs] CHECK CONSTRAINT [FK_Blogs_Users_AuthorID]
GO
ALTER TABLE [dbo].[ConsultantAppointmentEvaluations]  WITH CHECK ADD  CONSTRAINT [FK_ConsultantAppointmentEvaluations_Appointments_AppointmentID] FOREIGN KEY([AppointmentID])
REFERENCES [dbo].[Appointments] ([AppointmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ConsultantAppointmentEvaluations] CHECK CONSTRAINT [FK_ConsultantAppointmentEvaluations_Appointments_AppointmentID]
GO
ALTER TABLE [dbo].[ConsultantAppointmentEvaluations]  WITH CHECK ADD  CONSTRAINT [FK_ConsultantAppointmentEvaluations_Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ConsultantAppointmentEvaluations] CHECK CONSTRAINT [FK_ConsultantAppointmentEvaluations_Users_UserID]
GO
ALTER TABLE [dbo].[Consultants]  WITH CHECK ADD  CONSTRAINT [FK_Consultants_Certificates_CertificateID] FOREIGN KEY([CertificateID])
REFERENCES [dbo].[Certificates] ([CertificateID])
GO
ALTER TABLE [dbo].[Consultants] CHECK CONSTRAINT [FK_Consultants_Certificates_CertificateID]
GO
ALTER TABLE [dbo].[Consultants]  WITH CHECK ADD  CONSTRAINT [FK_Consultants_Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Consultants] CHECK CONSTRAINT [FK_Consultants_Users_UserID]
GO
ALTER TABLE [dbo].[ConsultantSchedules]  WITH CHECK ADD  CONSTRAINT [FK_ConsultantSchedules_Consultants_ConsultantID] FOREIGN KEY([ConsultantID])
REFERENCES [dbo].[Consultants] ([ConsultantID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ConsultantSchedules] CHECK CONSTRAINT [FK_ConsultantSchedules_Consultants_ConsultantID]
GO
ALTER TABLE [dbo].[CourseAssessments]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssessments_Assessments_AssessmentID] FOREIGN KEY([AssessmentID])
REFERENCES [dbo].[Assessments] ([AssessmentID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseAssessments] CHECK CONSTRAINT [FK_CourseAssessments_Assessments_AssessmentID]
GO
ALTER TABLE [dbo].[CourseAssessments]  WITH CHECK ADD  CONSTRAINT [FK_CourseAssessments_Courses_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseAssessments] CHECK CONSTRAINT [FK_CourseAssessments_Courses_CourseID]
GO
ALTER TABLE [dbo].[CourseRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_CourseRegistrations_Courses_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseRegistrations] CHECK CONSTRAINT [FK_CourseRegistrations_Courses_CourseID]
GO
ALTER TABLE [dbo].[CourseRegistrations]  WITH CHECK ADD  CONSTRAINT [FK_CourseRegistrations_Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseRegistrations] CHECK CONSTRAINT [FK_CourseRegistrations_Users_UserID]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Appointments_AppointmentID] FOREIGN KEY([AppointmentID])
REFERENCES [dbo].[Appointments] ([AppointmentID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Appointments_AppointmentID]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Courses_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Courses_CourseID]
GO
ALTER TABLE [dbo].[Payments]  WITH CHECK ADD  CONSTRAINT [FK_Payments_Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Payments] CHECK CONSTRAINT [FK_Payments_Users_UserID]
GO
ALTER TABLE [dbo].[ProgramParticipations]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipations_CommunicationPrograms_ProgramID] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[CommunicationPrograms] ([ProgramID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProgramParticipations] CHECK CONSTRAINT [FK_ProgramParticipations_CommunicationPrograms_ProgramID]
GO
ALTER TABLE [dbo].[ProgramParticipations]  WITH CHECK ADD  CONSTRAINT [FK_ProgramParticipations_Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ProgramParticipations] CHECK CONSTRAINT [FK_ProgramParticipations_Users_UserID]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Assessments_AssessmentID] FOREIGN KEY([AssessmentID])
REFERENCES [dbo].[Assessments] ([AssessmentID])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Assessments_AssessmentID]
GO
ALTER TABLE [dbo].[Questions]  WITH CHECK ADD  CONSTRAINT [FK_Questions_Surveys_SurveyID] FOREIGN KEY([SurveyID])
REFERENCES [dbo].[Surveys] ([SurveyID])
GO
ALTER TABLE [dbo].[Questions] CHECK CONSTRAINT [FK_Questions_Surveys_SurveyID]
GO
ALTER TABLE [dbo].[SurveyResponses]  WITH CHECK ADD  CONSTRAINT [FK_SurveyResponses_CommunicationPrograms_ProgramID] FOREIGN KEY([ProgramID])
REFERENCES [dbo].[CommunicationPrograms] ([ProgramID])
GO
ALTER TABLE [dbo].[SurveyResponses] CHECK CONSTRAINT [FK_SurveyResponses_CommunicationPrograms_ProgramID]
GO
ALTER TABLE [dbo].[SurveyResponses]  WITH CHECK ADD  CONSTRAINT [FK_SurveyResponses_Surveys_SurveyID] FOREIGN KEY([SurveyID])
REFERENCES [dbo].[Surveys] ([SurveyID])
GO
ALTER TABLE [dbo].[SurveyResponses] CHECK CONSTRAINT [FK_SurveyResponses_Surveys_SurveyID]
GO
ALTER TABLE [dbo].[SurveyResponses]  WITH CHECK ADD  CONSTRAINT [FK_SurveyResponses_Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[SurveyResponses] CHECK CONSTRAINT [FK_SurveyResponses_Users_UserID]
GO
ALTER TABLE [dbo].[Surveys]  WITH CHECK ADD  CONSTRAINT [FK_Surveys_Users_AuthorID] FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Surveys] CHECK CONSTRAINT [FK_Surveys_Users_AuthorID]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_RoleID] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles_RoleID]
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
