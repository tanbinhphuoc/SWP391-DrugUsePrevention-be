using DrugUsePreventionAPI.Repositories.Interfaces;

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
        Task<int> SaveChangesAsync();
    }
}