    namespace DrugUsePreventionAPI.Models.DTOs.Question
    {
    public class UpdateQuestionWithAnswersOutputDto
    {
        public int QuestionId { get; set; }
        public int AssessmentId { get; set; }

        public string QuestionText { get; set; }
        public string QuestionType { get; set; }

        public List<UpdateAnswerOptionOutputDto> Answers { get; set; }
    }

    public class UpdateAnswerOptionOutputDto
    {
        public int? AnswerId { get; set; }
        public string OptionText { get; set; }
        public int ScoreValue { get; set; }
    }

}
