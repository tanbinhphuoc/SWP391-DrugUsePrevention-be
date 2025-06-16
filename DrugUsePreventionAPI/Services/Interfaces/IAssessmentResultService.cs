using DrugUsePreventionAPI.Models.DTOs.AssessmentResultDto;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface IAssessmentResultService
    {
        Task<string> CreateAssessmentResult(CreateAssessmentResultDto dto);
        Task<CompareAssessmentResultDto?> CompareAssessmentResults(int userId, int courseId);

    }
}
