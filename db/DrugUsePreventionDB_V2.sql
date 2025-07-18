USE [DrugUsePreventionDB_V2]
GO
/****** Object:  Schema [HangFire]    Script Date: 7/10/2025 3:34:31 PM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/10/2025 3:34:31 PM ******/
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
/****** Object:  Table [dbo].[AnswerOptions]    Script Date: 7/10/2025 3:34:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnswerOptions](
	[OptionID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionID] [int] NOT NULL,
	[OptionText] [nvarchar](max) NOT NULL,
	[ScoreValue] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_AnswerOptions] PRIMARY KEY CLUSTERED 
(
	[OptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 7/10/2025 3:34:31 PM ******/
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
	[Price] [decimal](10, 2) NOT NULL,
	[Status] [nvarchar](max) NULL,
	[Note] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[ScheduleIds] [nvarchar](max) NULL,
 CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED 
(
	[AppointmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AssessmentResults]    Script Date: 7/10/2025 3:34:31 PM ******/
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
 CONSTRAINT [PK_AssessmentResults] PRIMARY KEY CLUSTERED 
(
	[ResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Assessments]    Script Date: 7/10/2025 3:34:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Assessments](
	[AssessmentID] [int] IDENTITY(1,1) NOT NULL,
	[AssessmentName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[AssessmentType] [nvarchar](10) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Assessments] PRIMARY KEY CLUSTERED 
(
	[AssessmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 7/10/2025 3:34:31 PM ******/
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
	[Thumbnail] [nvarchar](max) NULL,
	[AuthorAvatar] [nvarchar](max) NULL,
 CONSTRAINT [PK_Blogs] PRIMARY KEY CLUSTERED 
(
	[BlogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Certificates]    Script Date: 7/10/2025 3:34:31 PM ******/
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
/****** Object:  Table [dbo].[CommunicationPrograms]    Script Date: 7/10/2025 3:34:31 PM ******/
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
/****** Object:  Table [dbo].[ConsultantAppointmentEvaluations]    Script Date: 7/10/2025 3:34:31 PM ******/
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
/****** Object:  Table [dbo].[Consultants]    Script Date: 7/10/2025 3:34:31 PM ******/
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
	[HourlyRate] [decimal](10, 2) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[GoogleMeetLink] [nvarchar](255) NULL,
 CONSTRAINT [PK_Consultants] PRIMARY KEY CLUSTERED 
(
	[ConsultantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ConsultantSchedules]    Script Date: 7/10/2025 3:34:31 PM ******/
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
/****** Object:  Table [dbo].[CourseAssessments]    Script Date: 7/10/2025 3:34:31 PM ******/
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
/****** Object:  Table [dbo].[CourseRegistrations]    Script Date: 7/10/2025 3:34:31 PM ******/
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
/****** Object:  Table [dbo].[Courses]    Script Date: 7/10/2025 3:34:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[CourseID] [int] IDENTITY(1,1) NOT NULL,
	[CourseName] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](10) NOT NULL,
	[AgeMin] [int] NOT NULL,
	[AgeMax] [int] NULL,
	[Capacity] [int] NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseVideos]    Script Date: 7/10/2025 3:34:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseVideos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[VideoUrl] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Order] [int] NOT NULL,
 CONSTRAINT [PK_CourseVideos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 7/10/2025 3:34:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payments](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CourseID] [int] NULL,
	[AppointmentID] [int] NULL,
	[Amount] [decimal](10, 2) NULL,
	[PaymentDate] [datetime2](7) NULL,
	[PaymentMethod] [nvarchar](50) NULL,
	[Status] [nvarchar](10) NOT NULL,
	[TransactionID] [nvarchar](100) NULL,
	[RetryCount] [int] NULL,
 CONSTRAINT [PK_Payments] PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProgramParticipations]    Script Date: 7/10/2025 3:34:31 PM ******/
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
/****** Object:  Table [dbo].[Questions]    Script Date: 7/10/2025 3:34:31 PM ******/
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
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[QuestionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/10/2025 3:34:31 PM ******/
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
/****** Object:  Table [dbo].[SurveyResponses]    Script Date: 7/10/2025 3:34:31 PM ******/
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
/****** Object:  Table [dbo].[Surveys]    Script Date: 7/10/2025 3:34:31 PM ******/
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
/****** Object:  Table [dbo].[UserCourseProgresses]    Script Date: 7/10/2025 3:34:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCourseProgresses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[IsCompleted] [bit] NOT NULL,
	[CompletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_UserCourseProgresses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/10/2025 3:34:31 PM ******/
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
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 7/10/2025 3:34:31 PM ******/
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
/****** Object:  Table [HangFire].[Counter]    Script Date: 7/10/2025 3:34:31 PM ******/
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
/****** Object:  Table [HangFire].[Hash]    Script Date: 7/10/2025 3:34:31 PM ******/
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
/****** Object:  Table [HangFire].[Job]    Script Date: 7/10/2025 3:34:31 PM ******/
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
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 7/10/2025 3:34:31 PM ******/
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
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 7/10/2025 3:34:31 PM ******/
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
/****** Object:  Table [HangFire].[List]    Script Date: 7/10/2025 3:34:31 PM ******/
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
/****** Object:  Table [HangFire].[Schema]    Script Date: 7/10/2025 3:34:31 PM ******/
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
/****** Object:  Table [HangFire].[Server]    Script Date: 7/10/2025 3:34:31 PM ******/
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
/****** Object:  Table [HangFire].[Set]    Script Date: 7/10/2025 3:34:31 PM ******/
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
/****** Object:  Table [HangFire].[State]    Script Date: 7/10/2025 3:34:31 PM ******/
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
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250706135329_update14', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250707075322_update15', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250708073927_update16', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250709023715_update17', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250709123109_update18', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250709133428_update19', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250710053543_AddNewEntities', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250710081051_update20', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250710081830_update', N'8.0.8')
GO
SET IDENTITY_INSERT [dbo].[AnswerOptions] ON 

INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1002, 1006, N'Yes', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1003, 1006, N'No', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1004, 1007, N'No', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1005, 1007, N'Yes', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1006, 1008, N'Yes', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1007, 1008, N'No', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1008, 1009, N'No', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1009, 1009, N'Yes', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1010, 1010, N'Yes', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1011, 1010, N'No', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1012, 1011, N'string', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1013, 1012, N'a', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1014, 1012, N'b', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1015, 1013, N'c', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1016, 1013, N'd', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1017, 1014, N'Yes', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1018, 1014, N'No', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1019, 1015, N'Yes', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1020, 1015, N'No', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1021, 1016, N'Yes', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1022, 1016, N'No', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1023, 1017, N'Yes', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1024, 1017, N'No', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1025, 1018, N'Yes', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1026, 1018, N'No', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1027, 1019, N'string', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1028, 1019, N'string', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1029, 1020, N'string', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1030, 1020, N'string', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1031, 1021, N'string', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1032, 1021, N'string', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1033, 1022, N'string', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1034, 1022, N'string', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1035, 1023, N'string', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1036, 1023, N'string', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1037, 1024, N'Yes', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1038, 1024, N'No', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1039, 1025, N'Yes', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1040, 1025, N'No', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1041, 1026, N'Yes', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1042, 1026, N'No', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1043, 1027, N'Yes', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1044, 1027, N'No', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1045, 1028, N'Yes', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1046, 1028, N'No', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1047, 1029, N'string', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1048, 1029, N'no', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1049, 1030, N'yes', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1050, 1030, N'No', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1051, 1031, N'yes', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1052, 1031, N'No', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1053, 1032, N'yes', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1054, 1032, N'No', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1055, 1033, N'string', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1056, 1033, N'string', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1057, 1034, N'string', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1058, 1034, N'string', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1059, 1035, N'string', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1060, 1035, N'string', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1061, 1036, N'string', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1062, 1036, N'string', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1063, 1037, N'string', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1064, 1037, N'string', 4, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1065, 1038, N'string', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1066, 1038, N'string', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1067, 1039, N'string', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1068, 1039, N'string', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1069, 1040, N'string', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1070, 1040, N'string', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1071, 1041, N'string', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1072, 1041, N'string', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1073, 1042, N'string', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1074, 1042, N'string', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1075, 1043, N'string', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1076, 1043, N'string', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1077, 1044, N'string', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1078, 1044, N'string', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1079, 1045, N'string', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1080, 1045, N'string', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1081, 1046, N'string', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1082, 1046, N'string', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1083, 1047, N'string', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1084, 1047, N'string', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1085, 1048, N'string', 2, 0)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1086, 1048, N'string', 0, 0)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1087, 1049, N'string', 2, 0)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1088, 1049, N'string', 0, 0)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1089, 1050, N'string', 2, 0)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1090, 1050, N'string', 0, 0)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1091, 1051, N'string', 2, 0)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1092, 1051, N'string', 0, 0)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1093, 1052, N'string', 2, 0)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1094, 1052, N'string', 0, 0)
SET IDENTITY_INSERT [dbo].[AnswerOptions] OFF
GO
SET IDENTITY_INSERT [dbo].[AssessmentResults] ON 

INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime]) VALUES (3, 3, 7, NULL, N'Bạn đã hoàn thành bài đánh gia với 4 điểm!', 4, CAST(N'2025-06-12T21:44:45.4586169' AS DateTime2))
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime]) VALUES (4, 2, 7, NULL, N'Bạn đã hoàn thành bài đánh gia với 2 điểm!', 2, CAST(N'2025-06-16T00:44:18.6419825' AS DateTime2))
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime]) VALUES (5, 2, 7, NULL, N'Bạn đã hoàn thành bài đánh gia với 4 điểm!', 4, CAST(N'2025-06-16T00:50:17.5845965' AS DateTime2))
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime]) VALUES (6, 2, 7, NULL, N'Bạn đã hoàn thành bài đánh gia với 2 điểm!', 2, CAST(N'2025-06-16T14:04:10.6751770' AS DateTime2))
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime]) VALUES (7, 2, 7, NULL, N'Bạn đã hoàn thành bài đánh gia với 2 điểm!', 2, CAST(N'2025-06-16T15:15:45.1164488' AS DateTime2))
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime]) VALUES (8, 2, 7, NULL, N'Bạn đã hoàn thành bài đánh gia với 4 điểm!', 4, CAST(N'2025-06-16T15:18:14.8026140' AS DateTime2))
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime]) VALUES (9, 2, 7, 1013, N'Bạn đã hoàn thành bài đánh gia với 0 điểm!', 0, CAST(N'2025-06-16T15:26:34.0476535' AS DateTime2))
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime]) VALUES (10, 2, 7, 1013, N'Bạn đã hoàn thành bài đánh gia với 4 điểm!', 4, CAST(N'2025-06-16T15:26:56.2094580' AS DateTime2))
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime]) VALUES (11, 2, 7, 1013, N'Bạn đã hoàn thành bài đánh gia với 0 điểm!', 0, CAST(N'2025-06-16T15:40:23.4690934' AS DateTime2))
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime]) VALUES (12, 2, 7, 1013, N'Bạn đã hoàn thành bài đánh gia với 6 điểm!', 6, CAST(N'2025-06-16T15:40:52.0087736' AS DateTime2))
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime]) VALUES (22, 3, 11, 1013, N'Bạn đã hoàn thành bài đánh giá với 2 điểm!', 2, CAST(N'2025-06-24T19:16:25.9890698' AS DateTime2))
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime]) VALUES (24, 3, 11, NULL, N'Bạn đã hoàn thành bài đánh giá với 4 điểm!', 4, CAST(N'2025-06-24T19:24:35.5043752' AS DateTime2))
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime]) VALUES (27, 3, 25, 1013, N'Bạn đã hoàn thành bài đánh giá với 4 điểm!', 4, CAST(N'2025-06-26T14:58:04.1680430' AS DateTime2))
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime]) VALUES (30, 3, 25, NULL, N'Bạn đã hoàn thành bài đánh giá với 0 điểm!', 0, CAST(N'2025-06-26T15:02:33.8097207' AS DateTime2))
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime]) VALUES (42, 3, 45, NULL, N'Bạn đã hoàn thành bài đánh giá với 8 điểm!', 8, CAST(N'2025-07-04T13:47:45.6108179' AS DateTime2))
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime]) VALUES (43, 3, 45, NULL, N'Bạn đã hoàn thành bài đánh giá với 6 điểm!', 6, CAST(N'2025-07-04T15:11:31.0897848' AS DateTime2))
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime]) VALUES (44, 3, 38, NULL, N'Bạn đã hoàn thành bài đánh giá với 4 điểm!', 4, CAST(N'2025-07-04T15:12:54.0770870' AS DateTime2))
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime]) VALUES (46, 3, 41, NULL, N'Bạn đã hoàn thành bài đánh giá với 4 điểm!', 4, CAST(N'2025-07-04T15:18:05.2753780' AS DateTime2))
INSERT [dbo].[AssessmentResults] ([ResultID], [UserID], [AssessmentID], [CourseID], [ResultName], [Score], [TakeTime]) VALUES (48, 3, 41, 1017, N'Bạn đã hoàn thành bài đánh giá với 2 điểm!', 2, CAST(N'2025-07-04T15:18:59.9455325' AS DateTime2))
SET IDENTITY_INSERT [dbo].[AssessmentResults] OFF
GO
SET IDENTITY_INSERT [dbo].[Assessments] ON 

INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (7, N'Phòng chống ma túy', N'dành cho học sinh', N'Crafft', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (8, N'string', N'string', N'Crafft', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (9, N'string', N'string', N'Crafft', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (10, N'test multiple Q&A', N'string', N'Crafft', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (11, N'Nhận thức về ma túy', N'Dành cho học sinh', N'Crafft', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (12, N'kiểm tra thành quả', N'dành cho học sinh kết thúc khóa học', N'Crafft', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (13, N'kiểm tra thành quả', N'dành cho học sinh kết thúc khóa học', N'Crafft', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (14, N'string', N'string', N'Crafft', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (15, N'string', N'string', N'Crafft', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (16, N'string', N'string', N'Crafft', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (17, N'string', N'string', N'Crafft', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (18, N'string', N'string', N'Crafft', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (19, N'string', N'string', N'Crafft', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (20, N'string', N'string', N'Assist', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (21, N'string', N'string', N'Assist', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (22, N'string', N'string', N'Assist', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (23, N'string', N'string', N'Assist', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (24, N'string', N'string', N'Assist', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (25, N'ma túy', N'dành cho người dưới 18', N'Crafft', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (26, N'ma túy', N'dành cho người trên 18', N'Assist', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (27, N'ma túy', N'dành cho người dưới 18', N'Crafft', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (28, N'ma túy', N'dành cho người trên 18', N'Assist', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (29, N'string', N'string', N'Crafft', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (30, N'string', N'string', N'Crafft', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (31, N'string', N'string', N'Crafft', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (32, N'string', N'string', N'Crafft', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (33, N'string', N'string', N'Crafft', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (34, N'string', N'string', N'Crafft', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (35, N'string', N'string', N'Crafft', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (36, N'string', N'string', N'Crafft', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (37, N'string', N'string', N'Crafft', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (38, N'string', N'string', N'Assist', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (39, N'string', N'string', N'Assist', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (40, N'string', N'string', N'Assist', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (41, N'ad', N'aaa', N'Assist', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (42, N'string', N'string', N'Assist', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (43, N'string', N'string', N'Assist', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (44, N'string', N'string', N'Assist', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (45, N'HEHEHE', N'string', N'Crafft', 1)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (46, N'string', N'string', N'Assist', 0)
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted]) VALUES (47, N'stringa', N'string', N'Crafft', 0)
SET IDENTITY_INSERT [dbo].[Assessments] OFF
GO
SET IDENTITY_INSERT [dbo].[Certificates] ON 

INSERT [dbo].[Certificates] ([CertificateID], [CertificateName], [DateAcquired]) VALUES (1, N'string', CAST(N'2025-07-10T08:29:05.1630000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Certificates] OFF
GO
SET IDENTITY_INSERT [dbo].[Consultants] ON 

INSERT [dbo].[Consultants] ([ConsultantID], [UserID], [CertificateID], [Specialty], [Degree], [Experience], [HourlyRate], [CreatedAt], [UpdatedAt], [GoogleMeetLink]) VALUES (1, 14, 1, N'string', N'string', N'string', CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-07-10T08:29:26.1722325' AS DateTime2), CAST(N'2025-07-10T08:29:26.1724298' AS DateTime2), NULL)
SET IDENTITY_INSERT [dbo].[Consultants] OFF
GO
INSERT [dbo].[CourseAssessments] ([CourseID], [AssessmentID]) VALUES (1013, 11)
INSERT [dbo].[CourseAssessments] ([CourseID], [AssessmentID]) VALUES (1013, 12)
INSERT [dbo].[CourseAssessments] ([CourseID], [AssessmentID]) VALUES (1013, 13)
INSERT [dbo].[CourseAssessments] ([CourseID], [AssessmentID]) VALUES (1013, 20)
INSERT [dbo].[CourseAssessments] ([CourseID], [AssessmentID]) VALUES (1013, 21)
INSERT [dbo].[CourseAssessments] ([CourseID], [AssessmentID]) VALUES (1013, 22)
INSERT [dbo].[CourseAssessments] ([CourseID], [AssessmentID]) VALUES (1013, 23)
INSERT [dbo].[CourseAssessments] ([CourseID], [AssessmentID]) VALUES (1013, 24)
INSERT [dbo].[CourseAssessments] ([CourseID], [AssessmentID]) VALUES (1013, 28)
INSERT [dbo].[CourseAssessments] ([CourseID], [AssessmentID]) VALUES (1013, 32)
INSERT [dbo].[CourseAssessments] ([CourseID], [AssessmentID]) VALUES (1013, 33)
INSERT [dbo].[CourseAssessments] ([CourseID], [AssessmentID]) VALUES (1013, 34)
INSERT [dbo].[CourseAssessments] ([CourseID], [AssessmentID]) VALUES (1018, 40)
INSERT [dbo].[CourseAssessments] ([CourseID], [AssessmentID]) VALUES (1018, 41)
INSERT [dbo].[CourseAssessments] ([CourseID], [AssessmentID]) VALUES (1018, 44)
GO
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegisterTime]) VALUES (3, 1013, CAST(N'2025-06-24T19:08:39.0413467' AS DateTime2))
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegisterTime]) VALUES (3, 1022, CAST(N'2025-07-07T15:28:43.2422744' AS DateTime2))
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegisterTime]) VALUES (3, 1023, CAST(N'2025-07-09T16:19:22.7276520' AS DateTime2))
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegisterTime]) VALUES (3, 1024, CAST(N'2025-07-10T00:09:45.6340300' AS DateTime2))
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegisterTime]) VALUES (3, 1025, CAST(N'2025-07-10T00:10:59.1032303' AS DateTime2))
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegisterTime]) VALUES (13, 1023, CAST(N'2025-07-09T16:23:41.0892918' AS DateTime2))
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegisterTime]) VALUES (13, 1024, CAST(N'2025-07-09T23:57:48.5986442' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1013, N'string', N'string', N'HocSinh   ', N'Open', 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-06-16T07:10:49.0804773' AS DateTime2), CAST(N'2025-06-30T16:21:01.4169694' AS DateTime2), 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1016, N'string', N'string', N'HocSinh   ', N'Open', 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-06-30T16:39:16.6190055' AS DateTime2), CAST(N'2025-06-30T16:39:16.6190321' AS DateTime2), 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1017, N'string', N'string', N'PhuHuynh  ', N'Open', 26, 200, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-07-01T05:35:01.8853771' AS DateTime2), CAST(N'2025-07-01T05:35:01.8854025' AS DateTime2), 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1018, N'string', N'string', N'SinhVien  ', N'Open', 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-07-01T05:46:24.4398576' AS DateTime2), CAST(N'2025-07-01T05:46:24.4399464' AS DateTime2), 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1019, N'string', N'string', N'HocSinh   ', N'Open', 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-07-05T06:57:37.4225166' AS DateTime2), CAST(N'2025-07-05T06:57:37.4225307' AS DateTime2), 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1020, N'string', N'string', N'HocSinh   ', N'Open', 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-07-05T06:58:15.7283882' AS DateTime2), CAST(N'2025-07-05T06:58:15.7283883' AS DateTime2), 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1021, N'string', N'string', N'HocSinh   ', N'Open', 0, 0, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-07-05T07:15:21.5847333' AS DateTime2), CAST(N'2025-07-05T07:15:21.5847334' AS DateTime2), 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1022, N'Học Sinh', N'string', N'HocSinh   ', N'Closed', 12, 18, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-07-07T07:56:49.6144235' AS DateTime2), CAST(N'2025-07-07T08:28:27.9533443' AS DateTime2), 0)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1023, N'string', N'string', N'HocSinh   ', N'Open', 12, 18, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-07-08T04:32:20.6031448' AS DateTime2), CAST(N'2025-07-08T04:32:20.6031901' AS DateTime2), 0)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1024, N'aaaa', N'string', N'HocSinh   ', N'Open', 12, 18, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-07-09T13:38:47.8285333' AS DateTime2), CAST(N'2025-07-09T13:38:47.8285824' AS DateTime2), 0)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1025, N'aaaab', N'string', N'HocSinh   ', N'Open', 12, 18, 0, CAST(0.00 AS Decimal(18, 2)), CAST(N'2025-07-09T16:56:27.5490963' AS DateTime2), CAST(N'2025-07-09T16:56:27.5490963' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseVideos] ON 

INSERT [dbo].[CourseVideos] ([ID], [CourseID], [Title], [VideoUrl], [Description], [Order]) VALUES (1, 1022, N'string', N'https://www.youtube.com/embed/mVymtiLzdDU?si=wOo_M-5EWOKCnwHF', N'string', 1)
SET IDENTITY_INSERT [dbo].[CourseVideos] OFF
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 

INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1004, NULL, N'ma túy có lợi đúng không', N'True/False', 7, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1005, NULL, N'ma túy có lợi đúng không', N'True/False', 7, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1006, NULL, N'ma túy có lợi đúng không', N'True/False', 7, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1007, NULL, N'ma túy ai cũng phải xài thử', N'True/False', 7, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1008, NULL, N'ma túy không thử là phí', N'True/False', 7, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1009, NULL, N'ma túy chắc chắn tốt', N'True/False', 7, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1010, NULL, N'ma túy có thể chữa bệnh', N'True/False', 7, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1011, NULL, N'matuy', N'YES/NO', 9, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1012, NULL, N'aaa', N'aaa', 10, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1013, NULL, N'bbb', N'bbb', 10, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1014, NULL, N'Ma túy rất tốt', N'Yes/No', 11, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1015, NULL, N'Ma túy nên chơi', N'Yes/No', 11, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1016, NULL, N'Ma túy tốt cho người', N'Yes/No', 11, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1017, NULL, N'Ma túy là chất độc hại', N'Yes/No', 11, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1018, NULL, N'Ma túy là chất cấm', N'Yes/No', 11, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1019, NULL, N'abc', N'aaa', 12, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1020, NULL, N'abc', N'aaa', 12, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1021, NULL, N'abc', N'aaa', 12, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1022, NULL, N'abc', N'aaa', 12, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1023, NULL, N'abc', N'aaa', 12, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1024, NULL, N'Ma túy là chất kích thích có hại', N'YES/NO', 25, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1025, NULL, N'Ma túy là chất kích thích không có hại', N'YES/NO', 25, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1026, NULL, N'Ma túy giúp con người thông minh hơn', N'YES/NO', 25, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1027, NULL, N'Sử dụng ma túy có ích cho cộng đồng', N'YES/NO', 25, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1028, NULL, N'Ma túy ai cũng nên thử', N'YES/NO', 25, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1029, NULL, N'ỉa hả', N'yes/no', 45, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1030, NULL, N'heheheh', N'Input', 45, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1031, NULL, N'string', N'string', 41, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1032, NULL, N'ádw', N'Input', 45, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1033, NULL, N'string', N'string', 45, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1034, NULL, N'string', N'string', 45, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1035, NULL, N'string', N'string', 41, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1036, NULL, N'string', N'string', 45, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1037, NULL, N'string', N'string', 45, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1038, NULL, N'string', N'string', 38, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1039, NULL, N'string', N'string', 38, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1040, NULL, N'string', N'string', 38, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1041, NULL, N'string', N'string', 38, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1042, NULL, N'string', N'string', 38, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1043, NULL, N'string', N'string', 41, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1044, NULL, N'string', N'string', 41, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1045, NULL, N'string', N'string', 41, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1046, NULL, N'string', N'string', 41, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1047, NULL, N'string', N'string', 41, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1048, NULL, N'string', N'string', 46, 0)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1049, NULL, N'a', N'string', 46, 0)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1050, NULL, N'stringb', N'string', 46, 0)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1051, NULL, N'stringc', N'string', 46, 0)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1052, NULL, N'stringd', N'string', 46, 0)
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
SET IDENTITY_INSERT [dbo].[UserCourseProgresses] ON 

INSERT [dbo].[UserCourseProgresses] ([ID], [UserID], [CourseID], [IsCompleted], [CompletedAt]) VALUES (1, 3, 1023, 1, CAST(N'2025-07-09T17:07:21.5864941' AS DateTime2))
INSERT [dbo].[UserCourseProgresses] ([ID], [UserID], [CourseID], [IsCompleted], [CompletedAt]) VALUES (2, 13, 1023, 1, CAST(N'2025-07-09T09:29:28.7157279' AS DateTime2))
INSERT [dbo].[UserCourseProgresses] ([ID], [UserID], [CourseID], [IsCompleted], [CompletedAt]) VALUES (3, 13, 1024, 0, NULL)
INSERT [dbo].[UserCourseProgresses] ([ID], [UserID], [CourseID], [IsCompleted], [CompletedAt]) VALUES (4, 3, 1024, 1, CAST(N'2025-07-09T17:10:00.3835625' AS DateTime2))
INSERT [dbo].[UserCourseProgresses] ([ID], [UserID], [CourseID], [IsCompleted], [CompletedAt]) VALUES (5, 3, 1025, 0, NULL)
SET IDENTITY_INSERT [dbo].[UserCourseProgresses] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Email], [FullName], [DateOfBirth], [Phone], [Address], [Status], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (2, N'admin', N'$2a$11$ORd6pzAfXzC6n4rz7CfUpe0GmSgD/ux1OSYeweYUdUTONPAOgxU2m', N'admin@example.com', N'Administrator', NULL, NULL, NULL, NULL, 6, CAST(N'2025-06-02T05:33:02.2233412' AS DateTime2), CAST(N'2025-06-02T05:33:02.2233412' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Email], [FullName], [DateOfBirth], [Phone], [Address], [Status], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (3, N'hoang', N'$2a$11$SFeB956A7Gv19lAO/JWdg.zd4dP5vhfdAuPXAQz522my8dXNbNwAO', N'hoang@example.com', N'doquochoang', CAST(N'2025-06-02T18:18:45.3210000' AS DateTime2), N'012345678', N'113', N'Active', 2, CAST(N'2025-06-02T18:19:32.7626207' AS DateTime2), CAST(N'2025-06-02T18:19:32.7627795' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Email], [FullName], [DateOfBirth], [Phone], [Address], [Status], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (11, N'kaka', N'$2a$11$ORd6pzAfXzC6n4rz7CfUpe0GmSgD/ux1OSYeweYUdUTONPAOgxU2m', N'kaka@example.com', N'Administration', NULL, NULL, NULL, NULL, 6, CAST(N'2025-06-02T05:33:02.2233412' AS DateTime2), CAST(N'2025-06-02T05:33:02.2233412' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Email], [FullName], [DateOfBirth], [Phone], [Address], [Status], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (12, N'dohoang', N'$2a$11$tz85AlMJroJjJssUr10WHONA4Pw8wtm8QWvIrB0VUBSVcZtLFRTea', N'dohoang@example.com', N'DoQuocHoang', CAST(N'2025-06-03T01:39:01.9910000' AS DateTime2), N'012345678', N'123456', N'Active', 2, CAST(N'2025-06-03T01:51:06.2746338' AS DateTime2), CAST(N'2025-06-03T01:51:06.2746855' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Email], [FullName], [DateOfBirth], [Phone], [Address], [Status], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (13, N'nguyen', N'$2a$11$rx3.lTrEKXZzsYxius1T7ee5DtTpNJ8XW1jmO7lb7sAYrRTUhkzSS', N'nguyen@gmail.com', N'Lê Văn Nguyên', CAST(N'2025-07-09T09:22:15.7410000' AS DateTime2), N'123456789', N'123', N'Active', 2, CAST(N'2025-07-09T09:22:51.9823939' AS DateTime2), CAST(N'2025-07-09T09:22:51.9824715' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Email], [FullName], [DateOfBirth], [Phone], [Address], [Status], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (14, N'string', N'$2a$11$6IcAnwEfqIUio9z9E937XeuwH3WtX8EZ/3HnDqCHxcPsGvCojxPuy', N'user@gmail.com', N'string', NULL, NULL, NULL, N'Active', 4, CAST(N'2025-07-10T08:29:26.1114134' AS DateTime2), CAST(N'2025-07-10T08:29:26.1114136' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-schedules', N'CreatedAt', N'1752135871821', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-schedules', N'Cron', N'0 0 * * *', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-schedules', N'Job', N'{"t":"DrugUsePreventionAPI.Controllers.Data.ScheduleGenerator, DrugUsePreventionAPI","m":"GenerateDailySchedulesAsync","p":["System.DateTime, mscorlib"],"a":["\"2025-07-10T00:00:00Z\""]}', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-schedules', N'NextExecution', N'1752192000000', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-schedules', N'Queue', N'default', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-schedules', N'TimeZoneId', N'UTC', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-schedules', N'V', N'2', NULL)
GO
INSERT [HangFire].[Schema] ([Version]) VALUES (9)
GO
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'desktop-nggl106:14376:abc1ea88-05a5-4ae5-a7f9-45a2371affda', N'{"WorkerCount":20,"Queues":["default"],"StartedAt":"2025-07-10T08:24:33.0006535Z"}', CAST(N'2025-07-10T08:34:03.350' AS DateTime))
GO
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'recurring-jobs', 1752192000, N'generate-daily-schedules', NULL)
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
ALTER TABLE [dbo].[CourseVideos]  WITH CHECK ADD  CONSTRAINT [FK_CourseVideos_Courses_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseVideos] CHECK CONSTRAINT [FK_CourseVideos_Courses_CourseID]
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
ALTER TABLE [dbo].[UserCourseProgresses]  WITH CHECK ADD  CONSTRAINT [FK_UserCourseProgresses_Courses_CourseID] FOREIGN KEY([CourseID])
REFERENCES [dbo].[Courses] ([CourseID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserCourseProgresses] CHECK CONSTRAINT [FK_UserCourseProgresses_Courses_CourseID]
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
