
namespace DrugUsePreventionAPI.Models.DTOs.User
{
    public class UpdateConsultantDto
    {
        public string? UserName { get; set; }
        public string? Password { get; set; }
        public string? Email { get; set; }
        public string? FullName { get; set; }
        public string? Degree { get; set; }
        public decimal? HourlyRate { get; set; }
        public string? Specialty { get; set; }
        public string? Experience { get; set; }
        public string? CertificateName { get; set; } // Allow updating CertificateName
        public DateTime? DateAcquired { get; set; } // Allow updating DateAcquired
        public string? GoogleMeetLink { get; set; }
    }
}