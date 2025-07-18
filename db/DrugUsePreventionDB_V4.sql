USE [DrugUsePreventionDB_V4]
GO
/****** Object:  Schema [HangFire]    Script Date: 7/14/2025 3:00:14 AM ******/
CREATE SCHEMA [HangFire]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [dbo].[AnswerOptions]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [dbo].[Appointments]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [dbo].[AssessmentResults]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [dbo].[Assessments]    Script Date: 7/14/2025 3:00:14 AM ******/
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
	[AssessmentStage] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Assessments] PRIMARY KEY CLUSTERED 
(
	[AssessmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [dbo].[Certificates]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [dbo].[CommunicationPrograms]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [dbo].[ConsultantAppointmentEvaluations]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [dbo].[Consultants]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [dbo].[ConsultantSchedules]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [dbo].[CourseAssessments]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [dbo].[CourseRegistrations]    Script Date: 7/14/2025 3:00:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseRegistrations](
	[UserID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[RegistrationDate] [datetime2](7) NOT NULL,
	[Amount] [decimal](18, 2) NULL,
	[PaymentStatus] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[TransactionID] [nvarchar](max) NULL,
	[CourseRegistrationID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_CourseRegistrations] PRIMARY KEY CLUSTERED 
(
	[CourseRegistrationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 7/14/2025 3:00:14 AM ******/
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
	[Price] [decimal](10, 2) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[CourseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CourseVideos]    Script Date: 7/14/2025 3:00:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseVideos](
	[VideoID] [int] IDENTITY(1,1) NOT NULL,
	[CourseID] [int] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[VideoUrl] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_CourseVideos] PRIMARY KEY CLUSTERED 
(
	[VideoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payments]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [dbo].[ProgramParticipations]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [dbo].[Questions]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [dbo].[SurveyResponses]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [dbo].[Surveys]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [dbo].[UserCourseProgresses]    Script Date: 7/14/2025 3:00:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserCourseProgresses](
	[UserCourseProgressID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[IsCompleted] [bit] NOT NULL,
	[CompletedAt] [datetime2](7) NULL,
 CONSTRAINT [PK_UserCourseProgresses] PRIMARY KEY CLUSTERED 
(
	[UserCourseProgressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [HangFire].[AggregatedCounter]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [HangFire].[Counter]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [HangFire].[Hash]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [HangFire].[Job]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [HangFire].[JobParameter]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [HangFire].[JobQueue]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [HangFire].[List]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [HangFire].[Schema]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [HangFire].[Server]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [HangFire].[Set]    Script Date: 7/14/2025 3:00:14 AM ******/
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
/****** Object:  Table [HangFire].[State]    Script Date: 7/14/2025 3:00:14 AM ******/
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
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250712091350_update', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250713075342_update1', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250713121242_update2', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250713162400_update3', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250713170618_update4', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250713174128_update5', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250713182929_update6', N'8.0.8')
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
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1085, 1048, N'string', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1086, 1048, N'string', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1087, 1049, N'string', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1088, 1049, N'string', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1089, 1050, N'string', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1090, 1050, N'string', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1091, 1051, N'string', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1092, 1051, N'string', 0, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1093, 1052, N'string', 2, 1)
INSERT [dbo].[AnswerOptions] ([OptionID], [QuestionID], [OptionText], [ScoreValue], [IsDeleted]) VALUES (1094, 1052, N'string', 0, 1)
SET IDENTITY_INSERT [dbo].[AnswerOptions] OFF
GO
SET IDENTITY_INSERT [dbo].[Appointments] ON 

INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (1, 3, 1, CAST(N'2025-07-05T14:00:00.0000000' AS DateTime2), CAST(N'2025-07-05T15:00:00.0000000' AS DateTime2), CAST(50.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', NULL, CAST(N'2025-06-24T14:26:43.9433333' AS DateTime2), CAST(N'2025-06-24T14:26:43.9433333' AS DateTime2), NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (2, 5, 2, CAST(N'2025-07-01T13:00:00.0000000' AS DateTime2), CAST(N'2025-07-01T14:00:00.0000000' AS DateTime2), CAST(9999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-24T09:16:31.0781597' AS DateTime2), CAST(N'2025-06-24T09:16:31.0781599' AS DateTime2), NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (3, 5, 2, CAST(N'2025-07-01T14:00:00.0000000' AS DateTime2), CAST(N'2025-07-01T15:00:00.0000000' AS DateTime2), CAST(9999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-24T09:22:11.1756657' AS DateTime2), CAST(N'2025-06-24T09:22:11.1756660' AS DateTime2), NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (4, 5, 2, CAST(N'2025-07-01T15:00:00.0000000' AS DateTime2), CAST(N'2025-07-01T16:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-24T09:40:44.6396008' AS DateTime2), CAST(N'2025-06-24T09:40:44.6396009' AS DateTime2), NULL)
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (5, 5, 2, CAST(N'2025-07-01T16:00:00.0000000' AS DateTime2), CAST(N'2025-07-01T17:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-24T09:46:46.4089594' AS DateTime2), CAST(N'2025-06-24T09:46:46.4089595' AS DateTime2), N'5')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (6, 5, 2, CAST(N'2025-06-27T07:00:00.0000000' AS DateTime2), CAST(N'2025-06-27T09:00:00.0000000' AS DateTime2), CAST(199998.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'Tan dan', CAST(N'2025-06-26T15:09:59.0561451' AS DateTime2), CAST(N'2025-06-26T15:09:59.0562268' AS DateTime2), N'138,139')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (7, 5, 2, CAST(N'2025-06-27T15:00:00.0000000' AS DateTime2), CAST(N'2025-06-27T16:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-27T04:53:31.3348025' AS DateTime2), CAST(N'2025-06-27T04:53:31.3348555' AS DateTime2), N'146')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (8, 5, 2, CAST(N'2025-06-27T16:00:00.0000000' AS DateTime2), CAST(N'2025-06-27T17:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-27T06:03:18.0321456' AS DateTime2), CAST(N'2025-06-27T06:03:18.0321459' AS DateTime2), N'147')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (9, 5, 2, CAST(N'2025-06-27T17:00:00.0000000' AS DateTime2), CAST(N'2025-06-27T18:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-27T06:10:50.4195880' AS DateTime2), CAST(N'2025-06-27T06:10:50.4195882' AS DateTime2), N'148')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (10, 5, 2, CAST(N'2025-06-27T18:00:00.0000000' AS DateTime2), CAST(N'2025-06-27T19:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-27T06:34:15.8153270' AS DateTime2), CAST(N'2025-06-27T06:34:15.8153799' AS DateTime2), N'149')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (11, 5, 2, CAST(N'2025-06-28T07:00:00.0000000' AS DateTime2), CAST(N'2025-06-28T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-27T07:23:27.9563757' AS DateTime2), CAST(N'2025-06-27T07:23:27.9564255' AS DateTime2), N'150')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (12, 5, 2, CAST(N'2025-06-28T08:00:00.0000000' AS DateTime2), CAST(N'2025-06-28T09:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-27T07:56:26.6762435' AS DateTime2), CAST(N'2025-06-27T07:56:26.6762948' AS DateTime2), N'151')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (13, 5, 2, CAST(N'2025-06-28T09:00:00.0000000' AS DateTime2), CAST(N'2025-06-28T10:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-27T08:00:56.3653343' AS DateTime2), CAST(N'2025-06-27T08:00:56.3655255' AS DateTime2), N'152')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (14, 5, 2, CAST(N'2025-06-28T10:00:00.0000000' AS DateTime2), CAST(N'2025-06-28T11:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-27T08:04:51.9234233' AS DateTime2), CAST(N'2025-06-27T08:04:51.9234740' AS DateTime2), N'153')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (15, 5, 2, CAST(N'2025-06-28T11:00:00.0000000' AS DateTime2), CAST(N'2025-06-28T12:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-27T08:26:59.2264410' AS DateTime2), CAST(N'2025-06-27T08:26:59.2264840' AS DateTime2), N'154')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (16, 5, 2, CAST(N'2025-06-28T12:00:00.0000000' AS DateTime2), CAST(N'2025-06-28T13:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-27T08:35:09.1866132' AS DateTime2), CAST(N'2025-06-27T08:35:09.1866134' AS DateTime2), N'155')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (17, 5, 3, CAST(N'2025-06-28T07:00:00.0000000' AS DateTime2), CAST(N'2025-06-28T08:00:00.0000000' AS DateTime2), CAST(8888.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-27T17:28:48.1932281' AS DateTime2), CAST(N'2025-06-27T17:28:48.1932925' AS DateTime2), N'277')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (18, 5, 2, CAST(N'2025-06-29T07:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T16:55:03.6218322' AS DateTime2), CAST(N'2025-06-28T16:55:03.6218871' AS DateTime2), N'162')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (19, 5, 2, CAST(N'2025-06-29T09:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T10:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T16:57:07.1538402' AS DateTime2), CAST(N'2025-06-28T16:57:07.1538410' AS DateTime2), N'164')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (20, 5, 2, CAST(N'2025-06-29T08:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T09:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T17:35:50.1242035' AS DateTime2), CAST(N'2025-06-28T17:35:50.1242039' AS DateTime2), N'163')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (21, 5, 2, CAST(N'2025-06-29T10:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T11:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T17:36:13.5347516' AS DateTime2), CAST(N'2025-06-28T17:36:13.5347517' AS DateTime2), N'165')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (22, 5, 2, CAST(N'2025-06-29T11:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T12:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T17:42:54.4405369' AS DateTime2), CAST(N'2025-06-28T17:42:54.4405373' AS DateTime2), N'166')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (23, 5, 2, CAST(N'2025-06-29T12:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T13:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T17:43:22.5023129' AS DateTime2), CAST(N'2025-06-28T17:43:22.5023130' AS DateTime2), N'167')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (24, 5, 2, CAST(N'2025-06-29T13:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T14:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T17:43:30.0789282' AS DateTime2), CAST(N'2025-06-28T17:43:30.0789283' AS DateTime2), N'168')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (25, 5, 2, CAST(N'2025-06-29T14:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T15:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T17:45:59.1945205' AS DateTime2), CAST(N'2025-06-28T17:45:59.1945210' AS DateTime2), N'169')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (26, 5, 2, CAST(N'2025-06-29T15:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T16:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T17:52:23.5663431' AS DateTime2), CAST(N'2025-06-28T17:52:23.5663435' AS DateTime2), N'170')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (27, 5, 2, CAST(N'2025-06-29T16:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T17:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T17:52:50.9975125' AS DateTime2), CAST(N'2025-06-28T17:52:50.9975126' AS DateTime2), N'171')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (28, 5, 2, CAST(N'2025-06-30T07:00:00.0000000' AS DateTime2), CAST(N'2025-06-30T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T17:53:08.7966177' AS DateTime2), CAST(N'2025-06-28T17:53:08.7966178' AS DateTime2), N'174')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (29, 5, 2, CAST(N'2025-06-30T13:00:00.0000000' AS DateTime2), CAST(N'2025-06-30T14:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T18:18:31.0135268' AS DateTime2), CAST(N'2025-06-28T18:18:31.0135271' AS DateTime2), N'180')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (30, 5, 2, CAST(N'2025-06-29T17:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T18:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T18:25:58.7534826' AS DateTime2), CAST(N'2025-06-28T18:25:58.7534829' AS DateTime2), N'172')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (31, 5, 2, CAST(N'2025-06-30T08:00:00.0000000' AS DateTime2), CAST(N'2025-06-30T09:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T18:30:20.2770829' AS DateTime2), CAST(N'2025-06-28T18:30:20.2770831' AS DateTime2), N'175')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (32, 5, 2, CAST(N'2025-06-30T14:00:00.0000000' AS DateTime2), CAST(N'2025-06-30T15:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T18:41:04.4396847' AS DateTime2), CAST(N'2025-06-28T18:41:04.4396851' AS DateTime2), N'181')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (33, 5, 2, CAST(N'2025-07-01T09:00:00.0000000' AS DateTime2), CAST(N'2025-07-01T10:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T18:42:44.4004480' AS DateTime2), CAST(N'2025-06-28T18:42:44.4004482' AS DateTime2), N'188')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (34, 5, 2, CAST(N'2025-06-30T09:00:00.0000000' AS DateTime2), CAST(N'2025-06-30T10:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T18:49:42.3689397' AS DateTime2), CAST(N'2025-06-28T18:49:42.3689399' AS DateTime2), N'176')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (35, 5, 2, CAST(N'2025-07-02T08:00:00.0000000' AS DateTime2), CAST(N'2025-07-02T09:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-28T18:53:28.4249434' AS DateTime2), CAST(N'2025-06-28T18:53:28.4249436' AS DateTime2), N'206')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (36, 10, 5, CAST(N'2025-06-30T07:00:00.0000000' AS DateTime2), CAST(N'2025-06-30T08:00:00.0000000' AS DateTime2), CAST(8989.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T02:19:39.5677296' AS DateTime2), CAST(N'2025-06-29T02:19:39.5677827' AS DateTime2), N'698')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (37, 10, 2, CAST(N'2025-06-29T18:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T19:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T02:21:11.3131578' AS DateTime2), CAST(N'2025-06-29T02:21:11.3131579' AS DateTime2), N'173')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (38, 10, 2, CAST(N'2025-07-06T07:00:00.0000000' AS DateTime2), CAST(N'2025-07-06T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T06:13:59.5567048' AS DateTime2), CAST(N'2025-06-29T06:13:59.5567056' AS DateTime2), N'578')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (39, 5, 2, CAST(N'2025-06-30T12:00:00.0000000' AS DateTime2), CAST(N'2025-06-30T13:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T06:20:17.0895829' AS DateTime2), CAST(N'2025-06-29T06:20:17.0895830' AS DateTime2), N'179')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (40, 5, 3, CAST(N'2025-06-29T14:00:00.0000000' AS DateTime2), CAST(N'2025-06-29T15:00:00.0000000' AS DateTime2), CAST(8888.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T06:23:05.7418516' AS DateTime2), CAST(N'2025-06-29T06:23:05.7418518' AS DateTime2), N'296')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (41, 5, 2, CAST(N'2025-07-02T07:00:00.0000000' AS DateTime2), CAST(N'2025-07-02T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T06:23:16.0840200' AS DateTime2), CAST(N'2025-06-29T06:23:16.0840201' AS DateTime2), N'205')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (42, 5, 2, CAST(N'2025-07-02T09:00:00.0000000' AS DateTime2), CAST(N'2025-07-02T10:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T06:26:21.8793443' AS DateTime2), CAST(N'2025-06-29T06:26:21.8793445' AS DateTime2), N'207')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (43, 5, 2, CAST(N'2025-07-03T08:00:00.0000000' AS DateTime2), CAST(N'2025-07-03T09:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T06:36:11.8415302' AS DateTime2), CAST(N'2025-06-29T06:36:11.8415304' AS DateTime2), N'242')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (44, 5, 2, CAST(N'2025-07-01T07:00:00.0000000' AS DateTime2), CAST(N'2025-07-01T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T06:43:00.7469979' AS DateTime2), CAST(N'2025-06-29T06:43:00.7469983' AS DateTime2), N'186')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (45, 5, 2, CAST(N'2025-07-02T10:00:00.0000000' AS DateTime2), CAST(N'2025-07-02T11:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T06:43:30.2199868' AS DateTime2), CAST(N'2025-06-29T06:43:30.2199868' AS DateTime2), N'208')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (46, 5, 2, CAST(N'2025-07-02T11:00:00.0000000' AS DateTime2), CAST(N'2025-07-02T12:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T06:49:10.6555696' AS DateTime2), CAST(N'2025-06-29T06:49:10.6555702' AS DateTime2), N'209')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (47, 5, 2, CAST(N'2025-07-03T09:00:00.0000000' AS DateTime2), CAST(N'2025-07-03T10:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T07:06:03.6197919' AS DateTime2), CAST(N'2025-06-29T07:06:03.6197922' AS DateTime2), N'243')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (48, 5, 2, CAST(N'2025-07-03T07:00:00.0000000' AS DateTime2), CAST(N'2025-07-03T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T07:09:37.7472240' AS DateTime2), CAST(N'2025-06-29T07:09:37.7472242' AS DateTime2), N'241')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (49, 5, 2, CAST(N'2025-07-03T10:00:00.0000000' AS DateTime2), CAST(N'2025-07-03T11:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T07:36:55.1823618' AS DateTime2), CAST(N'2025-06-29T07:36:55.1823620' AS DateTime2), N'244')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (50, 5, 2, CAST(N'2025-07-02T12:00:00.0000000' AS DateTime2), CAST(N'2025-07-02T13:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T08:15:55.2001434' AS DateTime2), CAST(N'2025-06-29T08:15:55.2001442' AS DateTime2), N'210')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (51, 5, 2, CAST(N'2025-07-03T12:00:00.0000000' AS DateTime2), CAST(N'2025-07-03T13:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T08:23:18.3604486' AS DateTime2), CAST(N'2025-06-29T08:23:18.3604490' AS DateTime2), N'246')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (52, 5, 2, CAST(N'2025-06-30T10:00:00.0000000' AS DateTime2), CAST(N'2025-06-30T11:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T08:31:10.2762727' AS DateTime2), CAST(N'2025-06-29T08:31:10.2762729' AS DateTime2), N'177')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (53, 5, 2, CAST(N'2025-07-03T13:00:00.0000000' AS DateTime2), CAST(N'2025-07-03T14:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T08:49:46.6615643' AS DateTime2), CAST(N'2025-06-29T08:49:46.6615645' AS DateTime2), N'247')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (54, 5, 2, CAST(N'2025-07-04T07:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T13:35:36.9893110' AS DateTime2), CAST(N'2025-06-29T13:35:36.9893112' AS DateTime2), N'253')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (55, 5, 2, CAST(N'2025-07-01T08:00:00.0000000' AS DateTime2), CAST(N'2025-07-01T09:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T17:23:07.6855169' AS DateTime2), CAST(N'2025-06-29T17:23:07.6855691' AS DateTime2), N'187')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (56, 5, 2, CAST(N'2025-07-02T13:00:00.0000000' AS DateTime2), CAST(N'2025-07-02T14:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T17:28:17.1106692' AS DateTime2), CAST(N'2025-06-29T17:28:17.1106693' AS DateTime2), N'211')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (57, 5, 2, CAST(N'2025-07-03T14:00:00.0000000' AS DateTime2), CAST(N'2025-07-03T15:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T17:31:32.3099943' AS DateTime2), CAST(N'2025-06-29T17:31:32.3099945' AS DateTime2), N'248')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (58, 5, 2, CAST(N'2025-07-03T15:00:00.0000000' AS DateTime2), CAST(N'2025-07-03T16:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T17:39:56.2283076' AS DateTime2), CAST(N'2025-06-29T17:39:56.2283079' AS DateTime2), N'249')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (59, 5, 2, CAST(N'2025-07-01T12:00:00.0000000' AS DateTime2), CAST(N'2025-07-01T13:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T17:41:45.2054319' AS DateTime2), CAST(N'2025-06-29T17:41:45.2054322' AS DateTime2), N'191')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (60, 5, 2, CAST(N'2025-07-02T14:00:00.0000000' AS DateTime2), CAST(N'2025-07-02T15:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T17:43:58.7168627' AS DateTime2), CAST(N'2025-06-29T17:43:58.7168628' AS DateTime2), N'212')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (61, 5, 2, CAST(N'2025-07-03T11:00:00.0000000' AS DateTime2), CAST(N'2025-07-03T12:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T17:44:59.3337201' AS DateTime2), CAST(N'2025-06-29T17:44:59.3337203' AS DateTime2), N'245')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (62, 5, 2, CAST(N'2025-07-03T16:00:00.0000000' AS DateTime2), CAST(N'2025-07-03T17:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T17:53:11.9346967' AS DateTime2), CAST(N'2025-06-29T17:53:11.9346970' AS DateTime2), N'250')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (63, 5, 2, CAST(N'2025-07-04T08:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T09:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T17:53:57.8231777' AS DateTime2), CAST(N'2025-06-29T17:53:57.8231777' AS DateTime2), N'254')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (64, 5, 2, CAST(N'2025-07-03T17:00:00.0000000' AS DateTime2), CAST(N'2025-07-03T18:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-29T17:59:13.6360039' AS DateTime2), CAST(N'2025-06-29T17:59:13.6360040' AS DateTime2), N'251')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (65, 5, 2, CAST(N'2025-07-04T09:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T10:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-30T13:51:31.1904611' AS DateTime2), CAST(N'2025-06-30T13:51:31.1905581' AS DateTime2), N'255')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (66, 5, 2, CAST(N'2025-07-04T10:00:00.0000000' AS DateTime2), CAST(N'2025-07-04T11:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-30T13:54:18.5553598' AS DateTime2), CAST(N'2025-06-30T13:54:18.5554043' AS DateTime2), N'256')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (67, 5, 2, CAST(N'2025-07-02T15:00:00.0000000' AS DateTime2), CAST(N'2025-07-02T16:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-06-30T14:27:21.2647122' AS DateTime2), CAST(N'2025-06-30T14:27:21.2647130' AS DateTime2), N'213')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (68, 5, 2, CAST(N'2025-07-07T07:00:00.0000000' AS DateTime2), CAST(N'2025-07-07T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-04T17:37:22.0297537' AS DateTime2), CAST(N'2025-07-04T17:37:22.0298298' AS DateTime2), N'794')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (69, 5, 2, CAST(N'2025-07-10T08:00:00.0000000' AS DateTime2), CAST(N'2025-07-10T09:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-04T17:44:43.7468251' AS DateTime2), CAST(N'2025-07-04T17:44:43.7468256' AS DateTime2), N'915')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (70, 5, 2, CAST(N'2025-07-09T07:00:00.0000000' AS DateTime2), CAST(N'2025-07-09T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-04T17:47:53.2168446' AS DateTime2), CAST(N'2025-07-04T17:47:53.2168451' AS DateTime2), N'902')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (71, 5, 2, CAST(N'2025-07-08T07:00:00.0000000' AS DateTime2), CAST(N'2025-07-08T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-04T17:59:41.7532248' AS DateTime2), CAST(N'2025-07-04T17:59:41.7532258' AS DateTime2), N'842')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (72, 5, 2, CAST(N'2025-07-11T07:00:00.0000000' AS DateTime2), CAST(N'2025-07-11T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-04T18:03:29.1216104' AS DateTime2), CAST(N'2025-07-04T18:03:29.1216118' AS DateTime2), N'986')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (73, 5, 3, CAST(N'2025-07-06T07:00:00.0000000' AS DateTime2), CAST(N'2025-07-06T08:00:00.0000000' AS DateTime2), CAST(8888.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-04T18:14:30.5106787' AS DateTime2), CAST(N'2025-07-04T18:14:30.5106789' AS DateTime2), N'674')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (74, 5, 2, CAST(N'2025-07-05T07:00:00.0000000' AS DateTime2), CAST(N'2025-07-05T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-04T18:17:46.8747034' AS DateTime2), CAST(N'2025-07-04T18:17:46.8747037' AS DateTime2), N'373')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (75, 5, 2, CAST(N'2025-07-06T08:00:00.0000000' AS DateTime2), CAST(N'2025-07-06T09:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-04T18:29:29.4687953' AS DateTime2), CAST(N'2025-07-04T18:29:29.4687957' AS DateTime2), N'579')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (76, 5, 2, CAST(N'2025-07-05T09:00:00.0000000' AS DateTime2), CAST(N'2025-07-05T10:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-04T18:37:21.7752687' AS DateTime2), CAST(N'2025-07-04T18:37:21.7752689' AS DateTime2), N'375')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (77, 5, 2, CAST(N'2025-07-05T13:00:00.0000000' AS DateTime2), CAST(N'2025-07-05T14:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-04T18:42:32.6792244' AS DateTime2), CAST(N'2025-07-04T18:42:32.6792249' AS DateTime2), N'379')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (78, 5, 2, CAST(N'2025-07-09T09:00:00.0000000' AS DateTime2), CAST(N'2025-07-09T10:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-04T18:43:36.6951646' AS DateTime2), CAST(N'2025-07-04T18:43:36.6951647' AS DateTime2), N'904')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (79, 5, 2, CAST(N'2025-07-05T12:00:00.0000000' AS DateTime2), CAST(N'2025-07-05T13:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-05T04:03:11.8377574' AS DateTime2), CAST(N'2025-07-05T04:03:11.8378284' AS DateTime2), N'378')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (80, 5, 2, CAST(N'2025-07-05T14:00:00.0000000' AS DateTime2), CAST(N'2025-07-05T15:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-05T04:05:55.2302397' AS DateTime2), CAST(N'2025-07-05T04:05:55.2302400' AS DateTime2), N'380')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (81, 5, 2, CAST(N'2025-07-05T15:00:00.0000000' AS DateTime2), CAST(N'2025-07-05T16:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-05T04:10:42.2877759' AS DateTime2), CAST(N'2025-07-05T04:10:42.2878033' AS DateTime2), N'381')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (82, 5, 2, CAST(N'2025-07-05T16:00:00.0000000' AS DateTime2), CAST(N'2025-07-05T17:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-05T04:13:04.1540069' AS DateTime2), CAST(N'2025-07-05T04:13:04.1540070' AS DateTime2), N'382')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (83, 5, 2, CAST(N'2025-07-07T08:00:00.0000000' AS DateTime2), CAST(N'2025-07-07T09:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-05T06:17:03.4322718' AS DateTime2), CAST(N'2025-07-05T06:17:03.4323193' AS DateTime2), N'795')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (84, 5, 2, CAST(N'2025-07-05T17:00:00.0000000' AS DateTime2), CAST(N'2025-07-05T18:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-05T06:19:04.6517188' AS DateTime2), CAST(N'2025-07-05T06:19:04.6517908' AS DateTime2), N'383')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (85, 12, 5, CAST(N'2025-07-13T07:00:00.0000000' AS DateTime2), CAST(N'2025-07-13T08:00:00.0000000' AS DateTime2), CAST(8989.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-12T19:05:30.4755547' AS DateTime2), CAST(N'2025-07-12T19:05:30.4755782' AS DateTime2), N'2023')
INSERT [dbo].[Appointments] ([AppointmentID], [UserID], [ConsultantID], [StartDateTime], [EndDateTime], [Price], [Status], [Note], [CreatedAt], [UpdatedAt], [ScheduleIds]) VALUES (86, 12, 2, CAST(N'2025-07-13T07:00:00.0000000' AS DateTime2), CAST(N'2025-07-13T08:00:00.0000000' AS DateTime2), CAST(99999.00 AS Decimal(10, 2)), N'PENDING_PAYMENT', N'string', CAST(N'2025-07-12T19:10:11.8128102' AS DateTime2), CAST(N'2025-07-12T19:10:11.8128102' AS DateTime2), N'1927')
SET IDENTITY_INSERT [dbo].[Appointments] OFF
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

INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (7, N'Phòng chống ma túy', N'dành cho học sinh', N'Crafft', 1, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (8, N'string', N'string', N'Crafft', 1, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (9, N'string', N'string', N'Crafft', 1, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (10, N'test multiple Q&A', N'string', N'Crafft', 1, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (11, N'Nhận thức về ma túy', N'Dành cho học sinh', N'Crafft', 1, N'Output')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (12, N'kiểm tra thành quả', N'dành cho học sinh kết thúc khóa học', N'Crafft', 1, N'Output')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (13, N'kiểm tra thành quả', N'dành cho học sinh kết thúc khóa học', N'Crafft', 1, N'Output')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (14, N'string', N'string', N'Crafft', 1, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (15, N'string', N'string', N'Crafft', 1, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (16, N'string', N'string', N'Crafft', 1, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (17, N'string', N'string', N'Crafft', 1, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (18, N'string', N'string', N'Crafft', 1, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (19, N'string', N'string', N'Crafft', 1, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (20, N'string', N'string', N'Assist', 1, N'Output')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (21, N'string', N'string', N'Assist', 1, N'Output')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (22, N'string', N'string', N'Assist', 1, N'Output')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (23, N'string', N'string', N'Assist', 1, N'Output')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (24, N'string', N'string', N'Assist', 1, N'Output')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (25, N'ma túy', N'dành cho người dưới 18', N'Crafft', 1, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (26, N'ma túy', N'dành cho người trên 18', N'Assist', 1, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (27, N'ma túy', N'dành cho người dưới 18', N'Crafft', 1, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (28, N'ma túy', N'dành cho người trên 18', N'Assist', 1, N'Output')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (29, N'string', N'string', N'Crafft', 1, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (30, N'string', N'string', N'Crafft', 1, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (31, N'string', N'string', N'Crafft', 1, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (32, N'string', N'string', N'Crafft', 1, N'Output')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (33, N'string', N'string', N'Crafft', 1, N'Output')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (34, N'string', N'string', N'Crafft', 1, N'Output')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (35, N'string', N'string', N'Crafft', 1, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (36, N'string', N'string', N'Crafft', 1, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (37, N'string', N'string', N'Crafft', 1, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (38, N'string', N'string', N'Assist', 1, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (39, N'string', N'string', N'Assist', 1, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (40, N'string', N'string', N'Assist', 1, N'Output')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (41, N'ad', N'aaa', N'Assist', 1, N'Output')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (42, N'string', N'string', N'Assist', 1, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (43, N'string', N'string', N'Assist', 1, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (44, N'string', N'string', N'Assist', 1, N'Output')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (45, N'HEHEHE', N'string', N'Crafft', 1, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (46, N'string', N'string', N'Assist', 1, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (47, N'stringa', N'string', N'Crafft', 0, N'Input')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (48, N'string', N'string', N'Crafft', 0, N'Output')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (49, N'string', N'string', N'Assist', 0, N'Output')
INSERT [dbo].[Assessments] ([AssessmentID], [AssessmentName], [Description], [AssessmentType], [IsDeleted], [AssessmentStage]) VALUES (51, N'đây là input', N'string', N'Assist', 0, N'Input')
SET IDENTITY_INSERT [dbo].[Assessments] OFF
GO
SET IDENTITY_INSERT [dbo].[Certificates] ON 

INSERT [dbo].[Certificates] ([CertificateID], [CertificateName], [DateAcquired]) VALUES (1, N'string', CAST(N'2025-07-10T08:29:05.1630000' AS DateTime2))
INSERT [dbo].[Certificates] ([CertificateID], [CertificateName], [DateAcquired]) VALUES (2, N'Mental Health Training', CAST(N'2019-11-30T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Certificates] OFF
GO
SET IDENTITY_INSERT [dbo].[Consultants] ON 

INSERT [dbo].[Consultants] ([ConsultantID], [UserID], [CertificateID], [Specialty], [Degree], [Experience], [HourlyRate], [CreatedAt], [UpdatedAt], [GoogleMeetLink]) VALUES (1, 14, 1, N'string', N'string', N'string', CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-07-10T08:29:26.1722325' AS DateTime2), CAST(N'2025-07-10T08:29:26.1724298' AS DateTime2), NULL)
INSERT [dbo].[Consultants] ([ConsultantID], [UserID], [CertificateID], [Specialty], [Degree], [Experience], [HourlyRate], [CreatedAt], [UpdatedAt], [GoogleMeetLink]) VALUES (2, 6, 1, N'10', N'King', N'10', CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-24T08:57:30.8418666' AS DateTime2), CAST(N'2025-06-24T08:57:30.8419054' AS DateTime2), N'https://meet.google.com/yco-awfm-miz')
INSERT [dbo].[Consultants] ([ConsultantID], [UserID], [CertificateID], [Specialty], [Degree], [Experience], [HourlyRate], [CreatedAt], [UpdatedAt], [GoogleMeetLink]) VALUES (3, 7, 1, N'Good', N'Top1', N'10 year ', CAST(8888.00 AS Decimal(10, 2)), CAST(N'2025-06-26T16:18:49.7388089' AS DateTime2), CAST(N'2025-06-26T16:18:49.7388922' AS DateTime2), NULL)
INSERT [dbo].[Consultants] ([ConsultantID], [UserID], [CertificateID], [Specialty], [Degree], [Experience], [HourlyRate], [CreatedAt], [UpdatedAt], [GoogleMeetLink]) VALUES (5, 9, 1, N'football', N'Of life', N'20 year', CAST(8989.00 AS Decimal(10, 2)), CAST(N'2025-06-28T08:28:41.2776860' AS DateTime2), CAST(N'2025-06-28T08:30:13.3556849' AS DateTime2), N'https://meet.google.com/rqt-crtr-xsi')
SET IDENTITY_INSERT [dbo].[Consultants] OFF
GO
SET IDENTITY_INSERT [dbo].[ConsultantSchedules] ON 

INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (3, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (4, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (5, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (6, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (7, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (8, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (9, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (10, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (11, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (12, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (13, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (14, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (15, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (16, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (17, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (18, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (19, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (20, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (21, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (22, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (23, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (24, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (25, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (26, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (27, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (28, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (29, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (30, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (31, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (32, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (33, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (34, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (35, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (36, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (37, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (38, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (39, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (40, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (41, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (42, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (43, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (44, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (45, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (46, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (47, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (48, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (49, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (50, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (51, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (52, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (53, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (54, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (55, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (56, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (57, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (58, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (59, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (60, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (61, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (62, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (63, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (64, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (65, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (66, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (67, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (68, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (69, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (70, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (71, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (72, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (73, 1, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (74, 1, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (75, 1, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (76, 1, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (77, 1, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (78, 1, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (79, 1, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (80, 1, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (81, 1, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (82, 1, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (83, 1, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (84, 1, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (85, 1, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (86, 1, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (87, 1, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (88, 1, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (89, 1, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (90, 1, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (91, 1, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (92, 1, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (93, 1, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (94, 1, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (95, 1, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (96, 1, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (97, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (98, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (99, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (100, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (101, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (102, 2, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (103, 2, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (104, 2, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (105, 2, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (106, 2, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (107, 2, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (108, 2, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (109, 2, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (110, 2, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (111, 2, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (112, 2, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (113, 2, N'Tuesday', CAST(N'2025-06-24T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (114, 2, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (115, 2, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (116, 2, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (117, 2, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (118, 2, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (119, 2, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (120, 2, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (121, 2, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (122, 2, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (123, 2, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (124, 2, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (125, 2, N'Wednesday', CAST(N'2025-06-25T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (126, 2, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (127, 2, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (128, 2, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (129, 2, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (130, 2, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (131, 2, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (132, 2, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (133, 2, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (134, 2, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (135, 2, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (136, 2, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (137, 2, N'Thursday', CAST(N'2025-06-26T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (138, 2, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (139, 2, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (140, 2, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (141, 2, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (142, 2, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (143, 2, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (144, 2, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (145, 2, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (146, 2, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (147, 2, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (148, 2, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (149, 2, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (150, 2, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (151, 2, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (152, 2, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (153, 2, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (154, 2, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (155, 2, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (156, 2, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (157, 2, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (158, 2, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (159, 2, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (160, 2, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (161, 2, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (162, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (163, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (164, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (165, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (166, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (167, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (168, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (169, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (170, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (171, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (172, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (173, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (174, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (175, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (176, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (177, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (178, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (179, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (180, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (181, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (182, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (183, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (184, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (185, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (186, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (187, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (188, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (189, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (190, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (191, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (192, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (193, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (194, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (195, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (196, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (197, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (198, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (199, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (200, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (201, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (202, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (203, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (204, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (205, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (206, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (207, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (208, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (209, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (210, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (211, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (212, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (213, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (214, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (215, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (216, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (217, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (218, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (219, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (220, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (221, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (222, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (223, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (224, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (225, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (226, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (227, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (228, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (229, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (230, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (231, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (232, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (233, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (234, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (235, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (236, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (237, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (238, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (239, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (240, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (241, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (242, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (243, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (244, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (245, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (246, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (247, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (248, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (249, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (250, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (251, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (252, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (253, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (254, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (255, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (256, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (257, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (258, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (259, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (260, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (261, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (262, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (263, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (264, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (265, 3, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (266, 3, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (267, 3, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (268, 3, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (269, 3, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (270, 3, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (271, 3, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (272, 3, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (273, 3, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (274, 3, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (275, 3, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (276, 3, N'Friday', CAST(N'2025-06-27T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (277, 3, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (278, 3, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (279, 3, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (280, 3, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (281, 3, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (282, 3, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (283, 3, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (284, 3, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (285, 3, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (286, 3, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (287, 3, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (288, 3, N'Saturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (289, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (290, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (291, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (292, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (293, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (294, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (295, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (296, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (297, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (298, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (299, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (300, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (301, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (302, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (303, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (304, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (305, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (306, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (307, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (308, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (309, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (310, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (311, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (312, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (313, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (314, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (315, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (316, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (317, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (318, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (319, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (320, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (321, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (322, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (323, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (324, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (325, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (326, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (327, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (328, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (329, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (330, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (331, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (332, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (333, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (334, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (335, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (336, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (337, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (338, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (339, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (340, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (341, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (342, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (343, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (344, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (345, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (346, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (347, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (348, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (349, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (350, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (351, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (352, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (353, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (354, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (355, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (356, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (357, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (358, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (359, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (360, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (361, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (362, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (363, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (364, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (365, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (366, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (367, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (368, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (369, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (370, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (371, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (372, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (373, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (374, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (375, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (376, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (377, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (378, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (379, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (380, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (381, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (382, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (383, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (384, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (385, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (386, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (387, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (388, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (389, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (390, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (391, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (392, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (393, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (394, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (395, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (396, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (397, 5, N'Staturday', CAST(N'2025-06-28T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (398, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (399, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (400, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (401, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (402, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (403, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (404, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (405, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (406, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (407, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (408, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (409, 1, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (410, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (411, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (412, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (413, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (414, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (415, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (416, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (417, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (418, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (419, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (420, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (421, 1, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (422, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (423, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (424, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (425, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (426, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (427, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (428, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (429, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (430, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (431, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (432, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (433, 1, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (434, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (435, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (436, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (437, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (438, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (439, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (440, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (441, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (442, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (443, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (444, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (445, 1, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (446, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (447, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (448, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (449, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (450, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (451, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (452, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (453, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (454, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (455, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (456, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (457, 1, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (458, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (459, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (460, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (461, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (462, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (463, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (464, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (465, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (466, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (467, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (468, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (469, 1, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (470, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (471, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (472, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (473, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (474, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (475, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (476, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (477, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (478, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (479, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (480, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (481, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (482, 1, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (483, 1, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (484, 1, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (485, 1, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (486, 1, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (487, 1, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (488, 1, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (489, 1, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (490, 1, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (491, 1, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (492, 1, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (493, 1, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (494, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (495, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (496, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (497, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (498, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (499, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (500, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (501, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (502, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (503, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (504, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (505, 2, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (506, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (507, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (508, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (509, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (510, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (511, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (512, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (513, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (514, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (515, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (516, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (517, 2, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (518, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (519, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (520, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (521, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (522, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (523, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (524, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (525, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (526, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (527, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (528, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (529, 2, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (530, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (531, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (532, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (533, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (534, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (535, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (536, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (537, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (538, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (539, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (540, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (541, 2, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (542, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (543, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (544, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (545, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (546, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (547, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (548, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (549, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (550, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (551, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (552, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (553, 2, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (554, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (555, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (556, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (557, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (558, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (559, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (560, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (561, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (562, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (563, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (564, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (565, 2, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (566, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (567, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (568, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (569, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (570, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (571, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (572, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (573, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (574, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (575, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (576, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (577, 2, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (578, 2, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (579, 2, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (580, 2, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (581, 2, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (582, 2, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (583, 2, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (584, 2, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (585, 2, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (586, 2, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (587, 2, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (588, 2, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (589, 2, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (590, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (591, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (592, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (593, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (594, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (595, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (596, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (597, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (598, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (599, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (600, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (601, 3, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (602, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (603, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (604, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (605, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (606, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (607, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (608, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (609, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (610, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (611, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (612, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (613, 3, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (614, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (615, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (616, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (617, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (618, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (619, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (620, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (621, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (622, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (623, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (624, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (625, 3, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (626, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (627, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (628, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (629, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (630, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (631, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (632, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (633, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (634, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (635, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (636, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (637, 3, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (638, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (639, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (640, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (641, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (642, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (643, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (644, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (645, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (646, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (647, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (648, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (649, 3, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (650, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (651, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (652, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (653, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (654, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (655, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (656, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (657, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (658, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (659, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (660, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (661, 3, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (662, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (663, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (664, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (665, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (666, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (667, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (668, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (669, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (670, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (671, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (672, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (673, 3, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (674, 3, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (675, 3, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (676, 3, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (677, 3, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (678, 3, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (679, 3, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (680, 3, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (681, 3, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (682, 3, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (683, 3, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (684, 3, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (685, 3, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (686, 5, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (687, 5, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (688, 5, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (689, 5, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (690, 5, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (691, 5, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (692, 5, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (693, 5, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (694, 5, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (695, 5, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (696, 5, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (697, 5, N'Sunday', CAST(N'2025-06-29T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (698, 5, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (699, 5, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (700, 5, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (701, 5, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (702, 5, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (703, 5, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (704, 5, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (705, 5, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (706, 5, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (707, 5, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (708, 5, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (709, 5, N'Monday', CAST(N'2025-06-30T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (710, 5, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (711, 5, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (712, 5, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (713, 5, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (714, 5, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (715, 5, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (716, 5, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (717, 5, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (718, 5, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (719, 5, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (720, 5, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (721, 5, N'Tuesday', CAST(N'2025-07-01T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (722, 5, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (723, 5, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (724, 5, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (725, 5, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (726, 5, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (727, 5, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (728, 5, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (729, 5, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (730, 5, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (731, 5, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (732, 5, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (733, 5, N'Wednesday', CAST(N'2025-07-02T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (734, 5, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (735, 5, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (736, 5, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (737, 5, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (738, 5, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (739, 5, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (740, 5, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (741, 5, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (742, 5, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (743, 5, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (744, 5, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (745, 5, N'Thursday', CAST(N'2025-07-03T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (746, 5, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (747, 5, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (748, 5, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (749, 5, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (750, 5, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (751, 5, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (752, 5, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (753, 5, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (754, 5, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (755, 5, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (756, 5, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (757, 5, N'Friday', CAST(N'2025-07-04T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (758, 5, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (759, 5, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (760, 5, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (761, 5, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (762, 5, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (763, 5, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (764, 5, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (765, 5, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (766, 5, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (767, 5, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (768, 5, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (769, 5, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (770, 5, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (771, 5, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (772, 5, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (773, 5, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (774, 5, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (775, 5, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (776, 5, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (777, 5, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (778, 5, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (779, 5, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (780, 5, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (781, 5, N'Sunday', CAST(N'2025-07-06T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (782, 1, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (783, 1, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (784, 1, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (785, 1, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (786, 1, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (787, 1, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (788, 1, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (789, 1, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (790, 1, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (791, 1, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (792, 1, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (793, 1, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (794, 2, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (795, 2, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (796, 2, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (797, 2, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (798, 2, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (799, 2, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (800, 2, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (801, 2, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (802, 2, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (803, 2, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (804, 2, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (805, 2, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (806, 3, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (807, 3, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (808, 3, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (809, 3, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (810, 3, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (811, 3, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (812, 3, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (813, 3, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (814, 3, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (815, 3, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (816, 3, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (817, 3, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (818, 5, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (819, 5, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (820, 5, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (821, 5, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (822, 5, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (823, 5, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (824, 5, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (825, 5, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (826, 5, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (827, 5, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (828, 5, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (829, 5, N'Monday', CAST(N'2025-07-07T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (830, 1, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (831, 1, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (832, 1, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (833, 1, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (834, 1, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (835, 1, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (836, 1, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (837, 1, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (838, 1, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (839, 1, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (840, 1, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (841, 1, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (842, 2, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (843, 2, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (844, 2, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (845, 2, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (846, 2, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (847, 2, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (848, 2, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (849, 2, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (850, 2, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (851, 2, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (852, 2, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (853, 2, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (854, 3, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (855, 3, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (856, 3, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (857, 3, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (858, 3, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (859, 3, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (860, 3, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (861, 3, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (862, 3, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (863, 3, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (864, 3, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (865, 3, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (866, 5, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (867, 5, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (868, 5, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (869, 5, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (870, 5, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (871, 5, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (872, 5, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (873, 5, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (874, 5, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (875, 5, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (876, 5, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (877, 5, N'Tuesday', CAST(N'2025-07-08T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (878, 1, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (879, 1, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (880, 1, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (881, 1, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (882, 1, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (883, 1, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (884, 1, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (885, 1, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (886, 1, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (887, 1, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (888, 1, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (889, 1, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (890, 1, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (891, 1, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (892, 1, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (893, 1, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (894, 1, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (895, 1, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (896, 1, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (897, 1, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (898, 1, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (899, 1, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (900, 1, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (901, 1, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (902, 2, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (903, 2, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (904, 2, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (905, 2, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (906, 2, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (907, 2, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (908, 2, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (909, 2, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (910, 2, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (911, 2, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (912, 2, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (913, 2, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (914, 2, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (915, 2, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (916, 2, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (917, 2, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (918, 2, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (919, 2, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (920, 2, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (921, 2, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (922, 2, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (923, 2, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (924, 2, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (925, 2, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (926, 3, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (927, 3, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (928, 3, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (929, 3, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (930, 3, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (931, 3, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (932, 3, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (933, 3, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (934, 3, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (935, 3, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (936, 3, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (937, 3, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (938, 3, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (939, 3, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (940, 3, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (941, 3, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (942, 3, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (943, 3, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (944, 3, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (945, 3, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (946, 3, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (947, 3, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (948, 3, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (949, 3, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (950, 5, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (951, 5, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (952, 5, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (953, 5, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (954, 5, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (955, 5, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (956, 5, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (957, 5, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (958, 5, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (959, 5, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (960, 5, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (961, 5, N'Wednesday', CAST(N'2025-07-09T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (962, 5, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (963, 5, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (964, 5, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (965, 5, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (966, 5, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (967, 5, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (968, 5, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (969, 5, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (970, 5, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (971, 5, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (972, 5, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (973, 5, N'Thursday', CAST(N'2025-07-10T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (974, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (975, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (976, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (977, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (978, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (979, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (980, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (981, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (982, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (983, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (984, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (985, 1, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (986, 2, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (987, 2, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (988, 2, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (989, 2, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (990, 2, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (991, 2, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (992, 2, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (993, 2, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (994, 2, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (995, 2, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (996, 2, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (997, 2, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (998, 3, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (999, 3, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1000, 3, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1001, 3, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1002, 3, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1003, 3, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1004, 3, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1005, 3, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1006, 3, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1007, 3, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1008, 3, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1009, 3, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1010, 5, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1011, 5, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1012, 5, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1013, 5, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1014, 5, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1015, 5, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1016, 5, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1017, 5, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1018, 5, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1019, 5, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1020, 5, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1021, 5, N'Friday', CAST(N'2025-07-11T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1830, 1, N'Saturday', CAST(N'2025-07-05T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1831, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1832, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1833, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1834, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1835, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1836, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1837, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1838, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1839, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1840, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1841, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1842, 1, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1843, 2, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1844, 2, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1845, 2, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1846, 2, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1847, 2, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1848, 2, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1849, 2, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1850, 2, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1851, 2, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1852, 2, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1853, 2, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1854, 2, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1855, 3, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1856, 3, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1857, 3, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1858, 3, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1859, 3, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1860, 3, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1861, 3, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1862, 3, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1863, 3, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1864, 3, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1865, 3, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1866, 3, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1867, 5, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1868, 5, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1869, 5, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1870, 5, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1871, 5, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1872, 5, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1873, 5, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1874, 5, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1875, 5, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1876, 5, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1877, 5, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1878, 5, N'Saturday', CAST(N'2025-07-12T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1879, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1880, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1881, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1882, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1883, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1884, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1885, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1886, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1887, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1888, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1889, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1890, 1, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1891, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1892, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1893, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1894, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1895, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1896, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1897, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1898, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1899, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1900, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1901, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1902, 1, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1903, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1904, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1905, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1906, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1907, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1908, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1909, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1910, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1911, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1912, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1913, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1914, 1, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1915, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1916, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1917, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1918, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1919, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1920, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1921, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1922, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1923, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1924, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1925, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1926, 1, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1927, 2, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 0, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1928, 2, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1929, 2, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1930, 2, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1931, 2, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1932, 2, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1933, 2, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1934, 2, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1935, 2, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1936, 2, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1937, 2, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1938, 2, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1939, 2, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1940, 2, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1941, 2, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1942, 2, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1943, 2, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1944, 2, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1945, 2, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1946, 2, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1947, 2, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1948, 2, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1949, 2, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1950, 2, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1951, 2, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1952, 2, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1953, 2, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1954, 2, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1955, 2, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1956, 2, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1957, 2, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1958, 2, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1959, 2, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1960, 2, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1961, 2, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1962, 2, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1963, 2, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1964, 2, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1965, 2, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1966, 2, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1967, 2, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1968, 2, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1969, 2, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1970, 2, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1971, 2, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1972, 2, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1973, 2, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1974, 2, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1975, 3, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1976, 3, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1977, 3, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1978, 3, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1979, 3, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1980, 3, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1981, 3, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1982, 3, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1983, 3, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1984, 3, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1985, 3, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1986, 3, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1987, 3, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1988, 3, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1989, 3, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1990, 3, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1991, 3, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1992, 3, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1993, 3, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1994, 3, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1995, 3, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1996, 3, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1997, 3, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1998, 3, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (1999, 3, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2000, 3, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2001, 3, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2002, 3, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2003, 3, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2004, 3, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2005, 3, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2006, 3, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2007, 3, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2008, 3, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2009, 3, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2010, 3, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2011, 3, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2012, 3, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2013, 3, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2014, 3, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2015, 3, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2016, 3, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2017, 3, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2018, 3, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2019, 3, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2020, 3, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2021, 3, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2022, 3, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2023, 5, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2024, 5, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2025, 5, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2026, 5, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2027, 5, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2028, 5, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2029, 5, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2030, 5, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2031, 5, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2032, 5, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2033, 5, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2034, 5, N'Sunday', CAST(N'2025-07-13T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2035, 5, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2036, 5, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2037, 5, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2038, 5, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2039, 5, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2040, 5, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2041, 5, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2042, 5, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2043, 5, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2044, 5, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2045, 5, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2046, 5, N'Monday', CAST(N'2025-07-14T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2047, 5, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2048, 5, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2049, 5, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2050, 5, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2051, 5, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2052, 5, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2053, 5, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2054, 5, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2055, 5, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2056, 5, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2057, 5, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2058, 5, N'Tuesday', CAST(N'2025-07-15T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2059, 5, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2060, 5, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2061, 5, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2062, 5, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2063, 5, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2064, 5, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2065, 5, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2066, 5, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2067, 5, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2068, 5, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2069, 5, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2070, 5, N'Wednesday', CAST(N'2025-07-16T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2830, 1, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2831, 1, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2832, 1, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2833, 1, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2834, 1, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2835, 1, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2836, 1, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2837, 1, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2838, 1, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2839, 1, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2840, 1, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2841, 1, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2842, 2, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2843, 2, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2844, 2, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2845, 2, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2846, 2, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2847, 2, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2848, 2, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2849, 2, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2850, 2, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2851, 2, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2852, 2, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2853, 2, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2854, 3, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2855, 3, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2856, 3, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2857, 3, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2858, 3, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2859, 3, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2860, 3, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2861, 3, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2862, 3, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2863, 3, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2864, 3, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2865, 3, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2866, 5, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2867, 5, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2868, 5, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2869, 5, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2870, 5, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2871, 5, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2872, 5, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2873, 5, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2874, 5, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2875, 5, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2876, 5, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2877, 5, N'Thursday', CAST(N'2025-07-17T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2878, 1, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2879, 1, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2880, 1, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2881, 1, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2882, 1, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2883, 1, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2884, 1, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2885, 1, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2886, 1, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2887, 1, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2888, 1, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2889, 1, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2890, 2, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2891, 2, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2892, 2, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2893, 2, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2894, 2, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2895, 2, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2896, 2, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2897, 2, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2898, 2, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2899, 2, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2900, 2, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2901, 2, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2902, 3, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2903, 3, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2904, 3, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2905, 3, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2906, 3, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2907, 3, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2908, 3, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2909, 3, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2910, 3, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2911, 3, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2912, 3, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2913, 3, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2914, 5, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2915, 5, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2916, 5, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2917, 5, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2918, 5, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2919, 5, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2920, 5, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2921, 5, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2922, 5, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2923, 5, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2924, 5, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2925, 5, N'Friday', CAST(N'2025-07-18T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2928, 1, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2929, 1, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2930, 1, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2931, 1, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2932, 1, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2933, 1, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2934, 1, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2935, 1, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2936, 1, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2937, 1, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2938, 1, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2939, 1, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2940, 1, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2941, 1, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2942, 1, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2943, 1, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2944, 1, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2945, 1, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2946, 1, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2947, 1, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2948, 1, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2949, 1, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2950, 1, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2951, 1, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2952, 2, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2953, 2, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2954, 2, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2955, 2, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2956, 2, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2957, 2, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2958, 2, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2959, 2, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2960, 2, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2961, 2, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2962, 2, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2963, 2, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2964, 2, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2965, 2, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2966, 2, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2967, 2, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2968, 2, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
GO
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2969, 2, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2970, 2, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2971, 2, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2972, 2, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2973, 2, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2974, 2, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2975, 2, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2976, 3, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2977, 3, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2978, 3, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2979, 3, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2980, 3, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2981, 3, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2982, 3, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2983, 3, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2984, 3, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2985, 3, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2986, 3, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2987, 3, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2988, 3, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2989, 3, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2990, 3, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2991, 3, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2992, 3, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2993, 3, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2994, 3, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2995, 3, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2996, 3, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2997, 3, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2998, 3, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (2999, 3, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (3000, 5, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (3001, 5, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (3002, 5, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (3003, 5, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (3004, 5, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (3005, 5, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (3006, 5, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (3007, 5, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (3008, 5, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (3009, 5, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (3010, 5, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (3011, 5, N'Saturday', CAST(N'2025-07-19T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (3012, 5, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'07:00:00' AS Time), CAST(N'08:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (3013, 5, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'08:00:00' AS Time), CAST(N'09:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (3014, 5, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'09:00:00' AS Time), CAST(N'10:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (3015, 5, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'10:00:00' AS Time), CAST(N'11:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (3016, 5, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'11:00:00' AS Time), CAST(N'12:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (3017, 5, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (3018, 5, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'13:00:00' AS Time), CAST(N'14:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (3019, 5, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'14:00:00' AS Time), CAST(N'15:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (3020, 5, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'15:00:00' AS Time), CAST(N'16:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (3021, 5, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'16:00:00' AS Time), CAST(N'17:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (3022, 5, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'17:00:00' AS Time), CAST(N'18:00:00' AS Time), 1, NULL)
INSERT [dbo].[ConsultantSchedules] ([ScheduleID], [ConsultantID], [DayOfWeek], [Date], [StartTime], [EndTime], [IsAvailable], [Notes]) VALUES (3023, 5, N'Sunday', CAST(N'2025-07-20T00:00:00.0000000' AS DateTime2), CAST(N'18:00:00' AS Time), CAST(N'19:00:00' AS Time), 1, NULL)
SET IDENTITY_INSERT [dbo].[ConsultantSchedules] OFF
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
INSERT [dbo].[CourseAssessments] ([CourseID], [AssessmentID]) VALUES (1023, 48)
INSERT [dbo].[CourseAssessments] ([CourseID], [AssessmentID]) VALUES (1023, 49)
GO
SET IDENTITY_INSERT [dbo].[CourseRegistrations] ON 

INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegistrationDate], [Amount], [PaymentStatus], [Status], [TransactionID], [CourseRegistrationID]) VALUES (3, 1013, CAST(N'2025-06-24T19:08:39.0413467' AS DateTime2), NULL, N'', N'', N'', 1)
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegistrationDate], [Amount], [PaymentStatus], [Status], [TransactionID], [CourseRegistrationID]) VALUES (3, 1022, CAST(N'2025-07-07T15:28:43.2422744' AS DateTime2), NULL, N'', N'', N'', 2)
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegistrationDate], [Amount], [PaymentStatus], [Status], [TransactionID], [CourseRegistrationID]) VALUES (12, 1022, CAST(N'2025-07-13T12:14:48.8665831' AS DateTime2), CAST(0.00 AS Decimal(18, 2)), N'PENDING', N'PENDING_PAYMENT', N'1b257883-1ad2-41b2-87f1-03b81a09ac5f-1022', 3)
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegistrationDate], [Amount], [PaymentStatus], [Status], [TransactionID], [CourseRegistrationID]) VALUES (15, 1022, CAST(N'2025-07-13T16:29:45.0265152' AS DateTime2), CAST(99999.00 AS Decimal(18, 2)), N'PENDING', N'PENDING_PAYMENT', N'a6db1b46-db06-48f8-9a4c-4530f18258a2-COURSE-1022', 4)
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegistrationDate], [Amount], [PaymentStatus], [Status], [TransactionID], [CourseRegistrationID]) VALUES (3, 1023, CAST(N'2025-07-09T16:19:22.7276520' AS DateTime2), NULL, N'', N'', N'', 5)
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegistrationDate], [Amount], [PaymentStatus], [Status], [TransactionID], [CourseRegistrationID]) VALUES (13, 1023, CAST(N'2025-07-09T16:23:41.0892918' AS DateTime2), NULL, N'', N'', N'', 6)
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegistrationDate], [Amount], [PaymentStatus], [Status], [TransactionID], [CourseRegistrationID]) VALUES (3, 1024, CAST(N'2025-07-10T00:09:45.6340300' AS DateTime2), NULL, N'', N'', N'', 7)
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegistrationDate], [Amount], [PaymentStatus], [Status], [TransactionID], [CourseRegistrationID]) VALUES (13, 1024, CAST(N'2025-07-09T23:57:48.5986442' AS DateTime2), NULL, N'', N'', N'', 8)
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegistrationDate], [Amount], [PaymentStatus], [Status], [TransactionID], [CourseRegistrationID]) VALUES (3, 1025, CAST(N'2025-07-10T00:10:59.1032303' AS DateTime2), NULL, N'', N'', N'', 9)
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegistrationDate], [Amount], [PaymentStatus], [Status], [TransactionID], [CourseRegistrationID]) VALUES (3, 1026, CAST(N'2025-07-13T16:15:03.3536809' AS DateTime2), CAST(10000.00 AS Decimal(18, 2)), N'PENDING', N'PENDING_PAYMENT', N'438807db-641f-4ae7-8772-d00cc5c34fcd-COURSE-1026', 10)
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegistrationDate], [Amount], [PaymentStatus], [Status], [TransactionID], [CourseRegistrationID]) VALUES (3, 1027, CAST(N'2025-07-13T01:47:20.4531646' AS DateTime2), NULL, N'', N'', N'', 11)
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegistrationDate], [Amount], [PaymentStatus], [Status], [TransactionID], [CourseRegistrationID]) VALUES (3, 1028, CAST(N'2025-07-13T01:36:16.7674539' AS DateTime2), NULL, N'', N'', N'', 12)
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegistrationDate], [Amount], [PaymentStatus], [Status], [TransactionID], [CourseRegistrationID]) VALUES (3, 1029, CAST(N'2025-07-13T16:09:22.7935218' AS DateTime2), CAST(99999.00 AS Decimal(18, 2)), N'PENDING', N'PENDING_PAYMENT', N'8553eb46-de20-4a5c-ad58-5d0f917b2649-COURSE-1029', 13)
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegistrationDate], [Amount], [PaymentStatus], [Status], [TransactionID], [CourseRegistrationID]) VALUES (12, 1029, CAST(N'2025-07-13T14:41:49.9157656' AS DateTime2), CAST(567.00 AS Decimal(18, 2)), N'PENDING', N'PENDING_PAYMENT', N'6c368787-3e81-42cd-a4b2-75564bf5cca7-1029', 14)
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegistrationDate], [Amount], [PaymentStatus], [Status], [TransactionID], [CourseRegistrationID]) VALUES (3, 1030, CAST(N'2025-07-13T15:54:34.1467810' AS DateTime2), CAST(1000000.00 AS Decimal(18, 2)), N'PENDING', N'PENDING_PAYMENT', N'0f2d2f60-ffaa-4243-9e95-666129ae2156-1030', 15)
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegistrationDate], [Amount], [PaymentStatus], [Status], [TransactionID], [CourseRegistrationID]) VALUES (15, 1031, CAST(N'2025-07-13T16:48:36.7677881' AS DateTime2), CAST(99999.00 AS Decimal(18, 2)), N'PENDING', N'PENDING_PAYMENT', N'491653a9-b5fe-4462-b072-74da0666f004-COURSE-1031', 16)
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegistrationDate], [Amount], [PaymentStatus], [Status], [TransactionID], [CourseRegistrationID]) VALUES (3, 1031, CAST(N'2025-07-13T15:31:45.8954183' AS DateTime2), CAST(99999.00 AS Decimal(18, 2)), N'PENDING', N'PENDING_PAYMENT', N'0dd867ac-7d6c-46b4-abbd-bcf8223eaa40-1031', 17)
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegistrationDate], [Amount], [PaymentStatus], [Status], [TransactionID], [CourseRegistrationID]) VALUES (12, 1031, CAST(N'2025-07-13T12:18:50.5063886' AS DateTime2), CAST(99999.00 AS Decimal(18, 2)), N'PENDING', N'PENDING_PAYMENT', N'ff9282f5-16a9-4b3c-9aa8-9b47e5fb746e-1031', 18)
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegistrationDate], [Amount], [PaymentStatus], [Status], [TransactionID], [CourseRegistrationID]) VALUES (15, 1030, CAST(N'2025-07-13T17:22:20.9748613' AS DateTime2), CAST(1000000.00 AS Decimal(18, 2)), N'PENDING', N'PENDING_PAYMENT', N'5d916385-5b9a-4f84-b13a-320cf2e59417-COURSE-1030', 19)
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegistrationDate], [Amount], [PaymentStatus], [Status], [TransactionID], [CourseRegistrationID]) VALUES (15, 1026, CAST(N'2025-07-13T17:42:35.6189430' AS DateTime2), CAST(10000.00 AS Decimal(18, 2)), N'PENDING', N'PENDING_PAYMENT', N'COURSE-23-ea0ebb5f-31bc-438b-a756-7964d785319b', 23)
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegistrationDate], [Amount], [PaymentStatus], [Status], [TransactionID], [CourseRegistrationID]) VALUES (15, 1027, CAST(N'2025-07-13T17:47:29.4470866' AS DateTime2), CAST(1.00 AS Decimal(18, 2)), N'PENDING', N'PENDING_PAYMENT', N'COURSE-24-677b8ffc-b798-4dba-a8d5-7f34ea775542', 24)
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegistrationDate], [Amount], [PaymentStatus], [Status], [TransactionID], [CourseRegistrationID]) VALUES (16, 1031, CAST(N'2025-07-13T17:50:10.1281116' AS DateTime2), CAST(99999.00 AS Decimal(18, 2)), N'PENDING', N'PENDING_PAYMENT', N'COURSE-25-0068f1e3-856a-4c92-ad22-ce479e385804', 25)
INSERT [dbo].[CourseRegistrations] ([UserID], [CourseID], [RegistrationDate], [Amount], [PaymentStatus], [Status], [TransactionID], [CourseRegistrationID]) VALUES (16, 1022, CAST(N'2025-07-13T17:52:34.6714857' AS DateTime2), CAST(99999.00 AS Decimal(18, 2)), N'SUCCESS', N'CONFIRMED', N'COURSE-26-4a1c4080-df2c-4c6c-aeca-5c87ce4ff573', 26)
SET IDENTITY_INSERT [dbo].[CourseRegistrations] OFF
GO
SET IDENTITY_INSERT [dbo].[Courses] ON 

INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1013, N'string', N'string', N'HocSinh   ', N'Open', 0, 0, 0, CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-06-16T07:10:49.0804773' AS DateTime2), CAST(N'2025-06-30T16:21:01.4169694' AS DateTime2), 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1016, N'string', N'string', N'HocSinh   ', N'Open', 0, 0, 0, CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-06-30T16:39:16.6190055' AS DateTime2), CAST(N'2025-06-30T16:39:16.6190321' AS DateTime2), 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1017, N'string', N'string', N'PhuHuynh  ', N'Open', 26, 200, 0, CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-07-01T05:35:01.8853771' AS DateTime2), CAST(N'2025-07-01T05:35:01.8854025' AS DateTime2), 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1018, N'string', N'string', N'SinhVien  ', N'Open', 0, 0, 0, CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-07-01T05:46:24.4398576' AS DateTime2), CAST(N'2025-07-01T05:46:24.4399464' AS DateTime2), 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1019, N'string', N'string', N'HocSinh   ', N'Open', 0, 0, 0, CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-07-05T06:57:37.4225166' AS DateTime2), CAST(N'2025-07-05T06:57:37.4225307' AS DateTime2), 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1020, N'string', N'string', N'HocSinh   ', N'Open', 0, 0, 0, CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-07-05T06:58:15.7283882' AS DateTime2), CAST(N'2025-07-05T06:58:15.7283883' AS DateTime2), 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1021, N'string', N'string', N'HocSinh   ', N'Open', 0, 0, 0, CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-07-05T07:15:21.5847333' AS DateTime2), CAST(N'2025-07-05T07:15:21.5847334' AS DateTime2), 1)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1022, N'aaaaaaaaaaaaaaaa', N'string', N'HocSinh', N'Pending', 12, 18, 10000000, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-07T07:56:49.6144235' AS DateTime2), CAST(N'2025-07-13T12:16:45.8672416' AS DateTime2), 0)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1023, N'string', N'string', N'HocSinh   ', N'Open', 12, 18, 0, CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-07-08T04:32:20.6031448' AS DateTime2), CAST(N'2025-07-08T04:32:20.6031901' AS DateTime2), 0)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1024, N'aaaa', N'string', N'HocSinh   ', N'Open', 12, 18, 0, CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-07-09T13:38:47.8285333' AS DateTime2), CAST(N'2025-07-09T13:38:47.8285824' AS DateTime2), 0)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1025, N'aaaab', N'string', N'HocSinh   ', N'Open', 12, 18, 0, CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-07-09T16:56:27.5490963' AS DateTime2), CAST(N'2025-07-09T16:56:27.5490963' AS DateTime2), 0)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1026, N'aaaaaa', N'aaaaaa', N'SinhVien', N'Open', 12, 18, 10, CAST(10000.00 AS Decimal(10, 2)), CAST(N'2025-07-11T05:39:17.0751182' AS DateTime2), CAST(N'2025-07-11T05:39:17.0751677' AS DateTime2), 0)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1027, N'stringgg', N'string', N'HocSinh', N'Open', 12, 18, 11111, CAST(1.00 AS Decimal(10, 2)), CAST(N'2025-07-11T06:43:50.2065809' AS DateTime2), CAST(N'2025-07-11T06:43:50.2066375' AS DateTime2), 0)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1028, N'striâng', N'string', N'HocSinh', N'Open', 12, 18, 0, CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-07-12T09:25:07.8081002' AS DateTime2), CAST(N'2025-07-12T09:25:07.8081460' AS DateTime2), 0)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1029, N'ảowhun', N'string', N'HocSinh', N'Pending', 12, 18, 179635, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-13T08:11:00.0661154' AS DateTime2), CAST(N'2025-07-13T15:17:03.0063026' AS DateTime2), 0)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1030, N'striaaang', N'string', N'HocSinh', N'Pending', 12, 18, 0, CAST(1000000.00 AS Decimal(10, 2)), CAST(N'2025-07-13T12:08:35.4812719' AS DateTime2), CAST(N'2025-07-13T12:08:35.4812795' AS DateTime2), 0)
INSERT [dbo].[Courses] ([CourseID], [CourseName], [Description], [Type], [Status], [AgeMin], [AgeMax], [Capacity], [Price], [CreatedAt], [UpdatedAt], [IsDeleted]) VALUES (1031, N'ấccsa', N'string', N'HocSinh', N'Pending', 12, 18, 10001, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-13T12:18:26.3873901' AS DateTime2), CAST(N'2025-07-13T12:18:26.3874241' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Courses] OFF
GO
SET IDENTITY_INSERT [dbo].[CourseVideos] ON 

INSERT [dbo].[CourseVideos] ([VideoID], [CourseID], [Title], [VideoUrl], [Description], [IsDeleted]) VALUES (1, 1022, N'string', N'string', N'string', 0)
INSERT [dbo].[CourseVideos] ([VideoID], [CourseID], [Title], [VideoUrl], [Description], [IsDeleted]) VALUES (2, 1022, N'string', N'string', N'string', 1)
SET IDENTITY_INSERT [dbo].[CourseVideos] OFF
GO
SET IDENTITY_INSERT [dbo].[Payments] ON 

INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (1, 5, NULL, 3, CAST(9999.00 AS Decimal(10, 2)), CAST(N'2025-06-24T09:22:11.1919174' AS DateTime2), N'VNPAY', N'PENDING', N'500fbc94-084f-4c46-9484-efc1fb71b105-3', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (2, 5, NULL, 4, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-24T09:40:44.6587791' AS DateTime2), N'VNPAY', N'PENDING', N'5f9df9bd-6e33-431f-ba28-5d3c39faa21a-4', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (3, 5, NULL, 5, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-24T09:46:46.4194767' AS DateTime2), N'VNPAY', N'SUCCESS', N'01609f7c-293c-4f3f-84aa-523d582c0ff7-5', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (4, 5, NULL, 6, CAST(199998.00 AS Decimal(10, 2)), CAST(N'2025-06-26T15:09:59.4827192' AS DateTime2), N'VNPAY', N'SUCCESS', N'42efd495-d2ff-4017-b1a0-985611e3a436-6', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (5, 5, NULL, 7, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-27T04:53:31.4091642' AS DateTime2), N'VNPAY', N'PENDING', N'8ed48bef-f305-4f23-a2a9-5239875d8de9-7', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (6, 5, NULL, 8, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-27T06:03:18.1001058' AS DateTime2), N'VNPAY', N'PENDING', N'd1862665-da2c-4c9e-ae38-2a1b12da7138-8', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (7, 5, NULL, 9, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-27T06:10:50.4483111' AS DateTime2), N'VNPAY', N'PENDING', N'74d57939-3c5e-45d0-9717-c461fda9447d-9', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (8, 5, NULL, 10, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-27T06:34:16.0122583' AS DateTime2), N'VNPAY', N'PENDING', N'90de7cfd-a6c7-4313-ab9c-e53ca07b0ec5-10', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (9, 5, NULL, 11, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-27T07:23:28.1645398' AS DateTime2), N'VNPAY', N'PENDING', N'97b60f80-5645-4e95-ae68-342975e281c8-11', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (10, 5, NULL, 12, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-27T07:56:26.9098816' AS DateTime2), N'VNPAY', N'PENDING', N'd956b8ac-0a52-4edb-bd5b-e6dca2d80e04-12', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (11, 5, NULL, 13, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-27T08:00:56.5337670' AS DateTime2), N'VNPAY', N'PENDING', N'd269d032-c6af-46e8-8f00-1622f53d192e-13', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (12, 5, NULL, 14, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-27T08:04:52.1363298' AS DateTime2), N'VNPAY', N'SUCCESS', N'1f71e9bf-36ef-4f08-a2a2-3411f5c71577-14', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (13, 5, NULL, 15, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-27T08:26:59.4357322' AS DateTime2), N'VNPAY', N'PENDING', N'13aec7b3-9d12-48df-8b13-1bf38a267f88-15', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (14, 5, NULL, 16, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-27T08:35:09.2329388' AS DateTime2), N'VNPAY', N'PENDING', N'09bd709f-8693-4ace-b703-aeaa2a9c5e60-16', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (15, 5, NULL, 17, CAST(8888.00 AS Decimal(10, 2)), CAST(N'2025-06-27T17:28:48.3574882' AS DateTime2), N'VNPAY', N'PENDING', N'365fa9d0-6519-4e6a-b05a-d401c0083a83-17', 1)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (16, 5, NULL, 18, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T16:55:03.8500997' AS DateTime2), N'VNPAY', N'PENDING', N'705ff51a-1911-40ae-bae6-e09f5e72f542-18', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (17, 5, NULL, 19, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T16:57:07.1627568' AS DateTime2), N'VNPAY', N'SUCCESS', N'05dffb0a-8f72-484e-8655-ef241863b4fb-19', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (18, 5, NULL, 20, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T17:35:50.2104727' AS DateTime2), N'VNPAY', N'PENDING', N'8280a6fb-bd70-4858-b440-ef654f1efe55-20', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (19, 5, NULL, 21, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T17:36:13.5475235' AS DateTime2), N'VNPAY', N'SUCCESS', N'0ef8f05a-026c-40c4-966e-a557357ac89a-21', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (20, 5, NULL, 22, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T17:42:54.4949710' AS DateTime2), N'VNPAY', N'PENDING', N'7ef588df-7493-4daf-9a1e-864cebdc3def-22', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (21, 5, NULL, 23, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T17:43:22.5091722' AS DateTime2), N'VNPAY', N'PENDING', N'66054c6a-5ed2-4809-bb86-89e8de124144-23', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (22, 5, NULL, 24, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T17:43:30.0828806' AS DateTime2), N'VNPAY', N'PENDING', N'65259e30-4b46-427e-a6be-fec681dc355d-24', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (23, 5, NULL, 25, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T17:45:59.2896056' AS DateTime2), N'VNPAY', N'PENDING', N'4e61827a-fa5b-48ed-bd4f-e462527d01cc-25', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (24, 5, NULL, 26, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T17:52:23.6299940' AS DateTime2), N'VNPAY', N'PENDING', N'46224f72-063c-40ed-8074-1e79c975ccf2-26', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (25, 5, NULL, 27, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T17:52:51.0151323' AS DateTime2), N'VNPAY', N'PENDING', N'93e840f6-a154-4028-9c85-f07b7afacdd3-27', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (26, 5, NULL, 28, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T17:53:08.8155564' AS DateTime2), N'VNPAY', N'SUCCESS', N'2645c95d-d904-429a-9926-91fc61a2fe90-28', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (27, 5, NULL, 29, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T18:18:31.0685874' AS DateTime2), N'VNPAY', N'PENDING', N'b15f69af-a92e-4d9b-89dc-f268c4ad5780-29', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (28, 5, NULL, 30, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T18:25:58.8192377' AS DateTime2), N'VNPAY', N'SUCCESS', N'982b775c-e877-4e1d-9cfb-32a6400b1f6f-30', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (29, 5, NULL, 31, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T18:30:20.3129800' AS DateTime2), N'VNPAY', N'SUCCESS', N'92d80f45-a5d9-4008-a763-fcde16754d2a-31', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (30, 5, NULL, 32, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T18:41:04.4905647' AS DateTime2), N'VNPAY', N'SUCCESS', N'13d7fa5a-d7cf-4b42-9597-de8e613ffe3f-32', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (31, 5, NULL, 33, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T18:42:44.4148023' AS DateTime2), N'VNPAY', N'PENDING', N'3c856d38-9038-4653-af8a-15f2b1df0967-33', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (32, 5, NULL, 34, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T18:49:42.4222559' AS DateTime2), N'VNPAY', N'PENDING', N'1b4ca853-c8cb-43aa-b48c-54bca2acd612-34', 2)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (33, 5, NULL, 35, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-28T18:53:28.4557130' AS DateTime2), N'VNPAY', N'PENDING', N'b4bf03eb-0dc6-4d86-81d6-75bfe851c6d0-35', 1)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (34, 10, NULL, 36, CAST(8989.00 AS Decimal(10, 2)), CAST(N'2025-06-29T02:19:39.6224603' AS DateTime2), N'VNPAY', N'PENDING', N'5311ad7f-393c-48a3-b6b8-023b6737978d-36', 1)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (35, 10, NULL, 37, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T02:21:11.3167111' AS DateTime2), N'VNPAY', N'SUCCESS', N'706cb3ac-f816-4807-9b06-02cce75cc571-37', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (36, 10, NULL, 38, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T06:13:59.6327731' AS DateTime2), N'VNPAY', N'SUCCESS', N'07233e48-f91b-4478-904e-5244f6e52e15-38', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (37, 5, NULL, 39, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T06:20:17.1139829' AS DateTime2), N'VNPAY', N'SUCCESS', N'a4899e65-47ea-4110-aaa2-594a0c2c65d8-39', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (38, 5, NULL, 40, CAST(8888.00 AS Decimal(10, 2)), CAST(N'2025-06-29T06:23:05.7680520' AS DateTime2), N'VNPAY', N'PENDING', N'550c8107-094b-4704-9e4c-9661fab5e90a-40', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (39, 5, NULL, 41, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T06:23:16.0872228' AS DateTime2), N'VNPAY', N'SUCCESS', N'86d7b42d-029a-4dc0-a9b1-262d7ed3062e-41', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (40, 5, NULL, 42, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T06:26:21.9026261' AS DateTime2), N'VNPAY', N'SUCCESS', N'd5cb70bb-bba2-4d9f-a6d4-5abc94b6e016-42', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (41, 5, NULL, 43, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T06:36:11.8700034' AS DateTime2), N'VNPAY', N'SUCCESS', N'5e97733e-5b75-495b-a16c-ce525f7921af-43', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (42, 5, NULL, 44, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T06:43:00.7848039' AS DateTime2), N'VNPAY', N'PENDING', N'd4ab155b-e7e0-4776-8880-85bd4ac6b376-44', 1)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (43, 5, NULL, 45, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T06:43:30.2242259' AS DateTime2), N'VNPAY', N'SUCCESS', N'987547bd-294c-4dab-a257-a278243cccfe-45', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (44, 5, NULL, 46, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T06:49:10.6861863' AS DateTime2), N'VNPAY', N'SUCCESS', N'8fd443a5-1bf9-4adc-8fad-3a7bf236fe85-46', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (45, 5, NULL, 47, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T07:06:03.6730917' AS DateTime2), N'VNPAY', N'SUCCESS', N'80546047-2a2c-4284-ae5d-cd59dbd13d3a-47', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (46, 5, NULL, 48, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T07:09:37.7656325' AS DateTime2), N'VNPAY', N'SUCCESS', N'07d8deb8-7f2a-4dff-a465-265666045a55-48', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (47, 5, NULL, 49, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T07:36:55.2147943' AS DateTime2), N'VNPAY', N'SUCCESS', N'66ef7e76-4188-46bb-b287-d73d3946fa50-49', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (48, 5, NULL, 50, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T08:15:55.2703497' AS DateTime2), N'VNPAY', N'SUCCESS', N'1a3c3207-06b8-4968-8a10-4057d8c009b1-50', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (49, 5, NULL, 51, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T08:23:18.4003745' AS DateTime2), N'VNPAY', N'SUCCESS', N'76486b9e-4ce3-477f-af73-b7e79143eba6-51', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (50, 5, NULL, 52, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T08:31:10.3056873' AS DateTime2), N'VNPAY', N'SUCCESS', N'8b61e0c3-abc5-45c0-a7d2-ca5d6430b1d1-52', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (51, 5, NULL, 53, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T08:49:46.7007117' AS DateTime2), N'VNPAY', N'PENDING', N'73988a4f-70b1-4b70-b43b-859a50665b52-53', 1)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (52, 5, NULL, 54, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T13:35:37.0177903' AS DateTime2), N'VNPAY', N'SUCCESS', N'2683a7de-1907-40b4-a09a-943ab8918858-54', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (53, 5, NULL, 55, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T17:23:07.9542330' AS DateTime2), N'VNPAY', N'SUCCESS', N'20d2bba9-6c74-4872-bb2a-aff125bb75ee-55', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (54, 5, NULL, 56, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T17:28:17.1547925' AS DateTime2), N'VNPAY', N'SUCCESS', N'895d7e62-0e68-47dd-9fcb-a2727c3f9af6-56', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (55, 5, NULL, 57, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T17:31:32.3406208' AS DateTime2), N'VNPAY', N'SUCCESS', N'78d29cd8-9ffc-4668-9f27-da3db59659a0-57', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (56, 5, NULL, 58, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T17:39:56.2563978' AS DateTime2), N'VNPAY', N'SUCCESS', N'de7a4448-9df5-41ad-920e-cf4aaed25205-58', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (57, 5, NULL, 59, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T17:41:45.2239109' AS DateTime2), N'VNPAY', N'SUCCESS', N'360d6547-ddc3-4d56-ba2f-45e85c1ce7aa-59', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (58, 5, NULL, 60, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T17:43:58.7224235' AS DateTime2), N'VNPAY', N'SUCCESS', N'39b06db8-230e-4b5b-9cee-7c18e8f26cb8-60', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (59, 5, NULL, 61, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T17:44:59.3450545' AS DateTime2), N'VNPAY', N'SUCCESS', N'ff9a5cec-0070-4d13-8728-34dd10e11887-61', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (60, 5, NULL, 62, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T17:53:11.9969463' AS DateTime2), N'VNPAY', N'SUCCESS', N'a002289b-3863-4300-93bc-8eea28d91d11-62', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (61, 5, NULL, 63, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T17:53:57.8462846' AS DateTime2), N'VNPAY', N'SUCCESS', N'b14a5be1-1883-47f5-8967-cfba65ee4341-63', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (62, 5, NULL, 64, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-29T17:59:13.6570395' AS DateTime2), N'VNPAY', N'SUCCESS', N'50768c08-4f51-42a0-91a6-86aa8410779f-64', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (63, 5, NULL, 65, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-30T13:51:31.2938828' AS DateTime2), N'VNPAY', N'PENDING', N'd3f9528c-8cd1-47d0-baa7-17040823af67-65', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (64, 5, NULL, 66, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-30T13:54:18.7967448' AS DateTime2), N'VNPAY', N'SUCCESS', N'0581729e-2864-4eb9-9d41-a0bced7f67b0-66', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (65, 5, NULL, 67, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-06-30T14:27:21.3162266' AS DateTime2), N'VNPAY', N'SUCCESS', N'9b194dc8-7134-4a24-a433-67923f6ba74e-67', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (66, 5, NULL, 68, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-04T17:37:22.4181751' AS DateTime2), N'VNPAY', N'SUCCESS', N'b37d7c68-69f2-4622-9f85-136223b7051b-68', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (67, 5, NULL, 69, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-04T17:44:43.8701109' AS DateTime2), N'VNPAY', N'SUCCESS', N'f8760430-694f-4364-a315-e429e6d76fba-69', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (68, 5, NULL, 70, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-04T17:47:53.2984245' AS DateTime2), N'VNPAY', N'SUCCESS', N'749b2dae-d8e7-4aa7-ac87-3fea79d17c4e-70', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (69, 5, NULL, 71, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-04T17:59:41.8495153' AS DateTime2), N'VNPAY', N'SUCCESS', N'9febf6a7-79b3-4164-9a97-21d4805d55cc-71', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (70, 5, NULL, 72, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-04T18:03:29.1832143' AS DateTime2), N'VNPAY', N'SUCCESS', N'312d346d-8bae-44fd-a199-7bb1ab9f787b-72', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (71, 5, NULL, 73, CAST(8888.00 AS Decimal(10, 2)), CAST(N'2025-07-04T18:14:30.5822432' AS DateTime2), N'VNPAY', N'PENDING', N'21f7e596-3b56-4b9e-89da-d2966ed9371b-73', 1)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (72, 5, NULL, 74, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-04T18:17:46.9253052' AS DateTime2), N'VNPAY', N'SUCCESS', N'bfe5977d-a2a6-42ba-8494-aa950d69f0e6-74', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (73, 5, NULL, 75, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-04T18:29:29.5410134' AS DateTime2), N'VNPAY', N'SUCCESS', N'4f0bdcba-9ce5-4dad-b3ba-4309f338c376-75', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (74, 5, NULL, 76, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-04T18:37:21.8651786' AS DateTime2), N'VNPAY', N'SUCCESS', N'2564437e-1ddc-47c6-95d2-9591604c4cb0-76', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (75, 5, NULL, 77, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-04T18:42:32.7203477' AS DateTime2), N'VNPAY', N'SUCCESS', N'06b76cf5-b781-4ed8-9308-78e8d9958205-77', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (76, 5, NULL, 78, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-04T18:43:36.7029000' AS DateTime2), N'VNPAY', N'SUCCESS', N'02620672-0e45-4223-ad85-8d5f2fcfb911-78', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (77, 5, NULL, 79, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-05T04:03:11.9159509' AS DateTime2), N'VNPAY', N'SUCCESS', N'016c7133-5449-496c-b1d7-c02976bd09d7-79', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (78, 5, NULL, 80, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-05T04:05:55.2482257' AS DateTime2), N'VNPAY', N'SUCCESS', N'20e0f4dc-03ad-4c69-86f9-6c8aa19666d7-80', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (79, 5, NULL, 81, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-05T04:10:42.4864290' AS DateTime2), N'VNPAY', N'SUCCESS', N'fb5d768c-8aee-4ec5-a6a7-804bd6589243-81', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (80, 5, NULL, 82, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-05T04:13:04.1585823' AS DateTime2), N'VNPAY', N'SUCCESS', N'4dfe7603-02d3-400c-bd90-e6dc5b2e9084-82', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (81, 5, NULL, 83, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-05T06:17:03.6200543' AS DateTime2), N'VNPAY', N'PENDING', N'0e70e2e6-5e51-424b-b663-40af9092749c-83', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (82, 5, NULL, 84, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-05T06:19:04.8829300' AS DateTime2), N'VNPAY', N'SUCCESS', N'1ede746e-20bb-4d63-b5bf-4a64f59f47e0-84', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (83, 3, 1028, NULL, CAST(0.00 AS Decimal(10, 2)), CAST(N'2025-07-12T18:36:16.8535979' AS DateTime2), N'VNPay', N'PENDING', N'COURSE-963e893d8c7b48bd94868aaed2f16a6f', NULL)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (84, 3, 1027, NULL, CAST(1.00 AS Decimal(10, 2)), CAST(N'2025-07-12T18:43:43.3558843' AS DateTime2), N'VNPay', N'SUCCESS', N'COURSE-ed3994bc9c0a41428fbb12b29704ebea', NULL)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (85, 12, NULL, 85, CAST(8989.00 AS Decimal(10, 2)), CAST(N'2025-07-12T19:05:30.5233800' AS DateTime2), N'VNPAY', N'PENDING', N'9075ea8b-c6fe-4929-ba91-19d3e9a97259-85', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (86, 12, NULL, 86, CAST(99999.00 AS Decimal(10, 2)), CAST(N'2025-07-12T19:10:11.8187608' AS DateTime2), N'VNPAY', N'SUCCESS', N'd46cecd4-3531-4a6b-b639-6afded749f11-86', 0)
INSERT [dbo].[Payments] ([PaymentID], [UserID], [CourseID], [AppointmentID], [Amount], [PaymentDate], [PaymentMethod], [Status], [TransactionID], [RetryCount]) VALUES (87, 3, 1029, NULL, CAST(1872837.00 AS Decimal(10, 2)), CAST(N'2025-07-13T08:17:27.0652041' AS DateTime2), N'VNPay', N'PENDING', N'COURSE-13633b3554de4469a6ebdc48d05accbe', NULL)
SET IDENTITY_INSERT [dbo].[Payments] OFF
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
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1048, NULL, N'string', N'string', 46, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1049, NULL, N'a', N'string', 46, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1050, NULL, N'stringb', N'string', 46, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1051, NULL, N'stringc', N'string', 46, 1)
INSERT [dbo].[Questions] ([QuestionID], [SurveyID], [QuestionText], [QuestionType], [AssessmentID], [IsDeleted]) VALUES (1052, NULL, N'stringd', N'string', 46, 1)
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

INSERT [dbo].[UserCourseProgresses] ([UserCourseProgressID], [UserID], [CourseID], [IsCompleted], [CompletedAt]) VALUES (1, 3, 1023, 1, CAST(N'2025-07-09T17:07:21.5864941' AS DateTime2))
INSERT [dbo].[UserCourseProgresses] ([UserCourseProgressID], [UserID], [CourseID], [IsCompleted], [CompletedAt]) VALUES (2, 13, 1023, 1, CAST(N'2025-07-09T09:29:28.7157279' AS DateTime2))
INSERT [dbo].[UserCourseProgresses] ([UserCourseProgressID], [UserID], [CourseID], [IsCompleted], [CompletedAt]) VALUES (3, 13, 1024, 0, NULL)
INSERT [dbo].[UserCourseProgresses] ([UserCourseProgressID], [UserID], [CourseID], [IsCompleted], [CompletedAt]) VALUES (4, 3, 1024, 1, CAST(N'2025-07-09T17:10:00.3835625' AS DateTime2))
INSERT [dbo].[UserCourseProgresses] ([UserCourseProgressID], [UserID], [CourseID], [IsCompleted], [CompletedAt]) VALUES (5, 3, 1025, 0, NULL)
INSERT [dbo].[UserCourseProgresses] ([UserCourseProgressID], [UserID], [CourseID], [IsCompleted], [CompletedAt]) VALUES (6, 3, 1028, 0, NULL)
INSERT [dbo].[UserCourseProgresses] ([UserCourseProgressID], [UserID], [CourseID], [IsCompleted], [CompletedAt]) VALUES (7, 3, 1027, 0, NULL)
SET IDENTITY_INSERT [dbo].[UserCourseProgresses] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Email], [FullName], [DateOfBirth], [Phone], [Address], [Status], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (2, N'admin', N'$2a$11$ORd6pzAfXzC6n4rz7CfUpe0GmSgD/ux1OSYeweYUdUTONPAOgxU2m', N'admin@example.com', N'Administrator', NULL, NULL, NULL, NULL, 6, CAST(N'2025-06-02T05:33:02.2233412' AS DateTime2), CAST(N'2025-06-02T05:33:02.2233412' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Email], [FullName], [DateOfBirth], [Phone], [Address], [Status], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (3, N'hoang', N'$2a$11$SFeB956A7Gv19lAO/JWdg.zd4dP5vhfdAuPXAQz522my8dXNbNwAO', N'hoang@example.com', N'doquochoang', CAST(N'2025-06-02T18:18:45.3210000' AS DateTime2), N'012345678', N'113', N'Active', 2, CAST(N'2025-06-02T18:19:32.7626207' AS DateTime2), CAST(N'2025-06-02T18:19:32.7627795' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Email], [FullName], [DateOfBirth], [Phone], [Address], [Status], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (4, N'admin', N'$2a$11$8mCzd3GRz68wFJKff8IIJuml1MwRV9Fp95VXjEXCaRIWOTVzd5keW', N'admin@example.com', N'Administrator', NULL, NULL, NULL, N'Active', 6, CAST(N'2025-06-24T07:33:16.0896753' AS DateTime2), CAST(N'2025-06-24T07:33:16.0897480' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Email], [FullName], [DateOfBirth], [Phone], [Address], [Status], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (5, N'Tan', N'$2a$11$eFVN8CPi7S6XeC2n4vcfbuG7.SDCF//nbvBodOH6tRW3YEOqRqzae', N'tanphse180176@fpt.edu.vn', N'Tan dz', CAST(N'2020-06-24T00:00:00.0000000' AS DateTime2), N'0566887569', N'Binh Phước', N'Active', 2, CAST(N'2025-06-24T08:21:13.8029227' AS DateTime2), CAST(N'2025-06-24T08:21:13.8032522' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Email], [FullName], [DateOfBirth], [Phone], [Address], [Status], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (6, N'Consultan2', N'$2a$11$QvhZvHMM4YGkgkraynzbte.3cG3ovsmIGyYUlrGfWZ64sry8jxxo.', N'user@example.com', N'CR7', NULL, NULL, NULL, N'Active', 4, CAST(N'2025-06-24T08:57:30.6893456' AS DateTime2), CAST(N'2025-06-24T08:57:30.6893928' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Email], [FullName], [DateOfBirth], [Phone], [Address], [Status], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (7, N'ConsultantHN', N'$2a$11$dthsWcVUUJdUzPzCkz8lVuEw0ypXM74OCQVxHdIiuOykK1auMGlEG', N'Consultant@gmail.com', N'Consultant', NULL, NULL, NULL, N'Active', 4, CAST(N'2025-06-26T16:18:49.3334696' AS DateTime2), CAST(N'2025-06-26T16:18:49.3335515' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Email], [FullName], [DateOfBirth], [Phone], [Address], [Status], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (8, N'nguyendan', N'$2a$11$ALeuwR1UbEFD4SpsI48uje0XMpxu5b/bPOn5KQF3PtX99anRO4LQW', N'nguyendan@example.com', N'string', NULL, NULL, NULL, N'Active', 4, CAST(N'2025-06-28T06:02:33.3706256' AS DateTime2), CAST(N'2025-06-28T06:02:33.3706258' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Email], [FullName], [DateOfBirth], [Phone], [Address], [Status], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (9, N'ConsultantQ2', N'$2a$11$tEY7G02oNO0Pbe7T4RsKqOVIOCUw24SBjenTN3edJmTBmd7c7Id2G', N'ConsutantQ2@gmail.com', N'Nermar', NULL, NULL, NULL, N'Active', 4, CAST(N'2025-06-28T08:28:41.0978961' AS DateTime2), CAST(N'2025-06-28T08:30:13.3556844' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Email], [FullName], [DateOfBirth], [Phone], [Address], [Status], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (10, N'KingKAKA', N'$2a$11$g2FolOPAcLL5On8d.NUp0.7rMyJT4yLRC9xJaOLfb/piUkqJDOFG.', N'buitham8758@gmail.com', N'KAKA', CAST(N'2020-06-29T00:00:00.0000000' AS DateTime2), N'0999999999', N'Sai Gon', N'Active', 2, CAST(N'2025-06-29T02:18:35.7334392' AS DateTime2), CAST(N'2025-06-29T02:18:35.7334758' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Email], [FullName], [DateOfBirth], [Phone], [Address], [Status], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (11, N'kaka', N'$2a$11$ORd6pzAfXzC6n4rz7CfUpe0GmSgD/ux1OSYeweYUdUTONPAOgxU2m', N'kaka@example.com', N'Administration', NULL, NULL, NULL, NULL, 6, CAST(N'2025-06-02T05:33:02.2233412' AS DateTime2), CAST(N'2025-06-02T05:33:02.2233412' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Email], [FullName], [DateOfBirth], [Phone], [Address], [Status], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (12, N'dohoang', N'$2a$11$tz85AlMJroJjJssUr10WHONA4Pw8wtm8QWvIrB0VUBSVcZtLFRTea', N'dohoang@example.com', N'DoQuocHoang', CAST(N'2025-06-03T01:39:01.9910000' AS DateTime2), N'012345678', N'123456', N'Active', 2, CAST(N'2025-06-03T01:51:06.2746338' AS DateTime2), CAST(N'2025-06-03T01:51:06.2746855' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Email], [FullName], [DateOfBirth], [Phone], [Address], [Status], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (13, N'nguyen', N'$2a$11$rx3.lTrEKXZzsYxius1T7ee5DtTpNJ8XW1jmO7lb7sAYrRTUhkzSS', N'nguyen@gmail.com', N'Lê Văn Nguyên', CAST(N'2025-07-09T09:22:15.7410000' AS DateTime2), N'123456789', N'123', N'Active', 2, CAST(N'2025-07-09T09:22:51.9823939' AS DateTime2), CAST(N'2025-07-09T09:22:51.9824715' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Email], [FullName], [DateOfBirth], [Phone], [Address], [Status], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (14, N'string', N'$2a$11$6IcAnwEfqIUio9z9E937XeuwH3WtX8EZ/3HnDqCHxcPsGvCojxPuy', N'user@gmail.com', N'string', NULL, NULL, NULL, N'Active', 4, CAST(N'2025-07-10T08:29:26.1114134' AS DateTime2), CAST(N'2025-07-10T08:29:26.1114136' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Email], [FullName], [DateOfBirth], [Phone], [Address], [Status], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (15, N'hoang1', N'$2a$11$z2LpnkXht.M6W0XOHXSxzu/ZzIfHp65/0Ocmsy.YuDAR7xvwJOGMy', N'hoang1@gmail.com', N'doquochoang1', CAST(N'2025-07-13T16:28:31.7560000' AS DateTime2), N'123456789', N'123', N'Active', 2, CAST(N'2025-07-13T16:29:15.4486050' AS DateTime2), CAST(N'2025-07-13T16:29:15.4486672' AS DateTime2))
INSERT [dbo].[Users] ([UserID], [UserName], [Password], [Email], [FullName], [DateOfBirth], [Phone], [Address], [Status], [RoleID], [CreatedAt], [UpdatedAt]) VALUES (16, N'haha', N'$2a$11$mtRBYOVkCSi29OA3vRBlk.cG8FWcDsCeKcvLeacJGjhKuvTSCn7Ji', N'haha@example.com', N'string', CAST(N'2025-07-13T17:48:38.4820000' AS DateTime2), N'0123456789', N'string', N'Active', 2, CAST(N'2025-07-13T17:49:15.5582597' AS DateTime2), CAST(N'2025-07-13T17:49:15.5583345' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded', 1, NULL)
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2025-07-13', 1, CAST(N'2025-08-13T07:55:13.820' AS DateTime))
INSERT [HangFire].[AggregatedCounter] ([Key], [Value], [ExpireAt]) VALUES (N'stats:succeeded:2025-07-13-07', 1, CAST(N'2025-07-14T07:55:13.820' AS DateTime))
GO
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-schedules', N'CreatedAt', N'1752312107104', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-schedules', N'Cron', N'0 0 * * *', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-schedules', N'Job', N'{"t":"DrugUsePreventionAPI.Controllers.Data.ScheduleGenerator, DrugUsePreventionAPI","m":"GenerateDailySchedulesAsync","p":["System.DateTime, mscorlib"],"a":["\"2025-07-13T00:00:00Z\""]}', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-schedules', N'LastExecution', N'1752393312323', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-schedules', N'LastJobId', N'1', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-schedules', N'NextExecution', N'1752451200000', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-schedules', N'Queue', N'default', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-schedules', N'TimeZoneId', N'UTC', NULL)
INSERT [HangFire].[Hash] ([Key], [Field], [Value], [ExpireAt]) VALUES (N'recurring-job:generate-daily-schedules', N'V', N'2', NULL)
GO
SET IDENTITY_INSERT [HangFire].[Job] ON 

INSERT [HangFire].[Job] ([Id], [StateId], [StateName], [InvocationData], [Arguments], [CreatedAt], [ExpireAt]) VALUES (1, 3, N'Succeeded', N'{"t":"DrugUsePreventionAPI.Controllers.Data.ScheduleGenerator, DrugUsePreventionAPI","m":"GenerateDailySchedulesAsync","p":["System.DateTime, mscorlib"]}', N'["\"2025-07-13T00:00:00Z\""]', CAST(N'2025-07-13T07:55:12.353' AS DateTime), CAST(N'2025-07-14T07:55:13.823' AS DateTime))
SET IDENTITY_INSERT [HangFire].[Job] OFF
GO
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (1, N'CurrentCulture', N'"en-US"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (1, N'RecurringJobId', N'"generate-daily-schedules"')
INSERT [HangFire].[JobParameter] ([JobId], [Name], [Value]) VALUES (1, N'Time', N'1752393312')
GO
INSERT [HangFire].[Schema] ([Version]) VALUES (9)
GO
INSERT [HangFire].[Server] ([Id], [Data], [LastHeartbeat]) VALUES (N'desktop-nggl106:14680:fac15dd8-0328-4460-8cc4-72abac6a9bba', N'{"WorkerCount":20,"Queues":["default"],"StartedAt":"2025-07-13T19:49:09.3011438Z"}', CAST(N'2025-07-13T20:00:09.673' AS DateTime))
GO
INSERT [HangFire].[Set] ([Key], [Score], [Value], [ExpireAt]) VALUES (N'recurring-jobs', 1752451200, N'generate-daily-schedules', NULL)
GO
SET IDENTITY_INSERT [HangFire].[State] ON 

INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (1, 1, N'Enqueued', N'Triggered by recurring job scheduler', CAST(N'2025-07-13T07:55:12.370' AS DateTime), N'{"EnqueuedAt":"1752393312366","Queue":"default"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (2, 1, N'Processing', NULL, CAST(N'2025-07-13T07:55:12.473' AS DateTime), N'{"StartedAt":"1752393312421","ServerId":"desktop-nggl106:31464:5335af81-9399-4e5b-a8ab-e4e082b93c3d","WorkerId":"a520cd91-8445-420e-af2d-01872307f9b1"}')
INSERT [HangFire].[State] ([Id], [JobId], [Name], [Reason], [CreatedAt], [Data]) VALUES (3, 1, N'Succeeded', NULL, CAST(N'2025-07-13T07:55:13.823' AS DateTime), N'{"SucceededAt":"1752393313818","PerformanceDuration":"1338","Latency":"126"}')
SET IDENTITY_INSERT [HangFire].[State] OFF
GO
ALTER TABLE [dbo].[Assessments] ADD  DEFAULT (N'') FOR [AssessmentStage]
GO
ALTER TABLE [dbo].[CourseRegistrations] ADD  DEFAULT (N'') FOR [PaymentStatus]
GO
ALTER TABLE [dbo].[CourseRegistrations] ADD  DEFAULT (N'') FOR [Status]
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
ALTER TABLE [dbo].[UserCourseProgresses]  WITH CHECK ADD  CONSTRAINT [FK_UserCourseProgresses_Users_UserID] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[UserCourseProgresses] CHECK CONSTRAINT [FK_UserCourseProgresses_Users_UserID]
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
/****** Object:  StoredProcedure [dbo].[GetConsultantSchedulesWithStatus]    Script Date: 7/14/2025 3:00:14 AM ******/
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
