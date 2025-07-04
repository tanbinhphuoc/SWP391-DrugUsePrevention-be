using DrugUsePreventionAPI.Models.DTOs.AssessmentResultDto;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface IAssessmentResultService
    {
        Task<string> CreateInputAssessmentResult(CreateInputAssessmentResultDto dto);
        Task<string> CreateOutputAssessmentResult(CreateOutputAssessmentResultDto dto);
        Task<CompareAssessmentResultDto?> CompareAssessmentResults(int userId, int courseId);
        Task<bool> IsEligibleForCourseAsync(int userId);


    }
}
