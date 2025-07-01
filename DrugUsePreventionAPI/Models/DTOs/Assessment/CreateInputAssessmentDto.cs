namespace DrugUsePreventionAPI.Models.DTOs.Assessment
{
    public class CreateInputAssessmentDto
    {
        public string AssessmentName { get; set; }
        public string Description { get; set; }
        public string AssessmentType { get; set; } // "Assist" or "Crafft"
        public int MinAge { get; set; }
        public int MaxAge { get; set; }
    }
}
