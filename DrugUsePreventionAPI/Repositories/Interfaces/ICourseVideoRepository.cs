using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Repositories.Interfaces
{
    public interface ICourseVideoRepository
    {
        Task<List<CourseVideo>> GetVideosByCourseIdAsync(int courseId);
        Task AddAsync(CourseVideo video);

    }
}
