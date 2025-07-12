using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using System.Security.Cryptography;

namespace DrugUsePreventionAPI.Repositories
{
    public interface IUnitOfWork : IDisposable
    {
        IUserRepository Users { get; }
        IRoleRepository Roles { get; }
        IConsultantRepository Consultants { get; }
        ICertificateRepository Certificates { get; }
        IConsultantScheduleRepository ConsultantSchedules { get; }
        IPaymentRepository Payments { get; }
        IAppointmentRepository Appointments { get; }
        IAssessmentRepository Assessments { get; }
        IAssessmentResultRepository AssessmentResults { get; }
        ICourseRepository Courses { get; }
        ICourseRegistrationRepository CourseRegistrations { get; }
        ISurveyRepository Surveys { get; }
        IQuestionRepository Questions { get; }
        IAnswerOptionRepository AnswerOptions { get; }
        IUserCourseProgressRepository UserCourseProgress { get; }
        ICourseVideoRepository CourseVideos { get; }



        Task<int> SaveChangesAsync();
        void Attach<TEntity>(TEntity entity) where TEntity : class;

        DbContext GetContext();
    }
}