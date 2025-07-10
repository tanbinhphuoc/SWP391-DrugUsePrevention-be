namespace DrugUsePreventionAPI.Models.DTOs.Assessment
{
    public class CreateOutputAssessmentDto
    {
        public string AssessmentName { get; set; }
        public string Description { get; set; }
        public string AssessmentType { get; set; } // "Assist" or "Crafft"
        public int? CourseID { get; set; } // bắt buộc

    }

}
