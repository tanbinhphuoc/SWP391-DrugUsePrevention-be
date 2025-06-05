
CREATE DATABASE DrugUsePreventionDB;
GO

USE DrugUsePreventionDB;
GO

-- 1. Roles
CREATE TABLE Roles (
  roleID INT IDENTITY(1,1) PRIMARY KEY,
  roleName NVARCHAR(50) NOT NULL UNIQUE,
  description NVARCHAR(MAX) NULL
);
GO

-- 2. Users
CREATE TABLE Users (
  userID INT IDENTITY(1,1) PRIMARY KEY,
  userName NVARCHAR(100) NOT NULL UNIQUE,
  password NVARCHAR(255) NOT NULL,
  email NVARCHAR(100) NOT NULL UNIQUE,
  fullName NVARCHAR(150) NULL,
  dateOfBirth DATE NULL,
  phone NVARCHAR(20) NULL,
  address NVARCHAR(255) NULL,
  status NVARCHAR(50) NULL,
  roleID INT NOT NULL,
  createdAt DATETIME2 NOT NULL DEFAULT GETDATE(),
  updatedAt DATETIME2 NOT NULL DEFAULT GETDATE(),
  CONSTRAINT FK_Users_Roles FOREIGN KEY (roleID) REFERENCES Roles(roleID)
);
GO

-- 3. Certificates
CREATE TABLE Certificates (
  certificateID INT IDENTITY(1,1) PRIMARY KEY,
  certificateName NVARCHAR(255) NOT NULL,
  dateAcquired DATE NULL
);
GO

-- 4. Consultants
CREATE TABLE Consultants (
  consultantID INT IDENTITY(1,1) PRIMARY KEY,
  userID INT NOT NULL UNIQUE,
  certificateID INT NULL,
  specialty NVARCHAR(255) NULL,
  degree NVARCHAR(255) NULL,
  experience NVARCHAR(MAX) NULL,
  hourlyRate DECIMAL(10,2) NOT NULL DEFAULT 0.0,
  createdAt DATETIME2 NOT NULL DEFAULT GETDATE(),
  updatedAt DATETIME2 NOT NULL DEFAULT GETDATE(),
  CONSTRAINT FK_Consultants_Users FOREIGN KEY (userID) REFERENCES Users(userID),
  CONSTRAINT FK_Consultants_Certificates FOREIGN KEY (certificateID) REFERENCES Certificates(certificateID)
);
GO

-- 5. Consultant_Schedules
CREATE TABLE Consultant_Schedules (
  scheduleID INT IDENTITY(1,1) PRIMARY KEY,
  consultantID INT NOT NULL,
  dayOfWeek NVARCHAR(50) NOT NULL,
  date DATE NOT NULL,
  startTime TIME NOT NULL,
  endTime TIME NOT NULL,
  isAvailable BIT NOT NULL DEFAULT 1,
  notes NVARCHAR(MAX) NULL,
  CONSTRAINT FK_ConsultantSchedules_Consultants FOREIGN KEY (consultantID) REFERENCES Consultants(consultantID)
);
GO

-- 6. Courses
CREATE TABLE Courses (
  courseID INT IDENTITY(1,1) PRIMARY KEY,
  title NVARCHAR(255) NOT NULL,
  description NVARCHAR(MAX) NULL,
  startDate DATE NOT NULL,
  endDate DATE NOT NULL,
  status NVARCHAR(10) NOT NULL DEFAULT 'OPEN',
  ageMin INT NOT NULL,
  ageMax INT NULL,
  capacity INT NULL,
  price DECIMAL(10,2) NOT NULL DEFAULT 0.0,
  createdAt DATETIME2 NOT NULL DEFAULT GETDATE(),
  updatedAt DATETIME2 NOT NULL DEFAULT GETDATE()
);
GO
-- Constraint cho trường status tương tự ENUM
ALTER TABLE Courses
ADD CONSTRAINT CHK_Courses_Status CHECK (status IN ('OPEN','CLOSED','PAUSED'));
GO

-- 7. Blogs
CREATE TABLE Blogs (
  blogID INT IDENTITY(1,1) PRIMARY KEY,
  title NVARCHAR(255) NOT NULL,
  content NVARCHAR(MAX) NOT NULL,
  authorID INT NOT NULL,
  publishDate DATE NOT NULL,
  status NVARCHAR(10) NOT NULL DEFAULT 'PENDING',
  CONSTRAINT FK_Blogs_Users FOREIGN KEY (authorID) REFERENCES Users(userID)
);
GO
ALTER TABLE Blogs
ADD CONSTRAINT CHK_Blogs_Status CHECK (status IN ('PENDING','APPROVED','REJECTED'));
GO

-- 8. Course_Registrations
CREATE TABLE Course_Registrations (
  userID INT NOT NULL,
  courseID INT NOT NULL,
  registerTime DATETIME2 NOT NULL DEFAULT GETDATE(),
  CONSTRAINT PK_Course_Registrations PRIMARY KEY (userID, courseID),
  CONSTRAINT FK_CourseRegistrations_Users FOREIGN KEY (userID) REFERENCES Users(userID),
  CONSTRAINT FK_CourseRegistrations_Courses FOREIGN KEY (courseID) REFERENCES Courses(courseID)
);
GO

-- 9. Appointments
CREATE TABLE Appointments (
  appointmentID INT IDENTITY(1,1) PRIMARY KEY,
  userID INT NOT NULL,
  consultantID INT NOT NULL,
  startDateTime DATETIME2 NOT NULL,
  endDateTime DATETIME2 NOT NULL,
  googleMeetLink NVARCHAR(255) NULL,
  price DECIMAL(10,2) NOT NULL DEFAULT 0.0,
  status NVARCHAR(20) NOT NULL DEFAULT 'PENDING_PAYMENT',
  note NVARCHAR(MAX) NULL,
  createdAt DATETIME2 NOT NULL DEFAULT GETDATE(),
  updatedAt DATETIME2 NOT NULL DEFAULT GETDATE(),
  CONSTRAINT FK_Appointments_Users FOREIGN KEY (userID) REFERENCES Users(userID),
  CONSTRAINT FK_Appointments_Consultants FOREIGN KEY (consultantID) REFERENCES Consultants(consultantID)
);
GO
ALTER TABLE Appointments
ADD CONSTRAINT CHK_Appointments_Status CHECK (status IN ('PENDING_PAYMENT','CONFIRMED','CANCELED'));
GO

-- 10. Consultant_Appointment_Evaluations
CREATE TABLE Consultant_Appointment_Evaluations (
  evaluationID INT IDENTITY(1,1) PRIMARY KEY,
  appointmentID INT NOT NULL,
  userID INT NOT NULL,
  rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
  comment NVARCHAR(MAX) NULL,
  evaluationDate DATETIME2 NOT NULL DEFAULT GETDATE(),
  CONSTRAINT FK_Evaluations_Appointments FOREIGN KEY (appointmentID) REFERENCES Appointments(appointmentID),
  CONSTRAINT FK_Evaluations_Users FOREIGN KEY (userID) REFERENCES Users(userID)
);
GO

-- 11. Assessments
CREATE TABLE Assessments (
  assessmentID INT IDENTITY(1,1) PRIMARY KEY,
  assessmentName NVARCHAR(255) NOT NULL,
  description NVARCHAR(MAX) NULL,
  assessmentType NVARCHAR(10) NOT NULL,
  minAge INT NULL,
  maxAge INT NULL
);
GO
ALTER TABLE Assessments
ADD CONSTRAINT CHK_Assessments_Type CHECK (assessmentType IN ('PRE','POST'));
GO

-- 12. Course_Assessments
CREATE TABLE Course_Assessments (
  courseID INT NOT NULL,
  assessmentID INT NOT NULL,
  CONSTRAINT PK_Course_Assessments PRIMARY KEY (courseID, assessmentID),
  CONSTRAINT FK_CourseAssessments_Courses FOREIGN KEY (courseID) REFERENCES Courses(courseID),
  CONSTRAINT FK_CourseAssessments_Assessments FOREIGN KEY (assessmentID) REFERENCES Assessments(assessmentID)
);
GO

-- 13. Assessment_Results
CREATE TABLE Assessment_Results (
  resultID INT IDENTITY(1,1) PRIMARY KEY,
  userID INT NOT NULL,
  assessmentID INT NOT NULL,
  courseID INT NULL,
  resultName NVARCHAR(255) NULL,
  score FLOAT NOT NULL,
  takeTime DATETIME2 NOT NULL DEFAULT GETDATE(),
  CONSTRAINT FK_AssessmentResults_Users FOREIGN KEY (userID) REFERENCES Users(userID),
  CONSTRAINT FK_AssessmentResults_Assessments FOREIGN KEY (assessmentID) REFERENCES Assessments(assessmentID),
  CONSTRAINT FK_AssessmentResults_Courses FOREIGN KEY (courseID) REFERENCES Courses(courseID)
);
GO

-- 14. Surveys
CREATE TABLE Surveys (
  surveyID INT IDENTITY(1,1) PRIMARY KEY,
  title NVARCHAR(255) NOT NULL,
  type NVARCHAR(50) NULL,
  authorID INT NOT NULL,
  description NVARCHAR(MAX) NULL,
  CONSTRAINT FK_Surveys_Users FOREIGN KEY (authorID) REFERENCES Users(userID)
);
GO

-- 15. Questions
CREATE TABLE Questions (
  questionID INT IDENTITY(1,1) PRIMARY KEY,
  surveyID INT NOT NULL,
  questionText NVARCHAR(MAX) NOT NULL,
  questionType NVARCHAR(50) NULL,
  CONSTRAINT FK_Questions_Surveys FOREIGN KEY (surveyID) REFERENCES Surveys(surveyID)
);
GO

-- 16. AnswerOptions
CREATE TABLE AnswerOptions (
  optionID INT IDENTITY(1,1) PRIMARY KEY,
  questionID INT NOT NULL,
  optionText NVARCHAR(MAX) NOT NULL,
  scoreValue INT NULL,
  CONSTRAINT FK_AnswerOptions_Questions FOREIGN KEY (questionID) REFERENCES Questions(questionID)
);
GO

-- 17. Communication_Programs
CREATE TABLE Communication_Programs (
  programID INT IDENTITY(1,1) PRIMARY KEY,
  name NVARCHAR(255) NOT NULL,
  description NVARCHAR(MAX) NULL,
  startDate DATE NULL,
  endDate DATE NULL,
  location NVARCHAR(255) NULL
);
GO

-- 18. Program_Participations
CREATE TABLE Program_Participations (
  userID INT NOT NULL,
  programID INT NOT NULL,
  joinTime DATETIME2 NOT NULL DEFAULT GETDATE(),
  CONSTRAINT PK_Program_Participations PRIMARY KEY (userID, programID),
  CONSTRAINT FK_ProgramParticipations_Users FOREIGN KEY (userID) REFERENCES Users(userID),
  CONSTRAINT FK_ProgramParticipations_Programs FOREIGN KEY (programID) REFERENCES Communication_Programs(programID)
);
GO

-- 19. Survey_Responses
CREATE TABLE Survey_Responses (
  responseID INT IDENTITY(1,1) PRIMARY KEY,
  userID INT NOT NULL,
  surveyID INT NOT NULL,
  programID INT NULL,
  responseData NVARCHAR(MAX) NULL,
  submitTime DATETIME2 NOT NULL DEFAULT GETDATE(),
  CONSTRAINT FK_SurveyResponses_Users FOREIGN KEY (userID) REFERENCES Users(userID),
  CONSTRAINT FK_SurveyResponses_Surveys FOREIGN KEY (surveyID) REFERENCES Surveys(surveyID),
  CONSTRAINT FK_SurveyResponses_Programs FOREIGN KEY (programID) REFERENCES Communication_Programs(programID)
);
GO

-- 20. Payments
CREATE TABLE Payments (
  paymentID INT IDENTITY(1,1) PRIMARY KEY,
  userID INT NOT NULL,
  courseID INT NULL,
  appointmentID INT NULL,
  amount DECIMAL(10,2) NOT NULL DEFAULT 0.0,
  paymentDate DATETIME2 NOT NULL DEFAULT GETDATE(),
  paymentMethod NVARCHAR(50) NULL,
  status NVARCHAR(10) NOT NULL DEFAULT 'PENDING',
  transactionID NVARCHAR(100) NULL,
  CONSTRAINT FK_Payments_Users FOREIGN KEY (userID) REFERENCES Users(userID),
  CONSTRAINT FK_Payments_Courses FOREIGN KEY (courseID) REFERENCES Courses(courseID),
  CONSTRAINT FK_Payments_Appointments FOREIGN KEY (appointmentID) REFERENCES Appointments(appointmentID)
);
GO
ALTER TABLE Payments
ADD CONSTRAINT CHK_Payments_Status CHECK (status IN ('PENDING','SUCCESS','FAILED'));
GO

-- Seed Roles
INSERT INTO Roles (roleName, description)
VALUES 
    (N'Guest', N'Người dùng chưa đăng nhập'),
	(N'Member', N'Người dùng đăng kí thành công'),
    (N'Staff', N'Nhân viên tổ chức'),
    (N'Consultant', N'Chuyên gia tư vấn'),
    (N'Manager', N'Quản lý'),
    (N'Admin', N'Quản trị viên');
GO

select * from Roles
select * from Users


