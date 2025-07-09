using DrugUsePreventionAPI.Models.DTOs.Course;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface ICourseVideoService
    {
        Task AddCourseVideoAsync(CreateCourseVideoDto dto);
        Task<List<CourseVideoDto>> GetVideosByCourseIdAsync(int courseId);

    }
}
