using DrugUsePreventionAPI.Data;
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
                .FirstOrDefaultAsync(x => x.UserID == userId && x.CourseID == courseId && x.AssessmentStage == stage);
        }
    }

}