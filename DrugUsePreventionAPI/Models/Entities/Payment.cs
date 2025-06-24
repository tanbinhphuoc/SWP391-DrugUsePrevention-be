using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.Entities
{
    public class Payment
    {
        [Key]
        public int PaymentID { get; set; }

        [Required]
        public int UserID { get; set; }

        public int? CourseID { get; set; }

        public int? AppointmentID { get; set; }

        public decimal Amount { get; set; } = 0;

        public DateTime? PaymentDate { get; set; } = DateTime.Now;

        [MaxLength(50)]
        public string? PaymentMethod { get; set; }

        [Required]
        [MaxLength(10)]
        public string Status { get; set; } = "PENDING";

        [MaxLength(100)]
        public string? TransactionID { get; set; }

        public int? RetryCount { get; set; }
        // Navigation properties
        public virtual User User { get; set; }
        public virtual Course? Course { get; set; }
        public virtual Appointment? Appointment { get; set; }
    }
}