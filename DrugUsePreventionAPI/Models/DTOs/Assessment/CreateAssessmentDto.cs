namespace DrugUsePreventionAPI.Models.DTOs.AssessmentDto
{
    public class CreateAssessmentDto
    {
        public string AssessmentName {  get; set; }
        public string Description { get; set; }
        public string AssessmentType { get; set; } 
        public int MinAge { get; set; }
        public int MaxAge { get; set; }
    }


}
