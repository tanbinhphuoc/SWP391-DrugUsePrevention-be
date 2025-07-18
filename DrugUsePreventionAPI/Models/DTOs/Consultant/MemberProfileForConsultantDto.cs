namespace DrugUsePreventionAPI.Models.DTOs.Consultant
{
    public class MemberProfileForConsultantDto
    {
        public string? FullName { get; set; }
        public int? Age { get; set; }
        public string? Email { get; set; }
        public string? Phone { get; set; }
        public string? Address { get; set; }
        public List<string>? RegisteredCourses { get; set; }
        public List<string>? CompletedCourses { get; set; }
        public List<AssessmentResultInfo>? AssessmentResults { get; set; }
        public List<ConsultantInfo>? PreviousConsultants { get; set; }
    }
}
