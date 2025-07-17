namespace DrugUsePreventionAPI.Models.DTOs.StatisticalAssessment
{
    public class AssessmentScoreSummaryDto
    {
        public int TotalAssessments { get; set; }
        public double AverageScore { get; set; }
        public double MaxScore { get; set; }
        public double MinScore { get; set; }
    }
}
