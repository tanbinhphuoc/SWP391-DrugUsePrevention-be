namespace DrugUsePreventionAPI.Models.DTOs.StatisticalAssessment
{
    public class HighRiskSummaryDto
    {
        public double Threshold { get; set; }
        public int TotalUsers { get; set; }
        public int HighRiskUsers { get; set; }
        public double Percentage { get; set; }
    }
}
