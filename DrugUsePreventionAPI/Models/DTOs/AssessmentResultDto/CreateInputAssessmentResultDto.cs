namespace DrugUsePreventionAPI.Models.DTOs.AssessmentResultDto
{
    public class CreateInputAssessmentResultDto
    {
        public int UserId { get; set; }
        public int AssessmentId { get; set; }
        public List<int> AnswerOptionId { get; set; }
    }
}
