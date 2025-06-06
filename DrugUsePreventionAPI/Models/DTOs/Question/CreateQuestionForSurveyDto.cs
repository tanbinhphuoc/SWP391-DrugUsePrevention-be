namespace DrugUsePreventionAPI.Models.DTOs.Question
{
    public class CreateQuestionForSurveyDto
    {
        public int surveyID { get; set; }
        public string questionText { get; set; }

        public string questionType { get; set; }
    }
}
