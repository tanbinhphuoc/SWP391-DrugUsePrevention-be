using DrugUsePreventionAPI.Models.DTOs.AssessmentResultDto;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface IAssessmentResultService
    {
        Task<AssessmentResultResponseDto> CreateInputAssessmentResult(CreateInputAssessmentResultDto dto);
        Task<AssessmentResultResponseDto> CreateOutputAssessmentResult(CreateOutputAssessmentResultDto dto);
        Task<CompareAssessmentResultDto?> CompareAssessmentResults(int userId, int courseId);
        Task<bool> IsEligibleForCourseAsync(int userId);


    }
}
