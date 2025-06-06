using DrugUsePreventionAPI.Models.DTOs.Answer;
using DrugUsePreventionAPI.Models.DTOs.AssessmentDto;
using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface IAnswerOptionService
    {
        Task<bool> CreateAnswerOption(CreateAnswerOptionDto createAnswerOptionDto);
        Task<List<AnswerOption>> GetAllAnswerOption();
        Task<AnswerOption?> GetAnswerOptionById(int id);
        Task<bool> UpdateAnswerOption(int id, CreateAnswerOptionDto createAnswerOptionDto);
        Task<bool> DeleteAnswerOption(int id);
    }
}
