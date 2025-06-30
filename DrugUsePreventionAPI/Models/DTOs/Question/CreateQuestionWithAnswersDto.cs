namespace DrugUsePreventionAPI.Models.DTOs.Question
{
    public class CreateQuestionWithAnswersDto
    {
        public int AssessmentID { get; set; }

        public string? QuestionText { get; set; }

        public string? QuestionType { get; set; }

        public List<CreateAnswerDto>? Answers { get; set; }
    }

    public class CreateAnswerDto
    {
        public string? OptionText { get; set; }

        public int ScoreValue { get; set; } // Mỗi câu trả lời sẽ có điểm riêng (đã xử lý ở nơi khác)
    }
}
