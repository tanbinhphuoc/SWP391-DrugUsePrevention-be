namespace DrugUsePreventionAPI.Repositories.Interfaces
{
    public interface ICourseStatisticsRepository
    {
        Task<int> GetTotalCoursesAsync();
        Task<int> GetOpenCoursesCountAsync();
        Task<int> GetClosedCoursesCountAsync();
        Task<int> GetPendingCoursesCountAsync();
        Task<int> GetCoursesCountByTargetAsync(string targetAudience);
        Task<List<string>> GetCoursesWithNoEnrollmentAsync();
    }

}
