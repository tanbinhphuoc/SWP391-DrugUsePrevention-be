using DrugUsePreventionAPI.Controllers.Data;
using DrugUsePreventionAPI.Models.DTOs.StatisticalAssessment;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;

namespace DrugUsePreventionAPI.Repositories
{
    public class AssessmentStatisticsRepository : IAssessmentStatisticsRepository
    {
        private readonly ApplicationDbContext _context;

        public AssessmentStatisticsRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<int> GetTotalAssessmentsAsync()
        {
            return await _context.AssessmentResults.CountAsync();
        }

        public async Task<AssessmentScoreSummaryDto> GetAssessmentScoreSummaryAsync()
        {
            var results = _context.AssessmentResults;

            if (!await results.AnyAsync())
            {
                return new AssessmentScoreSummaryDto();
            }

            return new AssessmentScoreSummaryDto
            {
                TotalAssessments = await results.CountAsync(),
                AverageScore = await results.AverageAsync(ar => ar.Score),
                MaxScore = await results.MaxAsync(ar => ar.Score),
                MinScore = await results.MinAsync(ar => ar.Score)
            };
        }

        public async Task<HighRiskSummaryDto> GetHighRiskSummaryAsync(double threshold)
        {
            var results = _context.AssessmentResults;
            var total = await results.CountAsync();
            var highRisk = await results.CountAsync(ar => ar.Score >= threshold);

            return new HighRiskSummaryDto
            {
                Threshold = threshold,
                TotalUsers = total,
                HighRiskUsers = highRisk,
                Percentage = total == 0 ? 0 : (double)highRisk / total * 100
            };
        }

        public async Task<List<AssessmentTypeCountDto>> GetAssessmentCountsByTypeAsync()
        {
            return await _context.AssessmentResults
                .Include(ar => ar.Assessment)
                .GroupBy(ar => ar.Assessment.AssessmentType)
                .Select(g => new AssessmentTypeCountDto
                {
                    AssessmentType = g.Key,
                    Count = g.Count()
                })
                .ToListAsync();
        }

        public async Task<List<AgeScoreDistributionDto>> GetScoreDistributionByAgeAsync()
        {
            return await _context.AssessmentResults
                .Include(ar => ar.User)
                .Where(ar => ar.User.DateOfBirth.HasValue)
                .Select(ar => new
                {
                    Age = DateTime.Now.Year - ar.User.DateOfBirth.Value.Year,
                    ar.Score
                })
                .GroupBy(x => x.Age)
                .Select(g => new AgeScoreDistributionDto
                {
                    Age = g.Key,
                    AverageScore = g.Average(x => x.Score)
                })
                .OrderBy(x => x.Age)
                .ToListAsync();
        }

        public async Task<AssessmentScoreChangeDto> GetAssessmentScoreChangesAsync()
        {
            var allResults = await _context.AssessmentResults
                .Where(ar => !ar.IsDeleted)
                .OrderByDescending(ar => ar.TakeTime)
                .ToListAsync();

            var groupedByUser = allResults.GroupBy(ar => ar.UserID);

            int increasedCount = 0;
            int decreasedCount = 0;
            int totalUsers = 0;

            var scoreChanges = new List<UserScoreChangeDto>();

            foreach (var group in groupedByUser)
            {
                var userId = group.Key;

                var input = group
                    .Where(r => r.CourseID == null)
                    .OrderByDescending(r => r.TakeTime)
                    .FirstOrDefault();

                if (input == null) continue;

                var outputsByCourse = group
                    .Where(r => r.CourseID != null)
                    .GroupBy(r => r.CourseID)
                    .Select(g => g.OrderByDescending(r => r.TakeTime).FirstOrDefault())
                    .ToList();

                foreach (var output in outputsByCourse)
                {
                    if (output == null) continue;

                    var change = output.Score - input.Score;
                    totalUsers++;

                    if (change > 0) increasedCount++;
                    else if (change < 0) decreasedCount++;

                    scoreChanges.Add(new UserScoreChangeDto
                    {
                        UserId = userId,
                        CourseId = output.CourseID,
                        InputScore = input.Score,
                        OutputScore = output.Score,
                        ScoreChange = change
                    });
                }
            }

            return new AssessmentScoreChangeDto
            {
                TotalUsers = totalUsers,
                IncreasedCount = increasedCount,
                DecreasedCount = decreasedCount,
                IncreasedPercentage = totalUsers == 0 ? 0 : (double)increasedCount / totalUsers * 100,
                DecreasedPercentage = totalUsers == 0 ? 0 : (double)decreasedCount / totalUsers * 100,
                ScoreChanges = scoreChanges
            };
        }


    }
}
