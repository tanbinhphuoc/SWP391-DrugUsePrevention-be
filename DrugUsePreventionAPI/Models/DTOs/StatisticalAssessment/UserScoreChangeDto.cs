namespace DrugUsePreventionAPI.Models.DTOs.StatisticalAssessment
{
    public class UserScoreChangeDto
    {
        public int UserId { get; set; }
        public int? CourseId { get; set; } 
        public double InputScore { get; set; }
        public double OutputScore { get; set; }
        public double ScoreChange { get; set; }
    }

}
