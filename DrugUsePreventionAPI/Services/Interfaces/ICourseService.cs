using DrugUsePreventionAPI.Models.DTOs.Course;
using DrugUsePreventionAPI.Models.DTOs.CourseRegistration;
using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface ICourseService
    {
        Task<int?> CreateCourse(CreateCourseDto courseDto);
        Task<bool> UpdateCourse(int id, CreateCourseDto courseDto);
        Task<List<Course>> GetAllCourses();
        Task<Course?> GetCourseById(int id);
        Task<bool> DeleteCourse(int id);
        Task<bool> IsGetCourse(double score);
        Task<List<Course>> GetCoursesByAge(int age);
        Task<List<Course>> GetCompletedCoursesByUser(int userId);
        Task<List<Course>> GetUncompletedCoursesByUser(int userId);

    }
}
