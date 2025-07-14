namespace DrugUsePreventionAPI.Models.DTOs.User
{
    public class MemberProfileDto
    {
        public int UserID { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public string? FullName { get; set; }
        public DateTime? DateOfBirth { get; set; }
        public string? Phone { get; set; }
        public string? Address { get; set; }
        public string? Status { get; set; }
        public string? RoleName { get; set; }
        public DateTime CreatedAt { get; set; }
        public DateTime UpdatedAt { get; set; }
        public string? AssessmentStage { get; set; } 
    }
}
