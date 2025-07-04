using DrugUsePreventionAPI.Controllers.Data;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Repositories
{
    public class CourseRegistrationRepository : GenericRepository<CourseRegistration>, ICourseRegistrationRepository
    {
        public CourseRegistrationRepository(ApplicationDbContext context) : base(context) { }

        public async Task<bool> ExistsAsync(int userId, int courseId)
        {
            return await _context.CourseRegistrations
                .AnyAsync(a => a.UserID == userId && a.CourseID == courseId);
        }
    }

}