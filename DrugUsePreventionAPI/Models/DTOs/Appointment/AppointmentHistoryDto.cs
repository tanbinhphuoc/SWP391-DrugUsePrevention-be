namespace DrugUsePreventionAPI.Models.DTOs.Appointment
{
    public class AppointmentHistoryDto
    {
        public int AppointmentId { get; set; }
        public DateTime AppointmentStartDateTime { get; set; }
        public DateTime AppointmentEndDateTime { get; set; }
        public string? Status { get; set; }
        public decimal Price { get; set; }
        public string? ConsultantName { get; set; }
    }
}