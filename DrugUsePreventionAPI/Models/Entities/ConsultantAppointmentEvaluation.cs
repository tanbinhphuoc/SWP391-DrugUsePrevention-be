using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.Entities
{
    public class ConsultantAppointmentEvaluation
    {
        [Key]
        public int EvaluationID { get; set; }

        [Required]
        public int AppointmentID { get; set; }

        [Required]
        public int UserID { get; set; }

        [Required]
        [Range(1, 5)]
        public int Rating { get; set; }

        public string? Comment { get; set; }

        public DateTime EvaluationDate { get; set; } = DateTime.Now;

        // Navigation properties
        public virtual Appointment Appointment { get; set; }
        public virtual User User { get; set; }
    }
}