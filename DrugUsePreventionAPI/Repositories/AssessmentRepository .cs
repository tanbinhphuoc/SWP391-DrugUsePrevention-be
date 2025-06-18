using DrugUsePreventionAPI.Data;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Repositories
{
    public class AssessmentRepository : GenericRepository<Assessment>, IAssessmentRepository
    {
        public AssessmentRepository(ApplicationDbContext context) : base(context) { }

        public async Task<List<Assessment>> GetAssessmentsByAgeAsync(int age)
        {
            if (age >= 18)
            {
                return await _context.Assessments
                    .Where(a => a.AssessmentType.Equals("Assist"))
                    .ToListAsync();
            }
            else
            {
                return await _context.Assessments
                    .Where(a => a.AssessmentType.Equals("Crafft"))
                    .ToListAsync();
            }
        }

        public async Task<Assessment> GetAssessmentWithQuestionsAsync(int id)
        {
            return await _context.Assessments
                .Include(a => a.Questions)
                    .ThenInclude(q => q.AnswerOptions)
                .FirstOrDefaultAsync(a => a.AssessmentID == id);
        }
    }

}