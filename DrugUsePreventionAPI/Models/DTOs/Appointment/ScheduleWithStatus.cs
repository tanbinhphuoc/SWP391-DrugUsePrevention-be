
namespace DrugUsePreventionAPI.Models.DTOs.Appointment
{
    public class ScheduleWithStatus
    {
        public int ScheduleID { get; set; }
        public int ConsultantID { get; set; }
        public string? DayOfWeek { get; set; } 
        public DateTime Date { get; set; }
        public TimeSpan StartTime { get; set; }
        public TimeSpan EndTime { get; set; }
        public bool IsAvailable { get; set; }
        public string? Notes { get; set; } 
        public string? AppointmentStatus { get; set; } 
        public string? PaymentStatus { get; set; } 
    }
}