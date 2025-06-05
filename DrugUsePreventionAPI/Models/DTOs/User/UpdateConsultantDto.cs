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
        public int? CertificateID { get; set; }
    }
}
