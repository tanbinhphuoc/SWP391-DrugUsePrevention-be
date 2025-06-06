using DrugUsePreventionAPI.Models.DTOs.Answer;
using DrugUsePreventionAPI.Models.DTOs.Survey;
using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface ISurveyService
    {
        Task<bool> CreateSurvey(CreateSurveyDto createSurveyDto);
        Task<List<Survey>> GetAllSurvey();
        Task<Survey?> GetSurveyById(int id);
        Task<bool> UpdateSurvey(int id, CreateSurveyDto createSurveyDto);
        Task<bool> DeleteSurvey(int id);
    }
}
