namespace DrugUsePreventionAPI.Models.DTOs.Appointment
{
    public class ConsultantScheduleDto
    {
        public int ScheduleID { get; set; }
        public string DayOfWeek { get; set; }
        public DateTime Date { get; set; }
        public TimeSpan StartTime { get; set; }
        public TimeSpan EndTime { get; set; }
        public string Notes { get; set; }
    }
}
