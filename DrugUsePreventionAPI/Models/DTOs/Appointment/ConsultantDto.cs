namespace DrugUsePreventionAPI.Models.DTOs.Appointment
{
    public class ConsultantDto
    {
        public int ConsultantID { get; set; }
        public string? FullName { get; set; }
        public string? Email { get; set; }
        public string? Specialty { get; set; }
        public string? Degree { get; set; }
        public decimal HourlyRate { get; set; }
        public string? CertificateName { get; set; }
    }
}