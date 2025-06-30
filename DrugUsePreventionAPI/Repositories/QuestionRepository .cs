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
                .Where(q => q.SurveyID == surveyId && !q.IsDeleted)
                .ToListAsync();
        }

        public async Task<IEnumerable<Question>> GetByAssessmentIdAsync(int assessmentId)
        {
            return await _context.Questions
                .Where(q => q.AssessmentID == assessmentId && !q.IsDeleted)
                .ToListAsync();
        }

        public async Task SoftDeleteByAssessmentIdAsync(int assessmentId)
        {
            var questions = await _context.Questions
                .Where(q => q.AssessmentID == assessmentId && !q.IsDeleted)
                .ToListAsync();

            foreach (var question in questions)
            {
                question.IsDeleted = true;

                // Xử lý soft delete cho AnswerOptions liên kết
                var answerOptions = await _context.AnswerOptions
                    .Where(a => a.QuestionID == question.QuestionID && !a.IsDeleted)
                    .ToListAsync();

                foreach (var answer in answerOptions)
                {
                    answer.IsDeleted = true;
                }
            }

            _context.Questions.UpdateRange(questions);
            await _context.SaveChangesAsync();
        }

    }

}