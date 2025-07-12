using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Repositories.Interfaces
{
    public interface ICourseVideoRepository
    {
        Task AddAsync(CourseVideo video);
        Task<CourseVideo?> GetByIdAsync(int id);
        Task<List<CourseVideo>> GetVideosByCourseIdAsync(int courseId);

        void Update(CourseVideo video);


    }
}
