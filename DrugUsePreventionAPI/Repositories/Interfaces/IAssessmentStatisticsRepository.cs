using DrugUsePreventionAPI.Models.DTOs.StatisticalAssessment;

namespace DrugUsePreventionAPI.Repositories.Interfaces
{
    public interface IAssessmentStatisticsRepository
    {
        Task<int> GetTotalAssessmentsAsync();
        Task<AssessmentScoreSummaryDto> GetAssessmentScoreSummaryAsync();
        Task<HighRiskSummaryDto> GetHighRiskSummaryAsync(double threshold);
        Task<List<AssessmentTypeCountDto>> GetAssessmentCountsByTypeAsync();
        Task<List<AgeScoreDistributionDto>> GetScoreDistributionByAgeAsync();
        Task<AssessmentScoreChangeDto> GetAssessmentScoreChangesAsync();
    }
}
