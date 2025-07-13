using DrugUsePreventionAPI.Controllers.Data;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace DrugUsePreventionAPI.Repositories
{
    public class UserCourseProgressRepository : GenericRepository<UserCourseProgress>, IUserCourseProgressRepository
    {
        public UserCourseProgressRepository(ApplicationDbContext context) : base(context) { }

        public async Task<List<UserCourseProgress>> GetProgressByUserIdAsync(int userId)
        {
            return await _context.UserCourseProgresses
                .Include(p => p.Course)
                .Where(p => p.UserID == userId && !p.Course.IsDeleted)
                .ToListAsync();
        }

        public async Task<List<UserCourseProgress>> GetCompletedCoursesByUserAsync(int userId)
        {
            return await _context.UserCourseProgresses
                .Include(p => p.Course)
                .Where(p => p.UserID == userId && p.IsCompleted && !p.Course.IsDeleted)
                .ToListAsync();
        }
        public async Task<UserCourseProgress> GetByUserAndCourseAsync(int userId, int courseId)
        {
            return await _context.UserCourseProgresses
                .FirstOrDefaultAsync(x => x.UserID == userId && x.CourseID == courseId);
        }

    }
}
