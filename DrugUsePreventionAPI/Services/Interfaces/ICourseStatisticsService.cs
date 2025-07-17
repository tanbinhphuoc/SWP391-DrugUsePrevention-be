using DrugUsePreventionAPI.Models.DTOs.StatisticalCourse;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface ICourseStatisticsService
    {
        Task<CourseOverviewStatisticsDto> GetCourseOverviewStatisticsAsync();
    }

}
