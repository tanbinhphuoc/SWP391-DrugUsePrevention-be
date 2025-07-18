using DrugUsePreventionAPI.Models.DTOs.StatisticalAssessment;
using DrugUsePreventionAPI.Repositories.Interfaces;
using DrugUsePreventionAPI.Services.Interfaces;

namespace DrugUsePreventionAPI.Services.Implementations
{
    public class AssessmentStatisticsService : IAssessmentStatisticsService
    {
        private readonly IAssessmentStatisticsRepository _repo;

        public AssessmentStatisticsService(IAssessmentStatisticsRepository repo)
        {
            _repo = repo;
        }

        public async Task<int> GetTotalAssessmentsAsync() => await _repo.GetTotalAssessmentsAsync();

        public async Task<AssessmentScoreSummaryDto> GetAssessmentScoreSummaryAsync() => await _repo.GetAssessmentScoreSummaryAsync();

        public async Task<HighRiskSummaryDto> GetHighRiskSummaryAsync(double threshold) => await _repo.GetHighRiskSummaryAsync(threshold);

        public async Task<List<AssessmentTypeCountDto>> GetAssessmentCountsByTypeAsync() => await _repo.GetAssessmentCountsByTypeAsync();

        public async Task<List<AgeScoreDistributionDto>> GetScoreDistributionByAgeAsync() => await _repo.GetScoreDistributionByAgeAsync();

        public async Task<AssessmentScoreChangeDto> GetAssessmentScoreChangesAsync() => await _repo.GetAssessmentScoreChangesAsync();
    }
}
