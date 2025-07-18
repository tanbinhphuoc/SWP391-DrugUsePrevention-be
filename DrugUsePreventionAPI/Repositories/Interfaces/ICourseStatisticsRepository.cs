using DrugUsePreventionAPI.Models.DTOs.StatisticalCourse;

namespace DrugUsePreventionAPI.Repositories.Interfaces
{
    public interface ICourseStatisticsRepository
    {
        Task<int> GetTotalCoursesAsync();
        Task<int> GetOpenCoursesCountAsync();
        Task<int> GetClosedCoursesCountAsync();
        Task<int> GetPendingCoursesCountAsync();
        Task<int> GetCoursesCountByTargetAsync(string targetAudience);

        Task<List<CourseUserStatisticsDto>> GetCourseUserStatisticsAsync();
        Task<List<CourseImpactDto>> GetCoursesWithHighestImpactAsync();
        Task<CourseRevenueStatisticsDto> GetRevenueStatisticsAsync();
        Task<List<TimePointValueDto>> GetEnrollmentDistributionOverTimeAsync();
        Task<List<TimePointValueDto>> GetCompletionTrendAsync();
        Task<List<PieChartSegmentDto>> GetTargetAudienceRatioAsync();
    }

}