using DrugUsePreventionAPI.Data;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Repositories
{
    public class CourseRepository : GenericRepository<Course>, ICourseRepository
    {
        public CourseRepository(ApplicationDbContext context) : base(context) { }

        public async Task<List<Course>> GetCoursesByTypeAsync(string type)
        {
            return await _context.Courses
                .Where(c => c.Type == type && c.Status == "OPEN")
                .ToListAsync();
        }
    }

}