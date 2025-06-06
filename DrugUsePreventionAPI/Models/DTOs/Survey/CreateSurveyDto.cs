namespace DrugUsePreventionAPI.Models.DTOs.Survey
{
    public class CreateSurveyDto
    {
        public string title { get; set; }

        public string type { get; set; }

        public int authorID { get; set; }
        
        public string description { get; set; }
    }
}
