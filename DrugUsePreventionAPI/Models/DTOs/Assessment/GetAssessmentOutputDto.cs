namespace DrugUsePreventionAPI.Models.DTOs.Assessment
{
    public class GetAssessmentOutputDto
    {
        public int AssessmentID { get; set; }
        public string AssessmentName { get; set; } = string.Empty;
        public string AssessmentType { get; set; } = string.Empty;
        public string? Description { get; set; }
        public int CourseID { get; set; }
        public string AssessmentStage { get; set; } = "Output";
    }

}
