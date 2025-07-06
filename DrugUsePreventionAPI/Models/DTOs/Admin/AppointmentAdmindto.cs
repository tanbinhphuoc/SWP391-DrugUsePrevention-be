namespace DrugUsePreventionAPI.Models.DTOs.Admin
{
    public class AppointmentAdmindto
    {
        public int AppointmentID { get; set; }
        public string? UserName { get; set; }
        public string? ConsultantName { get; set; }
        public DateTime StartDateTime { get; set; }
        public DateTime EndDateTime { get; set; }
        public string? Status { get; set; }
        public decimal Price { get; set; }
        public string? Note { get; set; }
        public string? PaymentStatus { get; set; }
    }
}
