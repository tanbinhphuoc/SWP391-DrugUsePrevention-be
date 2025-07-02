namespace DrugUsePreventionAPI.Models.DTOs.Question
{
    public class GetQuestionWithAnswersDto
    {
        public int QuestionId { get; set; }
        public string QuestionText { get; set; }
        public string? QuestionType { get; set; }

        public List<AnswerOptionDto> Answers { get; set; } = new List<AnswerOptionDto>();

        public class AnswerOptionDto
        {
            public int AnswerId { get; set; }
            public string OptionText { get; set; }
            public int ScoreValue { get; set; }
        }
    }
}
