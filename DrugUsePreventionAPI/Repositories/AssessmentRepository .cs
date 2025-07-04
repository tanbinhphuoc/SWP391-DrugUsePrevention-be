using DrugUsePreventionAPI.Controllers.Data;
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
                .Include(a => a.Questions.Where(q => !q.IsDeleted)) // Lọc câu hỏi chưa bị xóa
                    .ThenInclude(q => q.AnswerOptions.Where(ao => !ao.IsDeleted)) // Lọc đáp án chưa bị xóa
                .FirstOrDefaultAsync(a => a.AssessmentID == id && !a.IsDeleted); // Bỏ những assessment bị xóa
        }

        // lấy tất cả assessment chưa bị xóa
        public async Task<List<Assessment>> GetAllActiveAssessmentsAsync()
        {
            return await _context.Assessments
                .Where(a => !a.IsDeleted)
                .ToListAsync();
        }
    }

}