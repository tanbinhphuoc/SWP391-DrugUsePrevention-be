using DrugUsePreventionAPI.Controllers.Data;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Repositories
{
    public class UnitOfWork : IUnitOfWork
    {
        private readonly ApplicationDbContext _context;

        public IUserRepository Users { get; private set; }
        public IRoleRepository Roles { get; private set; }
        public IConsultantRepository Consultants { get; private set; }
        public ICertificateRepository Certificates { get; private set; }
        public IConsultantScheduleRepository ConsultantSchedules { get; private set; }
        public IPaymentRepository Payments { get; private set; }
        public IAppointmentRepository Appointments { get; private set; }
        public IAssessmentRepository Assessments { get; private set; }
        public IAssessmentResultRepository AssessmentResults { get; private set; }
        public ICourseRepository Courses { get; private set; }
        public ICourseRegistrationRepository CourseRegistrations { get; private set; }
        public ISurveyRepository Surveys { get; private set; }
        public IQuestionRepository Questions { get; private set; }
        public IAnswerOptionRepository AnswerOptions { get; private set; }


        public UnitOfWork(
            ApplicationDbContext context,
            IUserRepository userRepository,
            IRoleRepository roleRepository,
            IConsultantRepository consultantRepository,
            ICertificateRepository certificateRepository,
            IConsultantScheduleRepository consultantScheduleRepository,
            IPaymentRepository paymentRepository,
            IAppointmentRepository appointmentRepository,
            IAssessmentRepository assessmentRepository,
            IAssessmentResultRepository assessmentResultRepository,
            ICourseRepository courseRepository,
            ICourseRegistrationRepository courseRegistrationRepository,
            ISurveyRepository surveyRepository,
            IQuestionRepository questionRepository,
            IAnswerOptionRepository answerOptionRepository)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
            Users = userRepository ?? throw new ArgumentNullException(nameof(userRepository));
            Roles = roleRepository ?? throw new ArgumentNullException(nameof(roleRepository));
            Consultants = consultantRepository ?? throw new ArgumentNullException(nameof(consultantRepository));
            Certificates = certificateRepository ?? throw new ArgumentNullException(nameof(certificateRepository));
            ConsultantSchedules = consultantScheduleRepository ?? throw new ArgumentNullException(nameof(consultantScheduleRepository));
            Payments = paymentRepository ?? throw new ArgumentNullException(nameof(paymentRepository));
            Appointments = appointmentRepository ?? throw new ArgumentNullException(nameof(appointmentRepository));
            Assessments = assessmentRepository ?? throw new ArgumentNullException(nameof(assessmentRepository));
            AssessmentResults = assessmentResultRepository ?? throw new ArgumentNullException(nameof(assessmentResultRepository));
            Courses = courseRepository ?? throw new ArgumentNullException(nameof(courseRepository));
            CourseRegistrations = courseRegistrationRepository ?? throw new ArgumentNullException(nameof(courseRegistrationRepository));
            Surveys = surveyRepository ?? throw new ArgumentNullException(nameof(surveyRepository));
            Questions = questionRepository ?? throw new ArgumentNullException(nameof(questionRepository));
            AnswerOptions = answerOptionRepository ?? throw new ArgumentNullException(nameof(answerOptionRepository));
        }

        public async Task<int> SaveChangesAsync()
        {
            return await _context.SaveChangesAsync();
        }

        public void Attach<TEntity>(TEntity entity) where TEntity : class
        {
            var repository = _context.Set<TEntity>();
            repository.Attach(entity);
        }
        public DbContext GetContext()
        {
            return _context;
        }
        public void Dispose()
        {
            _context.Dispose();
        }
    }
}
