using DrugUsePreventionAPI.Models.DTOs.Answer;
using DrugUsePreventionAPI.Models.DTOs.Question;
using DrugUsePreventionAPI.Models.DTOs.Survey;
using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface IQuestionService
    {
        Task<bool> CreateQuestionForSurvey(CreateQuestionForSurveyDto createQuestionForSurveyDto);
        Task<List<Question>> GetAllQuestionForSurvey();
        Task<Question?> GetQuestionForSurveyById(int id);
        Task<bool> UpdateQuestionForSurvey(int id, CreateQuestionForSurveyDto createQuestionForSurveyDto);
        Task<bool> DeleteQuestionForSurvey(int id);

        Task<bool> CreateQuestionForAssessment(CreateQuestionForAssessmentDto createQuestionForAssessmentDto);
        Task<List<Question>> GetAllQuestionForAssessment();
        Task<Question?> GetQuestionForAssessmentById(int id);
        Task<bool> UpdateQuestionForAssessment(int id, CreateQuestionForAssessmentDto createQuestionForAssessmentDto);
        Task<bool> DeleteQuestionForAssessment(int id);
    }
}
