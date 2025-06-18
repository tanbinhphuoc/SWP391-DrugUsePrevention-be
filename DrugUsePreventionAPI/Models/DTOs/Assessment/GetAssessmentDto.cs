namespace DrugUsePreventionAPI.Models.DTOs.AssessmentDto
{
    public class GetAssessmentDto
    {
        public string? AssessmentName { get; set; }
        public List<QuestionDto>? Questions { get; set; }
    }

    public class QuestionDto
    {
        public int QuestionId { get; set; }
        public string? QuestionText { get; set; }
        public List<AnswerDto>? Answers { get; set; }
    }

    public class AnswerDto
    {
        public int AnswerId { get; set; }
        public string? OptionText { get; set; }
        public bool IsCorrect { get; set; }
    }
}
