namespace DrugUsePreventionAPI.Models.DTOs.Appointment
{
    public class BookAppointmentDto
    {
        public int ConsultantId { get; set; }
        public List<int>? ScheduleIds { get; set; } // List of consecutive scheduleIDs
        public string? Note { get; set; }
    }
}