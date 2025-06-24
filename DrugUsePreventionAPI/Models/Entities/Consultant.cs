using DrugUsePreventionAPI.Models.Entities;
using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.Entities
{
    public class Consultant
    {
        [Key]
        public int ConsultantID { get; set; }

        [Required]
        public int UserID { get; set; }

        public int? CertificateID { get; set; }

        [MaxLength(255)]
        public string? Specialty { get; set; }

        [MaxLength(255)]
        public string? Degree { get; set; }

        public string? Experience { get; set; }

        public decimal HourlyRate { get; set; } = 0;

        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public DateTime UpdatedAt { get; set; } = DateTime.Now;
        public string? GoogleMeetLink { get; set; }

        // Navigation properties
        public virtual User User { get; set; }
        public virtual Certificate? Certificate { get; set; }
        public virtual ICollection<ConsultantSchedule> Schedules { get; set; }
        public virtual ICollection<Appointment> Appointments { get; set; }
    }
}