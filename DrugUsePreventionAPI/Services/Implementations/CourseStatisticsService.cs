using DrugUsePreventionAPI.Models.DTOs.StatisticalCourse;
using DrugUsePreventionAPI.Repositories.Interfaces;
using DrugUsePreventionAPI.Services.Interfaces;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class CourseStatisticsService : ICourseStatisticsService
    {
        private readonly ICourseStatisticsRepository _repository;

        public CourseStatisticsService(ICourseStatisticsRepository repository)
        {
            _repository = repository;
        }

        public async Task<CourseOverviewStatisticsDto> GetCourseOverviewStatisticsAsync()
        {
            return new CourseOverviewStatisticsDto
            {
                TotalCourses = await _repository.GetTotalCoursesAsync(),
                OpenCourses = await _repository.GetOpenCoursesCountAsync(),
                ClosedCourses = await _repository.GetClosedCoursesCountAsync(),
                PendingCourses = await _repository.GetPendingCoursesCountAsync(),
                HighSchoolTargetCount = await _repository.GetCoursesCountByTargetAsync("HocSinh"),
                CollegeTargetCount = await _repository.GetCoursesCountByTargetAsync("SinhVien"),
                ParentTargetCount = await _repository.GetCoursesCountByTargetAsync("PhuHuynh"),
            };
        }

        public async Task<List<CourseUserStatisticsDto>> GetCourseUserStatisticsAsync()
        {
            return await _repository.GetCourseUserStatisticsAsync();
        }

        public async Task<List<CourseImpactDto>> GetCoursesWithHighestImpactAsync()
        {
            return await _repository.GetCoursesWithHighestImpactAsync();
        }

        public async Task<CourseRevenueStatisticsDto> GetRevenueStatisticsAsync()
        {
            return await _repository.GetRevenueStatisticsAsync();
        }

    }


}