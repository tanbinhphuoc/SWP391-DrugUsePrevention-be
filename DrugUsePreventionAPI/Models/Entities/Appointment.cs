using DrugUsePreventionAPI.Models.Entities;
using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.Entities
{
    public class Appointment
    {
        [Key]
        public int AppointmentID { get; set; }

        [Required]
        public int UserID { get; set; }

        [Required]
        public int ConsultantID { get; set; }

        [Required]
        public DateTime StartDateTime { get; set; }

        [Required]
        public DateTime EndDateTime { get; set; }

        [MaxLength(255)]
        public string? GoogleMeetLink { get; set; }

        public decimal Price { get; set; } = 0;

        [Required]
        [MaxLength(20)]
        public string Status { get; set; } = "PENDING_PAYMENT";

        public string? Note { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.Now;
        public DateTime UpdatedAt { get; set; } = DateTime.Now;

        // Navigation properties
        public virtual User User { get; set; }
        public virtual Consultant Consultant { get; set; }
        public virtual ICollection<ConsultantAppointmentEvaluation> Evaluations { get; set; }
        public virtual ICollection<Payment> Payments { get; set; }
    }
}