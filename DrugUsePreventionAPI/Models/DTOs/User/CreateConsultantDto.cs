using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.DTOs.User
{
    public class CreateConsultantDto
    {
        [Required]
        public string UserName { get; set; }

        [Required]
        [StringLength(255, MinimumLength = 6)]
        public string Password { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [StringLength(150)]
        public string FullName { get; set; }

        [Required]
        public string Degree { get; set; }

        [Required]
        public decimal HourlyRate { get; set; }

        [Required]
        public string Specialty { get; set; }

        public string? Experience { get; set; }
        public int? CertificateID { get; set; }
    }


}
