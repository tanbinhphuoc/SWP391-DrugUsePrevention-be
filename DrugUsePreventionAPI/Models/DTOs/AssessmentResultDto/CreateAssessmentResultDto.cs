namespace DrugUsePreventionAPI.Models.DTOs.AssessmentResultDto
{
    public class CreateAssessmentResultDto
    {
        public required int UserId { get; set; }
        public required int AssessmentId { get; set; }
        public required List<int> AnswerOptionId { get; set; }     
        public required string AssessmentStage { get; set; } = "Input";
        public int? CourseId { get; set; }
    }
}
