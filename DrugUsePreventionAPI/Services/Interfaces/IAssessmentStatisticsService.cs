using DrugUsePreventionAPI.Models.DTOs.StatisticalAssessment;

namespace DrugUsePreventionAPI.Services.Interfaces
{
    public interface IAssessmentStatisticsService
    {
        Task<int> GetTotalAssessmentsAsync();
        Task<AssessmentScoreSummaryDto> GetAssessmentScoreSummaryAsync();
        Task<HighRiskSummaryDto> GetHighRiskSummaryAsync(double threshold);
        Task<List<AssessmentTypeCountDto>> GetAssessmentCountsByTypeAsync();
        Task<List<AgeScoreDistributionDto>> GetScoreDistributionByAgeAsync();
        Task<AssessmentScoreChangeDto> GetAssessmentScoreChangesAsync();
    }
}
