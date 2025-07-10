using DrugUsePreventionAPI.Controllers.Data;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Repositories
{
    public class AssessmentResultRepository : GenericRepository<AssessmentResult>, IAssessmentResultRepository
    {
        public AssessmentResultRepository(ApplicationDbContext context) : base(context) { }

        public async Task<AssessmentResult> GetByUserAndCourseAsync(int userId, int courseId, string stage)
        {
            return await _context.AssessmentResults
                .FirstOrDefaultAsync(x => x.UserID == userId && x.CourseID == courseId );
        }
        public async Task<AssessmentResult?> GetLatestResultByUserAsync(int userId)
        {
            return await _context.AssessmentResults
                .Where(r => r.UserID == userId)
                .OrderByDescending(r => r.TakeTime)
                .FirstOrDefaultAsync();
        }


    }

}