namespace DrugUsePreventionAPI.Models.DTOs.Consultant
{
    public class AssessmentResultInfo
    {
        public string? Stage { get; set; }
        public int? Score { get; set; }
        public DateTime? TakeTime { get; set; }
        public string CourseName { get; set; }
        public string AssessmentType { get; set; }
    }

}
