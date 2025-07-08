namespace DrugUsePreventionAPI.Models.DTOs.AssessmentResultDto
{
    public class CreateOutputAssessmentResultDto
    {
        public int UserId { get; set; }
        public int AssessmentId { get; set; }
        public List<int> AnswerOptionId { get; set; }
        public int CourseId { get; set; }
    }
}
