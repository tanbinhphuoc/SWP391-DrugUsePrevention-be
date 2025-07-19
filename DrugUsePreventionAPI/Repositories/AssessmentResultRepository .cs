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

        public async Task<AssessmentResult> GetAssessmentResultByUserAsync(int userId, string assessmentStage)
        {
            return await _context.AssessmentResults
                .Include(ar => ar.Assessment) 
                .Where(ar => ar.UserID == userId && ar.Assessment.AssessmentStage == assessmentStage)
                .OrderByDescending(ar => ar.TakeTime)
                .FirstOrDefaultAsync();
        }

        public async Task<AssessmentResult?> GetAssessmentResultByUsersAsync(int userId, int assessmentId)
        {
            return await _context.AssessmentResults
                .FirstOrDefaultAsync(r => r.UserID == userId && r.AssessmentID == assessmentId);
        }
        public async Task<IEnumerable<AssessmentResult>> GetByUserIdAsync(int userId)
        {
            return await _context.AssessmentResults
                .Include(r => r.Assessment)
                .Where(r => r.UserID == userId)
                .ToListAsync();
        }

        public async Task<int> GetAttemptCountByUserAsync(int userId, int assessmentId)
        {
            return await _context.AssessmentResults
                                 .Where(r => r.UserID == userId && r.AssessmentID == assessmentId)
                                 .CountAsync();
        }

    }

}