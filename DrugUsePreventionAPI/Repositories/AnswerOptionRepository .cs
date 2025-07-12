using DrugUsePreventionAPI.Controllers.Data;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Repositories
{
    public class AnswerOptionRepository : GenericRepository<AnswerOption>, IAnswerOptionRepository
    {
        public AnswerOptionRepository(ApplicationDbContext context) : base(context) { }

        public async Task<List<AnswerOption>> GetByQuestionIdAsync(int questionId)
        {
            return await _context.AnswerOptions
                .Where(a => a.QuestionID == questionId && !a.IsDeleted)
                .ToListAsync();
        }
    }
} 
