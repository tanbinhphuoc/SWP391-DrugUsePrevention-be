namespace DrugUsePreventionAPI.Models.DTOs.AssessmentDto
{
    public class GetAssessmentInputDto
    {
        public int AssessmentID { get; set; }
        public string AssessmentName { get; set; } = string.Empty;
        public string AssessmentType { get; set; } = string.Empty;
        public string? Description { get; set; }
        public string AssessmentStage { get; set; } = "Input";
    }
}
