namespace DrugUsePreventionAPI.Models.DTOs.StatisticalAssessment
{
    public class AssessmentScoreChangeDto
{
    public int TotalUsers { get; set; }
    public int IncreasedCount { get; set; }
    public int DecreasedCount { get; set; }
    public double IncreasedPercentage { get; set; }
    public double DecreasedPercentage { get; set; }
    public List<UserScoreChangeDto> ScoreChanges { get; set; }
}

}
