namespace DrugUsePreventionAPI.Models.DTOs.AssessmentResultDto
{
    public class CompareAssessmentResultDto
    {
        public int UserID { get; set; }
        public int? CourseID { get; set; }
        public double? InputScore { get; set; }
        public double? OutputScore { get; set; }
        public string? ComparisonResult { get; set; }
    }
}
