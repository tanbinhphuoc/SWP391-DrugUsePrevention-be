namespace DrugUsePreventionAPI.Repositories.Interfaces
{
    public interface ICourseRegistrationRepository : IGenericRepository<CourseRegistration>
    {
        Task<CourseRegistration> GetByIdWithDetailsAsync(int id);
        Task<CourseRegistration> GetByTransactionAsync(string transactionId);
        Task<IEnumerable<CourseRegistration>> GetByUserIdAsync(int userId);
        Task<CourseRegistration?> GetLatestByUserAndCourseAsync(int userId, int courseId);
        Task<CourseRegistration?> GetByIdAsync(int courseRegistrationId);

        Task<IEnumerable<CourseRegistration>> GetConfirmedAndPaidByUserIdAsync(int userId);
        Task<int> CountByCourseIdAndStatusAsync(int courseId, IEnumerable<string> statuses);


    }

}
