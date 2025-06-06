namespace DrugUsePreventionAPI.Models.DTOs.Answer
{
    public class CreateAnswerOptionDto
    {
        public int questionID { get; set; }

        public string optionText { get; set; }

        public int scoreValue { get; set; }
    }
}
