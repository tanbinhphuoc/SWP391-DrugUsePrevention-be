using System.ComponentModel.DataAnnotations;

namespace DrugUsePreventionAPI.Models.Entities
{
    public class ConsultantSchedule
    {
        [Key]
        public int ScheduleID { get; set; }

        [Required]
        public int ConsultantID { get; set; }

        [Required]
        [MaxLength(50)]
        public string DayOfWeek { get; set; }

        [Required]
        public DateTime Date { get; set; }

        [Required]
        public TimeSpan StartTime { get; set; }

        [Required]
        public TimeSpan EndTime { get; set; }

        public bool IsAvailable { get; set; } = true;

        public string? Notes { get; set; }

        // Navigation properties
        public virtual Consultant Consultant { get; set; }
    }
}