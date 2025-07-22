using DrugUsePreventionAPI.Controllers.Data;
using DrugUsePreventionAPI.Models.DTOs.StatisticalCourse;
using DrugUsePreventionAPI.Repositories.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;

namespace DrugUsePreventionAPI.Repositories
{
    public class CourseStatisticsRepository : ICourseStatisticsRepository
    {
        private readonly ApplicationDbContext _context;

        public CourseStatisticsRepository(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<int> GetTotalCoursesAsync()
        {
            return await _context.Courses.CountAsync(c => !c.IsDeleted);
        }

        public async Task<int> GetOpenCoursesCountAsync()
        {
            return await _context.Courses.CountAsync(c => c.Status == "OPEN" && !c.IsDeleted);
        }

        public async Task<int> GetClosedCoursesCountAsync()
        {
            return await _context.Courses.CountAsync(c => c.Status == "CLOSED" && !c.IsDeleted);
        }
        public async Task<int> GetPendingCoursesCountAsync()
        {
            return await _context.Courses.CountAsync(c => c.Status == "PENDING" && !c.IsDeleted);
        }

        public async Task<int> GetCoursesCountByTargetAsync(string targetAudience)
        {
            return await _context.Courses.CountAsync(c => c.Type == targetAudience && !c.IsDeleted);
        }


        public async Task<List<CourseUserStatisticsDto>> GetCourseUserStatisticsAsync()
        {
            var courses = await _context.Courses
                .Include(c => c.CourseRegistrations)
                .Where(c => !c.IsDeleted)
                .ToListAsync();

            var allAssessmentResults = await _context.AssessmentResults
                .Where(ar => !ar.IsDeleted)
                .ToListAsync();

            var result = new List<CourseUserStatisticsDto>();

            foreach (var course in courses)
            {
                int totalUsers = course.CourseRegistrations.Count;

                // Output Assessment Results: CourseID == current CourseID
                var outputResults = allAssessmentResults
                    .Where(ar => ar.CourseID == course.CourseID)
                    .ToList();

                // Tính trung bình điểm output
                double averageOutputScore = outputResults.Any()
                    ? outputResults.Average(ar => ar.Score)
                    : 0;

                // User nào đã có output assessment
                var usersWithOutput = outputResults
                    .Select(ar => ar.UserID)
                    .Distinct()
                    .ToList();

                int usersWithoutOutput = totalUsers -
                    course.CourseRegistrations
                        .Count(cr => usersWithOutput.Contains(cr.UserID));

                double completionRate = totalUsers > 0
                    ? (double)(totalUsers - usersWithoutOutput) / totalUsers * 100
                    : 0;

                result.Add(new CourseUserStatisticsDto
                {
                    CourseId = course.CourseID,
                    CourseName = course.CourseName,
                    TotalUsers = totalUsers,
                    AverageOutputScore = averageOutputScore,
                    UsersWithoutOutputAssessment = usersWithoutOutput,
                    CompletionRate = completionRate
                });
            }

            return result;
        }

        public async Task<List<CourseImpactDto>> GetCoursesWithHighestImpactAsync()
        {
            var results = await _context.AssessmentResults
                .Where(r => !r.IsDeleted)
                .ToListAsync();

            var assessments = await _context.Assessments
                .Where(a => !a.IsDeleted)
                .ToDictionaryAsync(a => a.AssessmentID);

            var grouped = results
                .Where(r => r.CourseID.HasValue) // chỉ lấy OUTPUT có CourseID
                .GroupBy(r => new { r.UserID, r.CourseID })
                .Select(g =>
                {
                    var output = g.OrderByDescending(r => r.TakeTime).FirstOrDefault(); // output = mới nhất

                    var input = results
                        .Where(r =>
                            r.UserID == g.Key.UserID &&
                            !r.CourseID.HasValue && // input không có courseid
                            assessments.ContainsKey(r.AssessmentID) &&
                            assessments[r.AssessmentID].AssessmentStage == "Input")
                        .OrderByDescending(r => r.TakeTime)
                        .FirstOrDefault();

                    if (input == null || output == null) return null;

                    var inputScore = input.Score;
                    var outputScore = output.Score;

                    double? improvement = (outputScore < inputScore) || (outputScore == inputScore && inputScore <= 2)
                        ? inputScore - outputScore
                        : (double?)null;

                    return new
                    {
                        CourseId = output.CourseID.Value,
                        Improvement = improvement
                    };
                })
                .Where(x => x != null && x.Improvement.HasValue)
                .GroupBy(x => x.CourseId)
                .Select(g => new CourseImpactDto
                {
                    CourseId = g.Key,
                    CourseName = _context.Courses.FirstOrDefault(c => c.CourseID == g.Key).CourseName,
                    AverageScoreImprovement = Math.Round(g.Average(x => x.Improvement.Value), 2)
                })
                .OrderByDescending(x => x.AverageScoreImprovement)
                .ToList();

            return grouped;
        }




        public async Task<CourseRevenueStatisticsDto> GetRevenueStatisticsAsync()
        {
            var registrations = _context.CourseRegistrations.AsNoTracking();

            var successfulPaymentsQuery = registrations.Where(r => r.PaymentStatus.ToUpper() == "SUCCESS");

            return new CourseRevenueStatisticsDto
            {
                TotalRevenue = await successfulPaymentsQuery.SumAsync(r => r.Amount) ?? 0,
                TotalTransactions = await registrations.CountAsync(),
                SuccessfulPayments = await successfulPaymentsQuery.CountAsync(),
                FailedPayments = await registrations.CountAsync(r => r.PaymentStatus.ToUpper() == "FAILED"),
                PendingPayments = await registrations.CountAsync(r => r.PaymentStatus.ToUpper() == "PENDING")
            };
        }



        public async Task<List<TimePointValueDto>> GetEnrollmentDistributionOverTimeAsync()
        {
            return await _context.CourseRegistrations
                .GroupBy(r => new { r.RegistrationDate.Year, r.RegistrationDate.Month })
                .Select(g => new TimePointValueDto
                {
                    TimeLabel = $"{g.Key.Year}-{g.Key.Month:D2}", // yyyy-MM
                    Value = g.Count()
                })
                .OrderBy(x => x.TimeLabel)
                .ToListAsync();
        }



        public async Task<List<TimePointValueDto>> GetCompletionTrendAsync()
        {
            return await _context.AssessmentResults
                .Where(ar => ar.Assessment.AssessmentStage == "Output" && ar.CourseID != null)
                .GroupBy(ar => ar.TakeTime.ToString("yyyy-MM"))
                .Select(g => new TimePointValueDto
                {
                    TimeLabel = g.Key,
                    Value = g.Count()
                })
                .OrderBy(x => x.TimeLabel)
                .ToListAsync();
        }


        public async Task<List<PieChartSegmentDto>> GetTargetAudienceRatioAsync()
        {
            return await _context.Courses
                .Where(c => !c.IsDeleted)
                .GroupBy(c => c.Type)
                .Select(g => new PieChartSegmentDto
                {
                    Label = g.Key,
                    Value = g.Count()
                }).ToListAsync();
        }
    }

}