using DrugUsePreventionAPI.Models.DTOs.StatisticalCourse;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface ICourseStatisticsService
    {
        Task<CourseOverviewStatisticsDto> GetCourseOverviewStatisticsAsync();
        Task<List<CourseUserStatisticsDto>> GetCourseUserStatisticsAsync();
        Task<List<CourseImpactDto>> GetCoursesWithHighestImpactAsync();
        Task<CourseRevenueStatisticsDto> GetRevenueStatisticsAsync();
        Task<ChartDataDto> GetChartStatisticsAsync();
    }

}