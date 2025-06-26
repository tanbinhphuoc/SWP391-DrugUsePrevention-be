namespace DrugUsePreventionAPI.Models.DTOs.Appointment
{
    public class AppointmentDto
    {
        public int AppointmentID { get; set; }
        public string? ConsultantName { get; set; }
        public string? MemberName { get; set; }
        public DateTime StartDateTime { get; set; }
        public DateTime EndDateTime { get; set; }
        public decimal Price { get; set; }
        public string? Status { get; set; }
        public string? Note { get; set; }
    }
}
