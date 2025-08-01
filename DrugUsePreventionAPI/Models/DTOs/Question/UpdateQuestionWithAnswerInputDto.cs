namespace DrugUsePreventionAPI.Models.DTOs.Question
{
        public class UpdateQuestionWithAnswersInputDto
        {
            public int QuestionId { get; set; }
            public int AssessmentId { get; set; } // để kiểm tra hợp lệ
            public string QuestionText { get; set; }
            public string QuestionType { get; set; }

            public List<UpdateAnswerOptionInputDto> Answers { get; set; }
        }

        public class UpdateAnswerOptionInputDto
        {
            public int? AnswerId { get; set; } // null nếu là đáp án mới
            public string OptionText { get; set; }
            public int ScoreValue { get; set; }
        }

}
