using DrugUsePreventionAPI.Models.DTOs.Course;
using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface ICourseVideoService
    {
        Task<CourseVideo> CreateCourseVideoAsync(CreateCourseVideoDto dto);
        Task UpdateCourseVideoAsync(UpdateCourseVideoDto dto);
        Task<List<CreateCourseVideoDto>> GetVideosByCourseIdAsync(int courseId);
        Task<CreateCourseVideoDto> GetVideoByIdAsync(int videoId);

        Task<bool> DeleteCourseVideoAsync(int videoId);



    }
}
