using DrugUsePreventionAPI.Models.DTOs.Question;
using DrugUsePreventionAPI.Models.Entities;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface IQuestionService
    {

        Task<bool> CreateQuestionForAssessment(CreateQuestionForAssessmentDto createQuestionForAssessmentDto);
        Task<List<Question>> GetAllQuestionForAssessment();
        Task<List<GetQuestionWithAnswersDto>> GetAllQuestionsWithAnswersForAssessmentId(int assessmentId);

        Task UpdateQuestionWithAnswersAsync(UpdateQuestionWithAnswersInputDto inputDto);
        Task UpdateMultipleInputQuestionsWithAnswersAsync(List<UpdateQuestionWithAnswersInputDto> inputDtos);
        Task UpdateQuestionWithAnswersOutputAsync(UpdateQuestionWithAnswersOutputDto dto);
        Task UpdateMultipleOutputQuestionsWithAnswersAsync(List<UpdateQuestionWithAnswersOutputDto> dtos);

        Task<bool> DeleteQuestionForAssessment(int id);
        Task<bool> CreateMultipleQuestionsWithAnswers(List<CreateQuestionWithAnswersDto> questionsWithAnswers);


    }
}
