using DrugUsePreventionAPI.Controllers.Data;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;

namespace DrugUsePreventionAPI.Repositories
{
    public class CourseStatisticsRepository : ICourseStatisticsRepository
    {
        private readonly ApplicationDbContext _context;

        public CourseStatisticsRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<int> GetTotalCoursesAsync()
        {
            return await _context.Courses.CountAsync(c => !c.IsDeleted);
        }

        public async Task<int> GetOpenCoursesCountAsync()
        {
            return await _context.Courses.CountAsync(c => c.Status == "OPEN" && !c.IsDeleted);
        }

        public async Task<int> GetClosedCoursesCountAsync()
        {
            return await _context.Courses.CountAsync(c => c.Status == "CLOSED" && !c.IsDeleted);
        }
        public async Task<int> GetPendingCoursesCountAsync()
        {
            return await _context.Courses.CountAsync(c => c.Status == "PENDING" && !c.IsDeleted);
        }

        public async Task<int> GetCoursesCountByTargetAsync(string targetAudience)
        {
            return await _context.Courses.CountAsync(c => c.Type == targetAudience && !c.IsDeleted);
        }

        public async Task<List<string>> GetCoursesWithNoEnrollmentAsync()
        {
            return await _context.Courses
                .Where(c => !c.CourseRegistrations.Any() && !c.IsDeleted)
                .Select(c => c.CourseName)
                .ToListAsync();
        }
    }

}
