using DrugUsePreventionAPI.Data;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Repositories
{
    public class QuestionRepository : GenericRepository<Question>, IQuestionRepository
    {
        public QuestionRepository(ApplicationDbContext context) : base(context) { }

        public async Task<IEnumerable<Question>> GetBySurveyIdAsync(int surveyId)
        {
            return await _context.Questions
                .Where(q => q.SurveyID == surveyId)
                .ToListAsync();
        }

        public async Task<IEnumerable<Question>> GetByAssessmentIdAsync(int assessmentId)
        {
            return await _context.Questions
                .Where(q => q.AssessmentID == assessmentId)
                .ToListAsync();
        }
    }

}