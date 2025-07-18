using DrugUsePreventionAPI.Models.Entities;
using System.Collections.Generic;

namespace DrugUsePreventionAPI.Repositories.Interfaces {
    public interface ICourseRepository : IGenericRepository<Course> {
        Task<Course?> GetCourseByTypeAsync(string type);

        Task<List<Course>> GetAllCourses();
        //Lấy các Course chưa bị xóa (IsDeleted = false)
        Task<List<Course>> GetAllActiveCourses();

        Task<List<Course>> GetCompletedCoursesByUser(int userId);
    }
}