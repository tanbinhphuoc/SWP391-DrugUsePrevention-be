namespace DrugUsePreventionAPI.Models.DTOs.AssessmentDto
{
    public class CreateAssessmentDto
    {
        public string? AssessmentName {  get; set; }
        public string? Description { get; set; }
        public string? AssessmentType { get; set; } 
        public string? AssessmentStage { get; set; } = "Input"; // "Output";
        public int MinAge { get; set; }
        public int MaxAge { get; set; }
        // Chỉ yêu cầu nếu là Output
        public int? CourseID { get; set; }
    }


}
