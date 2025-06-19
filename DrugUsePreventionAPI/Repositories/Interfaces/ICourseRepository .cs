using DrugUsePreventionAPI.Models.Entities;
using System.Collections.Generic;

namespace DrugUsePreventionAPI.Repositories.Interfaces {
    public interface ICourseRepository : IGenericRepository<Course> {
        Task<List<Course>> GetCoursesByTypeAsync(string type); 
        Task<List<Course>> GetAllCourses();
    }
}