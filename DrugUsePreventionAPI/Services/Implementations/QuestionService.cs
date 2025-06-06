using DrugUsePreventionAPI.Data;
using DrugUsePreventionAPI.Models.DTOs.Answer;
using DrugUsePreventionAPI.Models.DTOs.Question;
using DrugUsePreventionAPI.Models.Entities;
using DrugUsePreventionAPI.Services.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class QuestionService : IQuestionService
    {
        private readonly ApplicationDbContext _context;
        private readonly IConfiguration _configuration;

        public QuestionService(ApplicationDbContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
        }
        public async Task<bool> CreateQuestionForSurvey(CreateQuestionForSurveyDto createQuestionForSurveyDto)
        {
            try
            {
                var questionForSurvey = new Question()
                {
                    SurveyID = createQuestionForSurveyDto.surveyID,
                    QuestionText = createQuestionForSurveyDto.questionText,
                    QuestionType = createQuestionForSurveyDto.questionType,
                };
                _context.Questions.Add(questionForSurvey);
                await _context.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public async Task<bool> UpdateQuestionForSurvey(int id, CreateQuestionForSurveyDto createQuestionForSurveyDto)
        {
            var questionForSurvey = await _context.Questions.FindAsync(id);
            if (questionForSurvey == null)
                return false;

            questionForSurvey.SurveyID = createQuestionForSurveyDto.surveyID;
            questionForSurvey.QuestionText = createQuestionForSurveyDto.questionText;
            questionForSurvey.QuestionType = createQuestionForSurveyDto.questionType;


            try
            {
                _context.Questions.Update(questionForSurvey);
                await _context.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public async Task<List<Question>> GetAllQuestionForSurvey()
        {
            return await _context.Questions.ToListAsync();
        }

        public async Task<Question?> GetQuestionForSurveyById(int id)
        {
            return await _context.Questions.FindAsync(id);
        }

        public async Task<bool> DeleteQuestionForSurvey(int id)
        {
            var questionForSurvey = await _context.Questions.FindAsync(id);
            if (questionForSurvey == null)
            {
                return false;
            }
            try
            {
                _context.Questions.Remove(questionForSurvey);
                await _context.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }




        public async Task<bool> CreateQuestionForAssessment(CreateQuestionForAssessmentDto createQuestionForAssessmentDto)
        {
            try
            {
                var questionForAssessment = new Question()
                {
                    AssessmentID = createQuestionForAssessmentDto.assessmentID,
                    QuestionText = createQuestionForAssessmentDto.questionText,
                    QuestionType = createQuestionForAssessmentDto.questionType,
                };
                _context.Questions.Add(questionForAssessment);
                await _context.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public async Task<bool> UpdateQuestionForAssessment(int id, CreateQuestionForAssessmentDto createQuestionForAssessmentDto)
        {
            var questionForAssessment = await _context.Questions.FindAsync(id);
            if (questionForAssessment == null)
                return false;

            questionForAssessment.AssessmentID = createQuestionForAssessmentDto.assessmentID;
            questionForAssessment.QuestionText = createQuestionForAssessmentDto.questionText;
            questionForAssessment.QuestionType = createQuestionForAssessmentDto.questionType;


            try
            {
                _context.Questions.Update(questionForAssessment);
                await _context.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public async Task<List<Question>> GetAllQuestionForAssessment()
        {
            return await _context.Questions.ToListAsync();
        }

        public async Task<Question?> GetQuestionForAssessmentById(int id)
        {
            return await _context.Questions.FindAsync(id);
        }

        public async Task<bool> DeleteQuestionForAssessment(int id)
        {
            var questionForAssessment = await _context.Questions.FindAsync(id);
            if (questionForAssessment == null)
            {
                return false;
            }
            try
            {
                _context.Questions.Remove(questionForAssessment);
                await _context.SaveChangesAsync();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
