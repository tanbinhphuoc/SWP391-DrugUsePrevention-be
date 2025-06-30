namespace DrugUsePreventionAPI.Models.DTOs.Appointment
{
    public class PaymentDto
    {
        public int PaymentId { get; set; }
        public int? AppointmentId { get; set; }
        public decimal Amount { get; set; }
        public string? Status { get; set; }
        public string? TransactionId { get; set; }
        public DateTime PaymentDate { get; set; }
        public string? ConsultantName { get; set; }
        public DateTime? AppointmentStartDateTime { get; set; }
        public DateTime? AppointmentEndDateTime { get; set; }
    }
}