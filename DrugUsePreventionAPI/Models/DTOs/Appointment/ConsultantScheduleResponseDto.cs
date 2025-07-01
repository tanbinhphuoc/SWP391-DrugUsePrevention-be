namespace DrugUsePreventionAPI.Models.DTOs.Appointment
{
    public class ConsultantScheduleResponseDto
    {
        public required ConsultantScheduleDto? Schedule { get; set; }
        public string? AppointmentStatus { get; set; }
        public string? PaymentStatus { get; set; }
    }
}
